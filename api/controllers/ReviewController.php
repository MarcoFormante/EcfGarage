<?php


Class ReviewController{

    public function getReviews(){
        $Review = new Review();
        return $Review->getReviews();
    }

    public function newReview(string $name, string $message, int $review){
        
        $Review = new Review();
        $Review->newReview($name,$message, $review);
          
    }   

}
?>