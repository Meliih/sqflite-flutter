class Product {
  late int id;
  late String name;
  late String description;
  late double unitPrice;

  Product(this.id, this.name, this.description, this.unitPrice);

  Product.withId(this.name, this.description, this.unitPrice);

  Map<String, dynamic> toMap() {
    var map = Map<String, dynamic>();
    map['name'] = name;
    map['description'] = description;
    map['unitPrice'] = unitPrice;
    if (id != null) {
      map['id'] = id;
    }
    return map;
  }

  Product.fromObject(dynamic o) {
    this.id = o['id'];
    this.name = o['name'];
    this.description = o['description'];
    this.unitPrice = o['unitPrice'];
  }
}
