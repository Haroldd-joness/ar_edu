import 'package:ar_edu/constants%20/constants.dart';
import 'package:ar_edu/widgets/button.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Register extends StatefulWidget {
  const Register({Key? key}) : super(key: key);

  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();

  ///formKey
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final orientation = MediaQuery.of(context).orientation;


    return  Scaffold(
      backgroundColor: kBackgroundPrimary,
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Create account', style: kLoginText,),
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
                      validator: (value){
                        if(value == null || value.isEmpty){
                          return 'Enter a username';
                        }
                        return null;
                      },
                    ),
                    const SizedBox(height: 25,),
                    ///phone
                    TextFormField(
                      keyboardType: TextInputType.phone,
                      controller: _phoneController,
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        hintText: 'Contact',
                        prefixIcon: Icon(CupertinoIcons.phone),
                      ),

                      ///form validationn
                      validator: (value){
                        if(value == null || value.isEmpty){
                          return 'This field is required';
                        }
                        return null;
                      },
                    ),
                    const SizedBox(height: 25,),
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
                      validator: (value){
                        if(value == null || value.isEmpty){
                          return 'Create a password';
                        }
                        return null;
                      },
                    ),

                    const SizedBox(height: 30,),

                    ///Button
                    GestureDetector(
                      ///form validation
                      onTap: (){
                        if(_formKey.currentState!.validate()){
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(content: Text("success")),
                          );
                        }
                      },

                      child: SignUp(
                        title: 'Create account',
                        height: 54,
                        width: MediaQuery.of(context).size.width,
                        color: kSecondaryColor,
                      ),

                    ),
                    const SizedBox(height: 25,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children:  [
                        const Text("Already have an account"),
                        const SizedBox(width: 6,),
                        GestureDetector(
                          onTap: () => Navigator.pushReplacementNamed(context, '/login'),
                          child: const Text(
                            'login',
                            style: TextStyle(color: kPrimaryColor),
                          ),
                        )
                      ],
                    )


                  ],
                ),
              ),
            ),
            
          ],
        ),
      )
    );
  }
}
