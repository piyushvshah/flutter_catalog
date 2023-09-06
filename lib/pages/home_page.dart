import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_catalog/models/catalog.dart';
import 'package:velocity_x/velocity_x.dart';
import 'dart:convert';
import '../widgets/drawer.dart';

class HomePage extends StatefulWidget {
  HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    super.initState();
    loadData();
  }

  loadData() async {
    final jsonData = await rootBundle.loadString("assets/files/catalog.json");
    final decodedData = jsonDecode(jsonData);
    var productData = decodedData["products"];
    CatalogModel.items = List.from(productData)
        .map<Items>((items) => Items.fromMap(items))
        .toList();
    setState(() {});
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Catalog App"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: GridView.builder(
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2, crossAxisSpacing: 6, mainAxisSpacing: 6),
          itemBuilder: (context, index) {
            final items = CatalogModel.items[index];
            return Card(
              clipBehavior: Clip.antiAlias,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10)),
              child: GridTile(
                  child: Image.network(items.image),
                  header: Container(
                      decoration: BoxDecoration(color: Colors.deepPurple),
                      padding: EdgeInsets.all(3),
                      child: items.name.text.white.make()),
                  footer: Container(
                      padding: EdgeInsets.all(4),
                      color: Vx.black,
                      child: "\$${items.price}".text.white.bold.make())),
            );
          },
          itemCount: CatalogModel.items.length,
        ),
      ),
      drawer: MyDrawer(),
    );
  }
}
