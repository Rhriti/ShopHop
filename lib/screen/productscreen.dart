import 'package:flutter/material.dart';
import 'package:shopapp/Providers/productprovider.dart';
import '../Providers/productmodel.dart';
import '../widget/productwidget.dart';
import 'package:provider/provider.dart';
//import 'productdetailscreen.dart';

class Productscreen extends StatelessWidget {
  //const Productscreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final prodata = Provider.of<Products>(context); //by <> you mention which type of provider you are listening to
    final products = prodata.items;
    return Scaffold(
      appBar: AppBar(title: Text('Shop'), actions: [
        PopupMenuButton(
          icon: Icon(Icons.more_vert),
          itemBuilder: (_) => [
            PopupMenuItem(
              child: Text('Favourites only'),
              value: 1,
            ),
            PopupMenuItem(
              child: Text('All'),
              value: 2,
            )
          ],
          onSelected: (value) {
            print(value);
            if (value == 1)
              prodata.fav();
            if (value==2)
              prodata.notfav();
          },
        )
      ]),
      body: GridView.builder(
          padding: EdgeInsets.all(20),
          itemCount: products.length,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              childAspectRatio: 1.1,
              mainAxisSpacing: 10,
              crossAxisSpacing: 10),
          itemBuilder: (ctx, index) {
            return ChangeNotifierProvider<Product>.value(
                value: products[index],
                child: Productwidget());
          }),
    );
  }
}
