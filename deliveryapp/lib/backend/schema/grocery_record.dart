import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';


class GroceryRecord extends FirestoreRecord {
  GroceryRecord._(
    super.reference,
    super.data,
  ) {
    _initializeFields();
  }

  // "name" field.
  String? _name;
  String get name => _name ?? '';
  bool hasName() => _name != null;

  // "categories" field.
  String? _categories;
  String get categories => _categories ?? '';
  bool hasCategories() => _categories != null;

  // "grocery" field.
  DocumentReference? _grocery;
  DocumentReference? get grocery => _grocery;
  bool hasGrocery() => _grocery != null;

  // "image" field.
  String? _image;
  String get image => _image ?? '';
  bool hasImage() => _image != null;

  DocumentReference get parentReference => reference.parent.parent!;

  void _initializeFields() {
    _name = snapshotData['name'] as String?;
    _categories = snapshotData['categories'] as String?;
    _grocery = snapshotData['grocery'] as DocumentReference?;
    _image = snapshotData['image'] as String?;
  }

  static Query<Map<String, dynamic>> collection([DocumentReference? parent]) =>
      parent != null
          ? parent.collection('Grocery')
          : FirebaseFirestore.instance.collectionGroup('Grocery');

  static DocumentReference createDoc(DocumentReference parent, {String? id}) =>
      parent.collection('Grocery').doc(id);

  static Stream<GroceryRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => GroceryRecord.fromSnapshot(s));

  static Future<GroceryRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => GroceryRecord.fromSnapshot(s));

  static GroceryRecord fromSnapshot(DocumentSnapshot snapshot) =>
      GroceryRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static GroceryRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      GroceryRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'GroceryRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is GroceryRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createGroceryRecordData({
  String? name,
  String? categories,
  DocumentReference? grocery,
  String? image,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'name': name,
      'categories': categories,
      'grocery': grocery,
      'image': image,
    }.withoutNulls,
  );

  return firestoreData;
}

class GroceryRecordDocumentEquality implements Equality<GroceryRecord> {
  const GroceryRecordDocumentEquality();

  @override
  bool equals(GroceryRecord? e1, GroceryRecord? e2) {
    return e1?.name == e2?.name &&
        e1?.categories == e2?.categories &&
        e1?.grocery == e2?.grocery &&
        e1?.image == e2?.image;
  }

  @override
  int hash(GroceryRecord? e) =>
      const ListEquality().hash([e?.name, e?.categories, e?.grocery, e?.image]);

  @override
  bool isValidKey(Object? o) => o is GroceryRecord;
}
