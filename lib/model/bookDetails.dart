import 'package:flutter/material.dart';
import 'package:book_exchange/main.dart';
class bookDetailsScreen extends StatelessWidget {
  const bookDetailsScreen({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(30),
      child: Center(
        child: SingleChildScrollView(
          child: Column(
            children: [
              const Text(
                "Book Name: Rich Dad Poor Dad",
                style: TextStyle(
                  fontSize: 20, 
                  fontWeight:  FontWeight.w900,
                  color: Colors.teal,
                ),
              ),
              const SizedBox(
                height: 25,
              ),
       
       const Text(
                "Writer: Bellman nixon",
                style: TextStyle(
                  fontSize: 16, 
                  fontWeight:  FontWeight.w100,
                  color: Color.fromARGB(255, 16, 16, 16),
                ),
              ),
              const SizedBox(
                height: 15,
              ),
      const Text(
                "Condition: Good, Little bit old",
                style: TextStyle(
                  fontSize: 16, 
                  fontWeight:  FontWeight.w100,
                  color: Color.fromARGB(255, 16, 16, 16),
                ),
              ),
              const SizedBox(
                height: 15,
              ),
              Divider(
         color: Colors.redAccent, //color of divider
         height: 5, //height spacing of divider
         thickness: 3, //thickness of divier line
         indent: 25, //spacing at the start of divider
         endIndent: 25, //spacing at the end of divider
           ),

     const Text(
                "Contact: ",
                style: TextStyle(
                  fontSize: 26, 
                  fontWeight:  FontWeight.w100,
                  color: Color.fromARGB(255, 40, 4, 184),
                ),
              ),
              const SizedBox(
                height: 15,
              ),

     const Text(
                "Email: roxen.ali672@gmail.com",
                style: TextStyle(
                  fontSize: 16, 
                  fontWeight:  FontWeight.w100,
                  color: Color.fromARGB(255, 16, 16, 16),
                ),
              ),
              const SizedBox(
                height: 15,
              ),
 const Text(
                "Mobile: +8801865225656",
                style: TextStyle(
                  fontSize: 16, 
                  fontWeight:  FontWeight.w100,
                  color: Color.fromARGB(255, 16, 16, 16),
                ),
              ),
              const SizedBox(
                height: 15,
              ),
                          Divider(
         color: Colors.redAccent, //color of divider
         height: 5, //height spacing of divider
         thickness: 3, //thickness of divier line
         indent: 25, //spacing at the start of divider
         endIndent: 25, //spacing at the end of divider
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
       
        
      },
      child: Text("Get Books ->",
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