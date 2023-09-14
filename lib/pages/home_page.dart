// ignore_for_file: prefer_const_constructors

import 'package:first_project/helpers/colors.dart';
import 'package:first_project/pages/bon_tab.dart';
import 'package:first_project/pages/main_tab.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<StatefulWidget> createState() {
    return _HomePageState();
  }
}

class _HomePageState extends State<HomePage> {
  int currentTab = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.bgColor,
      body: body(),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        selectedItemColor: AppColors.appOrange,
        unselectedItemColor: Colors.grey,
        elevation: 7,
        onTap: (int index) {
          setState(() {
            currentTab = index;
          });
        },
        currentIndex: currentTab,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Գլխավոր'),
          BottomNavigationBarItem(
              icon: Icon(Icons.shopping_bag_outlined), label: 'BON'),
          BottomNavigationBarItem(icon: Icon(Icons.qr_code), label: 'QR կոդ'),
          BottomNavigationBarItem(
              icon: Icon(Icons.museum_sharp), label: 'Բանկինգ'),
        ],
      ),
    );
  }

  Widget body() {
    return getBody();
  }

  Widget getBody() {
    switch (currentTab) {
      case 0:
        return MainTab();
      case 1:
        return BonTab();
      default:
        return Container();
    }
  }
}
