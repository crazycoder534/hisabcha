import 'package:cloud_firestore/cloud_firestore.dart';

class Store {
  static Store? _store;
  static Store get instance => _store ??= Store();
  static final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  static final _reference = _firestore.collection('users');

  static Future get() async {}
  static Future update() async {}
  static Future edit() async {}
  static Future delete() async {}
}
