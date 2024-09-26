import 'package:flutter/material.dart';
import 'package:routemanagement/controllers/auth_controller.dart';

class LoginPage extends StatelessWidget {
  final TextEditingController usernameController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final AuthController authController = AuthController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // Background image

          // Centered content container
          Center(
            child: SingleChildScrollView(
              // Menambahkan SingleChildScrollView
              child: Container(
                width: MediaQuery.of(context).size.width * 0.8,
                padding: EdgeInsets.all(20.0),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(20.0),
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset(
                      'assets/images/auth.png', // Replace with your actual image path
                      width: 300.0, // Adjust width as needed
                      height: 300.0, // Adjust height as needed
                    ),
                    Text("WELCOME BACK!",
                        style: TextStyle(
                            fontSize: 30,
                            fontWeight: FontWeight.bold,
                            color: Colors.lightBlue)),
                    SizedBox(height: 20.0),
                    // Login form fields
                    TextField(
                      controller: usernameController,
                      decoration: InputDecoration(
                        labelText: 'Username',
                        prefixIcon: Icon(Icons.person),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                      ),
                    ),
                    SizedBox(height: 10.0),
                    TextField(
                      controller: passwordController,
                      decoration: InputDecoration(
                        labelText: 'Password',
                        prefixIcon: Icon(Icons.lock),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                        suffixIcon: Icon(
                            Icons.visibility_off), // Optional visibility toggle
                      ),
                      obscureText: true,
                    ),
                    SizedBox(height: 20.0),
                    // Login button
                    SizedBox(
                      width:
                          double.infinity, // Lebar tombol mengikuti TextField
                      child: ElevatedButton(
                        onPressed: () {
                          authController.login(
                            context,
                            usernameController.text,
                            passwordController.text,
                          );
                        },
                        child: Text('Login',
                            style: TextStyle(color: Colors.white)),
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.lightBlue,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                        ),
                      ),
                    ),
                    // SizedBox(height: 10.0),
                    TextButton(
                      onPressed: () {
                        // Navigasi ke halaman registrasi
                        Navigator.pushNamed(context, '/register');
                      },
                      child: Text('Don\'t Have Account? click here'),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
