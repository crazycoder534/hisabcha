class Item {
  late int id;
  String name = '';
  String category = '';
  double price = 0.0;
  Item(this.id, this.name, this.category, this.price);

  Item.fromFirebase(Map<String, dynamic> item) {
    id = item['id'];
    name = item['name'];
    category = item['category'];
    price = item['price'];
  }
  Map<String, dynamic> toFirebase() {
    Map<String, dynamic> item = {};
    item['id'] = id;
    item['name'] = name;
    item['category'] = category;
    item['price'] = price;
    return item;
  }
}
