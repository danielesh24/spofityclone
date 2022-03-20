import 'package:flutter/material.dart';
import 'package:spofityclone/paginas/principal_app.dart';

void main() {
  runApp(MyCloneSpotify());
}

class MyCloneSpotify extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: PrincipalApp(),
    );
  }
}
