import 'package:flutter/material.dart';
import 'package:sqflitedemo/data/DbHelper.dart';
import 'package:sqflitedemo/models/product.dart';

class ProductAdd extends StatefulWidget {
  const ProductAdd({Key? key}) : super(key: key);

  @override
  State<ProductAdd> createState() => _ProductAddState();
}

class _ProductAddState extends State<ProductAdd> {
  var dbHelper = DbHelper();

  var nameController = TextEditingController();
  var descriptionController = TextEditingController();
  var priceController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Yeni Ürün Ekle'),
      ),
      body: Padding(
        padding: EdgeInsets.all(30.0),
        child: Column(
          children: <Widget>[
            buildNameField(),
            buildDescriptionField(),
            buildUnitPriceField(),
            buildSaveButton(),
          ],
        ),
      ),
    );
  }

  buildNameField() {
    return TextField(
      controller: nameController,
      decoration: InputDecoration(
        labelText: 'Ürün Adı',
        border: OutlineInputBorder(),
      ),
    );
  }

  buildDescriptionField() {
    return TextField(
      decoration: InputDecoration(
        labelText: 'Ürün Açıklaması',
        border: OutlineInputBorder(),
      ),
      controller: descriptionController,
    );
  }

  buildUnitPriceField() {
    return TextField(
      decoration: InputDecoration(
        labelText: 'Birim Fiyatı',
        border: OutlineInputBorder(),
      ),
      controller: priceController,
    );
  }

  buildSaveButton() {
    return FlatButton(
      child: Text('Ekle'),
      onPressed: () {
        addProduct();
      },
    );
  }

  void addProduct() async {
    var result = await dbHelper.insert(Product(
        name: nameController.text,
        description: descriptionController.text,
        unitPrice: double.tryParse(priceController)));
    Navigator.pop(context, true);
  }
}
