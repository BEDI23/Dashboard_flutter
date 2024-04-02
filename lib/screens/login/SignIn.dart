import 'package:flutter/material.dart';
import 'package:miakplanou_admin/components/background.dart';
import 'package:miakplanou_admin/constants/colors.dart';
import 'package:miakplanou_admin/screens/home/Dashbaord.dart';
import 'package:miakplanou_admin/screens/login/SingUp.dart';
import 'package:miakplanou_admin/widgets/custom_text.dart';
import 'package:google_fonts/google_fonts.dart';

class SignIn extends StatefulWidget {
  const SignIn({Key? key}) : super(key: key);

  @override
  _SignInState createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  String? _emailError;
  String? _passwordError;

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  void _validateInputs() {
    setState(() {
      _emailError = _emailController.text.isEmpty ? "Email cannot be empty" : null;
      _passwordError = _passwordController.text.isEmpty ? "Password cannot be empty" : null;

      if (_emailController.text.isNotEmpty && !_emailController.text.contains("@")) {
        _emailError = "Invalid email format";
      }
    });

    if (_emailError == null && _passwordError == null) {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const Home()),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Background(
      child: Center(
        child: Container(
          constraints: const BoxConstraints(maxWidth: 400),
          padding: const EdgeInsets.all(24),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const SizedBox(height: 30),
              Row(
                children: [
                  Text(
                    "Login",
                    style: GoogleFonts.roboto(fontSize: 30, fontWeight: FontWeight.bold),
                  ),
                ],
              ),
              const SizedBox(height: 10),
              const Row(
                children: [
                  CustomText(
                    text: "Welcome.",
                    color: lightGrey,
                  ),
                ],
              ),
              const SizedBox(height: 15),
              TextField(
                controller: _emailController,
                decoration: InputDecoration(
                  labelText: "Email",
                  hintText: "abc@domain.com",
                  errorText: _emailError,
                  border: OutlineInputBorder(borderRadius: BorderRadius.circular(20)),
                ),
              ),
              const SizedBox(height: 15),
              TextField(
                controller: _passwordController,
                obscureText: true,
                decoration: InputDecoration(
                  labelText: "Password",
                  hintText: "123",
                  errorText: _passwordError,
                  border: OutlineInputBorder(borderRadius: BorderRadius.circular(20)),
                ),
              ),
              const SizedBox(height: 15),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: const [
                  CustomText(text: "Forgot password?", color: kPrimaryColor),
                ],
              ),
              const SizedBox(height: 15),
              InkWell(
                onTap: _validateInputs,
                child: Container(
                  decoration: BoxDecoration(
                    color: kPrimaryColor,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  alignment: Alignment.center,
                  width: double.maxFinite,
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  child: const CustomText(
                    text: "Login",
                    color: Colors.white,
                  ),
                ),
              ),
              const SizedBox(height: 15),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  const Text(
                    "Don’t have an Account ? ",
                    style: TextStyle(color: dark),
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(builder: (context) => const SignUp()),
                      );
                    },
                    child: const Text(
                      "Sign Up",
                      style: TextStyle(
                        color: kPrimaryColor,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
