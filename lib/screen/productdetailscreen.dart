import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shopapp/Providers/productprovider.dart';
import '../Providers/productmodel.dart';

class Productdetailscreen extends StatelessWidget {
  //const Productdetailscreen({Key? key}) : super(key: key);
  static String route = '/productdetail';

  @override
  Widget build(BuildContext context) {
    final product_id = ModalRoute.of(context)!.settings.arguments as String;
    final product = Provider.of<Products>(context).product(product_id);
    return Scaffold(
      appBar: AppBar(
        title: Text('Details'),
      ),
      body: Center(child: Text(product.title)),
    );
  }
}
