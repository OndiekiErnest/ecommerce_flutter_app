import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../models/product_model.dart';

class CartProvider extends ChangeNotifier {
  // list of our cart items
  final List<Product> _cart = [];

  // cart items getter method
  List<Product> get cart => _cart;

  // method to add product to cart
  void addToCart(Product product) {
    // if cart contains item; increment its quantity
    if (_cart.contains(product)) {
      for (Product element in _cart) {
        element.quantity++;
      }
      // else; just add it to cart list
    } else {
      _cart.add(product);
    }
    // let listeners know
    notifyListeners();
  }

  // method to increase product quantity in cart
  incrementQtn(int index) {
    _cart[index].quantity++;
    // it notifies listeners
    notifyListeners();
  }

  // method to decrease product quantity
  decrementQtn(int index) {
    // prevent user from decrementing past 1
    if (_cart[index].quantity <= 1) {
      return;
    }
    _cart[index].quantity--;
    notifyListeners();
  }

  // method to calculate the total price of items in cart list
  double totalPrice() {
    double total1 = 0.0;
    for (Product element in _cart) {
      total1 += element.price * element.quantity;
    }
    // return total cost
    return total1;
  }

  // static method to create an instance of this class from context
  static CartProvider of(BuildContext context, {bool listen = true}) {
    // return the instance
    return Provider.of<CartProvider>(
      context,
      listen: listen,
    );
  }
}
