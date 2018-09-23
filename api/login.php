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

			$sql2=$db->prepare("SELECT etunimi, sukunimi FROM asiakas WHERE asiakasID = :asiakasID");
			$sql2->bindParam(':asiakasID',$success);
			$sql2->execute();
			$result2 = $sql2->fetchAll(PDO::FETCH_ASSOC);

//			echo $result2[0]['etunimi'];
//			echo $result2[0]['sukunimi'];
			$_SESSION['firstname']=$result2[0]['etunimi'];
      $_SESSION['lastname']=$result2[0]['sukunimi'];

      header("Location: ../ui/index.php");
      exit();
  }
  else {
    header("Location: ../index.php?error=1");
  }
?>
