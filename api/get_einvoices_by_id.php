<?php
	require "connection.php";
	$id=$_GET['id'];

	$stmt=$db->prepare("SELECT elaskuID, saajannimi, iban, bic, viite, viesti, maara, aika, erapaiva
		FROM elasku WHERE asiakasid = :id");
	$stmt->bindParam(':id',$id);
	$stmt->execute();
	$result = $stmt->fetchAll(PDO::FETCH_ASSOC);

	echo json_encode($result);
	?>
