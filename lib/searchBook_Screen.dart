import 'dart:ui';

import 'package:book_exchange/main.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;



  class searchBookScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _searchBookScreen();
  }
  
}
searchData(String bookName) async {

var headers = {
  'Accept': 'application/json',
  'Authorization': 'Bearer eyJ0eXAiOiJKV1QiLCJhbGciOiJSUzI1NiJ9.eyJhdWQiOiIxIiwianRpIjoiOTYzMDA0NGI0OWJlZDViM2IyZjRkNDU0YTRhYTMzYjJkNTdmMDViZTg0YWQ5NzkzNGNlYmU3MTA5ZTllNTExNTk3YjBlNDA1Y2YzOTliZWEiLCJpYXQiOjE2NjAzOTgzODQuMzY0MzQ2LCJuYmYiOjE2NjAzOTgzODQuMzY0MzU5LCJleHAiOjE2OTE5MzQzODQuMTY0OTkyLCJzdWIiOiIxIiwic2NvcGVzIjpbXX0.TTkvZXVfn9WBrt5x8c1-wZTa8m9nGy58Dqk24YUflmSsHttA1SIdbs4wKTHAXYOnKkmUEq2xbKunIZu9nxMB9-ziA7a_wPx6Vod8TsVkPYUW5MOVSlXSEEiIJVx74G_i-kSgmVjhsglqruXDA0BYBb2HPQ3KPJHfW-dwfswtxdnX8GJJ_BQ0fm3N7G6hPG5qm8Hdxm9VjG-rQYdou2TTRDOYyHE0-kSwfMvGDs7LKzigwLrHRwNbXIwvylHOcNMX6AijCrI8LenNLpVYqyXcx46EhZCn9ed4NW7dK5qPDVL62-RVaYyybm6JcaiwH2L6Qc--ZKgibhzg8SacFwj0DMmq0qEnciEqWN7a2-orRhrctKdJ2fIG1ixFox9wH-7hAvEyJsobZUAU8J_3TEd9YKbDR47jGCPCB17oGHCAsrh4a2qF-rSFkYjU6ofRJrb_jn0hUtZpgCHjSDhfkjvib7AsJnYijul5dlHWkOzBLk_HTH1pjlni4HQfDRwRlHvsGXD6ckTNhCSz0GcJsgS78jZbtELihTPQxmTDpE8Hhm2X2vNSllT_U1zSU9Lp43QklC9QVNq05-q6e1MEEn3MTWW5IP3qZTgd1NO0qmIXxanxQDZFAPE8b9JUUUNuYfSE-u4FFrHG0nT0iTi-vRtAI6d9IKZIbdpRN2IQ3a8KWQE'
};
var request = http.Request('GET', Uri.parse('http://192.168.0.121/api/search?key=$bookName'));

request.headers.addAll(headers);

http.StreamedResponse response = await request.send();

if (response.statusCode == 200) {
  print(await response.stream.bytesToString());
}
else {
  print(response.reasonPhrase);
}

}

class _searchBookScreen extends State<searchBookScreen> {
  TextEditingController searchController = TextEditingController();

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
               controller: searchController,
                keyboardType: TextInputType.text,
                obscureText: false,
                decoration: const InputDecoration(
                  labelText: "Search Books",
                  border: OutlineInputBorder(),
                
                  suffixIcon: Icon(Icons.search),
                ),
              ),
   
     Container(
    height: 40,
    width: 200,
    decoration: BoxDecoration(
      borderRadius:  BorderRadius.circular(100),
      gradient: const LinearGradient(colors: [Color.fromARGB(255, 30, 144, 53), Color.fromARGB(255, 34, 223, 62)]),
      
    ),
    child: MaterialButton(
      onPressed: (){
         
          print(searchController.text);
          searchData(searchController.text);
      },
      
      child: Text("Search",
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