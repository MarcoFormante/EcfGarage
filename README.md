
Garage Vincent Parrot ECF 2023.

Hello everyone, for this project i used xaamp, react, and php
so..
 
Install XAMPP (or WAMP if you don't use XAMPP).

Navigate to C:/xampp/htdocs in File Explorer.
Right-click in an empty area inside this folder and click "Open in Terminal."
In the terminal, enter the command: git clone https://github.com/MarcoFormante/EcfGarage.git
Rename the "EcfGarage" folder to "app".
Run the following command lines in the terminal:

cd app

npm install;

npm audit fix ;

You'll also need to install Composer. 
After installing Composer, run this command in the terminal:
composer require firebase/php-jwt

Inside the "app" folder, create a new file named ".env.development" and open it.
Write the following line inside it:
REACT_APP_HTTP=http://localhost/app/api/

Ensure that Apache is running in the XAMPP control panel.

Create a file named ".htaccess" inside the "app" folder and open it. Set the environment variables for the JWT code and the path folder for "vendor/autoload.php" as follows:
Setenv JWTkey "mySecretJWTKey" (choose one secret key)
Setenv path "app"

Inside api folder /models/connection.php:
for connection the host is "localhost", dbname is "garage", username is "root", password is empty "";
mysql:host=localhost;dbname=garage","root",""
if use another name and password, change them.

In your browser, go to localhost/phpmyadmin, then go to SQL and execute the following query:
CREATE DATABASE garage 

Next, click on "Import" and import the file "garage.sql" located inside the "app" folder.
Finally, in the terminal, run the command: npm start

You can try to log in with these credentials in "Espace Reservé":

Email: testadmin@gmail.com
Password: Testadmin23

Feel free to create new cars or modify them. Please note that there are no images in the images/uploads folder related to the path images in the "car_images" table.

If you need any assistance, please reach out to formante.marco@gmail.com
