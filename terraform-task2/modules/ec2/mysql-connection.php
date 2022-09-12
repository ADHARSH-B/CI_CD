<h1>Hello Cloudreach!</h1>
<h4>Attempting MySQL connection from php...</h4>
<?php
$servername = file_get_contents("/home/ubuntu/rds_endpoint.txt");
$username = file_get_contents("/home/ubuntu/username.txt");
$password = file_get_contents("/home/ubuntu/password.txt");

// Create connection
$conn = new mysqli($servername, $username, $password);
echo "Attempting to connect mysql <br/>";
// Check connection
if ($conn->connect_error) {
  die("Connection failed: " . $conn->connect_error);
}
echo "Connected successfully";
?>
