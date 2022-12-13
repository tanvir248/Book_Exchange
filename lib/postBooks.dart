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
        'Bearer eyJ0eXAiOiJKV1QiLCJhbGciOiJSUzI1NiJ9.eyJhdWQiOiIxIiwianRpIjoiZmEyZTczODUwYzIwZjdmMzFlNWI2ZTE2MmEzMTViYzYxMDE3NWMxYWI0YTMwNzUxMjI4MzRlNzJiZTcyNmIzNmU2MmE4N2U1Mzk4OTMwNjYiLCJpYXQiOjE2NzA5NTExMzAuMzU5NzQ0LCJuYmYiOjE2NzA5NTExMzAuMzU5NzQ5LCJleHAiOjE3MDI0ODcxMzAuMzU1ODM1LCJzdWIiOiIxIiwic2NvcGVzIjpbXX0.f7gZM0WtOgZ_FgQ42OTOZqXBFQqFtdAeTfAK0ta6rlp7DLmR7SmcSHUck7fXnaPtkkd10WYeF8A3-6MJ2GTTTC_Y4k7INnjpltRLLxBm1M4DccGul5lWwGsOgnSFCu-TZ4DTSI5Fd6qe4b60N_O_vMbk5HB98Cwt8fy7uSZbHDSdsRH04UhhEsNLOJy3zJRQUZ8YgfbCsmveZwvI-Xphd437ba6QwuwmyHQkq09fG1uDyorYYUKmQKdt0hGxQOgLlK0BQc2EXik6bJq-CiqeQq9skpsqtrnhBuRi9NjzQdjsq29pkUUrTrTXIG1E_eTF2TUN4RDAPb-EhHbH5EFbZ5YT5GgsVjbd0ssaiVsBEFKNDVFzZUY4ojeKWy9fDc6InetIe2rUWjybJjf2qCTpWBQouxSiceduCXEV_bCfb0lG2vo3CLIC-v-b2BA7C3i_gmnghXzatFVDQsx8iDDHNWsiUZJEZ1-rMtdRQHsHy8cC2Jac20jBhEiCUyYIkO2R0NmgdAXgSGpTXWYIG-OstSUC_Y3nTeOQtFXTPurUtRTi4HPHlfvO17KjU1NiwYY77IiUJMpcyclOXmJpg-n_VHdNCPTUTx9hFc4oHFoLcQjf8v_sh149xixaZzxHDNuf0mwlLS6AiESKiMj0pWIs1EtiZMUs_NXbAjCPQa6flJU'
  };
  var request = http.MultipartRequest(
      'POST', Uri.parse('http://test.mrshoikot.com/api/books'));
  request.fields.addAll({
    'name': booksname,
    'writer': writer,
    'category': categoryx,
    'type': type
  });

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

                  const SizedBox(
                    height: 25,
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
