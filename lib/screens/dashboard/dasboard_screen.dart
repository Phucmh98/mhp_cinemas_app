import 'dart:math';
import 'dart:ui';

import 'package:circular_bottom_navigation/circular_bottom_navigation.dart';
import 'package:circular_bottom_navigation/tab_item.dart';
import 'package:flutter/material.dart';

import 'package:flutter_cinema_06/screens/category/category_screen.dart';
import 'package:flutter_cinema_06/screens/home/home_screen.dart';
import 'package:flutter_cinema_06/screens/profile/prof_screen.dart';

import 'package:flutter_cinema_06/screens/ticket/ticket_screen.dart';

class DasboardScreen extends StatefulWidget {
  const DasboardScreen({super.key});

  @override
  State<DasboardScreen> createState() => _DasboardScreenState();
}

class _DasboardScreenState extends State<DasboardScreen> {
  final PageController _pageController = PageController(initialPage: 0);

  List<Widget> screens = [
    const HomeScreen(),
    const CategoryScreen(),
    const TicketScreen(),
    const ProfScreen()
  ];
  List<TabItem> itemTabs = [
    TabItem(Icons.home_rounded, "HOME", const Color.fromARGB(255, 245, 169, 6),
        labelStyle: const TextStyle(
            color: Colors.white, fontWeight: FontWeight.w700, fontSize: 12)),
    TabItem(Icons.movie_filter, "CINEMAS", const Color.fromARGB(255, 245, 169, 6),
        labelStyle: const TextStyle(
            color: Colors.white, fontWeight: FontWeight.w700, fontSize: 12)),
    TabItem(
        Icons.local_activity_sharp, "TICKET", const Color.fromARGB(255, 245, 169, 6),
        labelStyle: const TextStyle(
            color: Colors.white, fontWeight: FontWeight.w700, fontSize: 12)),
    TabItem(Icons.person, "PROFILE", const Color.fromARGB(255, 245, 169, 6),
        labelStyle: const TextStyle(
            color: Colors.white, fontWeight: FontWeight.w700, fontSize: 12)),
  ];
  late CircularBottomNavigationController _navigationController;
  int currentIndex = 0;

  @override
  void initState() {
    super.initState();
    _navigationController = CircularBottomNavigationController(currentIndex);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      body: Padding(
        padding: const EdgeInsets.only(bottom: 0),
        child: PageView.builder(
          itemCount: screens.length,
          controller: _pageController,
          onPageChanged: (int index) {
            setState(() => _navigationController.value = index);
          },
          itemBuilder: (BuildContext context, int index) {
            return screens[index];
          },
        ),
      ),
      bottomNavigationBar: CircularBottomNavigation(
        itemTabs,
        controller: _navigationController,
        iconsSize: 30,
        selectedPos: currentIndex,
        circleStrokeWidth: 2,
        normalIconColor: Colors.white,
        selectedCallback: (int? index) {
          setState(() {
            currentIndex = index ?? 0;
            print(_navigationController.value);
            _pageController.jumpToPage(index!);
          });
        },
        barBackgroundGradient: const LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [Color(0xFF301860), Color(0xFF001848)],
        ),
      ),
    );
  }

  @override
  void dispose() {
    super.dispose();
    _navigationController.dispose();
  }
}
