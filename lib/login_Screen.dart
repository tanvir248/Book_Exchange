import 'package:book_exchange/main.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class loginScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return myLogin();
  }
}

loginData(String email, String password) async {
  var headers = {'Accept': 'application/json'};
  var request = http.MultipartRequest(
      'POST', Uri.parse('http://127.0.0.1:8000/api/login'));
  request.fields.addAll({'email': email, 'password': password});

  request.headers.addAll(headers);

  http.StreamedResponse response = await request.send();

  if (response.statusCode == 200) {
    print(await response.stream.bytesToString());
  } else {
    print(await response.stream.bytesToString());
    print("Error password or email!");
  }
}

class myLogin extends State<loginScreen> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(30),
      child: Center(
        child: SingleChildScrollView(
          child: Column(
            children: [
              const Text(
                "Book Exchange",
                style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.w900,
                  color: Colors.teal,
                ),
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
                height: 5,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  TextButton(
                      onPressed: () {}, child: const Text("Forgot Password?"))
                ],
              ),
              const SizedBox(
                height: 25,
              ),
              Container(
                height: 60,
                width: double.infinity,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(100),
                  gradient: const LinearGradient(
                      colors: [Colors.red, Color.fromARGB(255, 152, 10, 79)]),
                ),
                child: MaterialButton(
                  onPressed: () {
                    loginData(emailController.text, passwordController.text);
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => bottomNavUI()),
                    );
                  },
                  child: Text(
                    "Login",
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
                  Text(
                    "Don't have an account? ",
                    style: TextStyle(
                      color: Colors.black.withOpacity(0.8),
                    ),
                  ),
                  TextButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => signUpUI()),
                        );
                      },
                      child: const Text("Register Account"))
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
