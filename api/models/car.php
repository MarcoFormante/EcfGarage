<?php
header("Access-Control-Allow-Origin: *");
header("Access-Control-Allow-Headers: *");
require_once("connection.php");

Class Car {

    use Connection;


    public function getAllCars($page,$filters){
        $filters = json_decode($filters,true);
        $withOffer = "";
        if ($filters['offer'] === true) {
            $withOffer = 'AND offer > 0';
        }
        $queryCarCount= "SELECT COUNT(*) as count FROM cars 
        WHERE km > ? AND km < ? AND year > ? AND year < ? 
        AND price > ? - offer AND price < ? $withOffer";
        
        $queryGetCars="SELECT * FROM cars  
        WHERE (km > :minKm AND km < :maxKm) AND (year > :minYear AND year < :maxYear)
        AND (price - offer > :minPrice  AND price - offer < :maxPrice) $withOffer LIMIT :page,9";
      
        if (!is_null($this->pdo)) {
            //begin transaction
            $this->pdo->beginTransaction();
            $stmt = $this->pdo->prepare($queryCarCount);
            $stmt2 = $this->pdo->prepare($queryGetCars);

            foreach($filters as $f => $v){
                if ($f !== "offer") {
                    $stmt2->bindValue(":$f",$v);
                }
            }
            
            $stmt2->bindValue(":page",intval($page),PDO::PARAM_INT);
         
            //execution of two stmts to get Count & filtered cars
            $exeCount = $stmt->execute([$filters["minKm"],$filters["maxKm"],$filters['minYear'],$filters['maxYear'],$filters['minPrice'],$filters['maxPrice']]);
            $exeCars = $stmt2->execute();

            if($exeCount){
                $count = $stmt->fetch(PDO::FETCH_ASSOC);
            }else{
                $this->pdo->rollBack();
            }
            if($exeCars){
                while($cars = $stmt2->fetchAll(PDO::FETCH_ASSOC)){
                    echo json_encode(["count" => $count['count'],"cars"=>$cars]);
                }  
            }else{
                $this->pdo->rollBack();
            }

        }else{
            echo json_encode(["status"=>0,"message"=>"Probleme pendant la recuperation des données"]);
        }
    }


    public function getCardDetails(int $id){
        $query = "SELECT * FROM car_details WHERE car_id = :id";

        if (!is_null($this->pdo)) {
           
            $stmt = $this->pdo->prepare($query);
            $stmt->bindValue(':id',$id,PDO::PARAM_INT);

            if ($stmt->execute()) {
                
                $details = $stmt->fetch(PDO::FETCH_ASSOC);
                $equipments = $this->getCarEquipments($id);
                echo json_encode(["status"=>1,"details"=> $details,"equipements"=>$equipments]);
                
            }else{
              
                echo json_encode(["status"=>0,"message"=>"Probleme pendant la recuperation des données"]);
            }
        }
    }

    public function getCarEquipments(int $id){
        $query = "SELECT equipment , ce.equip_id FROM equipments
        JOIN car_equipments as ce ON ce.equip_ID = equipments.id
        where ce.car_id = :id";

        if (!is_null($this->pdo)) {
            $stmt = $this->pdo->prepare($query);
            $stmt->bindValue(':id',$id,PDO::PARAM_INT);

            if ($stmt->execute()) {
                $equipments = [];
                while($row = $stmt->fetch(PDO::FETCH_ASSOC)){
                    $equipments[]=$row;
                }
                return $equipments;
                
            }else{
              echo json_encode(["status"=>0,"message"=>"Probleme pendant la recuperation des données"]);
            }
        }
    }


    public function getCarImages(int $id){
        $query= "SELECT id,path FROM car_images WHERE car_id = :id";
        if(!is_null($this->pdo)){
            $stmt = $this->pdo->prepare($query);
            $stmt->bindValue(':id',$id,PDO::PARAM_INT);

            if ($stmt->execute()) {
                $images = [];
                while($row = $stmt->fetch(PDO::FETCH_ASSOC)){
                    $images[] = $row;
                }
                echo json_encode($images);
            }
        }
    }

    public function getAllFilters(){
        $query = "SELECT MIN(km)as minKm ,MAX(km) as maxKm,
        MIN(year) as minYear, MAX(year) as maxYear,
       (MIN(price) - MAX(offer)) as minPrice , MAX(price) as maxPrice from cars";

        if(!is_null($this->pdo)) {
        $stmt = $this->pdo->prepare($query);
            if ($stmt->execute()) {
                $filters = $stmt->fetch(PDO::FETCH_ASSOC);
                echo json_encode($filters);
            }
        }
    } 
}
?>


