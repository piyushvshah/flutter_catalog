import 'package:flutter/material.dart';

import '../models/catalog.dart';

class ItemWidget extends StatelessWidget {
  final Items items;

  ItemWidget({super.key, required this.items});
  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        leading: Image.network(items.image),
        title: Text(items.name),
        subtitle: Text(items.desc),
        trailing: Text(
          "\$${items.price}",
          textScaleFactor: 1.2,
          style: TextStyle(
            color: Colors.deepPurple,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
    );
  }
}
