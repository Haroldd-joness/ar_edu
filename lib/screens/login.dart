import 'package:ar_edu/constants%20/constants.dart';
import 'package:ar_edu/widgets/button.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  /// form key
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: kBackgroundPrimary,
        body: SingleChildScrollView(
          physics: const AlwaysScrollableScrollPhysics(),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Hello',
                style: kLoginText,
              ),
             Text(
              "Sign in to your account",
              style: kLogin
            ),

              Container(
                margin: const EdgeInsets.all(35),
                child: Form(
                  key: _formKey,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      TextFormField(
                        controller: _emailController,
                        decoration: const InputDecoration(
                          border: OutlineInputBorder(),
                          hintText: 'Email',
                          prefixIcon: Icon(CupertinoIcons.mail),
                        ),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter some email';
                          }
                          return null;
                        },
                      ),
                      const SizedBox(
                        height: 25,
                      ),
                      TextFormField(
                        controller: _passwordController,
                        obscureText: true,
                        decoration: const InputDecoration(
                          border: OutlineInputBorder(),
                          hintText: 'Password',
                          prefixIcon: Icon(CupertinoIcons.lock),
                        ),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter password';
                          }
                          return null;
                        },
                      ),
                      const SizedBox(height: 5,),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            GestureDetector(
                                onTap: () => print("clicked"),
                              child:  Text("Forget password", style: GoogleFonts.poppins(
                                  fontSize: 14,
                                  color: kPriColor
                              ),),

                            )
                          ],
                      ),

                      const SizedBox(
                        height: 30,
                      ),
                      GestureDetector(
                        onTap: () {
                          ///return true if the form is valid || false otherwise
                          if (_formKey.currentState!.validate()) {
                            Navigator.pushReplacementNamed(context, '/homePage');
                          }
                        },
                        child: SignUp(
                          title: 'LOGIN',
                          height: 54,
                          width: MediaQuery.of(context).size.width,
                          color: kSecondaryColor,
                        ),
                      ),

                       const SizedBox(height: 15,),
                      Text("OR", style: GoogleFonts.poppins(
                          fontSize: 15,
                          color: kPrimaryTextColor
                      ),),
                      const SizedBox(height: 25,),
                      GoogleSignIn(
                        title: 'Sign-in with Google',
                        height: 54,
                        width: MediaQuery.of(context).size.width,
                      ),

                      const SizedBox(height: 20,),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text("Don't have an account?", style: kLogin,),
                          const SizedBox(
                            width: 6,
                          ),
                          GestureDetector(
                            onTap: () => Navigator.pushReplacementNamed(
                                context, '/register'),
                            child:  Text(
                                'Sign up',
                                style: GoogleFonts.poppins(
                                    fontSize: 15,
                                    color: kPriColor
                                )
                            ),
                          ),
                        ],
                      ),

                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
