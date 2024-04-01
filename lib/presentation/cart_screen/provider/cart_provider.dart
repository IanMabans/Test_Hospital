import 'package:flutter/material.dart';
import '../../../core/app_export.dart';
import '../models/cart_model.dart';
import '../models/drugslist_item_model.dart';

/// A provider class for the CartScreen.
///
/// This provider manages the state of the CartScreen, including the
/// current cartModelObj

// ignore_for_file: must_be_immutable
class CartProvider extends ChangeNotifier {
  CartModel cartModelObj = CartModel();
  List<DrugslistItemModel> _cartItems = [];

  List<DrugslistItemModel> get cartItems => _cartItems;

  void addToCart(DrugslistItemModel item) {
    _cartItems.add(item);
    notifyListeners();
  }

  @override
  void dispose() {
    super.dispose();
  }
}
