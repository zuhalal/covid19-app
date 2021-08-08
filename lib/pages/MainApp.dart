import 'package:covid19app/pages/About.dart';
import 'package:covid19app/pages/Cases.dart';
import 'package:covid19app/pages/Daily.dart';
import 'package:covid19app/pages/Home.dart';
import 'package:flutter/material.dart';

class MainApp extends StatefulWidget {
  @override
  _MainAppState createState() => _MainAppState();
}

class _MainAppState extends State<MainApp> {
  int _selectedIndex = 0;
  final _layoutPage =[
    HomeScreen(),
    CasePage(),
    DailyPage(),
    About(),
  ];
  void _onTabItem(int index){
    setState((){
      _selectedIndex = index;
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _layoutPage.elementAt(_selectedIndex),
      bottomNavigationBar: BottomNavigationBar(
        selectedItemColor: Color(0xFF50DFC6),
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
              icon: Icon(Icons.home),
              title: Text("Home")
          ),
          BottomNavigationBarItem(
              icon: Icon(Icons.show_chart_outlined),
              title: Text("Case")
          ),
          BottomNavigationBarItem(
              icon: Icon(Icons.bar_chart),
              title: Text("Daily")
          ),
          BottomNavigationBarItem(
              icon: Icon(Icons.info),
              title: Text("About")
          ),
        ],
        type: BottomNavigationBarType.fixed,
        currentIndex: _selectedIndex,
        onTap: _onTabItem,
      ),
    );
  }
}