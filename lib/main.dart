import 'package:flutter/material.dart';
import './screen/productscreen.dart';

void main() => runApp(Myapp());

class Myapp extends StatefulWidget {
  @override
  State<Myapp> createState() => _MyappState();
}

class _MyappState extends State<Myapp> {
  //const Myapp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Productscreen(),
    );
  }
}
