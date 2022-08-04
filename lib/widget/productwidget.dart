import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:shopapp/Providers/productprovider.dart';
import '../Providers/productmodel.dart';
import '../screen/productdetailscreen.dart';
import '../Providers/productmodel.dart';
import 'package:provider/provider.dart';
import '../Providers/cart.dart';

class Productwidget extends StatelessWidget {
  //const Productwidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final product = Provider.of<Product>(context, listen: false);
    final cart = Provider.of<Cart>(context, listen: false);
    return GridTile(
        footer: GridTileBar(
          leading: Consumer(
            builder: (ctx, Product product, child) => IconButton(
                color: Colors.red,
                onPressed: () {
                  product.toggle();
                  print(product.isfav);
                },
                icon: Icon(product.isfav
                    ? Icons.favorite
                    : Icons.favorite_border_outlined)),
          ),
          title: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Text(
                product.title,
                textAlign: TextAlign.center,
                overflow: TextOverflow.fade,
              )),
          backgroundColor: Colors.black54,
          trailing: IconButton(
              onPressed: () {
                ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                    action: SnackBarAction(
                        disabledTextColor: Colors.white,
                        textColor: Colors.red,
                        label: 'UNDO',
                        onPressed: () {
                          print(product.id);
                          cart.undo(product.id);
                        }),
                    duration: Duration(milliseconds: 500),
                    content: Text('item added to cart')));
                cart.addItem(product.id, product.price, product.title);
              },
              icon: Icon(Icons.shopping_bag)),
        ),
        child: InkWell(
            onTap: () {
              Navigator.of(context)
                  .pushNamed('/productdetail', arguments: product.id);
            },
            child: Image.network(
              product.imageUrl,
              fit: BoxFit.cover,
            )));
  }
}
