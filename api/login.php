<?php
require "connection.php";
	$username=$_POST['username'];
  $password=$_POST['password'];

  $sql = $db->prepare("SELECT asiakasID FROM tunnarit WHERE kayttajatunnus = :username AND passu = :password");
  $sql->bindParam(':username',$username);
  $sql->bindParam(':password',$password);
  $sql->execute();
	$result = $sql->fetch(PDO::FETCH_ASSOC);

  $success = $result['asiakasID'];

  if($success > 0){
      session_start();
      $_SESSION['username']=$username;
      $_SESSION['asiakasID']=$success;
      header("Location: ../ui/index.php");
      exit();
  }
  else {
    header("Location: ../index.html");
  }
?>
