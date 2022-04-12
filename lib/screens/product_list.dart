import 'package:flutter/material.dart';
import 'package:sqflitedemo/data/DbHelper.dart';

import '../models/product.dart';
import 'ProductAdd.dart';

class ProductList extends StatefulWidget {
  const ProductList({Key? key}) : super(key: key);

  @override
  State<ProductList> createState() => _ProductListState();
}

class _ProductListState extends State<ProductList> {
  var dbHelper = DbHelper();
  late List<Product> products;
  int productCount = 0;

  @override
  void initState() {
    getProducts();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Ürün Listesi'),
      ),
      body: buildProductList(),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          goToProductAdd();
        },
        child: Icon(Icons.add),
        tooltip: "Yeni Ürün Ekle",
      ),
    );
  }

  buildProductList() {
    return ListView.builder(
      itemCount: productCount,
      itemBuilder: (BuildContext context, int position) {
        return Card(
          color: Colors.cyan,
          elevation: 2.0,
          child: ListTile(
            title: Text(products[position].name),
            subtitle: Text(products[position].description),
            leading: CircleAvatar(
              backgroundColor: Colors.blue,
              child: Text(products[position].name[0]),
            ),
            onTap: () {},
          ),
        );
      },
    );
  }

  void goToProductAdd() async {
    bool result =
        await Navigator.push(context, MaterialPageRoute(builder: (context) {
      return ProductAdd();
    }));
    if (result != null) {
      if (result == true) {
        getProducts();
      }
    }
  }

  void getProducts() async {
    var productsFuture = dbHelper.getProducts();
    productsFuture.then((data) {
      this.products = data;
      productCount = data.length;
    });
  }
}
