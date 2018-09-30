<!DOCTYPE html>
<html lang="en" dir="ltr">
  <head>
    <meta charset="utf-8">
    <title>A-Pankki - E-laskut</title>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css">
    <script src="rest.js"></script>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js"></script>
  </head>
  <body>

    <?php include 'navbar.php';?>

    <div class="container" style="margin:50px">

      <div class="container" id="abc" style="max-width: 800px">

      <div class="dropdown" id="tilinro"></div>
      <button type="button" class="btn btn-primary dropdown-toggle" id="valitse_tili" data-toggle="dropdown">Valitse tili</button>
      <ul class="dropdown-menu" role="menu" id="tee_uusi_maksu">
      </ul>

      <script>
        Populate_dropdown_for_id(<?php echo $_SESSION['asiakasID']; ?>);
      </script>

      <script>
      $(function(){
        $(".dropdown-menu").on('click', 'li a', function(event){
          $("#valitse_tili").text($(this).text());
          var x = this.getAttribute("data-value");
          GetAccountDetails_for_id(x);
          document.getElementById("form_tili").value = x;
         });
      });
      </script>

      <br><br>

      <div class="container" style="max-width: 800px">
        <h3>Maksutilin Tiedot</h3>
        <table class="table table-bordered" id="tili_tiedot">
          <tr><td>Tilinumero</td><td></td>
          <td>IBAN</td><td></td></tr>
          <tr><td>Tilin Nimi</td><td></td>
          <td>Tilin Saldo</td><td> </td><tr>
          <tr><td>SWIFT/BIC</td><td></td>
          <td>Tilin Omistaja</td><td>
          </td></tr>
        </table>
      </div>

      <br>

      <form id='AddNewPaymentForm'>
        <div class="container-fluid">
          <h3>Vastaanottajan Tiedot</h3>
          <div class="row" style="padding:5px">
            <div class="col-3">Tilinumero</div>
            <div class="col"><input type="text" class="form-control" name="tilinumero" id="tilinumero" readonly></div>
          </div>
          <div class="row" style="padding:5px">
            <div class="col-3">BIC</div>
            <div class="col"><input type="text" class="form-control" name="bic" id="bic" readonly></div>
          </div>
          <div class="row" style="padding:5px">
            <div class="col-3">Nimi</div>
            <div class="col"><input type="text" class="form-control" name="nimi" id="nimi" readonly></div>
          </div>
          <div class="row" style="padding:5px">
            <div class="col-3">Viite</div>
            <div class="col"><input type="text" class="form-control" name="viite" id="viite" readonly></div>
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
          <input type="hidden" name="form_tili" id="form_tili">
        </div>
      </form>
      <div class="row" style="padding:20px 0 5px 0">
        <div class="col-3"><button onclick='AddNewPaymentforEInvoice(<?php echo $_GET['id'] ?>)' class="btn btn-primary">Maksa</button></div>
        <div class="col"><div class="container" id="results"></div></div>
      </div>

      <script>
      Fill_EInvoice_info_for_id(<?php echo $_GET['id'] ?>);
      </script>

    </div>

  </body>
</html>
