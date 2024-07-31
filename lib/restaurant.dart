import 'menu_item.dart';

class Restaurant {
  final String id;
  final String name;
  final String imageUrl;
  final List<MenuItem> menuItems;

  Restaurant({required this.id, required this.name, required this.imageUrl, required this.menuItems});
}
