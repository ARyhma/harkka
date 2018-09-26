<?php
	include 'connection.php';

	$saajannimi = $_POST['nimi'];
	$iban=$_POST['tilinumero'];
	$bic='APANKKI';
	$viite=$_POST['viite'];
	$viesti=$_POST['viesti'];
	$maara=$_POST['maara'];
	$tiliID=$_POST['form_tili'];
	$tapahtumaid="1"; // e-invoice
	$aika=date("Y-m-d h:i:s");
	$erapaiva=$_POST['erapaiva'];

	if ($saajannimi == '' || $maara == '' || $maara <= 0 || $iban == '') {
	    http_response_code(404);
	}
	else {
		$maara = $maara * -1; // negative

		$sql=$db->prepare("INSERT INTO tilitapahtumat	(saajannimi,iban,bic,viite,viesti,maara,tiliID,tapahtumaid,aika,erapaiva)
		VALUES(:a_saajannimi,:a_iban,:a_bic,:a_viite,:a_viesti,:a_maara,:a_tiliid,:a_tapahtumaid,:a_aika,:a_erapaiva)");
		$sql->bindParam(':a_saajannimi',$saajannimi);
		$sql->bindParam(':a_iban',$iban);
		$sql->bindParam(':a_bic',$bic);
		$sql->bindParam(':a_viite',$viite);
		$sql->bindParam(':a_viesti',$viesti);
		$sql->bindParam(':a_maara',$maara);
		$sql->bindParam(':a_tiliid',$tiliID);
		$sql->bindParam(':a_tapahtumaid',$tapahtumaid);
		$sql->bindParam(':a_aika',$aika);
		$sql->bindParam(':a_erapaiva',$erapaiva);
		$sql->execute();

		$maara = abs($maara); // positive

		$sql=$db->prepare("UPDATE tili SET saldo = saldo - :a_maara WHERE tiliID=:a_tiliid");
		$sql->bindParam(':a_tiliid',$tiliID);
		$sql->bindParam(':a_maara',$maara);
		$sql->execute();

		if(isset($_GET['id'])) {
			$id=$_GET['id'];
			$stmt=$db->prepare("DELETE FROM elasku WHERE elaskuID = :id");
			$stmt->bindParam(':id',$id);
			$stmt->execute();
		}
		http_response_code(201);
	}
?>
