<?php
	require "connection.php";
	$id=$_GET['id'];

	$stmt=$db->prepare("SELECT pankkikortinnimi, concat(DATE_FORMAT(voimassaolo,'%d'),'.',DATE_FORMAT(voimassaolo,'%m'),'.',DATE_FORMAT(voimassaolo,'%Y')) as voimassaolo, kortinnumero, luottoraja FROM pankkikortit WHERE asiakasid = :id");
	$stmt->bindParam(':id',$id);
	$stmt->execute();
	$result = $stmt->fetchAll(PDO::FETCH_ASSOC);

	echo json_encode($result);
	?>
