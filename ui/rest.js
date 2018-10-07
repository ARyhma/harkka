function GetPerson_for_id(customer_id) {
  var url ='../api/get_person_by_id.php?id=' + customer_id;
  var xhttp = new XMLHttpRequest();
  xhttp.open('GET', url, true);
  var jsonData = '';
  xhttp.onreadystatechange = function() {
    if (xhttp.readyState == 4 && xhttp.status == 200) {
      jsonData = JSON.parse(xhttp.responseText);
      for (x in jsonData) {
        document.getElementById("etunimi").value = jsonData[x].etunimi;
        document.getElementById("sukunimi").value = jsonData[x].sukunimi;
        document.getElementById("osoite").value = jsonData[x].osoite;
        document.getElementById("postinumero").value = jsonData[x].postinumero;
        document.getElementById("postitoimipaikka").value = jsonData[x].postitoimipaikka;
      }
    }
  };
  xhttp.send();
}

function UpdatePerson(customer_id) {
	var url = '../api/update_person.php?id=' + customer_id;
	var xhttp = new XMLHttpRequest();
	xhttp.open('POST', url, true);
	var form = document.getElementById('UpdateForm');
	var formData = new FormData(form);
	xhttp.onreadystatechange = function() {
		if (xhttp.readyState == 4 && xhttp.status == 201) {
      document.getElementById('results').innerHTML = '<div class="alert alert-success">Tiedot muutettu! Takaisin <a class="alert-link" href="index.php">pääsivulle</a>.</div>';
  		} else {
  		document.getElementById('results').innerHTML = '<div class="alert alert-danger"><strong>Hupsista!</strong> Virheitä tiedoissa.</div>';
		}
	};
	xhttp.send(formData);
}

function GetBalance_for_id(customer_id) {
  var url ='../api/get_balance_by_id.php?id=' + customer_id;
  var xhttp = new XMLHttpRequest();
  xhttp.open('GET', url, true);
  var jsonData = '';
  var data = '';
  xhttp.onreadystatechange = function() {
    if (xhttp.readyState == 4 && xhttp.status == 200) {
      jsonData = JSON.parse(xhttp.responseText);
      for (x in jsonData) {
        data +=
          '<tr><td>' + jsonData[x].tilinnimi + '</td>' +
          '<td>' + jsonData[x].tilinumero + '</td>' +
          '<td>' + jsonData[x].saldo + ' &euro; </td>' +
          '<td><a href="show_transactions.php?id=' + jsonData[x].tiliID + '">Tapahtumat &raquo;</a></td></tr>';
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

function GetAccountDetails_for_id_vastaanottaja(account_id) {
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
      document.getElementById('tili_tiedot_vastaanottaja').innerHTML = data;
      document.getElementById('valitse_tili_vastaanottaja').setAttribute("data-value", account_id);
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

function Populate_dropdown_for_id_vastaanottaja(customer_id) {
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
      document.getElementById('tee_uusi_maksu_vastaanottaja').innerHTML = data;
    }
  };
  xhttp.send();
}

function GetCards_for_id(customer_id) {
  var url ='../api/get_cards_by_id.php?id=' + customer_id;
  var xhttp = new XMLHttpRequest();
  xhttp.open('GET', url, true);
  var jsonData = '';
  var data = '';
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

function GetEInvoices_for_id(customer_id) {
  var url ='../api/get_einvoices_by_id.php?id=' + customer_id;
  var xhttp = new XMLHttpRequest();
  xhttp.open('GET', url, true);
  var jsonData = '';
  var data = '';
  xhttp.onreadystatechange = function() {
    if (xhttp.readyState == 4 && xhttp.status == 200) {
      jsonData = JSON.parse(xhttp.responseText);
      for (x in jsonData) {
        data +=
          '<tr><td>' + jsonData[x].saajannimi + '</td>' +
          '<td>' + jsonData[x].iban + '</td>' +
          '<td>' + jsonData[x].viesti + '</td>' +
          '<td>' + jsonData[x].maara + '</td>' +
          '<td>' + jsonData[x].erapaiva + '</td>' +
          '<td><a href="pay_einvoice.php?id=' +
          jsonData[x].elaskuID + '">Maksa&raquo;</a></td></tr>';

      }
      document.getElementById('elaskut').innerHTML = data;
    }
  };
  xhttp.send();
}

function Fill_EInvoice_info_for_id(einvoice_id) {
  var url ='../api/get_einvoice_by_invoiceid.php?id=' + einvoice_id;
  var xhttp = new XMLHttpRequest();
  xhttp.open('GET', url, true);
  var jsonData = '';
  xhttp.onreadystatechange = function() {
    if (xhttp.readyState == 4 && xhttp.status == 200) {
      jsonData = JSON.parse(xhttp.responseText);
      for (x in jsonData) {
          document.getElementById("tilinumero").value = jsonData[x].iban;
          document.getElementById("bic").value = jsonData[x].bic;
          document.getElementById("nimi").value =  jsonData[x].saajannimi;
          document.getElementById("viite").value = jsonData[x].viite;
          document.getElementById("viesti").value = jsonData[x].viesti;
          document.getElementById("erapaiva").value = jsonData[x].erapaiva;
          document.getElementById("maara").value = jsonData[x].maara;
      }
    }
  };
  xhttp.send();
}

function GetTransactions_for_id(customer_id) {
  var url ='../api/get_transactions_by_id.php?id=' + customer_id;
  var xhttp = new XMLHttpRequest();
  xhttp.open('GET', url, true);
  var jsonData = '';
  var data = '<thead><tr><th>Saaja</th><th>IBAN</th><th>Viite</th><th>Viesti</th><th>Määrä</th><th>Tapahtuma</th><th>Aika</th></tr></thead><tbody>';
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
		  '<td>' + jsonData[x].tapahtuma + '</td>' +
          '<td>' + jsonData[x].pvm + '</td></tr>';
      }
      data += '</tbody></table>';
      document.getElementById('tilitapahtumien_tiedot').innerHTML = data;
    }
  };
  xhttp.send();
}

function GetPaidEinvoices_for_id(customer_id) {
  var url ='../api/get_paid_einvoices_by_id.php?id=' + customer_id;
  var xhttp = new XMLHttpRequest();
  xhttp.open('GET', url, true);
  var jsonData = '';
  var data = '<thead><tr><th>Laskuttaja</th><th>IBAN</th><th>Viite</th><th>Viesti</th><th>Määrä</th><th>Aika</th></tr></thead><tbody>';
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
          '<td>' + jsonData[x].pvm + '</td></tr>';
      }
      data += '</tbody></table>';
      document.getElementById('tilitapahtumien_tiedot').innerHTML = data;
    }
  };
  xhttp.send();
}

