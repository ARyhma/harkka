<!DOCTYPE html>
<html lang="en" dir="ltr">
  <head>
    <meta charset="utf-8">
    <title>A-Pankki</title>
      <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css" integrity="sha384-MCw98/SFnGE8fJT3GXwEOngsV7Zt27NXFoaoApmYm81iuXoPkFOJwJ8ERdknLPMO" crossorigin="anonymous">
      <script src="rest.js"></script>
      <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
      <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js"></script>
      <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js"></script>
  </head>
  <body>

    <?php include 'navbar.php';?>

    <div class="container" style="margin:40px">

    <p>
      <script>
        GetBalance_for_id( <?php echo $_SESSION['asiakasID']; ?> );
      </script>
    </p>

    <div class="container" style="max-width: 800px">
      <h2>Tilit</h2>
      <table class="table table-striped table-bordered table-hover">
      <thead><tr><th>Tilin Nimi</th><th>Tilinumero</th><th>Saldo</th><th></th></tr></thead>
      <tbody id="tilit"></tbody>
      </table>
    </div>

    <div class="container" id="tilit" style="max-width: 800px; ">
        <button class="btn btn-outline-secondary" onclick="window.location.href = './new_payment.php';">Tee uusi maksu</button>
        <button class="btn btn-outline-secondary" onclick="window.location.href = './move_money_between_accounts.php';">Siirrä rahaa tilien välillä</button>
        <button class="btn btn-outline-secondary" onclick="window.location.href = './show_transactions.php';">Tilitapahtumat</button>
    </div>

    <p>
      <script>
        GetCards_for_id( <?php echo $_SESSION['asiakasID']; ?> );
      </script>
    </p>

    <div class="container" style="max-width: 800px">
      <h2>Kortit</h2>
      <table class="table table-striped table-bordered table-hover">
      <thead><tr><th>Kortin Nimi</th><th>Voimassaolopäivä</th><th>Kortin Numero</th><th>Luottoraja</th></tr></thead>
      <tbody id="kortit"></tbody>
      </table>
    </div>

    <p>
      <script>
        GetEInvoices_for_id( <?php echo $_SESSION['asiakasID']; ?> );
      </script>
    </p>

    <div class="container"  style="max-width: 800px">
      <h2>Saapuneet e-laskut</h2>
      <table class="table table-striped table-bordered table-hover">
      <thead><tr><th>Laskuttaja</th><th>IBAN</th><th>Viesti</th><th>Määrä</th><th>Eräpäivä</th><th></th></tr></thead>
      <tbody id="elaskut"></tbody>
      </table>
    </div>

    <!--p>
        <button class="btn btn-primary" onclick="GetCustomers()">Kaikki asiakkaat</button>

        Anna asiakas id
        <input type="text" id="customer_id">
        <button onclick="GetCustomer_by_id()">Etsi asiakas</button>
    </p>

    <p>
        Lisää uusi asiakas
        <br>
        <form id='AddNewCustomerForm'>
            <label for="name">Etunimi</label> <br>
            <input type="text" name="etunimi" id="etunimi"> <br>
            <label for="author">Sukunimi</label> <br>
            <input type="text" name="sukunimi" id="sukunimi"> <br>
            <label for="author">Osoite</label> <br>
            <input type="text" name="osoite" id="osoite"> <br>
            <label for="author">postinumero</label> <br>
            <input type="text" name="postinumero" id="postinumero"> <br>
            <label for="author">postitoimipaikka</label> <br>
            <input type="text" name="postitoimipaikka" id="postitoimipaikka"> <br>
        </form>
        <button onclick="AddNewCustomer()">Lisää asiakas</button>
    </p>
    <p>
      Anna poistettavan kirjan id
      <input type="number" id="delete_id">
      <button class="btn btn-danger" onclick="DeleteBook()">Poista</button>
    </p>

    <p>
        Muokkaa kirja
        <br>
        <form id='UpdateForm'>
          <label for="name">Book id</label> <br>
          <input type="text" name="idBooks" id="idBooks"> <br>
            <label for="name">Book name</label> <br>
            <input type="text" name="name" id="name"> <br>
            <label for="author">Author</label> <br>
            <input type="text" name="author" id="author"> <br>
        </form>
        <button onclick="UpdateBook()">Tallenna</button>
    </p>
-->

    <div id="results"></div>
  </div>
  </body>
</html>
