import 'package:billfold/profile_setup/step1.dart';
import 'package:billfold/sign_up/login.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class Signup extends StatefulWidget {
  const Signup({super.key});

  @override
  State<Signup> createState() => _SignupState();
}

class _SignupState extends State<Signup> {
  FirebaseAuth auth = FirebaseAuth.instance;
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();
  CollectionReference users = FirebaseFirestore.instance.collection('users');

  signupLogic(context) async {
    var userCredentials = await auth.createUserWithEmailAndPassword(
      email: email.text,
      password: password.text,
    );
    users
        .add({"email": email.text})
        .then(
          (value) => Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => billInfoNote()),
          ),
        );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              //Image at the top
              Image.asset(
                "assets/BillFold_Signin_Graphic.png",
                height: 310,
                width: 320,
                fit: BoxFit.cover,
              ),
              // Text Title
              Padding(
                padding: const EdgeInsets.only(bottom: 5, top: 18),
                child: const Text(
                  "Hey, there!!",
                  style: TextStyle(
                    fontFamily: 'Poppins',
                    fontSize: 36,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
              const Text("Enter your credentials to continue"),
              // Spacing between title and input fields
              const SizedBox(height: 20),
              // Email Input Field
              Container(
                decoration: BoxDecoration(
                  color: Color(0xFFF1F1F1),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                    vertical: 8,
                    horizontal: 15,
                  ),
                  child: TextFormField(
                    controller: email,
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      hintText: "Enter your email",
                    ),
                  ),
                ),
              ),
              // Spacing between fields
              const SizedBox(height: 20),
              // Password Input Field
              Container(
                decoration: BoxDecoration(
                  color: Color(0xFFF1F1F1),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                    vertical: 8,
                    horizontal: 15,
                  ),
                  child: TextFormField(
                    controller: password,
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      hintText: "Enter your Password",
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 20),
              // Signup Button
              Row(
                children: [
                  Expanded(
                    child: MaterialButton(
                      color: Color(0xDD004093),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(100),
                      ),
                      onPressed: () {
                        signupLogic(context);
                      },
                      child: Padding(
                        padding: const EdgeInsets.all(20.0),
                        child: const Text(
                          "Sign Up",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              // Sign Up Link
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("Already have an account?"),
                  TextButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => loginUi()),
                      );
                    },
                    child: Text(
                      "Login",
                      style: TextStyle(
                        color: Color(0xDD004093),
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
