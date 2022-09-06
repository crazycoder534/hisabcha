import 'package:flutter/cupertino.dart';
import 'package:stacked/stacked.dart';

class AddNewItemVM extends BaseViewModel {
  final formKey = GlobalKey<FormState>();
  String? value;
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
