function GetCustomers() {
  var url = '../api/get_customers.php';
  var xhttp = new XMLHttpRequest();
  xhttp.open('GET', url, true);
  var jsonData = '';
  var data = '<table class="table table-bordered table-hover">';
  data += '<tr><th>asiakasID</th><th>Etunimi</th><th>Sukunimi</th><th>Osoite</th><th>Postinumero</th><th>Postitoimipaikka</th><th>Poista</th></tr>';
  xhttp.onreadystatechange = function() {
    if (xhttp.readyState == 4 && xhttp.status == 200) {
      jsonData = JSON.parse(xhttp.responseText);
      for (x in jsonData) {
        data +=
          '<tr><td>' + jsonData[x].asiakasID +
          '</td><td>' + jsonData[x].etunimi +
          '</td><td> ' + jsonData[x].sukunimi +
          '</td><td> ' + jsonData[x].osoite +
          '</td><td> ' + jsonData[x].postinumero +
          '</td><td> ' + jsonData[x].postitoimipaikka +
          '</td><td><a href="../api/delete_customer.php?id=' +
          jsonData[x].asiakasID + '">Poista</a></td></tr>';
      }
      data += '</table>';
      document.getElementById('results').innerHTML = data;
    }
  };
  xhttp.send();
}

function GetCustomer_by_id() {
  var id = document.getElementById('customer_id').value;
  var url ='../api/get_customer_by_id.php?id=';
  url += id;
  var xhttp = new XMLHttpRequest();
  xhttp.open('GET', url, true);
  var jsonData = '';
  var data = '<table border="1">';
  data += '<tr><th>Etunimi</th><th>Sukunimi</th></tr>';
  xhttp.onreadystatechange = function() {
    if (xhttp.readyState == 4 && xhttp.status == 200) {
      jsonData = JSON.parse(xhttp.responseText);
      for (x in jsonData) {
        data +=
          '<tr><td>' + jsonData[x].etunimi +
          '</td><td> ' + jsonData[x].sukunimi +
          '</td></tr>';
      }
      data += '</table>';
      document.getElementById('results').innerHTML = data;
    }
  };
  xhttp.send();
}

function GetBalance_for_id(customer_id) {
  var url ='../api/get_balance_by_id.php?id=' + customer_id;
  var xhttp = new XMLHttpRequest();
  xhttp.open('GET', url, true);
  var jsonData = '';
  var data = '<h2>Tilit</h2>';
  data += '<table class="table table-striped table-bordered table-hover">';
  data += '<thead><tr><th>Tilin Nimi</th><th>Tilinumero</th><th>Saldo</th><th></th></tr></thead><tbody>';
  xhttp.onreadystatechange = function() {
    if (xhttp.readyState == 4 && xhttp.status == 200) {
      jsonData = JSON.parse(xhttp.responseText);
      for (x in jsonData) {
        data +=
          '<tr><td>' + jsonData[x].tilinnimi + '</td>' +
          '<td>' + jsonData[x].tilinumero + '</td>' +
          '<td>' + jsonData[x].saldo + ' &euro; </td>' +
          '<td><a href="show_transactions.php?id=' +
          jsonData[x].tiliID + '">Tapahtumat</a></td></tr>';
      }
      data += '</tbody></table>';
      document.getElementById('tilit').innerHTML = data;
    }
  };
  xhttp.send();
}

function GetAccountDetails_for_id(account_id) {
  var url ='../api/get_account_details_by_id.php?id=' + account_id;
  var xhttp = new XMLHttpRequest();
  xhttp.open('GET', url, true);
  var jsonData = '';
  var data = '';
  xhttp.onreadystatechange = function() {
    if (xhttp.readyState == 4 && xhttp.status == 200) {
      jsonData = JSON.parse(xhttp.responseText);
      for (x in jsonData) {
        data +=
          '<tr><td>Tilinumero</td><td>' + jsonData[x].tilinumero + '</td>' +
          '<td>IBAN</td><td>' + jsonData[x].iban + '</td></tr>' +
          '<tr><td>Tilin Nimi</td><td>' + jsonData[x].tilinnimi + '</td>' +
          '<td>Tilin Saldo</td><td>' + jsonData[x].saldo + ' &euro; </td><tr>' +
          '<tr><td>SWIFT/BIC</td><td>' + jsonData[x].bic + '</td>' +
          '<td>Tilin Omistaja</td><td>' + jsonData[x].etunimi + ' ' +
          jsonData[x].sukunimi + '</td></tr>';
      }
      document.getElementById('tili_tiedot').innerHTML = data;
      document.getElementById('valitse_tili').setAttribute("data-value", account_id);
    }
  };
  xhttp.send();
}

function Populate_dropdown_for_id(customer_id) {
  var url ='../api/get_balance_by_id.php?id=' + customer_id;
  var xhttp = new XMLHttpRequest();
  xhttp.open('GET', url, true);
  var jsonData = '';
  var data = '';
  xhttp.onreadystatechange = function() {
    if (xhttp.readyState == 4 && xhttp.status == 200) {
      jsonData = JSON.parse(xhttp.responseText);
      for (x in jsonData) {
        data += '<li><a class="dropdown-item" data-value="' + jsonData[x].tiliID + '" href="#">' + jsonData[x].tilinnimi + ' ' + jsonData[x].saldo + ' &euro;</a></li>';
      }
      document.getElementById('tee_uusi_maksu').innerHTML = data;
    }
  };
  xhttp.send();
}

