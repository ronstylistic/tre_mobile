import 'package:flutter/material.dart';
import 'package:tre_app/constant.dart';
import 'package:tre_app/tab/settings.dart';

import '../custom/app_bar.dart';
import 'notifications.dart';

class HomeScreenTab extends StatefulWidget {
  const HomeScreenTab({Key? key}) : super(key: key);

  @override
  State<HomeScreenTab> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreenTab> {
  int _selectedIndex = 0;
  static List<Widget> _widgetOptions = <Widget>[
    Notifications(),
    Settings()
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar("Account"),
      body: SafeArea(
          child: _widgetOptions.elementAt(_selectedIndex)
      ),
      bottomNavigationBar: buildBottomNavigationBar(),
    );
  }

  BottomNavigationBar buildBottomNavigationBar() {
    return BottomNavigationBar(
      items: const<BottomNavigationBarItem>[
        BottomNavigationBarItem(
          icon: Icon(Icons.home),
          label: 'Home',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.notifications),
          label: 'Notifications',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.settings),
          label: 'Settings',
        ),
      ],
      currentIndex: _selectedIndex,
      unselectedItemColor: customTextLightColor,
      selectedItemColor: customTextColor,
      onTap: (int index) {
        setState(() {
          _selectedIndex = index;
        });
      },
      showSelectedLabels: false,
      showUnselectedLabels: false,
    );
  }
}