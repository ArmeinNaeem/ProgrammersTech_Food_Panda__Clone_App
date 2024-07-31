import 'package:flutter/material.dart';
import 'menu_item.dart';

class MenuItemCard extends StatelessWidget {
  final MenuItem menuItem;
  final VoidCallback onAdd;

  MenuItemCard({required this.menuItem, required this.onAdd});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        title: Text(menuItem.name),
        trailing: Text('\$${menuItem.price.toString()}'),
        onTap: onAdd,
      ),
    );
  }
}
