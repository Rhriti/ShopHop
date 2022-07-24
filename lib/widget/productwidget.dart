import 'package:flutter/material.dart';
import '../model/productmodel.dart';

class Productwidget extends StatelessWidget {
  //const Productwidget({Key? key}) : super(key: key);
  Product product;
  Productwidget(this.product);

  @override
  Widget build(BuildContext context) {
    return GridTile(footer: GridTileBar(title: Text(product.title,textAlign: TextAlign.center,),backgroundColor: Colors.black38,),child: Image.network(product.imageUrl,fit: BoxFit.cover,));
  }
}
