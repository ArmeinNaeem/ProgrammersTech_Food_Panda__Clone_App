import 'menu_item.dart';

class CartService {
  List<MenuItem> _cartItems = [];

  List<MenuItem> get cartItems => _cartItems;

  void addToCart(MenuItem item) {
    _cartItems.add(item);
  }

  void removeFromCart(MenuItem item) {
    _cartItems.remove(item);
  }

  double getTotalPrice() {
    return _cartItems.fold(0, (total, item) => total + item.price);
  }
}
