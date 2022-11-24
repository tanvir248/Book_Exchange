import 'package:book_exchange/model/seeAllBooks.dart';
import 'package:flutter/material.dart';
import 'package:book_exchange/main.dart';

class bookDetailsScreen extends StatelessWidget {
  bookDetailsScreen(this.book);
  Book book;

  @override
  Widget build(BuildContext context) {
    print(book.name);
    return Scaffold(
        appBar: AppBar(
          title: Text("All Books"),
        ),
        body: Padding(
          padding: const EdgeInsets.all(30),
          child: Center(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Image.network(
                    book.photo ?? "",
                    fit: BoxFit.cover,
                    height: 100,
                  ),
                  Text(
                    "Name: " + book.name,
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w900,
                      color: Colors.teal,
                    ),
                  ),
                  const SizedBox(
                    height: 25,
                  ),
                  Text(
                    "Writer: " + book.writer,
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w100,
                      color: Color.fromARGB(255, 16, 16, 16),
                    ),
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  Text(
                    "Category: " + book.category,
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w100,
                      color: Color.fromARGB(255, 16, 16, 16),
                    ),
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  Divider(
                    color: Colors.redAccent, //color of divider
                    height: 5, //height spacing of divider
                    thickness: 3, //thickness of divier line
                    indent: 25, //spacing at the start of divider
                    endIndent: 25, //spacing at the end of divider
                  ),
                  const Text(
                    "Contact: ",
                    style: TextStyle(
                      fontSize: 26,
                      fontWeight: FontWeight.w100,
                      color: Color.fromARGB(255, 40, 4, 184),
                    ),
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  Text(
                    "Email: " + book.user.email,
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w100,
                      color: Color.fromARGB(255, 16, 16, 16),
                    ),
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  Text(
                    "Mobile: " + book.user.phone,
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w100,
                      color: Color.fromARGB(255, 16, 16, 16),
                    ),
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  Divider(
                    color: Colors.redAccent, //color of divider
                    height: 5, //height spacing of divider
                    thickness: 3, //thickness of divier line
                    indent: 25, //spacing at the start of divider
                    endIndent: 25, //spacing at the end of divider
                  ),
                ],
              ),
            ),
          ),
        ));
  }
}
