class Data {
  int? id;
  String name = '';
  String category = '';
  double price = 0.0;
  Data(this.id, this.name, this.category, this.price);

  Data.fromFirebase(Map<String, dynamic> data) {
    id = data['id'];
    name = data['name'];
    category = data['category'];
    price = data['price'];
  }
  Map<String, dynamic> toFirebase() {
    Map<String, dynamic> data = {};
    data['id'] = id;
    data['name'] = name;
    data['category'] = category;
    data['price'] = price;
    return data;
  }
}
