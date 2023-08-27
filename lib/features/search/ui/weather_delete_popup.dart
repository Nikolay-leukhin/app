import 'package:flutter/material.dart';

class WeatherDeletePopup extends StatefulWidget {
  const WeatherDeletePopup({super.key});

  @override
  State<WeatherDeletePopup> createState() => _WeatherDeletePopupState();
}

class _WeatherDeletePopupState extends State<WeatherDeletePopup> {
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      content: Container(
        child: Column(
          children: [],
        ),
      ),
    );
  }
}