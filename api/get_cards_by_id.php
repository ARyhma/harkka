<?php
	require "connection.php";
	$id=$_GET['id'];

	$stmt=$db->prepare("SELECT pankkikortinnimi, voimassaolo, kortinnumero, luottoraja FROM pankkikortit WHERE asiakasid = :id");
	$stmt->bindParam(':id',$id);
	$stmt->execute();
	$result = $stmt->fetchAll(PDO::FETCH_ASSOC);

	echo json_encode($result);
	?>
