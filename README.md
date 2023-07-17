
Garage Vincent Parrot ECF 2023.

Hello everyone, for this project i used xaamp, react, and php
so..
 
install xampp (or wamp if you don't use xampp )

go inside C:/ xampp / htdocs

right click in empty zone inside this folder and click  "open in terminal" ;

write : git clone https://github.com/MarcoFormante/EcfGarage.git

rename "EcfGarage" folder to "app";

command line in terminal : 

cd app

npm install;

npm audit fix ;

you need to install composer 

when you got composer write this command line in the terminal "composer require firebase/php-jwt"

inside "app" folder :

-create a new file ".env.development" , open it and write REACT_APP_HTTP= http://localhost/app/api/ ;
check in xampp control panel if apache is running ;

-create a file ".htaccess" , open it and  set the env for jwt code and path folder for vendor/autoload.php :
Setenv JWTkey "mySecretJWTKey" (choose one secret key)
Setenv path "app"


In your browser search for localhost/phpmyadmin , go to SQL and write : CREATE DATABASE garage ,and execute it

then go to "import" and import the file "garage.sql" inside the app folder;

and last command line in terminal (normally) : npm start


Try to logIn with this credentials in "Area Reservè" :

testadmin@gmail.com	
Testadmin23

try to create new cars or modify them.
there are not images in upload folder related with path images in car_images table

need some help? 

formante.marco@gmail.com
