import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import '../Providers/cart.dart';
import 'package:provider/provider.dart';
import 'orderscreen.dart';

class Cartscreen extends StatelessWidget {
  //const Cartscreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final cart = Provider.of<Cart>(context);
    double total = 0.0;
    cart.items.forEach((pid, cartitem) {
      total += cartitem.price * cartitem.quantity;
    });
    List<CartItem> citems = cart.items.values.toList();

    return Scaffold(
        appBar: AppBar(
          title: Text('Cart'),
        ),
        body: Padding(
          padding: const EdgeInsets.all(10),
          child: Column(
            children: [
              Card(
                //color: Colors.amber,
                elevation: 15,
                borderOnForeground: true,
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 13, vertical: 5),
                  child: Row(children: [
                    Text('TOTAL',
                        style: TextStyle(
                            fontWeight: FontWeight.w400, fontSize: 25)),
                    Spacer(),
                    Column(
                      children: [
                        Chip(
                          backgroundColor: Colors.white38,
                          elevation: 5,
                          label: Text(total.toStringAsFixed(2)),
                          avatar: CircleAvatar(
                              child: Icon(Icons.currency_rupee_outlined)),
                        ),
                        TextButton(
                            onPressed: () {
                              Navigator.of(context).pushNamed('/orders');
                            },
                            child: Text('ORDER NOW'))
                      ],
                    ),
                  ]),
                ),
              ),
              // ignore: unused_local_variable
              ...List.generate(cart.items.length, (index) {
                return Dismissible(
                  confirmDismiss: (dir) {
                    return showDialog(
                        context: context,
                        builder: (_) {
                          return AlertDialog(
                            actionsAlignment: MainAxisAlignment.center,
                            content: Text('Delete item ?',textAlign: TextAlign.center,),
                            actions: [
                              TextButton(
                                  onPressed: () {
                                    Navigator.of(context).pop(false);
                                  },
                                  child: Text('NO')),
                              TextButton(
                                  onPressed: () {
                                    Navigator.of(context).pop(true);
                                  },
                                  child: Text('YES'))
                            ],
                          );
                        });
                  },
                  onDismissed: (dir) {
                    cart.dismiss(citems[index].id);
                    print(citems[index].id);
                  },
                  direction: DismissDirection.endToStart,
                  background: Container(
                    padding: EdgeInsets.all(10),
                    alignment: Alignment.centerRight,
                    child: Icon(Icons.delete),
                    width: double.infinity,
                    decoration: BoxDecoration(color: Colors.red),
                  ),
                  key: ValueKey(citems[index].id),
                  child: ListTile(
                      trailing: Text('X ${citems[index].quantity}'),
                      title: Text(citems[index].title),
                      subtitle: Text(
                          'total : ₹ ${citems[index].price * citems[index].quantity}'),
                      leading: Chip(
                        elevation: 5,
                        backgroundColor: Colors.white12,
                        label: Text(citems[index].price.toString()),
                        avatar: CircleAvatar(
                          child: Icon(Icons.currency_rupee),
                        ),
                      )),
                );
              })
            ],
          ),
        ));
  }
}
