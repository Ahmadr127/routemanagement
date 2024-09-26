import 'package:flutter/material.dart';
import 'package:calendar_appbar/calendar_appbar.dart';
import 'package:routemanagement/views/home/category_page.dart';
import 'package:routemanagement/views/home/home_page.dart';
import 'package:routemanagement/views/home/transaction_page.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int currentIndex = 0;

  final List<Widget> _children = [
    const HomePage(),
    const CategoryPage(),
  ];

  void onTapTapped(int index) {
    setState(() {
      currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: (currentIndex == 0)
    ? CalendarAppBar(
        fullCalendar: true,
        accent: Colors.blue,
        locale: 'id',
        backButton: false,
        onDateChanged: (value) => print(value),
        firstDate: DateTime.now().subtract(const Duration(days: 140)),
        lastDate: DateTime.now(),
      )
    : PreferredSize(
        preferredSize: const Size.fromHeight(100),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Container(
            alignment: Alignment.centerLeft,
            child: const Text("Categories" ,style: TextStyle(fontSize: 30),),
          ),
        ),
      ),

      floatingActionButton: Visibility(
        visible: (currentIndex == 0) ? true : false,
        child: FloatingActionButton(
          onPressed: () {
            Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => const TransactionPage(),
        ),
      );
          },
          backgroundColor: Colors.blue,
          shape: const CircleBorder(),
          child: const Icon(
            Icons.add,
            color: Colors.white,
          ),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      body: _children[
          currentIndex], // Use square brackets to access the list item
      bottomNavigationBar: BottomAppBar(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            IconButton(
              onPressed: () {
                onTapTapped(0);
              },
              icon: const Icon(Icons.home),
            ),
            IconButton(
              onPressed: () {
                onTapTapped(1);
              },
              icon: const Icon(Icons.list),
            ),
          ],
        ),
      ),
    );
  }
}