function AddNewPayment() {
	var url = '../api/add_payment.php';
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

function AddNewPaymentforEInvoice(einvoice_id) {
	var url = '../api/add_payment_for_einvoice.php?id=' + einvoice_id;
	var xhttp = new XMLHttpRequest();
	xhttp.open('POST', url, true);
	var form = document.getElementById('AddNewPaymentForm');
	var formData = new FormData(form);
	xhttp.onreadystatechange = function() {
		if (xhttp.readyState == 4 && xhttp.status == 201) {
    document.getElementById('results').innerHTML = '<div class="alert alert-success">Maksu vahvistettu! Takaisin <a class="alert-link" href="index.php">pääsivulle</a>.</div>';
		} else {
		document.getElementById('results').innerHTML = '<div class="alert alert-danger"><strong>Hupsista!</strong> Virheitä tiedoissa.</div>';
		}
	};
	xhttp.send(formData);
}

function MoveMoneyBetweenAccounts() {
	var url = '../api/move_money_between_accounts.php';
	var xhttp = new XMLHttpRequest();
	xhttp.open('POST', url, true);
	var form = document.getElementById('AddNewPaymentForm');
	var formData = new FormData(form);
	xhttp.onreadystatechange = function() {
		if (xhttp.readyState == 4 && xhttp.status == 201) {
		document.getElementById('results').innerHTML = '<div class="alert alert-success">Maksu vahvistettu! Tee <a class="alert-link" href="move_money_between_accounts.php">tästä uusi maksu</a>.</div>';
		} else {
		document.getElementById('results').innerHTML = '<div class="alert alert-danger"><strong>Hupsista!</strong> Virheitä tiedoissa.</div>';
		}
	};
	xhttp.send(formData);
}

/*
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
*/
