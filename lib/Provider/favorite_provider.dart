import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../models/product_model.dart';

class FavoriteProvider extends ChangeNotifier {
  // fav list
  final List<Product> _favorites = [];

  // getter method
  List<Product> get favorites => _favorites;

  // method to add and remove product from fav list
  void toggleFavorite(Product product) {
    if (_favorites.contains(product)) {
      _favorites.remove(product);
    } else {
      _favorites.add(product);
    }
    // let listeners know
    notifyListeners();
  }

  // check if product exists in fav list
  bool productExists(Product product) {
    final exists = _favorites.contains(product);
    return exists;
  }

  // create instance of this clas from context
  static FavoriteProvider of(BuildContext context, {bool listen = true}) {
    return Provider.of<FavoriteProvider>(
      context,
      listen: listen,
    );
  }
}
