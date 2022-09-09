import 'package:hisabcha/home/model.dart';
import 'package:hisabcha/store/store.dart';
import 'package:stacked/stacked.dart';

class HomeViewModel extends BaseViewModel {
  HomeViewModel() {
    loadData();
  }

  loadData() async {
    Store.instance.initReference();
    await getItem();
  }

  DateTime time = DateTime.now();

  List<Item> items = [];
  deleteItem(int index) {
    items.removeAt(index);
    notifyListeners();
  }

  Future<List<Item>> getItem() async {
    var dbItems = await Store.instance.get();
    items = dbItems.docs
        .map((item) => Item.fromFirebase(item.data() as Map<String, dynamic>))
        .toList();
    notifyListeners();
    return items;
  }

  addItem(item) async {
    if (item != null) {
      items.insert(0, item);
      notifyListeners();
      await Store.instance.add(item.toFirebase());
    }
  }

  editItem(item, int index) async {
    if (item != null) {
      items[index].id = item.id;
      items[index].name = item.name;
      items[index].price = item.price;
      items[index].category = item.category;
      notifyListeners();
      await Store.instance.update(item.toFirebase(), item.id.toString());
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
