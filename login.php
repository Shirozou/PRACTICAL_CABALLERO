<?php
$conn = mysqli_connect("localhost", "root", "" , "library");
if(!$conn){
    die("connection failed");
}
$email = $_POST['email'];
$password = $_POST['password'];
$sql = "SELECT * FROM stafftable WHERE email='$email' AND password='$password'";
$result=mysqli_query($conn, $sql);
if(mysqli_num_rows($result)> 0){
    echo "SUCCESS";
    exit();
}else{
    echo "FAILED";
}
mysqli_close($conn)
?>

