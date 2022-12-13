import 'package:book_exchange/model/seeAllBooks.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class allBooksDatas {
  getBooksData() async {
    var headers = {
      'Accept': 'application/json',
      'Authorization':
          'Bearer eyJ0eXAiOiJKV1QiLCJhbGciOiJSUzI1NiJ9.eyJhdWQiOiIxIiwianRpIjoiZmEyZTczODUwYzIwZjdmMzFlNWI2ZTE2MmEzMTViYzYxMDE3NWMxYWI0YTMwNzUxMjI4MzRlNzJiZTcyNmIzNmU2MmE4N2U1Mzk4OTMwNjYiLCJpYXQiOjE2NzA5NTExMzAuMzU5NzQ0LCJuYmYiOjE2NzA5NTExMzAuMzU5NzQ5LCJleHAiOjE3MDI0ODcxMzAuMzU1ODM1LCJzdWIiOiIxIiwic2NvcGVzIjpbXX0.f7gZM0WtOgZ_FgQ42OTOZqXBFQqFtdAeTfAK0ta6rlp7DLmR7SmcSHUck7fXnaPtkkd10WYeF8A3-6MJ2GTTTC_Y4k7INnjpltRLLxBm1M4DccGul5lWwGsOgnSFCu-TZ4DTSI5Fd6qe4b60N_O_vMbk5HB98Cwt8fy7uSZbHDSdsRH04UhhEsNLOJy3zJRQUZ8YgfbCsmveZwvI-Xphd437ba6QwuwmyHQkq09fG1uDyorYYUKmQKdt0hGxQOgLlK0BQc2EXik6bJq-CiqeQq9skpsqtrnhBuRi9NjzQdjsq29pkUUrTrTXIG1E_eTF2TUN4RDAPb-EhHbH5EFbZ5YT5GgsVjbd0ssaiVsBEFKNDVFzZUY4ojeKWy9fDc6InetIe2rUWjybJjf2qCTpWBQouxSiceduCXEV_bCfb0lG2vo3CLIC-v-b2BA7C3i_gmnghXzatFVDQsx8iDDHNWsiUZJEZ1-rMtdRQHsHy8cC2Jac20jBhEiCUyYIkO2R0NmgdAXgSGpTXWYIG-OstSUC_Y3nTeOQtFXTPurUtRTi4HPHlfvO17KjU1NiwYY77IiUJMpcyclOXmJpg-n_VHdNCPTUTx9hFc4oHFoLcQjf8v_sh149xixaZzxHDNuf0mwlLS6AiESKiMj0pWIs1EtiZMUs_NXbAjCPQa6flJU'
    };
    var request =
        http.Request('GET', Uri.parse('http://test.mrshoikot.com/api/books'));

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
          'Bearer eyJ0eXAiOiJKV1QiLCJhbGciOiJSUzI1NiJ9.eyJhdWQiOiIxIiwianRpIjoiZmEyZTczODUwYzIwZjdmMzFlNWI2ZTE2MmEzMTViYzYxMDE3NWMxYWI0YTMwNzUxMjI4MzRlNzJiZTcyNmIzNmU2MmE4N2U1Mzk4OTMwNjYiLCJpYXQiOjE2NzA5NTExMzAuMzU5NzQ0LCJuYmYiOjE2NzA5NTExMzAuMzU5NzQ5LCJleHAiOjE3MDI0ODcxMzAuMzU1ODM1LCJzdWIiOiIxIiwic2NvcGVzIjpbXX0.f7gZM0WtOgZ_FgQ42OTOZqXBFQqFtdAeTfAK0ta6rlp7DLmR7SmcSHUck7fXnaPtkkd10WYeF8A3-6MJ2GTTTC_Y4k7INnjpltRLLxBm1M4DccGul5lWwGsOgnSFCu-TZ4DTSI5Fd6qe4b60N_O_vMbk5HB98Cwt8fy7uSZbHDSdsRH04UhhEsNLOJy3zJRQUZ8YgfbCsmveZwvI-Xphd437ba6QwuwmyHQkq09fG1uDyorYYUKmQKdt0hGxQOgLlK0BQc2EXik6bJq-CiqeQq9skpsqtrnhBuRi9NjzQdjsq29pkUUrTrTXIG1E_eTF2TUN4RDAPb-EhHbH5EFbZ5YT5GgsVjbd0ssaiVsBEFKNDVFzZUY4ojeKWy9fDc6InetIe2rUWjybJjf2qCTpWBQouxSiceduCXEV_bCfb0lG2vo3CLIC-v-b2BA7C3i_gmnghXzatFVDQsx8iDDHNWsiUZJEZ1-rMtdRQHsHy8cC2Jac20jBhEiCUyYIkO2R0NmgdAXgSGpTXWYIG-OstSUC_Y3nTeOQtFXTPurUtRTi4HPHlfvO17KjU1NiwYY77IiUJMpcyclOXmJpg-n_VHdNCPTUTx9hFc4oHFoLcQjf8v_sh149xixaZzxHDNuf0mwlLS6AiESKiMj0pWIs1EtiZMUs_NXbAjCPQa6flJU'
    };
    var request = http.Request(
        'GET', Uri.parse('http://test.mrshoikot.com/api/search?key=$keyword'));

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