import 'package:flutter/material.dart';

import 'main.dart';

class SignInPage extends StatefulWidget {
  const SignInPage({Key? key}) : super(key: key);

  @override
  _SignInPageState createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  final formKey1 = GlobalKey<FormState>();
  final TextEditingController nameController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

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
            key: formKey1,
            child: Column(
              children: [
                SizedBox(
                  height: height * 0.04,
                ),
                Text(
                  'Sign In',
                  style: TextStyle(fontSize: 30, color: Colors.blue[900]),
                ),
                SizedBox(
                  height: height * 0.04,
                ),
                TextFormField(
                  controller: nameController,
                  keyboardType: TextInputType.text,
                  decoration: InputDecoration(
                    prefixIcon: Icon(Icons.person),
                    labelText: 'Name',
                  ),
                  validator: (value) {
                    return validateName(value!);
                  },
                ),
                TextFormField(
                  controller: passwordController,
                  keyboardType: TextInputType.visiblePassword,
                  obscureText: true,
                  decoration: InputDecoration(
                    labelText: 'Password',
                    hintText: 'Enter your password',
                    prefixIcon: Icon(Icons.lock),
                  ),
                  validator: (value) {
                    return validatePassword(value!);
                  },
                ),
                SizedBox(
                  height: height * 0.07,
                ),
                ElevatedButton(
                  onPressed: () {
                    if (formKey1.currentState!.validate()) {
                      final SnackBar a =
                          SnackBar(content: Text('Submitting...'));
                      ScaffoldMessenger.of(context).showSnackBar(a);
                    }
                    final SnackBar a = SnackBar(content: Text('Signing in...'));
                    ScaffoldMessenger.of(context).showSnackBar(a);
                  },
                  child: Icon(Icons.arrow_forward, size: 40),
                  style: ButtonStyle(
                    padding: MaterialStatePropertyAll(EdgeInsets.all(10)),
                    shape: MaterialStatePropertyAll(CircleBorder()),
                    iconColor: MaterialStatePropertyAll(Colors.black),
                    backgroundColor: MaterialStatePropertyAll(Colors.blue[900]),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
