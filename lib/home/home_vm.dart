import 'package:hisabcha/home/model.dart';
import 'package:stacked/stacked.dart';

class HomeViewModel extends BaseViewModel {
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
}
