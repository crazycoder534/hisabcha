import 'package:flutter/cupertino.dart';
import 'package:hisabcha/home/model.dart';
import 'package:stacked/stacked.dart';

class AddNewItemVM extends BaseViewModel {
  final formKey = GlobalKey<FormState>();
  String? value;
  String? name;
  double? price;
  String? category;
  onSave() {
    if (formKey.currentState!.validate()) {
      formKey.currentState!.save();
      data.name = name!;
      data.category = category!;
      data.price = price!;
    }
  }

  void onNameSaved(name) {
    this.name = name;
    print('=====================> $name');
  }

  void onPriceSaved(price) {
    this.price = double.tryParse(price);
    print('=====================>$price');
  }

  void onCategorySaved(category) {
    category = this.category;
    print('=====================>$category');
  }

  String? nameValidator(value) {
    if (value == '' || value.isEmpty) {
      return "This field can't be empty";
    } else {
      return null;
    }
  }

  String? priceValidator(value) {
    if (value == '' || value.isEmpty) {
      return "This field can't be empty";
    } else {
      return null;
    }
  }

  String? categoryValidator(value) {
    if (value == '' || value.isEmpty) {
      return "Choose category";
    } else {
      return null;
    }
  }

  Data data = Data(0, '', '', 0.0);
  List<String> categories = [
    'Pizza',
    'Chawal',
    'Karahi',
    'Nihari',
    'Daal/Chaney',
    'Qourma',
    'Fast Food',
    'Sabzi',
    'Shake',
    'Lassi',
    'Pulao',
    'Other',
  ];
}
