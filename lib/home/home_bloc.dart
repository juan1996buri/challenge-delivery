import 'package:flutter/material.dart';

import '../data/grocery_product.dart';

enum GroceryState {
  cart,
  detail,
}

class HomeBloc extends ChangeNotifier {
  List<GroceryProduct> products = List.unmodifiable(groceryProducts);
  GroceryState currentStateGrocery = GroceryState.detail;
  List<CartProduct> cartProducts = [];

  void changeCart() {
    currentStateGrocery = GroceryState.cart;
    notifyListeners();
  }

  void changeDetail() {
    currentStateGrocery = GroceryState.detail;
    notifyListeners();
  }

  void addToCart(GroceryProduct product) {
    for (int i = 0; i < cartProducts.length; i++) {
      final cartProduct = cartProducts[i];
      if (cartProduct.product.name == product.name) {
        cartProduct.increment();
        notifyListeners();
        return;
      }
    }
    cartProducts.add(CartProduct(product: product));
    notifyListeners();
  }

  void removeProductToCart(GroceryProduct product) {
    for (CartProduct cartProduct in cartProducts) {
      if (cartProduct.product.name == product.name) {
        cartProducts.remove(cartProduct);
        notifyListeners();
        return;
      }
    }
  }

  int totalProductSelected() {
    return cartProducts.fold(
        0, (previousValue, element) => previousValue + element.amount);
  }

  double priceTotalCart() {
    return cartProducts.fold(0.0, (previousValue, element) {
      return previousValue + element.amount * element.product.price;
    });
  }
}

class CartProduct {
  CartProduct({
    required this.product,
    this.amount = 1,
  });
  final GroceryProduct product;
  int amount;

  void increment() {
    amount++;
  }
}
