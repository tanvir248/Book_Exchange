import 'package:book_exchange/main.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;


  class postBooksScreen extends StatefulWidget {
     var category;
  @override
  State<StatefulWidget> createState() {
    return myPostBooksSecreen();
  }
  
}

postABooks(String booksname, String writer, String categoryx) async {
  var headers = {
  'Accept': 'application/json',
  'Authorization': 'Bearer eyJ0eXAiOiJKV1QiLCJhbGciOiJSUzI1NiJ9.eyJhdWQiOiIxIiwianRpIjoiOTYzMDA0NGI0OWJlZDViM2IyZjRkNDU0YTRhYTMzYjJkNTdmMDViZTg0YWQ5NzkzNGNlYmU3MTA5ZTllNTExNTk3YjBlNDA1Y2YzOTliZWEiLCJpYXQiOjE2NjAzOTgzODQuMzY0MzQ2LCJuYmYiOjE2NjAzOTgzODQuMzY0MzU5LCJleHAiOjE2OTE5MzQzODQuMTY0OTkyLCJzdWIiOiIxIiwic2NvcGVzIjpbXX0.TTkvZXVfn9WBrt5x8c1-wZTa8m9nGy58Dqk24YUflmSsHttA1SIdbs4wKTHAXYOnKkmUEq2xbKunIZu9nxMB9-ziA7a_wPx6Vod8TsVkPYUW5MOVSlXSEEiIJVx74G_i-kSgmVjhsglqruXDA0BYBb2HPQ3KPJHfW-dwfswtxdnX8GJJ_BQ0fm3N7G6hPG5qm8Hdxm9VjG-rQYdou2TTRDOYyHE0-kSwfMvGDs7LKzigwLrHRwNbXIwvylHOcNMX6AijCrI8LenNLpVYqyXcx46EhZCn9ed4NW7dK5qPDVL62-RVaYyybm6JcaiwH2L6Qc--ZKgibhzg8SacFwj0DMmq0qEnciEqWN7a2-orRhrctKdJ2fIG1ixFox9wH-7hAvEyJsobZUAU8J_3TEd9YKbDR47jGCPCB17oGHCAsrh4a2qF-rSFkYjU6ofRJrb_jn0hUtZpgCHjSDhfkjvib7AsJnYijul5dlHWkOzBLk_HTH1pjlni4HQfDRwRlHvsGXD6ckTNhCSz0GcJsgS78jZbtELihTPQxmTDpE8Hhm2X2vNSllT_U1zSU9Lp43QklC9QVNq05-q6e1MEEn3MTWW5IP3qZTgd1NO0qmIXxanxQDZFAPE8b9JUUUNuYfSE-u4FFrHG0nT0iTi-vRtAI6d9IKZIbdpRN2IQ3a8KWQE'
};
var request = http.MultipartRequest('POST', Uri.parse('http://192.168.0.121/api/books'));
request.fields.addAll({
  'name': booksname,
  'writer': writer,
  'category': categoryx
});

request.headers.addAll(headers);

http.StreamedResponse response = await request.send();

if (response.statusCode == 200) {
  print(await response.stream.bytesToString());
}
else {
  print(response.reasonPhrase);
}
}


class myPostBooksSecreen extends State<postBooksScreen> {
  
   TextEditingController BookName = TextEditingController();
  TextEditingController writerName_Conditons = TextEditingController();
  var bookCategory;
  @override
  Widget build(BuildContext context) {
    return Padding(
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
                  prefixIcon:  Icon(Icons.book_online)
                ),
              ),
 
        const SizedBox(
                height: 25,
              ),
            TextFormField(
                controller: writerName_Conditons,
                keyboardType: TextInputType.phone,
                obscureText: false,
                decoration: const InputDecoration(
                  labelText: "Writer & Book Condition",
                  border: OutlineInputBorder(),
                  prefixIcon:  Icon(Icons.document_scanner_outlined),
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

      Padding(
          padding: EdgeInsets.fromLTRB(20, 20, 20, 20),
          child: Text('Category: ',
            style: TextStyle(fontWeight: FontWeight.normal,fontSize: 22, color: Colors.black )
  
            )
            ),


       

  const SizedBox(
    height: 25,
  ),
Container(
    height: 60,
    width: double.infinity,
    decoration: BoxDecoration(
      borderRadius:  BorderRadius.circular(100),
      gradient: const LinearGradient(colors: [Color.fromARGB(255, 234, 66, 66), Colors.red]),
      
    ),
    child: MaterialButton(
      onPressed: (){
        postABooks(BookName.text, writerName_Conditons.text, "Donate");
      },
      child: Text("Post Books",
      style: TextStyle(
          fontSize: 25,
          color: Colors.white
      ),
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
    );
  }
}