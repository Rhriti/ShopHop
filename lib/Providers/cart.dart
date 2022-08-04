import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';

class CartItem {
  final String id;
  //final String pid;
  final String title;
  int quantity;
  final double price;

  CartItem({
    required this.id,
    //required this.pid,
    required this.title,
    required this.quantity,
    required this.price,
  });
}

class Cart with ChangeNotifier {
  Map<String, CartItem> _items = {};

  Map<String, CartItem> get items {
    return {..._items};
  }

  int get itemCount {
    return _items.length;
  }

  void undo(pid) {
    var mark;
    for (String key in _items.keys) {
      if (key == pid) {
        _items[key]!.quantity -= 1;
        mark = key;
        break;
      }
    }
    if (_items[mark]!.quantity == 0) _items.remove(mark);
    notifyListeners();
  }

  void dismiss(pid) {
    print(pid);
    for (CartItem val in items.values) print(val.id);
    _items.removeWhere((key, value) => value.id == pid);
    notifyListeners();
  }

  void addItem(
    String productId,
    double price,
    String title,
  ) {
    if (_items.containsKey(productId)) {
      // change quantity...

      _items.update(
        productId, //this is the key MP
        (existingCartItem) => CartItem(
          id: existingCartItem.id,
          title: existingCartItem.title,
          price: existingCartItem.price,
          quantity: existingCartItem.quantity + 1,
        ),
      );
    } else {
      _items.putIfAbsent(
        productId,
        () => CartItem(
          id: DateTime.now().toString(),
          title: title,
          price: price,
          quantity: 1,
        ),
      );
    }
    notifyListeners();
  }
}
