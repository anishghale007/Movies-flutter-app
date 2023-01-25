import 'package:flutter/material.dart';
import 'package:movies_app/constants/constants.dart';
import 'package:movies_app/resources/values_manager.dart';

class BottomNavigation extends StatelessWidget {
  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: AppMargin.m18),
      child: BottomNavigationBar(
        backgroundColor: kMainThemeColor,
        type: BottomNavigationBarType.fixed,
        showSelectedLabels: false,
        showUnselectedLabels: false,
        elevation: 1,
        selectedItemColor: kActiveNavigationColor,
        unselectedItemColor: kInactiveNavigationColor,
        currentIndex: currentIndex,
        items: [
          BottomNavigationBarItem(
            label: 'Home',
            icon: Icon(
              Icons.home,
              size: 30,
            ),
          ),
          BottomNavigationBarItem(
            label: 'Home',
            icon: Icon(
              Icons.airplane_ticket_rounded,
              size: 30,
            ),
          ),
          BottomNavigationBarItem(
            label: 'Home',
            icon: Icon(
              Icons.wallet_rounded,
              size: 30,
            ),
          ),
          BottomNavigationBarItem(
            label: 'Home',
            icon: Icon(
              Icons.account_circle,
              size: 30,
            ),
          ),
        ],
      ),
    );
  }
}
