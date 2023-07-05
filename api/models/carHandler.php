<?php

require_once 'connection.php';


Class carHandler{

    use Connection;

    public function getAllEquipments(){
        $query= "SELECT * FROM equipments ORDER BY id";

        if (!is_null($this->pdo)) {
            $stmt = $this->pdo->prepare($query);
            if ($stmt->execute()) {
                $equipments=[];
                while ($row = $stmt->fetch(PDO::FETCH_ASSOC)) {
                    $equipments[]=$row;  
                }
                echo json_encode(["status"=>1,"equipments"=>$equipments]);
            }else{
                echo json_encode(["status"=>0,"message"=>"Erreur pendant la recuperation des données(equipments)"]);
            }
        }
    }


    public function createNewCar($thumbnail,$gallery,$details,$equipments){

        $path = $_SERVER['DOCUMENT_ROOT'] ."/app/public/images/uploads/" ;
        $thumbnailName =  uniqid() . uniqid().".jpg";
        $galleryPathArray = [];

        foreach ($_FILES['gallery']['tmp_name'] as $key => $value) {
            $fileName =  (uniqid() . random_int(20,999))  . uniqid().".jpg";
            $galleryPathArray[$key] = $fileName; 
        }

        if (!is_null($this->pdo)) {
       //CAR CARD
        $carCardParams = [":make"=>$details[0],":model" =>$details[1],":thumbnail"=>$thumbnailName,":year"=>$details[3], ":km"=>$details[4] , ":price"=>$details[2],":offer"=>$details[13]];
        $queryCarCard = "INSERT INTO cars(make,model,thumbnail,year,km,price,offer) VALUES(:make,:model,:thumbnail,:year,:km,:price,:offer)";
        $stmtCarCard = $this->pdo->prepare($queryCarCard);
        
            foreach ($carCardParams as $key => $value) {
                if (preg_match("/:make|:model|:thumbnail/i",$key)) {
                    $stmtCarCard->bindValue($key,$value,PDO::PARAM_STR);
                }else{
                    $stmtCarCard->bindValue($key,$value,PDO::PARAM_INT);
                }
            }

            //DETAILS
            $carDetailsParams = [":vo_number"=>$details[12],":gearbox"=> $details[9],":din_power"=>$details[7],":fiscal_power"=>$details[8],":color"=>$details[6],":doors"=>$details[11],":seats"=>$details[5],":energy"=>$details[10]];
            $queryCarDetails = "INSERT INTO car_details(car_id,vo_number,gearbox,din_power,fiscal_power,color,doors,seats,energy) VALUES(:car_id,:vo_number,:gearbox,:din_power,:fiscal_power,:color,:doors,:seats,:energy)";
            $stmtCarDetails = $this->pdo->prepare($queryCarDetails);
        
                 
                  foreach ($carDetailsParams as $key => $value) {
                    if (preg_match("/:vo_number|:din_power|:fiscal_power|:doors|:seats/i",$key)) {
                        $stmtCarDetails->bindValue($key,$value,PDO::PARAM_INT);
                    }else{
                        $stmtCarDetails->bindValue($key,$value,PDO::PARAM_STR);
                    }
                }
                

                //EQUIPMENTS
                $queryCarEquipments = "INSERT INTO car_equipments(car_id,equip_id) VALUES";
                $hasEquipments = count($equipments) > 0;
                if ($hasEquipments ===  true) {
                    foreach ($equipments as $key => $value) {
                        if($key !== count($equipments) - 1){
                            $queryCarEquipments .="(:car_id$key,:equip_id$value),";
                        }else{
                            $queryCarEquipments .="(:car_id$key,:equip_id$value)";
                        }
                    }
                }

                $stmtCarEquipments = $this->pdo->prepare($queryCarEquipments);


                //CAR GALLERY
                $queryCarGallery = "INSERT INTO car_images(path,car_id) VALUES";
                $galleryLength = count($galleryPathArray);
                foreach ($galleryPathArray as $key => $value) {
                    if ($key !== $galleryLength - 1) {
                        $queryCarGallery .= "(:path$key,:car_id$key),";
                    }else{
                        $queryCarGallery .= "(:path$key,:car_id$key)";
                    }
                  
                }

            $stmtCarGallery = $this->pdo->prepare($queryCarGallery);


        $this->pdo->beginTransaction();
          
        try {
            $carId = "";
            $stmtCarCardExecuted = $stmtCarCard->execute();
            $carId = $this->pdo->lastInsertId();

            $stmtCarDetails->bindValue(':car_id',$carId,PDO::PARAM_INT);
            $stmtCarDetailsExecuted = $stmtCarDetails->execute();

            if ($hasEquipments) {
                foreach ($equipments as $key => $value) {
                    $stmtCarEquipments->bindValue(":car_id$key",$carId,PDO::PARAM_INT);
                    $stmtCarEquipments->bindValue(":equip_id$value",$value,PDO::PARAM_INT);      
                }
            }

            if ($hasEquipments === true) {
                $stmtCarEquipmentsExecuted = $stmtCarEquipments->execute(); 

            }else{
                $stmtCarEquipments = null;
                $stmtCarEquipmentsExecuted = false;
            }
           
            foreach ($galleryPathArray as $key => $value) {
                $stmtCarGallery->bindValue(":path$key",$value,PDO::PARAM_STR);
                $stmtCarGallery->bindValue(":car_id$key",$carId,PDO::PARAM_INT);
            }

            $stmtCarGalleryExecuted = $stmtCarGallery->execute();

            if ($stmtCarCardExecuted && $stmtCarDetailsExecuted && $stmtCarGalleryExecuted ) {
               
                if ($hasEquipments && $stmtCarEquipmentsExecuted) {
                    uploadThumbnail($thumbnail,$path,$thumbnailName);
                    uploadGalleryImages($gallery,$path,$galleryPathArray);
                    echo json_encode(["status"=> 1, "message"=>"Nouvelle voiture creé avec succès"]);
                }else if (!$hasEquipments) {
                    uploadThumbnail($thumbnail,$path,$thumbnailName);
                    uploadGalleryImages($gallery,$path,$galleryPathArray);
                    echo json_encode(["status"=> 1, "message"=>"Nouvelle voiture creé avec succès"]);
                }    
            }
        } catch (PDOException $e) {
          $this->pdo->rollBack();
          echo json_encode(["status"=>0,"message"=>"error" . $e->getMessage()]);
          return ;
        }

               
         $this->pdo->commit();
    }
}


public function addNewEquipment(string $equipment){
    $query = "INSERT INTO equipments(equipment) VALUE(:equipment)";

    if (!is_null($this->pdo)) {
        $stmt = $this->pdo->prepare($query);
        $stmt->bindValue(":equipment",$equipment);

        if ($stmt->execute()) {
            echo json_encode(["status"=> 1, "message"=>"Nouvel equipment ajouté avec succès","equipId"=>$this->pdo->lastInsertId()]);
        }else{
            echo json_encode(["status"=> 0,'message'=>"Erreur: un problème est survenu, rententez"]);
        }
    }else{
        echo json_encode(["status"=> 0,'message'=>"Erreur: un problème est survenu, rententez"]);
    }
}




public function getAllCars( int $currentPage){
    $query = "SELECT id,make,model,thumbnail,year,km,price,offer,created_at,cd.vo_number 
    FROM cars INNER JOIN car_details as cd ON cd.car_id = cars.id
    ORDER BY cars.created_at ASC
    LIMIT :currentPage,9";

    $queryCountCars = "SELECT count(*) as count FROM cars";

    if (!is_null($this->pdo)) {
      $stmt = $this->pdo->prepare($query);
      $stmt->bindValue(":currentPage",$currentPage,PDO::PARAM_INT);
      $stmtCount = $this->pdo->prepare($queryCountCars);
      $this->pdo->beginTransaction();
      
    try{
        $stmt->execute();
        $stmtCount->execute();
        $cars = [];
        while ($row = $stmt->fetch(PDO::FETCH_ASSOC)) {
                $cars[] = $row;
        }
        $count = $stmtCount->fetch(PDO::FETCH_COLUMN);
        echo json_encode(["status"=> 1, "cars"=>$cars,"count"=>$count]);
            
        } catch (PDOException $e) {

            echo json_encode(["status"=> 0, "message"=>"Erreur: Un problème est survenu, impossible de recuperer les voitures /" . $e->getMessage()]);
        }
        
      }else{
        echo json_encode(["status"=> 0, "message"=>"Erreur: Un problème est survenu, impossible de recuperer les voitures"]);
      }
    }




    public function deleteCar(int $id, string $thumbnail){
        $queryDeleteCar = "DELETE FROM cars WHERE id = :id";
        $queryGetImagesPath = "SELECT path FROM car_images WHERE car_id =  :id";

        if (!is_null($this->pdo)) {
            $stmtImages = $this->pdo->prepare($queryGetImagesPath);
            $stmtImages->bindValue(":id",$id,PDO::PARAM_INT);

            $stmt = $this->pdo->prepare($queryDeleteCar);
            $stmt->bindValue(":id",$id,PDO::PARAM_INT);

        $this->pdo->beginTransaction();
            try {
               
                $stmtImages->execute();
                $imagesArray = [];
                while ($row = $stmtImages->fetch(PDO::FETCH_COLUMN)) {
                   $imagesArray[]= $row;
                }
              
                if (count($imagesArray) > 0) {
                    
                    if ($stmt->execute()) {
                    
                        $imagesArray[] = $thumbnail;
                        deleteAllImagesFromFolder($imagesArray) ;     
                    }else{
                        echo json_encode(["status"=> 0, "message"=>"Erreur: Un problème est survenu, impossible de supprimer la voiture"]);
                    }

                }else{
                    $stmt->execute();
                }

            }catch (Exception $e) {
                $this->pdo->rollBack();
                echo json_encode(["status"=> 0, "message"=>"Erreur: Un problème est survenu, impossible de supprimer la voiture"]);
            }
     
  
        }else{
            echo json_encode(["status"=> 0, "message"=>"Erreur: Un problème connection, impossible de supprimer la voiture"]);
        }

        $this->pdo->commit();
    }

}




function uploadThumbnail($image,$path,$imageName){
    move_uploaded_file($image['tmp_name'], $path . $imageName);
}



function uploadGalleryImages($gallery,$path,$galleryPathArray){
    foreach ($gallery['tmp_name'] as $key => $imgTmp) {
       move_uploaded_file($imgTmp, $path . $galleryPathArray[$key]);
    } 
}


function deleteAllImagesFromFolder($images){
    $path = $_SERVER['DOCUMENT_ROOT'] ."/app/public/images/uploads/" ;
    foreach ($images as $key => $value) {
        unlink($path . $value);
    }
    echo json_encode(["status"=> 1, "message"=>"Voiture supprimé avec succès"]);
   
}