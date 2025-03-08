import 'package:flutter/material.dart';
import 'package:flutter_application_1/features/buy_cars/persentation/buy_cars_screen.dart';
import 'package:flutter_application_1/features/home/persintation/home_screen.dart';
import 'package:flutter_application_1/features/profile_cars/persentaion/profile_cars_screen.dart';
import 'package:flutter_application_1/features/sell_cars/persentation/sell_cars_screen.dart';


class BottomBar extends StatefulWidget {
  const BottomBar({super.key});

  @override
  State<BottomBar> createState() => _BottomBarState();
}

class _BottomBarState extends State<BottomBar> {
  int selected = 0; 
  final List<Widget> pages = [
    HomeScreen(),
    BuyCarsScreen(),
    SellCarsScreen(),
    ProfileCarsScreen(),
  
    
  ];

  void onItemTapped(int index) {
    setState(() {
      selected = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: pages[selected], 
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: selected,
        onTap: onItemTapped,
        selectedItemColor: Colors.blue,
        unselectedItemColor: Colors.grey,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.directions_car),
            label: 'Buy Car',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.attach_money),
            label: 'Sell Car',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Profile',
          ),
        ],
      ),
    );
  }
}

