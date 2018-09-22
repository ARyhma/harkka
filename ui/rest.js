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
