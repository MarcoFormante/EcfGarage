<?php
header("Access-Control-Allow-Origin: *");
header("Access-Control-Allow-Headers: *");
require_once("connection.php");

Class Car {

    use Connection;

    private int $id;
    private string $make;
    private string $model;
    private string $thumbnail;
    private int $year;
    private int $km;
    private int $price;
    private int $offer;
    private $created_at;

    


    /**
     * Get the value of id
     */ 
    public function getId()
    {
        return $this->id;
    }

    /**
     * Get the value of make
     */ 
    public function getMake()
    {
        return $this->make;
    }

    /**
     * Get the value of model
     */ 
    public function getModel()
    {
        return $this->model;
    }

    /**
     * Get the value of thumbnail
     */ 
    public function getThumbnail()
    {
        return $this->thumbnail;
    }

    /**
     * Get the value of year
     */ 
    public function getYear()
    {
        return $this->year;
    }

    /**
     * Get the value of km
     */ 
    public function getKm()
    {
        return $this->km;
    }
    /**
     * Get the value of price
     */ 
    public function getPrice()
    {
        return $this->price;
    }

    /**
     * Get the value of offer
     */ 
    public function getOffer()
    {
        return $this->offer;
    }

    /**
     * Get the value of created_at
     */ 
    public function getCreated_at()
    {
        return $this->created_at;
    }


    public function getOffers($limit){
      
        $query = "SELECT *  FROM cars WHERE offer > 0 LIMIT :limit,10";
        $query2 = "SELECT COUNT(*) FROM cars WHERE offer > 0";
        if (!is_null($this->pdo)) {
        $stmt = $this->pdo->prepare($query);
        $stmt->bindValue(':limit',$limit,PDO::PARAM_INT);
        $stmt->setFetchMode(PDO::FETCH_ASSOC);
        $stmt2 = $this->pdo->prepare($query2);
       
            $cars = [];

            try {
                if($stmt->execute()) {
                    while($row = $stmt->fetchAll()){
                    array_push($cars,$row);
                }  

                if($stmt2->execute()){
                    while($count = $stmt2->fetchAll()){
                       echo json_encode(['cars'=>$cars[0],'count'=>$count[0]]);
                }
            }else{
                throw new Exception("Erreur pendant la recuperation des données");
                
                echo json_encode(["status" => 0, "message"=> "Erreur pendant la recuperation des données"] );
            }
                
            }else{
                throw new Exception("Erreur pendant la recuperation des données");
                echo json_encode(["status" => 0, "message"=> "Erreur pendant la recuperation des données"] );
                
           } 
        } catch (Exception $e) {
            
            echo json_encode(["status" => 0, "message"=> "Erreur pendant la recuperation des données ,"] );
        }
        }else{
            throw new Exception("Erreur pendant la recuperation des données");
            echo json_encode(["status" => 0, "message"=> "Erreur pendant la recuperation des données"] );
        }
    }

    public function getAllCars($page,$filters){
        $filters = json_decode($filters,true);
       
        $withOffer = "";
        if ($filters['offer'] === true) {
            $withOffer = "AND offer > 0";
        }
        $queryCarCount= "SELECT COUNT(*)as count FROM cars 
        WHERE km > ? AND km < ? AND year > ? AND year < ? 
        AND price > ? AND price < ? $withOffer";
        
        $queryGetCars="SELECT * FROM cars  
        WHERE (km > :minKm AND km < :maxKm) AND (year > :minYear AND year < :maxYear)
        AND (price > :minPrice AND price < :maxPrice) LIMIT :page,10";
      

        if (!is_null($this->pdo)) {
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

            // $exeCars = $stmt2->execute([$filters["minKm"],$filters["maxKm"],$filters['minYear'],$filters['maxYear'],$filters['minPrice'],$filters['maxPrice']]);

            $this->pdo->rollBack();
            if($exeCount){
                $count = $stmt->fetch(PDO::FETCH_ASSOC);
               
            }
            if($exeCars){
               
                while($cars = $stmt2->fetchAll(PDO::FETCH_ASSOC)){
                    echo json_encode(["count" => $count['count'],"cars"=>$cars]);
                }
                
            }

        }
    }
}
?>


