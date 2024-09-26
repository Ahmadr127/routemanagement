import 'package:flutter/material.dart';
import 'package:routemanagement/views/auth/login_page.dart';
import 'package:routemanagement/views/auth/register_page.dart';
import 'package:routemanagement/views/home/main_page.dart';

class AppRoutes {
  static Map<String, WidgetBuilder> routes = {
    '/': (context) => LoginPage(), // Set '/' as the initial route
    '/register': (context) => RegisterPage(), // Set '/' as the initial route
    '/mainpage': (context) => const MainPage()
  };
}