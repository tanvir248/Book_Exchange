import 'package:book_exchange/main.dart';
import 'package:flutter/material.dart';

class searchBookScreen extends StatelessWidget {
  const searchBookScreen({ Key? key }) : super(key: key);

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
                
                keyboardType: TextInputType.text,
                obscureText: false,
                decoration: const InputDecoration(
                  labelText: "Search Books",
                  border: OutlineInputBorder(),
                
                  suffixIcon: Icon(Icons.search),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}