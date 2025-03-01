import 'package:flutter/material.dart';
import 'package:flutter_application_1/core/theming/color_manager.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: ColorsManager.mainBlue,
      height: 500,
    );
  }
}