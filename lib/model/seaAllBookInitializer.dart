import 'package:book_exchange/model/seeAllBooks.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class allBooksDatas {
  getBooksData() async {
    var headers = {
      'Accept': 'application/json',
      'Authorization':
          'Bearer eyJ0eXAiOiJKV1QiLCJhbGciOiJSUzI1NiJ9.eyJhdWQiOiIxIiwianRpIjoiY2VhYTUyNmQxOWE5MTMwYzZjYjhjOTljYTY2YmIyMzQxZjNjNTAzMjRmMTdlY2FlZDNmYmJkZTAxNTBiNDRiZWI4ZDUzM2JiMjkyZjJkYjIiLCJpYXQiOjE2NjkwNDQ4ODguODM5NDc4LCJuYmYiOjE2NjkwNDQ4ODguODM5NDg1LCJleHAiOjE3MDA1ODA4ODcuNjEwNDk5LCJzdWIiOiIxIiwic2NvcGVzIjpbXX0.kKilWXstc5nQrTBSlBy-EaJjxMexpMX-CdeukGQCivPBTDk7qV3MjUl-NhaIhPCmke_T4CzopWMNb-tgYu01-JMsrJt7Byb6j7_eIBcEmaiRgX2O7JVII9CAwgxMbdzFUScugkjA8I0F4rigJw1W71-EnP0INdxCp55nCihrNuOZNQbYVlPK3piMyi487dWdTG2FoCJQfRL_CWoUw0XCTUaC3cPeipbKc7Fj1TQZoePjsREnZirtyaF0y4LBe7j7GdKW0YynwWIeKa9PUzyJbHwEiTbPzseYFoDL1lJg9Ra_anJ0_ZEO-S06BvaS5-HmuTFcUQ9bHdLgs7G6bOHyudRDJ0EC5HC7v6im5raitjFYUtNVvdhoA-S_b8TrxwTeKt7sppbv9KJ-iksxBXd1DykneCx6l4bXBOatziNC8zpDz43nDm7tLcxd5Z7rQVTxvB9PNziiqAq7wd5j4YfA5XxHP6YLQAs3JkLJK6NMRA9xAyQ_cWRggrJGAimCKaYAZSX0IQ_cNguGzjueRYRKv0Uq4MktqidVzHn07me3EldFgqmtq3DMWkS9T3pTnJnOLfdhxkHjRSTugxP2S9bGEeduBq-qjHgTq91d4PftkjFGUo7JNN2_bc6jAKSQPp8uhKwadNpYPokv1OQ9AZ7A191RU7xIXppuyp3SEKb8pug'
    };
    var request =
        http.Request('GET', Uri.parse('http://127.0.0.1:8000/api/books'));

    request.headers.addAll(headers);

    http.StreamedResponse response = await request.send();

    if (response.statusCode == 200) {
      //print(await response.stream.bytesToString());
      var jsonString = await response.stream.bytesToString();
      return searchBooksFromJson(jsonString).data;
    } else {
      print(response.reasonPhrase);
    }
  }

  searchBooksData(keyword) async {
    var headers = {
      'Accept': 'application/json',
      'Authorization':
          'Bearer eyJ0eXAiOiJKV1QiLCJhbGciOiJSUzI1NiJ9.eyJhdWQiOiIxIiwianRpIjoiY2VhYTUyNmQxOWE5MTMwYzZjYjhjOTljYTY2YmIyMzQxZjNjNTAzMjRmMTdlY2FlZDNmYmJkZTAxNTBiNDRiZWI4ZDUzM2JiMjkyZjJkYjIiLCJpYXQiOjE2NjkwNDQ4ODguODM5NDc4LCJuYmYiOjE2NjkwNDQ4ODguODM5NDg1LCJleHAiOjE3MDA1ODA4ODcuNjEwNDk5LCJzdWIiOiIxIiwic2NvcGVzIjpbXX0.kKilWXstc5nQrTBSlBy-EaJjxMexpMX-CdeukGQCivPBTDk7qV3MjUl-NhaIhPCmke_T4CzopWMNb-tgYu01-JMsrJt7Byb6j7_eIBcEmaiRgX2O7JVII9CAwgxMbdzFUScugkjA8I0F4rigJw1W71-EnP0INdxCp55nCihrNuOZNQbYVlPK3piMyi487dWdTG2FoCJQfRL_CWoUw0XCTUaC3cPeipbKc7Fj1TQZoePjsREnZirtyaF0y4LBe7j7GdKW0YynwWIeKa9PUzyJbHwEiTbPzseYFoDL1lJg9Ra_anJ0_ZEO-S06BvaS5-HmuTFcUQ9bHdLgs7G6bOHyudRDJ0EC5HC7v6im5raitjFYUtNVvdhoA-S_b8TrxwTeKt7sppbv9KJ-iksxBXd1DykneCx6l4bXBOatziNC8zpDz43nDm7tLcxd5Z7rQVTxvB9PNziiqAq7wd5j4YfA5XxHP6YLQAs3JkLJK6NMRA9xAyQ_cWRggrJGAimCKaYAZSX0IQ_cNguGzjueRYRKv0Uq4MktqidVzHn07me3EldFgqmtq3DMWkS9T3pTnJnOLfdhxkHjRSTugxP2S9bGEeduBq-qjHgTq91d4PftkjFGUo7JNN2_bc6jAKSQPp8uhKwadNpYPokv1OQ9AZ7A191RU7xIXppuyp3SEKb8pug'
    };
    var request = http.Request(
        'GET', Uri.parse('http://127.0.0.1:8000/api/search?key=$keyword'));

    request.headers.addAll(headers);

    http.StreamedResponse response = await request.send();

    if (response.statusCode == 200) {
      //print(await response.stream.bytesToString());
      var jsonString = await response.stream.bytesToString();
      return searchBooksFromJson(jsonString).data;
    } else {
      print(response.reasonPhrase);
    }
  }
}

/*var jsonString = request.body;
 final searchBooks = searchBooksFromJson(jsonString);
 return searchBooks;*/