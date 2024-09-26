// import 'package:flutter/material.dart';
 
// class TabMenu extends StatefulWidget {
//   @override
//   _TabMenuState createState() => _TabMenuState();
// }
 
// class _TabMenuState extends State with SingleTickerProviderStateMixin {
//   late TabController _tabController;
 
//   @override
//   void initState() {
//     super.initState();
//     _tabController = TabController(length: 3, vsync: this);
//   }
 
//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       children: [
//         TabBar(
//           controller: _tabController,
//           tabs: [
//             Tab(icon: Icon(Icons.home), text: "Home"),
//             Tab(icon: Icon(Icons.settings), text: "Settings"),
//             Tab(icon: Icon(Icons.info), text: "Info"),
//           ],
//         ),
//         Expanded(
//           child: TabBarView(
//             controller: _tabController,
//             children: [
//               Center(child: Text('Home Content')),
//               Center(child: Text('Settings Content')),
//               Center(child: Text('Info Content')),
//             ],
//           ),
//         ),
//       ],
//     );
//   }
// }