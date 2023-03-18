import 'package:ar_edu/constants%20/constants.dart';
import 'package:ar_edu/networking%20/auth_signup.dart';
import 'package:ar_edu/widgets/button.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Register extends StatefulWidget {
  const Register({Key? key}) : super(key: key);

  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  ///formKey
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final orientation = MediaQuery.of(context).orientation;

    return SafeArea(
      child: Scaffold(
          backgroundColor: kBackgroundPrimary,
          body: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Sign Up',
                style: kLoginText,
              ),
              Text(
                "Create an account",
                style: kLogin,
              ),
              Container(
                margin: const EdgeInsets.all(35),
                child: Form(
                  key: _formKey,
                  child: Column(
                    children: [
                      ///username
                      TextFormField(
                        ///username
                        controller: _usernameController,
                        decoration: const InputDecoration(
                          border: OutlineInputBorder(),
                          hintText: 'Username or email',
                          prefixIcon: Icon(CupertinoIcons.person),
                        ),

                        ///form validationn
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Enter a username';
                          }
                          return null;
                        },
                      ),

                      ///phone

                      const SizedBox(
                        height: 25,
                      ),

                      ///password
                      TextFormField(
                        controller: _passwordController,
                        obscureText: true,
                        decoration: const InputDecoration(
                          border: OutlineInputBorder(),
                          hintText: 'Create password',
                          prefixIcon: Icon(CupertinoIcons.lock),
                        ),

                        ///form validationn
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Create a password';
                          }
                          return null;
                        },
                      ),

                      const SizedBox(
                        height: 30,
                      ),

                      ///Button
                      GestureDetector(
                        ///form validation
                        onTap: () async {
                          if (_formKey.currentState!.validate()) {
                            final message = await AuthService().createAccount(
                                email: _emailController.text.trim(),
                                password: _passwordController.text.trim()
                            );
                            if (message != null && message.contains('success')) {
                              Navigator.pushReplacementNamed(
                                  context, '/homePage');
                            }
                            ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                              content: Text(message ?? 'An error occured'),
                            ));
                          }
                        },
                        child: SignUp(
                          title: 'Create account',
                          height: 54,
                          width: MediaQuery.of(context).size.width,
                          color: kSecondaryColor,
                        ),
                      ),
                      const SizedBox(
                        height: 25,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "Already have an account",
                            style: kLogin,
                          ),
                          const SizedBox(
                            width: 6,
                          ),
                          GestureDetector(
                            onTap: () => Navigator.pushReplacementNamed(
                                context, '/login'),
                            child: Text('Login',
                                style: GoogleFonts.poppins(
                                    fontSize: 15, color: kPriColor)),
                          )
                        ],
                      )
                    ],
                  ),
                ),
              ),
            ],
          )),
    );
  }
}
