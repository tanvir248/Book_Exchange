import 'package:book_exchange/home_Screen.dart';
import 'package:book_exchange/postBooks.dart';
import 'package:book_exchange/searchBook_Screen.dart';
import 'package:book_exchange/sign_up_Screen.dart';
import 'package:flutter/material.dart';
import 'login_Screen.dart';
import 'package:book_exchange/home_Screen.dart';
import 'package:book_exchange/main.dart';
import 'package:book_exchange/searchBook_Screen.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:http/http.dart' as http;
import 'package:book_exchange/allBooks.dart';

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
      body: signUp(),
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

class homehUI extends StatelessWidget {

  const homehUI({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title:  "Home",
      theme: ThemeData(
        primarySwatch: Colors.teal,

      ),
      home: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text(
            "Home"
          ),
          actions: <Widget>[
            IconButton(onPressed: (){
             
                Navigator.push(context, 
        MaterialPageRoute(builder: (context) =>allBookScreen()),
        );
            }, icon: Icon(Icons.document_scanner)),
          ],
        ),
      body: homeScreen(),
        ),
    );
  }
}





class bottomNavUI extends StatefulWidget {
  const bottomNavUI({ Key? key }) : super(key: key);

  @override
  _bottomNavUI createState() => _bottomNavUI();
}

class _bottomNavUI extends State<bottomNavUI> {
  
int _currentIndex = 0;
final tabs = [
     homehUI(),
     searchUI()
  ];

  @override
  Widget build(BuildContext context) => Scaffold(

    body: tabs[_currentIndex],
    bottomNavigationBar: BottomNavigationBar(
      currentIndex : _currentIndex,
      
      items: [
        BottomNavigationBarItem(
          icon: Icon(Icons.home),
          label: "Home",
          backgroundColor: Colors.red
          ),

          BottomNavigationBarItem(
          icon: Icon(Icons.search),
          label: "Search Books",
          backgroundColor: Colors.green

          )
    ],
    onTap: (index) {
      setState(() {
      _currentIndex = index;
      });
    }
    ),

    );
  }



class postBooksUI extends StatelessWidget {
  const postBooksUI({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title:  "Post Books Here",
      theme: ThemeData(
        primarySwatch: Colors.teal,

      ),
      home: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text(
            "Post Books"
          ),
        ),
      body: postBooksScreen(),
        ),
    );  
  }
}