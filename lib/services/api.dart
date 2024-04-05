import 'dart:convert';
import 'package:http/http.dart' as http;

class ApiService {
  Future user
      ({
        required String email,
        required String password
      })
  async {
    final url = Uri.parse('http://192.168.1.73:8000/user');
    final data = {
      "email": email,
      "password": password
    };

    try {
      final response = await http.post(url, body: data);

      if (response.statusCode == 201) {
        print('User registered successfully');
      } else {
        print('Failed to register user instance: ${response.statusCode}');
      }
    } catch (e) {
      print('Failed to register user: $e');
    }
  }
}
