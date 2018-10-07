<?php
	require "connection.php";
	$id=$_GET['id'];

	$stmt=$db->prepare("SELECT saajannimi, iban, viite, viesti, concat(left(maara, 1),' ',SUBSTR(maara, 2),' €') as maara, concat(DATE_FORMAT(aika,'%d'),'.',DATE_FORMAT(aika,'%m'),'.',DATE_FORMAT(aika,'%Y')) as pvm 
		FROM tilitapahtumat WHERE tiliID = :id order by aika desc");
	$stmt->bindParam(':id',$id);
	$stmt->execute();
	$result = $stmt->fetchAll(PDO::FETCH_ASSOC);

	echo json_encode($result);
	?>
