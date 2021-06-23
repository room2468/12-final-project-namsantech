import 'package:cloud_firestore/cloud_firestore.dart';

final FirebaseFirestore _firestore = FirebaseFirestore.instance;
final CollectionReference _mainCollection = _firestore.collection('Menu');

class DatabaseKategori {
  static String userUid;

  static Future<void> addItem({
    String name,
    String imageUrl,
    String rating,
    String numberOfRating,
  }) async {
    DocumentReference documentReferencer = _mainCollection.doc(userUid);

    Map<String, dynamic> data = <String, dynamic>{
      "name": name,
      "imageUrl": imageUrl,
      "rating": rating,
      "numberofRating": numberOfRating
    };

    await documentReferencer
        .set(data)
        .whenComplete(() => print("Note item added to the database"))
        .catchError((e) => print(e));
  }

  static Future<void> updateItem({
    String name,
    String imageUrl,
    String rating,
    String numberOfRating,
    String docId,
  }) async {
    DocumentReference documentReferencer = _mainCollection.doc(docId);

    Map<String, dynamic> data = <String, dynamic>{
      "name": name,
      "imageUrl": imageUrl,
      "rating": rating,
      "numberofRating": numberOfRating
    };

    await documentReferencer
        .update(data)
        .whenComplete(() => print("Note item updated in the database"))
        .catchError((e) => print(e));
  }

  static Stream<QuerySnapshot> readItems() {
    CollectionReference notesItemCollection = _mainCollection;

    return notesItemCollection.snapshots();
  }

  static Future<void> deleteItem({
    String docId,
  }) async {
    DocumentReference documentReferencer = _mainCollection.doc(docId);

    await documentReferencer
        .delete()
        .whenComplete(() => print('Note item deleted from the database'))
        .catchError((e) => print(e));
  }
}