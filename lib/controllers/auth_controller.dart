import 'package:flutter/material.dart';
 
class AuthController {
  // Method untuk login
  void login(BuildContext context, String username, String password) {
    // Implementasi logika autentikasi
    if (username == "admin" && password == "123") {
      Navigator.pushReplacementNamed(context, '/mainpage');
    } else {
      print('Login gagal');
    }
  }
}