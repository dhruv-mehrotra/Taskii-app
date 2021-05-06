import 'package:flutter/services.dart';
import 'package:taskii/signup_page.dart';

import 'widgets/authentication_service.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SignInPage extends StatelessWidget {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
          appBar: AppBar(
            title: const Text('Log into Taskii'),
          ),
          body: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              new SizedBox(
                width: 100.0,
                height: 100.0,
                child: new Image.asset("assets/taskii_logo.png",
                    height: 90.00, width: 90.00),
              ),
              TextField(
                style: TextStyle(color: Colors.teal),
                controller: emailController,
                decoration: InputDecoration(
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: Colors.teal,
                    ),
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  disabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: Colors.teal,
                    ),
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  hintText: "Enter Your Email...",
                  hintStyle: TextStyle(
                    color: Colors.purple,
                    fontStyle: FontStyle.italic,
                  ),
                  labelText: "Email",
                  fillColor: Colors.pink,
                  focusedBorder: OutlineInputBorder(
                    borderSide:
                        const BorderSide(color: Colors.white, width: 2.0),
                    borderRadius: BorderRadius.circular(25.0),
                  ),
                ),
              ),
              TextField(
                style: TextStyle(color: Colors.teal),
                controller: passwordController,
                decoration: InputDecoration(
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: Colors.teal,
                    ),
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  hintText: "Enter Your Password...",
                  hintStyle: TextStyle(
                    color: Colors.purple,
                    fontStyle: FontStyle.italic,
                  ),
                  border: new OutlineInputBorder(
                      borderSide: new BorderSide(color: Colors.teal)),
                  labelText: "Password",
                  fillColor: Colors.pink,
                  focusedBorder: OutlineInputBorder(
                    borderSide:
                        const BorderSide(color: Colors.white, width: 2.0),
                    borderRadius: BorderRadius.circular(25.0),
                  ),
                ),
              ),
              RaisedButton(
                color: Colors.pink,
                textColor: Colors.white54,
                onPressed: () {
                  context.read<AuthenticationService>().signIn(
                        email: emailController.text.trim(),
                        password: passwordController.text.trim(),
                      );
                },
                child: Text("Sign in"),
              ),
              RaisedButton(
                color: Colors.pink,
                textColor: Colors.white54,
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => SignUpPage()),
                  );
                },
                child: Text("Sign up Instead"),
              )
            ],
          ),
        );
  }
}
