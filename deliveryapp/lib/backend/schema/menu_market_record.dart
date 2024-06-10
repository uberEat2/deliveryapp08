import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import '/flutter_flow/flutter_flow_util.dart';

class MenuMarketRecord extends FirestoreRecord {
  MenuMarketRecord._(
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

  DocumentReference get parentReference => reference.parent.parent!;

  void _initializeFields() {
    _name = snapshotData['name'] as String?;
    _price = castToType<int>(snapshotData['price']);
    _image = snapshotData['image'] as String?;
  }

  static Query<Map<String, dynamic>> collection([DocumentReference? parent]) =>
      parent != null
          ? parent.collection('menuMarket')
          : FirebaseFirestore.instance.collectionGroup('menuMarket');

  static DocumentReference createDoc(DocumentReference parent, {String? id}) =>
      parent.collection('menuMarket').doc(id);

  static Stream<MenuMarketRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => MenuMarketRecord.fromSnapshot(s));

  static Future<MenuMarketRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => MenuMarketRecord.fromSnapshot(s));

  static MenuMarketRecord fromSnapshot(DocumentSnapshot snapshot) =>
      MenuMarketRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static MenuMarketRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      MenuMarketRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'MenuMarketRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is MenuMarketRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createMenuMarketRecordData({
  String? name,
  int? price,
  String? image,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'name': name,
      'price': price,
      'image': image,
    }.withoutNulls,
  );

  return firestoreData;
}

class MenuMarketRecordDocumentEquality implements Equality<MenuMarketRecord> {
  const MenuMarketRecordDocumentEquality();

  @override
  bool equals(MenuMarketRecord? e1, MenuMarketRecord? e2) {
    return e1?.name == e2?.name &&
        e1?.price == e2?.price &&
        e1?.image == e2?.image;
  }

  @override
  int hash(MenuMarketRecord? e) =>
      const ListEquality().hash([e?.name, e?.price, e?.image]);

  @override
  bool isValidKey(Object? o) => o is MenuMarketRecord;
}
