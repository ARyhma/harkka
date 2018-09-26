<!DOCTYPE html>
<html lang="en" dir="ltr">
  <head>
    <meta charset="utf-8">
    <title>A-Pankki</title>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css">
    <script src="rest.js"></script>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js"></script>
  </head>
  <body>

    <nav class="navbar navbar-expand-sm bg-dark navbar-dark">
      <a class="navbar-brand" href="index.php">A-Pankki</a>
      <ul class="navbar-nav">
        <li class="nav-item">
          <a class="nav-link" href="#">Link 1</a>
        </li>
        <li class="nav-item">
          <a class="nav-link" href="#">Link 2</a>
        </li>
        <li class="nav-item">
          <a class="nav-link" href="#">Link 3</a>
        </li>
      </ul>
      <span class="navbar-text ml-auto">
        <?php
          session_start();
          if(isset($_SESSION['username'])){
            echo 'Tervetuloa '.$_SESSION['firstname'].' '.$_SESSION['lastname'];
            echo '<a href="../api/logout.php"><button class="btn btn-link">Kirjaudu ulos</button></a>';
          }
          else {
            echo 'Tervetuloa vieras ';
            echo '<a href="../index.php"><button type="button" class="btn btn-link">Kirjaudu</button></a>';
          }
        ?>
      </span>
    </nav>

    <div class="container" style="margin:50px">

      <div class="container" style="max-width: 800px">

      <div class="dropdown" id="tilinro">
        <button type="button" class="btn btn-primary dropdown-toggle" id="valitse_tili" data-toggle="dropdown">Valitse tili</button>
        <ul class="dropdown-menu" role="menu" id="tee_uusi_maksu">
        </ul>
      </div>

      <script>
        Populate_dropdown_for_id( <?php echo $_SESSION['asiakasID']; ?> );
      </script>

      <script>
      $(function(){
        $("#tee_uusi_maksu").on('click', 'li a', function(event){
          $("#valitse_tili").text($(this).text());
          var x = this.getAttribute("data-value");
          GetAccountDetails_for_id(x);
          document.getElementById("form_tili_maksu").value = x;
         });
      });
      </script>

      <br>

      <div class="container" style="max-width: 800px">
        <h3>Maksutilin Tiedot</h3>
        <table class="table table-bordered" id="tili_tiedot">
          <tr><td>Tilinumero</td><td></td>
          <td>IBAN</td><td></td></tr>
          <tr><td>Tilin Nimi</td><td></td>
          <td>Tilin Saldo</td><td></td><tr>
          <tr><td>SWIFT/BIC</td><td></td>
          <td>Tilin Omistaja</td><td>
          </td></tr>
        </table>
      </div>


      <br>


      <div class="dropdown" id="tilinro_vastaanottaja">
      <button type="button" class="btn btn-primary dropdown-toggle" id="valitse_tili_vastaanottaja" data-toggle="dropdown">Valitse tili</button>
      <ul class="dropdown-menu" role="menu" id="tee_uusi_maksu_vastaanottaja">
      </ul>
      </div>

      <script>
        Populate_dropdown_for_id_vastaanottaja( <?php echo $_SESSION['asiakasID']; ?> );
      </script>

      <script>
      $(function(){
        $("#tee_uusi_maksu_vastaanottaja").on('click', 'li a', function(event){
          $("#valitse_tili_vastaanottaja").text($(this).text());
          var x = this.getAttribute("data-value");
          GetAccountDetails_for_id_vastaanottaja(x);
          document.getElementById("form_tili_vastaanottaja").value = x;
         });
      });
      </script>

      <br>

      <div class="container" style="max-width: 800px">
        <h3>Vastaanottavan Tilin Tiedot</h3>
        <table class="table table-bordered" id="tili_tiedot_vastaanottaja">
          <tr><td>Tilinumero</td><td></td>
          <td>IBAN</td><td></td></tr>
          <tr><td>Tilin Nimi</td><td></td>
          <td>Tilin Saldo</td><td></td><tr>
          <tr><td>SWIFT/BIC</td><td></td>
          <td>Tilin Omistaja</td><td>
          </td></tr>
        </table>
      </div>

      <form id='AddNewPaymentForm'>
        <div class="container-fluid">
          <h3>Maksun Lisätiedot</h3>
          <div class="row" style="padding:5px">
            <div class="col-3">Viite</div>
            <div class="col"><input type="text" class="form-control" name="viite" id="viite"></div>
          </div>
          <div class="row" style="padding:5px">
            <div class="col-3">Viesti</div>
            <div class="col"><input type="text" class="form-control" name="viesti" id="viesti"></div>
          </div>
          <div class="row" style="padding:5px">
            <div class="col-3">Eräpäivä</div>
            <div class="col"><input type="text" class="form-control" name="erapaiva" id="erapaiva" value="<?php echo date("Y-m-d h:i:s"); ?>"></div>
          </div>
          <div class="row" style="padding:5px">
            <div class="col-3">Maksun määrä</div>
            <div class="col"><input type="text" class="form-control" name="maara" id="maara"></div>
          </div>
          <input type="hidden" name="form_tili_maksu" id="form_tili_maksu">
          <input type="hidden" name="form_tili_vastaanottaja" id="form_tili_vastaanottaja">
        </div>
      </form>
      <div class="row" style="padding:20px 0 5px 0">
        <div class="col-3"><button onclick='MoveMoneyBetweenAccounts()' class="btn btn-primary">Maksa</button></div>
        <div class="col"><div class="container" id="results"></div></div>
      </div>

    </div>

  </body>
</html>
