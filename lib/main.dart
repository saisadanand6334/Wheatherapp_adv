import 'package:flutter/material.dart';

import 'home.dart';

void main() {
  runApp(const Whet());
}

class Whet extends StatelessWidget {
  const Whet({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Weather(),
    );
  }
}
