import 'package:cloud_firestore/cloud_firestore.dart';

class Store {
  final usersRefAlizeh = FirebaseFirestore.instance.collection('users');
  final usersRefJennah = FirebaseFirestore.instance.collection('users');

  Future<String> receveButtonJennah() async {
    String s = '';
    try {
      await FirebaseFirestore.instance
          .collection('users')
          .doc('alizeh')
          .get()
          .then((value) {
        Map m = value.data();
        s = m['messages'];
        print(s);
      });
      return s;
    } catch (e) {
      return e;
    }
  }

  Future<String> receveButtonAlizeh() async {
    String s = ' ';
    try {
      await usersRefAlizeh.doc('jennah').get().then((val) {
        Map m = val.data();
        s = m['message'];
        print(s);
      });
      return s;
    } catch (e) {
      return e;
    }
  }

  Future sentMessageAlizeh(String value) async {
    await usersRefAlizeh.doc('alizeh').set({
      'messages': value,
    });
    print('stored values in firebase');
  }

  Future sentMessageJennah(String value) async {
    await usersRefJennah.doc('jennah').set({
      'message': value,
    });
    print('stored values in firebase');
  }
}
