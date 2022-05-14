import 'package:flutter/material.dart';

class SalatPage extends StatelessWidget {
  const SalatPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          child: Center(
            child: Text('Salat Page'),
          ),
        ),
      ),
    );
  }
}
