import 'package:flutter/material.dart';
import 'package:formlogin/SignUpPage.dart';

import 'SigninPage.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
          useMaterial3: true,
        ),
        home: const SignUpPage());
  }
}

String? validateName(String value) {
  if (value.isEmpty) {
    return 'Name is required';
  }
  return null;
}

String? validateEmail(String value) {
  if (value.isEmpty) {
    return 'Email is required';
  } else if (!RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$').hasMatch(value)) {
    return 'Invalid email address';
  }
  return null;
}

String? validatePassword(String value) {
  if (value.length < 8) {
    return 'Password must be at least 8 characters long';
  }

  if (!value.contains(RegExp(r'[A-Z]'))) {
    return 'Password must contain at least one uppercase letter';
  }

  if (!value.contains(RegExp(r'[a-z]'))) {
    return 'Password must contain at least one lowercase letter';
  }

  if (!value.contains(RegExp(r'[0-9]'))) {
    return 'Password must contain at least one digit';
  }

  if (!value.contains(RegExp(r'[!@#\$%^&*]'))) {
    return 'Password must contain at least one special character';
  }

  return null;
}
