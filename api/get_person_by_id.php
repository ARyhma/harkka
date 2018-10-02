<?php
	require "connection.php";
	$id=$_GET['id'];

	$stmt=$db->prepare("SELECT etunimi, sukunimi, osoite, postinumero, postitoimipaikka FROM asiakas WHERE asiakasID = :id");
	$stmt->bindParam(':id',$id);
	$stmt->execute();
	$result = $stmt->fetchAll(PDO::FETCH_ASSOC);

	echo json_encode($result);
	?>
