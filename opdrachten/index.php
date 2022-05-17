<?php

$host = "127.0.0.1";
$user = "root";
$password = "";
$database = "sales_database";

$customerNumber = 103;

echo "MySQL PDO Stored procedure call<br>";

try {

     $pdo = new PDO("mysql:host=$host;dbname=$database", $user, $password);

     // calling stored procedure command
     $sql = 'CALL p_get_customer_shipping(:id, @return)';

     // prepare for execution of the stored procedure
     $stmt = $pdo->prepare($sql);

     // pass value to the command
     $stmt->bindParam(':id', $customerNumber, PDO::PARAM_INT);

     // execute the stored procedure
     $stmt->execute();

     $stmt->closeCursor();

     // execute the second query to get customer's shipping
     $row = $pdo->query("SELECT @return AS shipping")->fetch(PDO::FETCH_ASSOC);
     if ($row) {
         echo $row !== false ? $row['shipping'] : "Oops...";
     }

} catch (PDOException $e) {
    die("Error occurred:" . $e->getMessage());
}



?>