import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:hisabcha/auth/auth.dart';

class Store {
  static Store? _store;
  static Store get instance => _store ??= Store();
  static final FirebaseFirestore firestore = FirebaseFirestore.instance;
  CollectionReference? reference;
  DocumentReference? ref;
  String uid = 'usmanarif534@gmail.com';

  void initReference() {
    Store.instance.ref = firestore
        .collection('users')
        .doc(Authentication.instance.auth.currentUser!.email);
  }

  Future<QuerySnapshot> get() async {
    return await ref!.collection('items').get();
  }

  Future<DocumentReference> getById(String id) async {
    return ref!.collection('items').doc(id);
  }

  Future<void> delete(String id) async {
    return await ref!.collection('items').doc(id).delete();
  }

  Future<DocumentReference> add(Map<String, dynamic> data) async {
    return await ref!.collection('items').add(data);
  }

  Future<void> update(Map<String, dynamic> data, String id) async {
    return await ref!.collection('items').doc(id).update(data);
  }
}
