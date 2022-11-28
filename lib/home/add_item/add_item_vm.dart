import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:hisabcha/utils/constants.dart';
import 'package:hisabcha/utils/widgets.dart';
import 'package:stacked/stacked.dart';

import '../model.dart';

class AddNewItemVM extends BaseViewModel {
  final formKey = GlobalKey<FormState>();
  String? value;
  String? name;
  double? price;
  String? category;
  onSave(BuildContext context) {
    if (formKey.currentState!.validate()) {
      if (category != null) {
        formKey.currentState!.save();
        item.name = name!;
        item.category = category!;
        item.price = price!;
        Navigator.pop(context, item);
      } else {
        toaster(context, 'Select food category', purple);
      }
    }
  }

  getCategory(category) {
    this.category = category;
    notifyListeners();
  }

  void onNameSaved(name) {
    this.name = name;
    log('=====================> $name');
  }

  void onPriceSaved(price) {
    this.price = double.tryParse(price);
    log('=====================>$price');
  }

  void onCategorySaved(category) {
    category = this.category;
    this.category = category;
    log('=====================>$category');
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

  Item item = Item(0, '', '', 0.0);
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
