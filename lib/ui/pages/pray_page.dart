import 'package:flutter/material.dart';

class PrayPage extends StatelessWidget {
  const PrayPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          child: Center(
            child: Text('Pray Page'),
          ),
        ),
      ),
    );
  }
}
