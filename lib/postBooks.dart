import 'package:book_exchange/main.dart';
import 'package:flutter/material.dart';

class postBooksScreen extends StatelessWidget {
  const postBooksScreen({ Key? key }) : super(key: key);

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
                
                keyboardType: TextInputType.visiblePassword,
                obscureText: true,
                decoration: const InputDecoration(
                  //this for password authentiacion 
                  labelText: "Enter Your Password For Post",
                  border: OutlineInputBorder(),
                  prefixIcon:  Icon(Icons.lock),
                  suffixIcon: Icon(Icons.remove_red_eye),
                ),
              ),
        const SizedBox(
                height: 25,
              ),
            TextFormField(
                
                keyboardType: TextInputType.phone,
                obscureText: true,
                decoration: const InputDecoration(
                  labelText: "Enter Book Description",
                  border: OutlineInputBorder(),
                  prefixIcon:  Icon(Icons.document_scanner_outlined),
                ),
              ),
              const SizedBox(
                height: 25,
              ),
            TextFormField(
                
                keyboardType: TextInputType.streetAddress,
                obscureText: true,
                decoration: const InputDecoration(
                  labelText: "Enter Book Quantity",
                  border: OutlineInputBorder(),
                  prefixIcon:  Icon(Icons.info),
                ),
              ),
const SizedBox(
  height: 5,
),

  const SizedBox(
    height: 25,
  ),
Container(
    height: 60,
    width: double.infinity,
    decoration: BoxDecoration(
      borderRadius:  BorderRadius.circular(100),
      gradient: const LinearGradient(colors: [Colors.green, Colors.red]),
      
    ),
    child: MaterialButton(
      onPressed: (){

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
  
  const Divider(
    height: 30,
    color: Colors.black,
  ),
  const SizedBox(
    height: 10,
  ),
      Row(
    mainAxisAlignment: MainAxisAlignment.end,
    children: [
      TextButton(onPressed: (){
        Navigator.push(context, 
        MaterialPageRoute(builder: (context) => loginUI()),
        );
      }, child: const Text( "Back"))
    ],
  ),
            ],
          ),
        ),
      ),
    );
  }
}