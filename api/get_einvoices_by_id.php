<?php
	require "connection.php";
	$id=$_GET['id'];

	$stmt=$db->prepare("SELECT elaskuID, saajannimi, iban, bic, viite, viesti, concat(maara,' €') as maara, aika, concat(DATE_FORMAT(erapaiva,'%d'),'.',DATE_FORMAT(erapaiva,'%m'),'.',DATE_FORMAT(erapaiva,'%Y')) as erapaiva
		FROM elasku WHERE asiakasid = :id");
	$stmt->bindParam(':id',$id);
	$stmt->execute();
	$result = $stmt->fetchAll(PDO::FETCH_ASSOC);

	echo json_encode($result);
	?>
