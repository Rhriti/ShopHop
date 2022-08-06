import 'package:flutter/material.dart';
import '../Providers/cart.dart';
import 'package:provider/provider.dart';

class Orders extends StatefulWidget {
  @override
  State<Orders> createState() => _OrdersState();
}

class _OrdersState extends State<Orders> {
  //const Orders({Key? key}) : super(key: key);
  bool expanded = false;
  @override
  Widget build(BuildContext context) {
    //final total = ModalRoute.of(context)!.settings.arguments;
    final cart = Provider.of<Cart>(context, listen: false);
    double total = 0.0;
    for (CartItem val in cart.items.values) total += val.price * val.quantity;
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: Icon(Icons.arrow_back)),
        title: Text('Orders'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(14.0),
        child: Column(
          children: [
            Card(
              elevation: 20,
              //margin: EdgeInsets.all(20),
              child: ListTile(
                trailing: IconButton(
                    splashRadius: 20,
                    onPressed: () {
                      setState(() {
                        expanded = !expanded;
                        print(expanded);
                      });
                    },
                    icon: Icon(Icons.expand_more)),
                leading: Chip(
                  label: Text(total.toStringAsFixed(2)),
                  avatar: CircleAvatar(
                    child: Icon(Icons.currency_rupee),
                  ),
                ),
              ),
            ),
            //(expanded) ? Text('ss') : Text('sss')
            if (expanded == true)
              ...cart.items.values.map((ele) => Column(
                    children: [
                      ListTile(
                        leading: Text(ele.title),
                        trailing: Text('${ele.price} x ${ele.quantity}'),
                      ),
                      Divider(height: 0,)
                    ],
                  ))
          ],
        ),
      ),
    );
  }
}
