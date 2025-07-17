import 'package:billfold/nav_widgets/dasboard.dart';
import 'package:billfold/sign_up/signup.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class loginUi extends StatefulWidget {
  const loginUi({super.key});

  @override
  State<loginUi> createState() => _loginUiState();
}

class _loginUiState extends State<loginUi> {
  bool isPasswordVisible = false;
  String? _loginError;

  FirebaseAuth auth = FirebaseAuth.instance;
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();

  loginLogic(context) async {
    try {
      var result = await auth.signInWithEmailAndPassword(
        email: email.text,
        password: password.text,
      );
      setState(() {
        _loginError = null;
      });
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => DashboardPage()),
      );
    } catch (e) {
      setState(() {
        _loginError = "Invalid email or password";
      });
    }
  }

  forgotPasswordLogic() async {
    // Logic for forgot password can be added here
    // For example, sending a password reset email
    try {
      await auth.sendPasswordResetEmail(email: email.text);
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(SnackBar(content: Text("Password reset email sent")));
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("Error sending password reset email")),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                //Image at the top
                Image.asset(
                  "assets/BillFold_Login_Graphic.png",
                  height: 310,
                  width: 320,
                  fit: BoxFit.cover,
                ),
                // Text Title
                Padding(
                  padding: const EdgeInsets.only(bottom: 5, top: 18),
                  child: const Text(
                    "Welcome Back!!",
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
                        suffixIcon: IconButton(
                          onPressed: () {
                            setState(() {
                              isPasswordVisible = !isPasswordVisible;
                            });
                          },
                          icon: Icon(
                            isPasswordVisible
                                ? Icons.visibility
                                : Icons.visibility_off,
                          ),
                        ),
                      ),
                      obscureText: !isPasswordVisible, // Hide password input
                    ),
                  ),
                ),
                // Forgot Password Link
                Padding(
                  padding: const EdgeInsets.only(top: 10),
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: InkWell(
                      onTap: () {
                        // Logic for forgot password can be added here
                        forgotPasswordLogic();
                      },
                      child: Text(
                        "Forgot Password?",
                        style: TextStyle(color: Color(0xDD004093)),
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                // Display login error if any
                if (_loginError != null)
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 8.0),
                    child: Text(
                      _loginError!,
                      style: TextStyle(
                        color: Colors.red,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                // Login Button
                Row(
                  children: [
                    Expanded(
                      child: MaterialButton(
                        color: Color(0xDD004093),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(100),
                        ),
                        onPressed: () {
                          loginLogic(context);
                        },
                        child: Padding(
                          padding: const EdgeInsets.all(20.0),
                          child: const Text(
                            "Login",
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
                    Text("Don't have an account?"),
                    TextButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => Signup()),
                        );
                      },
                      child: Text(
                        "Sign Up",
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
      ),
    );
  }
}
