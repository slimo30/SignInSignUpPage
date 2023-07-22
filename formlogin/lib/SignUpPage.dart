import 'package:flutter/material.dart';

import 'SigninPage.dart';
import 'main.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({super.key});

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  TextEditingController _nameController = TextEditingController();
  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();

  final formKey = GlobalKey<FormState>();
  String name = '';
  bool _isPasswordVisible = false;
  @override
  Widget build(BuildContext context) {
    final double height = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.only(left: 40, right: 40),
          child: Form(
            key: formKey,
            child: Column(
              children: [
                SizedBox(
                  height: height * 0.04,
                ),
                Text(
                  'Here To get',
                  style: TextStyle(fontSize: 30, color: Colors.blue[900]),
                ),
                Text(
                  'Welcome !',
                  style: TextStyle(fontSize: 30, color: Colors.blue[900]),
                ),
                SizedBox(
                  height: height * 0.04,
                ),
                TextFormField(
                  keyboardType: TextInputType.text,
                  decoration: InputDecoration(
                    prefixIcon: Icon(Icons.person),
                    labelText: 'Name',
                  ),
                  validator: (value) {
                    return validateName(value!);
                  },
                  controller: _nameController,
                ),
                TextFormField(
                  keyboardType: TextInputType.emailAddress,
                  controller: _emailController,
                  decoration: InputDecoration(
                    labelText: 'Email',
                    prefixIcon: Icon(Icons.email),
                  ),
                  validator: (value) {
                    return validateEmail(value!);
                  },
                ),
                TextFormField(
                  keyboardType: TextInputType.visiblePassword,
                  obscureText: _isPasswordVisible,
                  controller: _passwordController,
                  decoration: InputDecoration(
                    labelText: 'Password',
                    hintText: 'Enter your password',
                    prefixIcon: Icon(Icons.lock),
                    suffixIcon: GestureDetector(
                      onTap: () {
                        setState(() {
                          _isPasswordVisible = !_isPasswordVisible;
                        });
                      },
                      child: Icon(
                        _isPasswordVisible
                            ? Icons.visibility
                            : Icons.visibility_off,
                      ),
                    ),
                  ),
                  validator: (value) {
                    return validatePassword(value!);
                  },
                ),
                SizedBox(
                  height: height * 0.07,
                ),
                Row(
                  children: [
                    Text(
                      'Sign up',
                      style: TextStyle(fontSize: 25, color: Colors.blue[900]),
                    ),
                    ElevatedButton(
                      onPressed: () {
                        if (formKey.currentState!.validate()) {
                          final SnackBar a =
                              SnackBar(content: Text('Submitting...'));
                          ScaffoldMessenger.of(context).showSnackBar(a);
                        }
                      },
                      child: Icon(Icons.arrow_forward, size: 40),
                      style: ButtonStyle(
                        padding: MaterialStatePropertyAll(EdgeInsets.all(10)),
                        shape: MaterialStatePropertyAll(CircleBorder()),
                        iconColor: MaterialStatePropertyAll(Colors.black),
                        backgroundColor:
                            MaterialStatePropertyAll(Colors.blue[900]),
                      ),
                    ),
                  ],
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                ),
                SizedBox(
                  height: height * 0.07,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => SignInPage(),
                          ),
                        );
                      },
                      child: Text(
                        'Sign in',
                        style: TextStyle(fontSize: 20, color: Colors.blue[900]),
                      ),
                    )
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
