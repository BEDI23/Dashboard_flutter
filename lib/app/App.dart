import 'package:flutter/material.dart';
import 'package:miakplanou_admin/screens/home/Dashbaord.dart';
import 'package:miakplanou_admin/screens/login/SignIn.dart';

class MiakplanouAdmin extends StatelessWidget {
  const MiakplanouAdmin({super.key});

  @override
  Widget build(BuildContext context) {
    return const  MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Material App',
      home: Home(),
    );
  }
}