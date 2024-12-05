// import 'package:flutter/material.dart';

// class HomeScreen extends StatefulWidget {
//   const HomeScreen({super.key});

//   @override
//   State<HomeScreen> createState() => _HomeScreenState();
// }

// class _HomeScreenState extends State<HomeScreen> with SingleTickerProviderStateMixin{
//   late TabController _tabController;
  
//   @override
//   void initState(){
//     _tabController = TabController(length: 4, vsync: this, initialIndex:0);
//     _tabController.addListener(_handleTabSelection);
//     super.initState();
//   }

//   _handleTabSelection(){
//     if(_tabController.indexIsChanging){
//       setState((){

//       });
//     }
//   }

// @override
// void dispose(){
//   _tabController.dispose();
//   super.dispose();
// }

// @override
// Widget build(BuildContext context){
//   return Scaffold(
//     body: SafeArea(
//       child: Padding(
//         padding: EdgeInsets.only(top: 15),
//         child: ListView(
//           children: [
//             Padding(
//               padding: EdgeInsets.symmetric(horizontal: 15),
//               child: : Row,
//               )
//           ],
//         ),
//       )
//     ),
//   )
// }

import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home'),
        backgroundColor: Colors.blue,
      ),
      body: const Padding(
          padding: EdgeInsets.all(16),
          child: Center(child: Text('Ini adalah halaman home'))),
    );
  }
}




//   }  
