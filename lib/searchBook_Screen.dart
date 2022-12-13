import 'dart:ui';

import 'package:book_exchange/main.dart';
import 'package:book_exchange/searchResult.dart';
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
    'Authorization':
        'Bearer eyJ0eXAiOiJKV1QiLCJhbGciOiJSUzI1NiJ9.eyJhdWQiOiIxIiwianRpIjoiZmEyZTczODUwYzIwZjdmMzFlNWI2ZTE2MmEzMTViYzYxMDE3NWMxYWI0YTMwNzUxMjI4MzRlNzJiZTcyNmIzNmU2MmE4N2U1Mzk4OTMwNjYiLCJpYXQiOjE2NzA5NTExMzAuMzU5NzQ0LCJuYmYiOjE2NzA5NTExMzAuMzU5NzQ5LCJleHAiOjE3MDI0ODcxMzAuMzU1ODM1LCJzdWIiOiIxIiwic2NvcGVzIjpbXX0.f7gZM0WtOgZ_FgQ42OTOZqXBFQqFtdAeTfAK0ta6rlp7DLmR7SmcSHUck7fXnaPtkkd10WYeF8A3-6MJ2GTTTC_Y4k7INnjpltRLLxBm1M4DccGul5lWwGsOgnSFCu-TZ4DTSI5Fd6qe4b60N_O_vMbk5HB98Cwt8fy7uSZbHDSdsRH04UhhEsNLOJy3zJRQUZ8YgfbCsmveZwvI-Xphd437ba6QwuwmyHQkq09fG1uDyorYYUKmQKdt0hGxQOgLlK0BQc2EXik6bJq-CiqeQq9skpsqtrnhBuRi9NjzQdjsq29pkUUrTrTXIG1E_eTF2TUN4RDAPb-EhHbH5EFbZ5YT5GgsVjbd0ssaiVsBEFKNDVFzZUY4ojeKWy9fDc6InetIe2rUWjybJjf2qCTpWBQouxSiceduCXEV_bCfb0lG2vo3CLIC-v-b2BA7C3i_gmnghXzatFVDQsx8iDDHNWsiUZJEZ1-rMtdRQHsHy8cC2Jac20jBhEiCUyYIkO2R0NmgdAXgSGpTXWYIG-OstSUC_Y3nTeOQtFXTPurUtRTi4HPHlfvO17KjU1NiwYY77IiUJMpcyclOXmJpg-n_VHdNCPTUTx9hFc4oHFoLcQjf8v_sh149xixaZzxHDNuf0mwlLS6AiESKiMj0pWIs1EtiZMUs_NXbAjCPQa6flJU'
  };
  var request = http.Request(
      'GET', Uri.parse('http://test.mrshoikot.com/api/search?key=$bookName'));

  request.headers.addAll(headers);

  http.StreamedResponse response = await request.send();

  if (response.statusCode == 200) {
    print(await response.stream.bytesToString());
  } else {
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
                height: 50,
                width: 200,
                margin: const EdgeInsets.only(top: 20),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  gradient: const LinearGradient(colors: [
                    Color.fromARGB(255, 30, 144, 53),
                    Color.fromARGB(255, 34, 223, 62)
                  ]),
                ),
                child: MaterialButton(
                  onPressed: () {
                    print(searchController.text);
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) =>
                              searchResult(keyword: searchController.text)),
                    );
                  },
                  child: Text(
                    "Search",
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
    );
  }
}
