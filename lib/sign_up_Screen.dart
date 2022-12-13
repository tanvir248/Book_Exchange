import 'dart:async';
import 'dart:convert';
import 'package:book_exchange/main.dart';
import 'package:book_exchange/sign_up_Screen.dart';
import 'package:book_exchange/model/registerAPIModel.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class signUp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return MysignUp();
  }
}

var regSuccess;

registerData(String name, String email, String password, String location,
    String phone) async {
  var headers = {'Accept': 'application/json'};
  var request = http.MultipartRequest(
      'POST', Uri.parse('http://test.mrshoikot.com/api/register'));
  request.fields.addAll({
    'name': name,
    'email': email,
    'password': password,
    'location': location,
    'phone': phone
  });

  request.headers.addAll(headers);

  http.StreamedResponse response = await request.send();

  if (response.statusCode == 200) {
    print(await response.stream.bytesToString());

    regSuccess = true;
  } else {
    print(response.reasonPhrase);
    print(await response.stream.bytesToString());
    print("Registration failed!");
  }
}

class MysignUp extends State<signUp> {
  // ResponseRegister ;

  //ResponseRegister RegisterResponse;
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController locationController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
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
                controller: nameController,
                keyboardType: TextInputType.emailAddress,
                decoration: const InputDecoration(
                    labelText: "Enter Name",
                    border: OutlineInputBorder(),
                    prefixIcon: Icon(Icons.abc)),
              ),
              const SizedBox(
                height: 25,
              ),
              TextFormField(
                controller: emailController,
                keyboardType: TextInputType.emailAddress,
                decoration: const InputDecoration(
                    labelText: "Enter Email",
                    border: OutlineInputBorder(),
                    prefixIcon: Icon(Icons.email)),
              ),
              const SizedBox(
                height: 25,
              ),
              TextFormField(
                controller: passwordController,
                keyboardType: TextInputType.visiblePassword,
                obscureText: true,
                decoration: const InputDecoration(
                  labelText: "Enter Password",
                  border: OutlineInputBorder(),
                  prefixIcon: Icon(Icons.lock),
                  suffixIcon: Icon(Icons.remove_red_eye),
                ),
              ),
              const SizedBox(
                height: 25,
              ),
              TextFormField(
                controller: phoneController,
                keyboardType: TextInputType.phone,
                obscureText: false,
                decoration: const InputDecoration(
                  labelText: "Enter Phone",
                  border: OutlineInputBorder(),
                  prefixIcon: Icon(Icons.phone),
                ),
              ),
              const SizedBox(
                height: 25,
              ),
              TextFormField(
                controller: locationController,
                keyboardType: TextInputType.streetAddress,
                obscureText: false,
                decoration: const InputDecoration(
                  labelText: "Enter Address",
                  border: OutlineInputBorder(),
                  prefixIcon: Icon(Icons.info),
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
                  borderRadius: BorderRadius.circular(100),
                  gradient:
                      const LinearGradient(colors: [Colors.green, Colors.red]),
                ),
                child: MaterialButton(
                  onPressed: () {
                    print(nameController.text);
                    registerData(
                        nameController.text,
                        emailController.text,
                        passwordController.text,
                        locationController.text,
                        phoneController.text);
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => bottomNavUI()),
                    );
                    if (regSuccess) {
                      print("yahoo!");
                    } else {
                      print("Oops!");
                    }
                  },
                  child: Text(
                    "Sign Up",
                    style: TextStyle(fontSize: 25, color: Colors.white),
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
                  TextButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => loginUI()),
                        );
                      },
                      child: const Text("Back"))
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
