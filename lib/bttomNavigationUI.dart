// import 'package:book_exchange/home_Screen.dart';
// import 'package:book_exchange/main.dart';
// import 'package:book_exchange/searchBook_Screen.dart';
// import 'package:flutter/material.dart';
// import 'package:book_exchange/login_Screen.dart';

// int _currentIndex = 0;
// final tabs = [
//      homehUI(),
//      searchUI()
//   ];
// class buttonNav extends StatelessWidget {
  
//   const buttonNav({ Key? key }) : super(key: key);

  
  
//   @override
//   Widget build(BuildContext context) => Scaffold(
//     body: tabs[_currentIndex],
//     bottomNavigationBar: BottomNavigationBar(
//       currentIndex : _currentIndex,
//       items: [
//         BottomNavigationBarItem(
//           icon: Icon(Icons.home),
//           label: "Home",
//           backgroundColor: Colors.red
//           ),

//           BottomNavigationBarItem(
//           icon: Icon(Icons.search),
//           label: "Search Books",
//           backgroundColor: Colors.green

//           )
//     ],
//     onTap: (index) {
//       StepState(){
//         _currentIndex = index;
//       }
//     }
//     ),

//     );
//   }
