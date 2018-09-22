<!DOCTYPE html>
<html lang="en" dir="ltr">
  <head>
    <meta charset="utf-8">
    <title></title>
  </head>
  <body>

    <?php
    	try
    	{
    	 $conn_string = "mysql:host=mysli.oamk.fi;dbname=opisk_c8hape00";
    	 $db = new PDO ($conn_string, "c8hape00", "mysql");
    	 $db->setAttribute (PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);
    	//print ("Connected\n");
    	}
    	catch (PDOException $e)
    	{
    	 print ("Cannot connect to server\n");
    	 print ("Error code: " . $e->getCode () . "\n");
    	 print ("Error message: " . $e->getMessage () . "\n");
    	}

//    function get_books()
//    {
//        include "connection.php";
        $sql = "SELECT * FROM asiakas";
        $resultObject = $db->query($sql);
        $resultArray = $resultObject->fetchAll(PDO::FETCH_ASSOC);
        return $resultArray;
    }

    function show_books($a)
    {
      foreach ($a as $key)
      {
        echo "<p>";
        echo "asiakasID ".$key['asiakasID']."<br>";
        echo "etunimi ".$key['etunimi']."<br>";
        echo "sukunimi ".$key['sukunimi']."<br>";
        echo "osoite ".$key['osoite']."<br>";
        echo "postinumero ".$key['postinumero']."<br>";
        echo "postitoimipaikka".$key['postitoimipaikka']."<br>";
        echo "tunnus".$key['tunnus']."<br>";
        echo "salasana".$key['salasana']."<br>";
        echo "</p>";
      }

      echo "<p>";
      print_r($a);
      echo "</p>";
    }
    ?>

    <h2>Aiakkaat from the database</h2>

    <?php
    $books=get_books();
    show_books($books);
    ?>

  </body>
</html>
