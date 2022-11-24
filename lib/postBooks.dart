import 'package:book_exchange/main.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class postBooksScreen extends StatefulWidget {
  final String type;
  postBooksScreen({required this.type});
  var category;
  @override
  State<StatefulWidget> createState() {
    return myPostBooksSecreen(type);
  }
}

postABooks(
    String booksname, String writer, String categoryx, String type) async {
  var headers = {
    'Accept': 'application/json',
    'Authorization':
        'Bearer eyJ0eXAiOiJKV1QiLCJhbGciOiJSUzI1NiJ9.eyJhdWQiOiIxIiwianRpIjoiY2VhYTUyNmQxOWE5MTMwYzZjYjhjOTljYTY2YmIyMzQxZjNjNTAzMjRmMTdlY2FlZDNmYmJkZTAxNTBiNDRiZWI4ZDUzM2JiMjkyZjJkYjIiLCJpYXQiOjE2NjkwNDQ4ODguODM5NDc4LCJuYmYiOjE2NjkwNDQ4ODguODM5NDg1LCJleHAiOjE3MDA1ODA4ODcuNjEwNDk5LCJzdWIiOiIxIiwic2NvcGVzIjpbXX0.kKilWXstc5nQrTBSlBy-EaJjxMexpMX-CdeukGQCivPBTDk7qV3MjUl-NhaIhPCmke_T4CzopWMNb-tgYu01-JMsrJt7Byb6j7_eIBcEmaiRgX2O7JVII9CAwgxMbdzFUScugkjA8I0F4rigJw1W71-EnP0INdxCp55nCihrNuOZNQbYVlPK3piMyi487dWdTG2FoCJQfRL_CWoUw0XCTUaC3cPeipbKc7Fj1TQZoePjsREnZirtyaF0y4LBe7j7GdKW0YynwWIeKa9PUzyJbHwEiTbPzseYFoDL1lJg9Ra_anJ0_ZEO-S06BvaS5-HmuTFcUQ9bHdLgs7G6bOHyudRDJ0EC5HC7v6im5raitjFYUtNVvdhoA-S_b8TrxwTeKt7sppbv9KJ-iksxBXd1DykneCx6l4bXBOatziNC8zpDz43nDm7tLcxd5Z7rQVTxvB9PNziiqAq7wd5j4YfA5XxHP6YLQAs3JkLJK6NMRA9xAyQ_cWRggrJGAimCKaYAZSX0IQ_cNguGzjueRYRKv0Uq4MktqidVzHn07me3EldFgqmtq3DMWkS9T3pTnJnOLfdhxkHjRSTugxP2S9bGEeduBq-qjHgTq91d4PftkjFGUo7JNN2_bc6jAKSQPp8uhKwadNpYPokv1OQ9AZ7A191RU7xIXppuyp3SEKb8pug'
  };
  var request = http.MultipartRequest(
      'POST', Uri.parse('http://127.0.0.1:8000/api/books'));
  request.fields
      .addAll({'name': booksname, 'writer': writer, 'category': categoryx});

  request.headers.addAll(headers);

  http.StreamedResponse response = await request.send();

  if (response.statusCode == 200) {
    print(await response.stream.bytesToString());
  } else {
    print(response.reasonPhrase);
  }
}

class myPostBooksSecreen extends State<postBooksScreen> {
  final String type;
  myPostBooksSecreen(this.type);
  TextEditingController BookName = TextEditingController();
  TextEditingController writerName_Conditons = TextEditingController();
  var bookCategory;
  var categories = [
    'Science',
    'Math',
    'English',
    'Bangla',
    'Religion',
    'Social Science',
    'Others'
  ];
  @override
  Widget build(BuildContext context) {
    print(type);
    return Scaffold(
        appBar: AppBar(
          title: Text("Post a new book"),
        ),
        body: Padding(
          padding: const EdgeInsets.all(30),
          child: Center(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  const SizedBox(
                    height: 25,
                  ),
                  TextFormField(
                    controller: BookName,
                    keyboardType: TextInputType.text,
                    decoration: const InputDecoration(
                        labelText: "Enter Book Name",
                        border: OutlineInputBorder(),
                        prefixIcon: Icon(Icons.book_online)),
                  ),

                  const SizedBox(
                    height: 25,
                  ),
                  TextFormField(
                    controller: writerName_Conditons,
                    keyboardType: TextInputType.phone,
                    obscureText: false,
                    decoration: const InputDecoration(
                      labelText: "Writer",
                      border: OutlineInputBorder(),
                      prefixIcon: Icon(Icons.document_scanner_outlined),
                    ),
                  ),
                  //   const SizedBox(
                  //     height: 25,
                  //   ),
                  // TextFormField(

                  //     keyboardType: TextInputType.streetAddress,
                  //     obscureText: true,
                  //     decoration: const InputDecoration(
                  //       labelText: "Enter Book Quantity",
                  //       border: OutlineInputBorder(),
                  //       prefixIcon:  Icon(Icons.info),
                  //     ),
                  //   ),
                  // Book category...!

                  DropdownButtonFormField(
                      items: categories.map((String category) {
                        return new DropdownMenuItem(
                            value: category,
                            child: Row(
                              children: <Widget>[
                                Icon(Icons.star),
                                Text(category),
                              ],
                            ));
                      }).toList(),
                      onChanged: (newValue) {
                        // do other stuff with _category
                        setState(() => bookCategory = newValue);
                      },
                      value: bookCategory,
                      decoration: InputDecoration(
                        contentPadding: EdgeInsets.fromLTRB(10, 20, 10, 20),
                        filled: true,
                        fillColor: Colors.grey[200],
                      )),

                  const SizedBox(
                    height: 25,
                  ),
                  Container(
                    height: 60,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(100),
                      gradient: const LinearGradient(colors: [
                        Color.fromARGB(255, 234, 66, 66),
                        Colors.red
                      ]),
                    ),
                    child: MaterialButton(
                      onPressed: () {
                        postABooks(BookName.text, writerName_Conditons.text,
                            bookCategory, type);
                      },
                      child: Text(
                        "Post Books",
                        style: TextStyle(fontSize: 25, color: Colors.white),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                ],
              ),
            ),
          ),
        ));
  }
}
