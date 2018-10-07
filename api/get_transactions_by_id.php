<?php
	require "connection.php";
	$id=$_GET['id'];

	$stmt=$db->prepare("SELECT t.saajannimi, t.iban, t.viite, t.viesti, concat(left(t.maara, 1),' ',SUBSTR(t.maara, 2),' €') as maara, tt.tapahtuma, concat(DATE_FORMAT(t.aika,'%d'),'.',DATE_FORMAT(t.aika,'%m'),'.',DATE_FORMAT(t.aika,'%Y')) as pvm  
			FROM tilitapahtumat t, tapahtumat tt WHERE t.tapahtumaid=tt.tapahtumaid and tiliID = :id order by aika desc");
	$stmt->bindParam(':id',$id);
	$stmt->execute();
	$result = $stmt->fetchAll(PDO::FETCH_ASSOC);

	echo json_encode($result);
	?>
