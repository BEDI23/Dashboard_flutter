import 'package:flutter/material.dart';
import 'package:miakplanou_admin/components/background.dart';
import 'package:miakplanou_admin/constants/colors.dart';
import 'package:miakplanou_admin/screens/login/SignIn.dart';
import 'package:miakplanou_admin/widgets/custom_text.dart';
import 'package:google_fonts/google_fonts.dart';

class SignUp extends StatefulWidget {
  const SignUp({Key? key}) : super(key: key);

  @override
  _SignUpState createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  String? _usernameError;
  String? _emailError;
  String? _passwordError;

  @override
  void dispose() {
    _usernameController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  void _validateInputs() {
    setState(() {
      _usernameError = _usernameController.text.isEmpty ? "Username cannot be empty" : null;
      _emailError = _emailController.text.isEmpty ? "Email cannot be empty" : null;
      _passwordError = _passwordController.text.isEmpty ? "Password cannot be empty" : null;

      if (_emailController.text.isNotEmpty && !_emailController.text.contains("@")) {
        _emailError = "Invalid email format";
      }
    });

    if (_usernameError == null && _emailError == null && _passwordError == null) {
      // Navigate to the SignIn screen
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const SignIn()),
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
              _buildTextField(
                controller: _usernameController,
                labelText: "Username",
                hintText: "abc",
                errorText: _usernameError,
              ),
              const SizedBox(height: 15),
              _buildTextField(
                controller: _emailController,
                labelText: "Email",
                hintText: "abc@domain.com",
                errorText: _emailError,
              ),
              const SizedBox(height: 15),
              _buildTextField(
                controller: _passwordController,
                labelText: "Password",
                hintText: "123",
                errorText: _passwordError,
                obscureText: true,
              ),
              const SizedBox(height: 30),
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
                    text: "Register",
                    color: Colors.white,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildTextField({
    required TextEditingController controller,
    required String labelText,
    required String hintText,
    String? errorText,
    bool obscureText = false,
  }) {
    return TextField(
      controller: controller,
      obscureText: obscureText,
      decoration: InputDecoration(
        labelText: labelText,
        hintText: hintText,
        errorText: errorText,
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(20)),
      ),
    );
  }
}
