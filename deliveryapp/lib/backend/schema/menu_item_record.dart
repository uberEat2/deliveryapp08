import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import '/flutter_flow/flutter_flow_util.dart';

class MenuItemRecord extends FirestoreRecord {
  MenuItemRecord._(
    super.reference,
    super.data,
  ) {
    _initializeFields();
  }

  // "name" field.
  String? _name;
  String get name => _name ?? '';
  bool hasName() => _name != null;

  // "price" field.
  int? _price;
  int get price => _price ?? 0;
  bool hasPrice() => _price != null;

  // "image" field.
  String? _image;
  String get image => _image ?? '';
  bool hasImage() => _image != null;

  // "Item" field.
  DocumentReference? _item;
  DocumentReference? get item => _item;
  bool hasItem() => _item != null;

  DocumentReference get parentReference => reference.parent.parent!;

  void _initializeFields() {
    _name = snapshotData['name'] as String?;
    _price = castToType<int>(snapshotData['price']);
    _image = snapshotData['image'] as String?;
    _item = snapshotData['Item'] as DocumentReference?;
  }

  static Query<Map<String, dynamic>> collection([DocumentReference? parent]) =>
      parent != null
          ? parent.collection('menuItem')
          : FirebaseFirestore.instance.collectionGroup('menuItem');

  static DocumentReference createDoc(DocumentReference parent, {String? id}) =>
      parent.collection('menuItem').doc(id);

  static Stream<MenuItemRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => MenuItemRecord.fromSnapshot(s));

  static Future<MenuItemRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => MenuItemRecord.fromSnapshot(s));

  static MenuItemRecord fromSnapshot(DocumentSnapshot snapshot) =>
      MenuItemRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static MenuItemRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      MenuItemRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'MenuItemRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is MenuItemRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createMenuItemRecordData({
  String? name,
  int? price,
  String? image,
  DocumentReference? item,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'name': name,
      'price': price,
      'image': image,
      'Item': item,
    }.withoutNulls,
  );

  return firestoreData;
}

class MenuItemRecordDocumentEquality implements Equality<MenuItemRecord> {
  const MenuItemRecordDocumentEquality();

  @override
  bool equals(MenuItemRecord? e1, MenuItemRecord? e2) {
    return e1?.name == e2?.name &&
        e1?.price == e2?.price &&
        e1?.image == e2?.image &&
        e1?.item == e2?.item;
  }

  @override
  int hash(MenuItemRecord? e) =>
      const ListEquality().hash([e?.name, e?.price, e?.image, e?.item]);

  @override
  bool isValidKey(Object? o) => o is MenuItemRecord;
}
