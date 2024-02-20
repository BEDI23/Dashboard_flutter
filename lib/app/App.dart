import 'package:flutter/material.dart';
import 'package:miakplanou_admin/screens/login/SignIn.dart';

class MiakplanouAdmin extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Material App',
      home: const SignIn(title: 'TODO'),
    );
  }
}