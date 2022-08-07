import 'package:flutter/material.dart';
import 'package:shopapp/Providers/productmodel.dart';
import '../Providers/productprovider.dart';
import 'package:provider/provider.dart';

class Productedit extends StatefulWidget {
  //Productedit({Key? key}) : super(key: key);
  @override
  State<Productedit> createState() => _ProducteditState();
}

class _ProducteditState extends State<Productedit> {
  final _priceFocusNode = FocusNode();
  final _desfocusNode = FocusNode();
  final _urlfocusnode = FocusNode();
  var _popimage;
  var url;
  final _form = GlobalKey<FormState>();
  Product _newproduct = Product(
      id: DateTime.now().toString(),
      title: '',
      description: '',
      price: 0,
      imageUrl: '');
  var currpro = null;

  @override
  void initState() {
    _urlfocusnode.addListener(() {
      setState(() {
        _popimage = OverlayEntry(
            builder: (_) => Dialog(
                  backgroundColor: Colors.black38,
                  child: Card(
                    elevation: 500,
                    child: Container(
                        decoration: BoxDecoration(
                            border: Border.all(color: Colors.white, width: 1),
                            borderRadius: BorderRadius.circular(20)),
                        width: 100,
                        height: 300,
                        child: ClipRRect(
                            borderRadius: BorderRadius.circular(20),
                            child: Image.network(url.text))),
                  ),
                ));
      });
    });
    super.initState();
  }

  void save() {
    bool x = _form.currentState!.validate();
    if (x == false) return;
    //save only when inputs are valid
    _form.currentState!.save();
    final products = Provider.of<Products>(context, listen: false);
    if (currpro == null) {
      print(_newproduct.id);
      products.addproduct(_newproduct.id, _newproduct);
    } else {
      print(currpro.id);
      print(_newproduct.id);
      products.addproduct(currpro.id, _newproduct);
    }
    Navigator.of(context).pop();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    _priceFocusNode.dispose();
    _desfocusNode.dispose(); // to avoid memory leaks
    url.dispose();
    _urlfocusnode.dispose();
    _popimage.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    currpro = ModalRoute.of(context)!.settings.arguments;
    url =
        TextEditingController(text: (currpro == null) ? '' : currpro.imageUrl);
    return Scaffold(
        appBar: AppBar(
          title: Text('Product Manager'),
        ),
        body: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Form(
              key: _form,
              child: SingleChildScrollView(
                child: Column(children: [
                  TextFormField(
                    initialValue: (currpro == null) ? '' : currpro.title,
                    validator: (val) {
                      if (val == '')
                        return 'Enter title';
                      else
                        return null;
                    },
                    onSaved: (val) {
                      _newproduct.title = val as String;
                    },
                    autofocus: true,
                    textInputAction: TextInputAction.next,
                    decoration: InputDecoration(label: Text('title')),
                    onFieldSubmitted: (_) {
                      FocusScope.of(context).requestFocus(_priceFocusNode);
                    },
                  ),
                  TextFormField(
                    initialValue: (currpro == null)
                        ? 0.toString()
                        : currpro.price.toString(),
                    onSaved: (val) {
                      _newproduct.price = double.parse(val as String);
                    },
                    validator: (val) {
                      if (val == 0.toString())
                        return 'Enter price';
                      else
                        return null;
                    },
                    autofocus: true,
                    textInputAction: TextInputAction.next,
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(label: Text('price')),
                    focusNode: _priceFocusNode,
                    onFieldSubmitted: (_) {
                      FocusScope.of(context).requestFocus(_desfocusNode);
                    },
                  ),
                  TextFormField(
                    initialValue: (currpro == null) ? '' : currpro.description,
                    onSaved: (val) {
                      _newproduct.description = val as String;
                    },
                    validator: (val) {
                      if (val == '')
                        return 'Enter desc';
                      else
                        return null;
                    },

                    autofocus: true,
                    decoration: InputDecoration(label: Text('description')),
                    onFieldSubmitted: (_) {
                      FocusScope.of(context).requestFocus(_urlfocusnode);
                    },
                    maxLines: 3,
                    keyboardType: TextInputType.multiline,
                    focusNode: _desfocusNode,
                    //textInputAction: TextInputAction.next,
                  ),
                  Row(crossAxisAlignment: CrossAxisAlignment.end, children: [
                    GestureDetector(
                      onLongPressEnd: (_) {
                        _popimage.remove();
                      },
                      onLongPress: () {
                        Overlay.of(context)!.insert(_popimage);
                      },
                      child: Container(
                        alignment: Alignment.center,
                        height: 100,
                        width: 100,
                        margin: EdgeInsets.only(top: 10, right: 10),
                        decoration: BoxDecoration(border: Border.all(width: 1)),
                        child: (url.text.isEmpty)
                            ? Text('Enter Url')
                            : Image.network(url.text),
                      ),
                    ),
                    Expanded(
                      child: TextFormField(
                          // initialValue:
                          //     (currpro == null) ? '' : currpro.imageUrl,
                          onSaved: (val) {
                            _newproduct.imageUrl = val as String;
                          },
                          validator: (val) {
                            if (val == '') return 'Enter url dear';
                            return null;
                          },
                          //initialValue: '',
                          textInputAction: TextInputAction.done,
                          focusNode: _urlfocusnode,
                          decoration: InputDecoration(label: Text('Url')),
                          controller:
                              url, //either the controller or initial value
                          keyboardType: TextInputType.url,
                          onEditingComplete: () {
                            setState(() {
                              _popimage = OverlayEntry(
                                  builder: (_) => Dialog(
                                        backgroundColor: Colors.black38,
                                        child: Card(
                                          elevation: 500,
                                          child: Container(
                                              decoration: BoxDecoration(
                                                  border: Border.all(
                                                      color: Colors.white,
                                                      width: 1),
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          20)),
                                              width: 100,
                                              height: 300,
                                              child: ClipRRect(
                                                  borderRadius:
                                                      BorderRadius.circular(20),
                                                  child:
                                                      Image.network(url.text))),
                                        ),
                                      ));
                            });
                          }),
                    )
                  ]),
                  TextButton(onPressed: save, child: Text('SAVE'))
                ]),
              )),
        ));
  }
}
