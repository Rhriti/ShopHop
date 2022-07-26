import 'package:flutter/material.dart';
import 'package:shopapp/Providers/productmodel.dart';
import './screen/productscreen.dart';
import 'package:provider/provider.dart';
import './Providers/productprovider.dart';
import './screen/productdetailscreen.dart';
import './Providers/cart.dart';


void main() => runApp(Myapp());

class Myapp extends StatefulWidget {
  @override
  State<Myapp> createState() => _MyappState();
}

class _MyappState extends State<Myapp> {
  //const Myapp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {

    return MultiProvider(
      providers: [ChangeNotifierProvider(create: (ctx) => Products()),ChangeNotifierProvider(create: (_)=>Cart())],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        routes: {Productdetailscreen.route: (_) => Productdetailscreen()},
        home: Productscreen(),
      ),
    );
  }
}
