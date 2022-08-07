import 'package:flutter/material.dart';
import 'package:shopapp/Providers/productmodel.dart';

class Productedit extends StatefulWidget {
  //Productedit({Key? key}) : super(key: key);
  @override
  State<Productedit> createState() => _ProducteditState();
}

class _ProducteditState extends State<Productedit> {
  final _priceFocusNode = FocusNode();
  final _desfocusNode = FocusNode();
  final url = TextEditingController(text: '');
  final _urlfocusnode = FocusNode();
  late OverlayEntry _popimage;
  final _form = GlobalKey<FormState>();

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
    _form.currentState!.save();
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
                    initialValue: '',
                    autofocus: true,
                    textInputAction: TextInputAction.next,
                    decoration: InputDecoration(label: Text('title')),
                    onFieldSubmitted: (_) {
                      FocusScope.of(context).requestFocus(_priceFocusNode);
                    },
                  ),
                  TextFormField(
                    initialValue: 0.toString(),
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
                    initialValue: '',
                    autofocus: true,
                    decoration: InputDecoration(label: Text('description')),
                    onFieldSubmitted: (_) {
                      FocusScope.of(context).requestFocus(_urlfocusnode);
                    },
                    maxLines: 3,
                    keyboardType: TextInputType.multiline,
                    focusNode: _desfocusNode,
                    textInputAction: TextInputAction.next,
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
                          //initialValue: '',
                          textInputAction: TextInputAction.done,
                          focusNode: _urlfocusnode,
                          decoration: InputDecoration(label: Text('Url')),
                          controller: url,
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