function GetCards_for_id(customer_id) {
  var url ='../api/get_cards_by_id.php?id=' + customer_id;
  var xhttp = new XMLHttpRequest();
  xhttp.open('GET', url, true);
  var jsonData = '';
  var data = '<h2>Kortit</h2>';
  data += '<table class="table table-striped table-bordered table-hover">';
  data += '<thead><tr><th>Kortin Nimi</th><th>Voimassaolopäivä</th><th>Kortin Numero</th><th>Luottoraja</th></tr></thead><tbody>';
  xhttp.onreadystatechange = function() {
    if (xhttp.readyState == 4 && xhttp.status == 200) {
      jsonData = JSON.parse(xhttp.responseText);
      for (x in jsonData) {
        data +=
          '<tr><td>' + jsonData[x].pankkikortinnimi + '</td>' +
          '<td>' + jsonData[x].voimassaolo + '</td>' +
          '<td>' + jsonData[x].kortinnumero + '</td>' +
          '<td>' + jsonData[x].luottoraja + ' &euro;</td></tr>';
      }
      data += '</tbody></table>';
      document.getElementById('kortit').innerHTML = data;
    }
  };
  xhttp.send();
}

function GetTransactions_for_id(customer_id) {
  var url ='../api/get_transactions_by_id.php?id=' + customer_id;
  var xhttp = new XMLHttpRequest();
  xhttp.open('GET', url, true);
  var jsonData = '';
//  var data = '<table class="table table-striped table-bordered table-hover">';
  var data = '<thead><tr><th>Saaja</th><th>IBAN</th><th>Viite</th><th>Viesti</th><th>Määrä</th><th>Aika</th></tr></thead><tbody>';
  xhttp.onreadystatechange = function() {
    if (xhttp.readyState == 4 && xhttp.status == 200) {
      jsonData = JSON.parse(xhttp.responseText);
      for (x in jsonData) {
        data +=
          '<tr><td>' + jsonData[x].saajannimi + '</td>' +
          '<td>' + jsonData[x].iban + '</td>' +
          '<td>' + jsonData[x].viite + '</td>' +
          '<td>' + jsonData[x].viesti + '</td>' +
          '<td>' + jsonData[x].maara + '</td>' +
          '<td>' + jsonData[x].aika + '</td></tr>';
      }
      data += '</tbody></table>';
      document.getElementById('tilitapahtumien_tiedot').innerHTML = data;
    }
  };
  xhttp.send();
}

function AddNewPayment() {
//  var tili = document.getElementById('valitse_tili').getAttribute("data-value");
//  alert("tili ");
	var url = '../api/add_payment.php';//?id=' + tili;
	var xhttp = new XMLHttpRequest();
	xhttp.open('POST', url, true);
	var form = document.getElementById('AddNewPaymentForm');
	var formData = new FormData(form);
	xhttp.onreadystatechange = function() {
		if (xhttp.readyState == 4 && xhttp.status == 201) {
		document.getElementById('results').innerHTML = '<div class="alert alert-success">Maksu vahvistettu! Tee <a class="alert-link" href="new_payment.php">tästä uusi maksu</a>.</div>';
		} else {
		document.getElementById('results').innerHTML = '<div class="alert alert-danger"><strong>Hupsista!</strong> Virheitä tiedoissa.</div>';
		}
	};
	xhttp.send(formData);
}

function AddNewCustomer() {
	var url = '../api/add_customer.php';
	var xhttp = new XMLHttpRequest();
	xhttp.open('POST', url, true);
	var form = document.getElementById('AddNewCustomerForm');
	var formData = new FormData(form);
	xhttp.onreadystatechange = function() {
		if (xhttp.readyState == 4 && xhttp.status == 201) {
		document.getElementById('results').innerHTML = 'Asiakkas lisäys onnistui';
		} else {
		document.getElementById('results').innerHTML = 'Virhe';
		}
	};
	xhttp.send(formData);
}

function DeleteBook() {
  var id = document.getElementById('delete_id').value;
  var url ='../api/delete_books.php?id=';
  url += id;
  var xhttp = new XMLHttpRequest();
  xhttp.open('DELETE', url, true);
  xhttp.onreadystatechange = function() {
    if (xhttp.readyState == 4 && xhttp.status == 201) {
  		document.getElementById('results').innerHTML = 'Kirjan poisto onnistui';
  		} else {
  		document.getElementById('results').innerHTML = 'Virhe';
  		}
  };
  xhttp.send();
}

function UpdateBook() {
	var url = '../api/update_book.php';
	var xhttp = new XMLHttpRequest();
	xhttp.open('POST', url, true);
	var form = document.getElementById('UpdateForm');
	var formData = new FormData(form);
	xhttp.onreadystatechange = function() {
		if (xhttp.readyState == 4 && xhttp.status == 201) {
		document.getElementById('results').innerHTML = 'Kirjan muokkaus onnistui';
		} else {
		document.getElementById('results').innerHTML = 'Virhe';
		}
	};
	xhttp.send(formData);
}
