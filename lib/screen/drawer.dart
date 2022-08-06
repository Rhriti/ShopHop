import 'package:flutter/material.dart';

class Drawerscreen extends StatelessWidget {
  //const Drawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      //backgroundColor: Color.fromRGBO(250, 218, 221,.8),
      child: Column(
        children: [
          DrawerHeader(child: Text('Navigate')),
          TextButton(
              onPressed: () {
                Navigator.of(context).pushReplacementNamed('/');
              },
              child: Text('Shop')),
          TextButton(
              onPressed: () {
                Navigator.of(context).pushNamed('/orders');
              },
              child: Text('Order')),
          TextButton(
              onPressed: () {
                Navigator.of(context).pushNamed('/userproduct');
              },
              child: Text('User products')),
        ],
      ),
    );
  }
}
