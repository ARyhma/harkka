<!DOCTYPE html>
<html lang="en" dir="ltr">
  <head>
    <meta charset="utf-8">
    <title>A-Pankki</title>
      <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css" integrity="sha384-MCw98/SFnGE8fJT3GXwEOngsV7Zt27NXFoaoApmYm81iuXoPkFOJwJ8ERdknLPMO" crossorigin="anonymous">
      <script src="rest.js"></script>
  </head>
  <body>

    <?php include 'navbar.php';?>

    <div class="container" style="margin:40px auto;">

    <script>
      GetBalance_for_id( <?php echo $_SESSION['asiakasID']; ?> );
    </script>

    <div class="container" style="max-width: 800px;">
      <h2>Tilit</h2>
      <table class="table table-striped table-bordered table-hover">
      <thead><tr><th>Tilin Nimi</th><th>Tilinumero</th><th>Saldo</th><th></th></tr></thead>
      <tbody id="tilit"></tbody>
      </table>
    </div>

    <div class="container" style="max-width: 800px;">
        <button class="btn btn-outline-secondary" onclick="window.location.href = './new_payment.php';">Tee uusi maksu</button>
        <button class="btn btn-outline-secondary" onclick="window.location.href = './move_money_between_accounts.php';">Siirrä rahaa tilien välillä</button>
        <button class="btn btn-outline-secondary" onclick="window.location.href = './show_transactions.php';">Tilitapahtumat</button>
        <button class="btn btn-outline-secondary" onclick="window.location.href = './show_paid_einvoices.php?id=2';">Maksetut e-laskut</button>
    </div>

    <script>
      GetCards_for_id( <?php echo $_SESSION['asiakasID']; ?> );
    </script>

    <br>

    <div class="container" style="max-width: 800px">
      <h2>Kortit</h2>
      <table class="table table-striped table-bordered table-hover">
      <thead><tr><th>Kortin Nimi</th><th>Voimassaolopäivä</th><th>Kortin Numero</th><th>Luottoraja</th></tr></thead>
      <tbody id="kortit"></tbody>
      </table>
    </div>

    <script>
      GetEInvoices_for_id( <?php echo $_SESSION['asiakasID']; ?> );
    </script>

    <div class="container"  style="max-width: 800px">
      <h2>Saapuneet e-laskut</h2>
      <table class="table table-striped table-bordered table-hover">
      <thead><tr><th>Laskuttaja</th><th>IBAN</th><th>Viesti</th><th>Määrä</th><th>Eräpäivä</th><th></th></tr></thead>
      <tbody id="elaskut"></tbody>
      </table>
    </div>

  </div>
  </body>
</html>
