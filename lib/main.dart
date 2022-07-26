import 'package:flutter/material.dart';
import 'package:shopapp/Providers/productmodel.dart';
import './screen/productscreen.dart';
import 'package:provider/provider.dart';
import './Providers/productprovider.dart';
import './screen/productdetailscreen.dart';

void main() => runApp(Myapp());

class Myapp extends StatefulWidget {
  @override
  State<Myapp> createState() => _MyappState();
}

class _MyappState extends State<Myapp> {
  //const Myapp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (ctx) => Products(),  // it will trigger when item is added or else 
      child: MaterialApp(
        routes: {
          Productdetailscreen.route:(_)=>Productdetailscreen()
        },
        home: Productscreen(),
      ),
    );
  }
}
