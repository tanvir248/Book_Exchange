import 'package:book_exchange/main.dart';
import 'package:book_exchange/model/bookDetails.dart';
import 'package:book_exchange/model/seeAllBooks.dart';
import 'package:flutter/material.dart';
import 'package:book_exchange/model/seaAllBookInitializer.dart';
import 'package:http/http.dart' as http;

class searchResult extends StatefulWidget {
  final String keyword;
  searchResult({required this.keyword});
  @override
  State<StatefulWidget> createState() {
    return _searchResult(keyword);
  }
}

class _searchResult extends State<searchResult> {
  final String keyword;
  _searchResult(this.keyword);
  List<Book>? allBooks;
  var isLoaded = false;

  @override
  void initState() {
    super.initState();

    getBooksData();
  }

  getBooksData() async {
    //allBooks = await
    allBooks = await allBooksDatas().searchBooksData(keyword);
    print("Exactly Length is: ");
    print(keyword);
    print(allBooks?.length);
    if (allBooks != null) {
      setState(() {
        isLoaded = true;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("All Books"),
      ),
      body: Visibility(
        visible: isLoaded,
        child: ListView.builder(
          itemCount: allBooks?.length,
          itemBuilder: (context, index) {
            return GestureDetector(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => bookDetailsScreen(
                              allBooks![index],
                            )));
              },
              child: Card(
                child: ListTile(
                  title: Text(allBooks?[index].name ?? ""),
                  subtitle: Text(allBooks?[index].writer ?? ""),
                  leading: Image.network(
                    allBooks?[index].photo ?? "",
                    fit: BoxFit.fitWidth,
                  ),
                ),
              ),
            );
          },
        ),
        replacement: const Center(
          child: CircularProgressIndicator(),
        ),
      ),
    );
  }
}
