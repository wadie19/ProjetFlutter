import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:login_with_signup/Screens/LoginForm.dart';
import 'package:login_with_signup/compl/routes.dart';

class MyHome extends StatefulWidget {
  const MyHome({Key key}) : super(key: key);
  @override
  State<MyHome> createState() => _MyHome();
}

class _MyHome extends State<MyHome> {
  final GlobalKey<NavigatorState> key = GlobalKey();
  int myindex = 0;

  @override
  void initState() {
    super.initState();

      Navigator.pushNamed(context, "/login");

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("HOME"),
      ),
      body: Navigator(
        key: key,
        initialRoute: '/family',
        onGenerateRoute: homeRoutes,
      ),
      bottomNavigationBar:
      BottomNavigationBar(items: const <BottomNavigationBarItem>[
        BottomNavigationBarItem(
          icon: Icon(Icons.preview_outlined),
          label: 'Family',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.production_quantity_limits),
          label: 'Material',
        ),
      ], currentIndex: myindex, onTap: _onItemTapped),
    );
  }

  void _onItemTapped(int index) {
    setState(() {
      myindex = index;
      switch (index) {
        case 0:
          key.currentState.pushNamed('/family');
          break;
        case 1:
          key.currentState.pushNamed('/material');
          break;
      }
    });
  }
}
