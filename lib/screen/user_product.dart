import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shopapp/Providers/productprovider.dart';
import '../widget/userprowidget.dart';

class Userproduct extends StatelessWidget {
  //const Userproduct({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final prodata = Provider.of<Products>(context);
    print(prodata);
    return Scaffold(
      appBar: AppBar(actions: [
        IconButton(
            onPressed: () {
              Navigator.of(context).pushNamed('/productedit');
            },
            icon: Icon(Icons.add))
      ], title: Text('Products')),
      body: ListView(
          children: prodata.allitems.map((ele) => Userprowidget(ele)).toList()),
    );
  }
}
