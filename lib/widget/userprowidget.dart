import 'package:flutter/material.dart';
import '../Providers/productprovider.dart';
import '../Providers/productmodel.dart';
import '../screen/productedit.dart';

class Userprowidget extends StatelessWidget {
  //const Userprowidget({Key? key}) : super(key: key);
  Product productx;
  Products prodata;
  Userprowidget(this.productx, this.prodata);

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
                    splashColor: Colors.blueAccent,
                    splashRadius: 25,
                    color: Colors.blue,
                    onPressed: () {
                      Navigator.of(context)
                          .pushNamed('/productedit', arguments: productx);
                    },
                    icon: Icon(Icons.edit)),
                IconButton(
                    splashColor: Colors.red,
                    splashRadius: 25,
                    color: Colors.red,
                    onPressed: () {
                      prodata.delelte(productx.id);
                    },
                    icon: Icon(Icons.delete))
              ],
            ),
          ),
        ),
        Divider()
      ],
    );
  }
}
