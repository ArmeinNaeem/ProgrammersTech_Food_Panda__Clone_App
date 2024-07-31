import 'package:cloud_firestore/cloud_firestore.dart';
import 'restaurant.dart';
import 'menu_item.dart';

class RestaurantService {
  final FirebaseFirestore _db = FirebaseFirestore.instance;

  Future<List<Restaurant>> getRestaurants() async {
    var snapshot = await _db.collection('restaurants').get();
    return snapshot.docs.map((doc) => Restaurant(
      id: doc.id,
      name: doc['name'],
      imageUrl: doc['imageUrl'],
      menuItems: (doc['menuItems'] as List).map((item) => MenuItem(
        id: item['id'],
        name: item['name'],
        price: item['price'].toDouble(),
      )).toList(),
    )).toList();
  }
}
