import 'package:flutter/material.dart';

import 'package:flutter_application_1/features/home/persintation/widgets/buy_car.dart';
import 'package:flutter_application_1/features/home/persintation/widgets/header_home.dart';


import 'package:flutter_application_1/features/home/persintation/widgets/sell_car.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          physics: BouncingScrollPhysics(),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [HeaderHome(), BuyCar(), SellCar()],
          ),
        ),
      
      ),
    );
  }
}
