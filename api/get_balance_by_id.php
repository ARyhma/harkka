<?php
	require "connection.php";
	$id=$_GET['id'];

	$stmt=$db->prepare("SELECT tiliID, tilinnimi, tilinumero, saldo FROM tili
		WHERE omistajaID = :id");
	$stmt->bindParam(':id',$id);
	$stmt->execute();
	$result = $stmt->fetchAll(PDO::FETCH_ASSOC);

	echo json_encode($result);
	?>
