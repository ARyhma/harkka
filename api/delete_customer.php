<?php
	session_start();
	if(isset($_SESSION['idUsers'])) {
		require "connection.php";
		$id=$_GET['id'];

		$stmt=$db->prepare("DELETE FROM asiakas WHERE asiakasID = :id");
		$stmt->bindParam(':id',$id);
		$stmt->execute();
		http_response_code(201);
	}
	else {
		echo '<p>Virhe - idUsers not set</p>';
	}
	?>
