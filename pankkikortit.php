<!DOCTYPE html>
<html lang="en" dir="ltr">
  <head>
    <meta charset="utf-8">
    <title>MySQL</title>
  </head>
  <body>

    <?php
    function get_books()
    {
    	try
    	{
    	 $conn_string = "mysql:host=mysli.oamk.fi;dbname=opisk_c8hape00";
       $db = new PDO ($conn_string, "c8hape00", "mysql");
    	 $db->setAttribute (PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);
    	 print ("-- connected --\n");
    	}
    	catch (PDOException $e)
    	{
    	 print ("Cannot connect to server\n");
    	 print ("Error code: " . $e->getCode () . "\n");
    	 print ("Error message: " . $e->getMessage () . "\n");
    	}

      $sql = "SELECT * FROM pankkikortit";
      $resultObject = $db->query($sql);
      $resultArray = $resultObject->fetchAll(PDO::FETCH_ASSOC);
      return $resultArray;
    }

    function show_books($a)
    {
      foreach ($a as $key)
      {
        echo "<p>";
        echo "pankkikorttiID ".$key['pankkikorttiID']."<br>";
        echo "pankkikortinnimi ".$key['pankkikortinnimi']."<br>";
        echo "voimassaolo ".$key['voimassaolo']."<br>";
        echo "kortinnumero ".$key['kortinnumero']."<br>";
        echo "asiakasid ".$key['asiakasid']."<br>";
        echo "tili_tiliID".$key['tili_tiliID']."<br>";
        echo "</p>";
      }

    }
    ?>

    <h2>Pankkiortit:</h2>

    <?php
    $books=get_books();
    show_books($books);
    ?>

  </body>
</html>
