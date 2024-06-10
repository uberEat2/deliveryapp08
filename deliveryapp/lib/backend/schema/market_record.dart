import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';


class MarketRecord extends FirestoreRecord {
  MarketRecord._(
    super.reference,
    super.data,
  ) {
    _initializeFields();
  }

  // "name" field.
  String? _name;
  String get name => _name ?? '';
  bool hasName() => _name != null;

  // "image" field.
  String? _image;
  String get image => _image ?? '';
  bool hasImage() => _image != null;

  // "market" field.
  DocumentReference? _market;
  DocumentReference? get market => _market;
  bool hasMarket() => _market != null;

  DocumentReference get parentReference => reference.parent.parent!;

  void _initializeFields() {
    _name = snapshotData['name'] as String?;
    _image = snapshotData['image'] as String?;
    _market = snapshotData['market'] as DocumentReference?;
  }

  static Query<Map<String, dynamic>> collection([DocumentReference? parent]) =>
      parent != null
          ? parent.collection('Market')
          : FirebaseFirestore.instance.collectionGroup('Market');

  static DocumentReference createDoc(DocumentReference parent, {String? id}) =>
      parent.collection('Market').doc(id);

  static Stream<MarketRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => MarketRecord.fromSnapshot(s));

  static Future<MarketRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => MarketRecord.fromSnapshot(s));

  static MarketRecord fromSnapshot(DocumentSnapshot snapshot) => MarketRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static MarketRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      MarketRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'MarketRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is MarketRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createMarketRecordData({
  String? name,
  String? image,
  DocumentReference? market,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'name': name,
      'image': image,
      'market': market,
    }.withoutNulls,
  );

  return firestoreData;
}

class MarketRecordDocumentEquality implements Equality<MarketRecord> {
  const MarketRecordDocumentEquality();

  @override
  bool equals(MarketRecord? e1, MarketRecord? e2) {
    return e1?.name == e2?.name &&
        e1?.image == e2?.image &&
        e1?.market == e2?.market;
  }

  @override
  int hash(MarketRecord? e) =>
      const ListEquality().hash([e?.name, e?.image, e?.market]);

  @override
  bool isValidKey(Object? o) => o is MarketRecord;
}
