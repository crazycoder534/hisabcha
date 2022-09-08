import 'package:hisabcha/home/model.dart';
import 'package:stacked/stacked.dart';

class HomeViewModel extends BaseViewModel {
  DateTime time = DateTime.now();

  List<Data> data = [
    Data(1, 'Naan Chaney', 'Nashta', 2000),
    Data(2, 'Naan Chaney', 'Nashta', 2000),
    Data(3, 'Naan Chaney', 'Nashta', 2000),
    Data(4, 'Naan Chaney', 'Nashta', 2000),
    Data(5, 'Naan Chaney', 'Nashta', 2000),
    Data(6, 'Naan Chaney', 'Nashta', 2000),
    Data(7, 'Naan Chaney', 'Nashta', 2000),
    Data(8, 'Naan Chaney', 'Nashta', 2000),
    Data(9, 'Naan Chaney', 'Nashta', 2000),
    Data(10, 'Naan Chaney', 'Nashta', 2000),
  ];
  deleteItem(int index) {
    data.removeAt(index);
    notifyListeners();
  }

  addItem(item) {
    if (item != null) {
      data.insert(0, item);
    }
    notifyListeners();
  }

  editItem(item, int index) {
    if (item != null) {
      data[index].id = item.id;
      data[index].name = item.name;
      data[index].price = item.price;
      data[index].category = item.category;
    }
    notifyListeners();
  }

  String greetings() {
    if (time.hour >= 11 && time.hour < 16) {
      return "Good Afternoon";
    }
    if (time.hour >= 16) {
      return "Good Evening";
    } else {
      return "Good Morning";
    }
  }
}
