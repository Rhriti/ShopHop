import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:shopapp/Providers/productprovider.dart';
import '../Providers/productmodel.dart';
import '../screen/productdetailscreen.dart';
import '../Providers/productmodel.dart';
import 'package:provider/provider.dart';

class Productwidget extends StatelessWidget {
  //const Productwidget({Key? key}) : super(key: key);
 

  @override
  Widget build(BuildContext context) {
    final product = Provider.of<Product>(context,listen: false);

    return GridTile(
        footer: GridTileBar(
          leading: Consumer(
            builder: (ctx,Product product,child)=>IconButton(
                color: Colors.red,
                onPressed: () {
                  product.toggle();
                  print(product.isfav);
                },
                icon: Icon(product.isfav
                    ? Icons.favorite
                    : Icons.favorite_border_outlined)),),
          title: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Text(
                product.title,
                textAlign: TextAlign.center,
                overflow: TextOverflow.fade,
              )),
          backgroundColor: Colors.black54,
          trailing:
              IconButton(onPressed: () {}, icon: Icon(Icons.shopping_bag)),
        ),
        child: InkWell(
            onTap: () {
              Navigator.of(context).pushNamed('/productdetail', arguments: product.id);
            },
            child: Image.network(
              product.imageUrl,
              fit: BoxFit.cover,
            )));
  }
}
