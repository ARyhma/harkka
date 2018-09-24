<?php
	require "connection.php";
	$id=$_GET['id'];

//	$stmt=$db->prepare("SELECT tiliID, tilinnimi, tilinumero, saldo, iban, bic
//		FROM tili WHERE tiliID = :id");
	$stmt=$db->prepare("SELECT tiliID, tilinnimi, tilinumero, saldo, iban, bic, asiakas.sukunimi, asiakas.etunimi FROM tili JOIN asiakas ON	asiakas.asiakasID=tili.omistajaID WHERE tiliID = :id");
	$stmt->bindParam(':id',$id);
	$stmt->execute();
	$result = $stmt->fetchAll(PDO::FETCH_ASSOC);

	echo json_encode($result);
	?>
