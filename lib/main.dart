import 'package:book_exchange/searchBook_Screen.dart';
import 'package:book_exchange/sign_up_Screen.dart';
import 'package:flutter/material.dart';
import 'login_Screen.dart';
void main() => runApp(loginUI());

class loginUI extends StatelessWidget {
  const loginUI({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title:  "Login here",
      theme: ThemeData(
        primarySwatch: Colors.teal,

      ),
      home: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text(
            "Login"
          ),
        ),
      body: loginScreen(),
        ),
    );
  }
}

class signUpUI extends StatelessWidget {
  const signUpUI({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title:  "SignUp Here",
      theme: ThemeData(
        primarySwatch: Colors.teal,

      ),
      home: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text(
            "SignUp"
          ),
        ),
      body: signUpScreen(),
        ),
    );
  }
}

class searchUI extends StatelessWidget {
  const searchUI({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title:  "Search Here",
      theme: ThemeData(
        primarySwatch: Colors.teal,

      ),
      home: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text(
            "Search Book"
          ),
        ),
      body: searchBookScreen(),
        ),
    );
  }
}