<?php
	require "connection.php";
	$id=$_GET['id'];

	$stmt=$db->prepare("SELECT saajannimi, iban, viite, viesti, maara, aika 
		FROM tilitapahtumat WHERE tiliID = :id");
	$stmt->bindParam(':id',$id);
	$stmt->execute();
	$result = $stmt->fetchAll(PDO::FETCH_ASSOC);

	echo json_encode($result);
	?>
