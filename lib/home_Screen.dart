import 'package:book_exchange/main.dart';
import 'package:book_exchange/postBooks.dart';
import 'package:flutter/material.dart';


class homeScreen extends StatelessWidget {
  const homeScreen({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(30),
      child: Center(
        child: SingleChildScrollView(
          child: Column(
            children: [
              const Text(
                "Create A Post",
                style: TextStyle(
                  fontSize: 30, 
                  fontWeight:  FontWeight.w900,
                  color: Colors.teal,
                ),
              ),
              const SizedBox(
                height: 25,
              ),
       
   
     Container(
    height: 80,
    width: double.infinity,
    decoration: BoxDecoration(
      borderRadius:  BorderRadius.circular(100),
      gradient: const LinearGradient(colors: [Color.fromARGB(255, 30, 144, 53), Color.fromARGB(255, 34, 223, 62)]),
      
    ),
    child: MaterialButton(
      onPressed: (){
        Navigator.push(context, 
        MaterialPageRoute(builder: (context) => postBooksScreen()),
        );
      },
      child: Text("Exchange Book",
      style: TextStyle(
          fontSize: 25,
          color: Colors.white
      ),
      ),
    ),
),
  const SizedBox(
    height: 50,
  ),



  Container(
    height: 80,
    width: double.infinity,
    decoration: BoxDecoration(
      borderRadius:  BorderRadius.circular(100),
      gradient: const LinearGradient(colors: [Color.fromARGB(255, 232, 12, 224), Color.fromARGB(255, 150, 7, 133)]),
      
    ),
    child: MaterialButton(
      onPressed: (){
        Navigator.push(context, 
        MaterialPageRoute(builder: (context) => postBooksScreen()),
        );
      },
      child: Text("Donate",
      style: TextStyle(
          fontSize: 25,
          color: Colors.white
      ),
      ),
    ),
),
  const SizedBox(
    height: 50,
  ),


   
  Container(
    height: 80,
    width: double.infinity,
    decoration: BoxDecoration(
      borderRadius:  BorderRadius.circular(100),
      gradient: const LinearGradient(colors: [Color.fromARGB(119, 227, 111, 10), Color.fromARGB(255, 234, 43, 22)]),
      
    ),
    child: MaterialButton(
      onPressed: (){
        Navigator.push(context, 
        MaterialPageRoute(builder: (context) => postBooksScreen()),
        );
      },
      child: Text("Sell Book",
      style: TextStyle(
          fontSize: 25,
          color: Colors.white
      ),
      ),
    ),
),
  const SizedBox(
    height: 50,
  ),

            ],
          ),
        ),
      ),
    );
  }
}