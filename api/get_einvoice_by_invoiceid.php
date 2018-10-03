<?php
	require "connection.php";
	$id=$_GET['id'];

	$stmt=$db->prepare("SELECT saajannimi, iban, bic, viite, viesti, maara, concat(DATE_FORMAT(erapaiva,'%d'),'.',DATE_FORMAT(erapaiva,'%m'),'.',DATE_FORMAT(erapaiva,'%Y')) as erapaiva
		FROM elasku WHERE elaskuID = :id");
	$stmt->bindParam(':id',$id);
	$stmt->execute();
	$result = $stmt->fetchAll(PDO::FETCH_ASSOC);

	echo json_encode($result);
	?>
