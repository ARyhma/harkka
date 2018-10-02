<!DOCTYPE html>
<html lang="en" dir="ltr">
  <head>
    <meta charset="utf-8">
    <title>A-Pankki - Henkilötiedot</title>
      <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css" integrity="sha384-MCw98/SFnGE8fJT3GXwEOngsV7Zt27NXFoaoApmYm81iuXoPkFOJwJ8ERdknLPMO" crossorigin="anonymous">
      <script src="rest.js"></script>
  </head>
  <body>

    <?php include 'navbar.php';?>

    <div class="container" style="margin:40px auto; max-width: 800px">

      <script>
        GetPerson_for_id( <?php echo $_SESSION['asiakasID']; ?> );
      </script>

      <form id="UpdateForm">
        <div class="container-fluid">
          <h3>Asiakastiedot</h3>
          <div class="row" style="padding:5px">
            <div class="col-3">Etunimi</div>
            <div class="col"><input type="text" class="form-control" name="etunimi" id="etunimi" readonly></div>
          </div>
          <div class="row" style="padding:5px">
            <div class="col-3">Sukunimi</div>
            <div class="col"><input type="text" class="form-control" name="sukunimi" id="sukunimi" readonly></div>
          </div>
          <div class="row" style="padding:5px">
            <div class="col-3">Osoite</div>
            <div class="col"><input type="text" class="form-control" name="osoite" id="osoite"></div>
          </div>
          <div class="row" style="padding:5px">
            <div class="col-3">Postinumero</div>
            <div class="col"><input type="text" class="form-control" name="postinumero" id="postinumero"></div>
          </div>
          <div class="row" style="padding:5px">
            <div class="col-3">Postitoimipaikka</div>
            <div class="col"><input type="text" class="form-control" name="postitoimipaikka" id="postitoimipaikka"></div>
          </div>
        </div>
      </form>
      <div class="row" style="padding:20px 0 5px 0">
        <div class="col-3"><button onclick='UpdatePerson( <?php echo $_SESSION['asiakasID']; ?> )' class="btn btn-primary">Muuta Tiedot</button></div>
        <div class="col"><div class="container" id="results"></div></div>
      </div>

    </div>

  </body>
</html>
