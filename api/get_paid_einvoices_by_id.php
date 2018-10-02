<?php
	require "connection.php";
	$id=$_GET['id'];

	$stmt=$db->prepare("SELECT saajannimi, tilitapahtumat.iban, viite, viesti, maara, aika
		FROM tilitapahtumat JOIN tili ON tili.tiliID=tilitapahtumat.tiliID
		WHERE tili.omistajaID = :id AND tilitapahtumat.tapahtumaid = 1");

	$stmt->bindParam(':id',$id);
	$stmt->execute();
	$result = $stmt->fetchAll(PDO::FETCH_ASSOC);

	echo json_encode($result);
	?>
