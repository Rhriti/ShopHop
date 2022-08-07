import 'package:flutter/material.dart';
import '../Providers/productprovider.dart';
import '../Providers/productmodel.dart';
import '../screen/productedit.dart';

class Userprowidget extends StatelessWidget {
  //const Userprowidget({Key? key}) : super(key: key);
  Product productx;
  Userprowidget(this.productx);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ListTile(
          leading: CircleAvatar(
              //radius: 150,
              radius: 24,
              backgroundColor: Colors.pink,
              child: CircleAvatar(
                backgroundImage: NetworkImage(productx.imageUrl),
              )),
          title: Text(productx.title),
          trailing: SizedBox(
            width: 100,
            child: Row(
              children: [
                IconButton(
                    onPressed: () {
                      Navigator.of(context).pushNamed('/productedit',arguments: productx);
                    },
                    icon: Icon(Icons.edit)),
                IconButton(onPressed: () {}, icon: Icon(Icons.delete))
              ],
            ),
          ),
        ),
        Divider()
      ],
    );
  }
}
