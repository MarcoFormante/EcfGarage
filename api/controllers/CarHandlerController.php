<?php



Class CarHandlerController{

    public function getAllEquipments(){
        $carHandler = new carHandler();
        $carHandler->getAllEquipments();
    }

    public function createNewCar($thumbnail,$gallery,$details,$equipments){
        $carHandler = new carHandler();
        $carHandler->createNewCar($thumbnail,$gallery,$details,$equipments);
    }


    public function addNewEquipment(string $equipment){
        $carHandler = new carHandler();
        $carHandler->addNewEquipment($equipment);
    }

    public function getAllCars(int $currentPage, string $filters, $filterValue){
        $carHandler = new carHandler();
        $carHandler->getAllCars($currentPage,$filters,$filterValue);
    }


    public function deleteCar(int $id, string $thumbnail){
        $carHandler = new carHandler();
        $carHandler->deleteCar($id,$thumbnail);
    }


    public function updateCar(string $table ,string $column, $value, int $id ,string $imageData = null){
        $imageData = htmlspecialchars($imageData);
        $carHandler = new carHandler();
        $carHandler->updateCar($table,$column,$value,$id,$imageData);
    }
}
