import 'package:flutter/material.dart';
import '../Providers/cart.dart';
import 'package:provider/provider.dart';

class Cartscreen extends StatelessWidget {
  //const Cartscreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final cart = Provider.of<Cart>(context);
    double total=0.0;
    cart.items.forEach((pid, cartitem) {
      total += cartitem.price * cartitem.quantity;
    });

    return Scaffold(
        appBar: AppBar(
          title: Text('Cart'),
        ),
        body: Padding(
          padding: const EdgeInsets.all(10),
          child: Column(
            children: [
              Card(
                color: Color.fromARGB(255, 24, 241, 197),
                child: Padding(
                  
                  padding: const EdgeInsets.all(20),
                  child: Row(children: [ 
                   Text('TOTAL'),Spacer(),Chip(label:Text(total.toString()),avatar: CircleAvatar(child: Icon(Icons.currency_rupee_outlined)),)]),
                ),
              ),
            ],
          ),
        ));
  }
}
