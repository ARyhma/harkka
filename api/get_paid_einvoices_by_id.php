<?php
	require "connection.php";
	$id=$_GET['id'];

	$stmt=$db->prepare("SELECT saajannimi, tilitapahtumat.iban, viite, viesti, concat(left(maara, 1),' ',SUBSTR(maara, 2),' €') as maara, concat(DATE_FORMAT(aika,'%d'),'.',DATE_FORMAT(aika,'%m'),'.',DATE_FORMAT(aika,'%Y')) as pvm
		FROM tilitapahtumat JOIN tili ON tili.tiliID=tilitapahtumat.tiliID
		WHERE tili.omistajaID = :id AND tilitapahtumat.tapahtumaid = 1 order by aika desc");

	$stmt->bindParam(':id',$id);
	$stmt->execute();
	$result = $stmt->fetchAll(PDO::FETCH_ASSOC);

	echo json_encode($result);
	?>
