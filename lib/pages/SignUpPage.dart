import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({super.key});

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {

  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController cPasswordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: SafeArea(
        child: Container(
          padding: EdgeInsets.symmetric(
            horizontal: 40,
          ),
          child: Center(
            child: SingleChildScrollView(
              child: Column(
                children: [

                  Text("Chat App", style: TextStyle(
                      color: Theme.of(context).colorScheme.secondary,
                      fontSize: 45,
                      fontWeight: FontWeight.bold
                  ),),

                  SizedBox(height: 10,),

                  TextField(
                    controller: emailController,
                    decoration: InputDecoration(
                        labelText: "Email Address"
                    ),
                  ),

                  SizedBox(height: 10,),

                  TextField(
                    controller: passwordController,
                    obscureText: true,
                    decoration: InputDecoration(
                        labelText: "Password"
                    ),
                  ),

                  SizedBox(height: 10,),

                  TextField(
                    controller: cPasswordController,
                    obscureText: true,
                    decoration: InputDecoration(
                        labelText: "Confirm Password"
                    ),
                  ),

                  SizedBox(height: 20,),

                  CupertinoButton(
                    onPressed: () {
                    //  checkValues();
                    },
                    color: Theme.of(context).colorScheme.secondary,
                    child: Text("Sign Up"),
                  ),

                ],
              ),
            ),
          ),
        ),
      ),
      bottomNavigationBar: Container(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [

            Text("Already have an account?", style: TextStyle(
                fontSize: 16
            ),),

            CupertinoButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: Text("Log In", style: TextStyle(
                  fontSize: 16
              ),),
            ),

          ],
        ),
      ),
    );
  }
}
