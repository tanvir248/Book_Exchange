import 'package:book_exchange/model/seeAllBooks.dart';
import 'package:http/http.dart' as http;


class allBooksDatas {
  getBooksData() async {
   var headers = {
  'Accept': 'application/json',
  'Authorization': 'Bearer eyJ0eXAiOiJKV1QiLCJhbGciOiJSUzI1NiJ9.eyJhdWQiOiIxIiwianRpIjoiOTYzMDA0NGI0OWJlZDViM2IyZjRkNDU0YTRhYTMzYjJkNTdmMDViZTg0YWQ5NzkzNGNlYmU3MTA5ZTllNTExNTk3YjBlNDA1Y2YzOTliZWEiLCJpYXQiOjE2NjAzOTgzODQuMzY0MzQ2LCJuYmYiOjE2NjAzOTgzODQuMzY0MzU5LCJleHAiOjE2OTE5MzQzODQuMTY0OTkyLCJzdWIiOiIxIiwic2NvcGVzIjpbXX0.TTkvZXVfn9WBrt5x8c1-wZTa8m9nGy58Dqk24YUflmSsHttA1SIdbs4wKTHAXYOnKkmUEq2xbKunIZu9nxMB9-ziA7a_wPx6Vod8TsVkPYUW5MOVSlXSEEiIJVx74G_i-kSgmVjhsglqruXDA0BYBb2HPQ3KPJHfW-dwfswtxdnX8GJJ_BQ0fm3N7G6hPG5qm8Hdxm9VjG-rQYdou2TTRDOYyHE0-kSwfMvGDs7LKzigwLrHRwNbXIwvylHOcNMX6AijCrI8LenNLpVYqyXcx46EhZCn9ed4NW7dK5qPDVL62-RVaYyybm6JcaiwH2L6Qc--ZKgibhzg8SacFwj0DMmq0qEnciEqWN7a2-orRhrctKdJ2fIG1ixFox9wH-7hAvEyJsobZUAU8J_3TEd9YKbDR47jGCPCB17oGHCAsrh4a2qF-rSFkYjU6ofRJrb_jn0hUtZpgCHjSDhfkjvib7AsJnYijul5dlHWkOzBLk_HTH1pjlni4HQfDRwRlHvsGXD6ckTNhCSz0GcJsgS78jZbtELihTPQxmTDpE8Hhm2X2vNSllT_U1zSU9Lp43QklC9QVNq05-q6e1MEEn3MTWW5IP3qZTgd1NO0qmIXxanxQDZFAPE8b9JUUUNuYfSE-u4FFrHG0nT0iTi-vRtAI6d9IKZIbdpRN2IQ3a8KWQE'
};
var request = http.Request('GET', Uri.parse('http://192.168.0.121/api/books'));

request.headers.addAll(headers);

http.StreamedResponse response = await request.send();

if (response.statusCode == 200) {
  //print(await response.stream.bytesToString());
  var jsonString = await response.stream.bytesToString();
    print(jsonString);
   return jsonString;
}
else {
  print(response.reasonPhrase);
}

  }
}

/*var jsonString = request.body;
 final searchBooks = searchBooksFromJson(jsonString);
 return searchBooks;*/