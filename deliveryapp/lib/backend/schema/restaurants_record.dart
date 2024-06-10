import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';


class RestaurantsRecord extends FirestoreRecord {
  RestaurantsRecord._(
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

  // "address" field.
  String? _address;
  String get address => _address ?? '';
  bool hasAddress() => _address != null;

  // "image" field.
  String? _image;
  String get image => _image ?? '';
  bool hasImage() => _image != null;

  // "open" field.
  DateTime? _open;
  DateTime? get open => _open;
  bool hasOpen() => _open != null;

  // "close" field.
  DateTime? _close;
  DateTime? get close => _close;
  bool hasClose() => _close != null;

  // "location" field.
  LatLng? _location;
  LatLng? get location => _location;
  bool hasLocation() => _location != null;

  // "grocery" field.
  DocumentReference? _grocery;
  DocumentReference? get grocery => _grocery;
  bool hasGrocery() => _grocery != null;

  // "market" field.
  List<DocumentReference>? _market;
  List<DocumentReference> get market => _market ?? const [];
  bool hasMarket() => _market != null;

  void _initializeFields() {
    _name = snapshotData['name'] as String?;
    _categories = snapshotData['categories'] as String?;
    _address = snapshotData['address'] as String?;
    _image = snapshotData['image'] as String?;
    _open = snapshotData['open'] as DateTime?;
    _close = snapshotData['close'] as DateTime?;
    _location = snapshotData['location'] as LatLng?;
    _grocery = snapshotData['grocery'] as DocumentReference?;
    _market = getDataList(snapshotData['market']);
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('restaurants');

  static Stream<RestaurantsRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => RestaurantsRecord.fromSnapshot(s));

  static Future<RestaurantsRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => RestaurantsRecord.fromSnapshot(s));

  static RestaurantsRecord fromSnapshot(DocumentSnapshot snapshot) =>
      RestaurantsRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static RestaurantsRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      RestaurantsRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'RestaurantsRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is RestaurantsRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createRestaurantsRecordData({
  String? name,
  String? categories,
  String? address,
  String? image,
  DateTime? open,
  DateTime? close,
  LatLng? location,
  DocumentReference? grocery,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'name': name,
      'categories': categories,
      'address': address,
      'image': image,
      'open': open,
      'close': close,
      'location': location,
      'grocery': grocery,
    }.withoutNulls,
  );

  return firestoreData;
}

class RestaurantsRecordDocumentEquality implements Equality<RestaurantsRecord> {
  const RestaurantsRecordDocumentEquality();

  @override
  bool equals(RestaurantsRecord? e1, RestaurantsRecord? e2) {
    const listEquality = ListEquality();
    return e1?.name == e2?.name &&
        e1?.categories == e2?.categories &&
        e1?.address == e2?.address &&
        e1?.image == e2?.image &&
        e1?.open == e2?.open &&
        e1?.close == e2?.close &&
        e1?.location == e2?.location &&
        e1?.grocery == e2?.grocery &&
        listEquality.equals(e1?.market, e2?.market);
  }

  @override
  int hash(RestaurantsRecord? e) => const ListEquality().hash([
        e?.name,
        e?.categories,
        e?.address,
        e?.image,
        e?.open,
        e?.close,
        e?.location,
        e?.grocery,
        e?.market
      ]);

  @override
  bool isValidKey(Object? o) => o is RestaurantsRecord;
}
