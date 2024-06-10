import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';

class OrderRecord extends FirestoreRecord {
  OrderRecord._(
    super.reference,
    super.data,
  ) {
    _initializeFields();
  }

  // "timetamp" field.
  DateTime? _timetamp;
  DateTime? get timetamp => _timetamp;
  bool hasTimetamp() => _timetamp != null;

  // "Status" field.
  String? _status;
  String get status => _status ?? '';
  bool hasStatus() => _status != null;

  // "sorce" field.
  LatLng? _sorce;
  LatLng? get sorce => _sorce;
  bool hasSorce() => _sorce != null;

  // "destination" field.
  LatLng? _destination;
  LatLng? get destination => _destination;
  bool hasDestination() => _destination != null;

  // "driverposition" field.
  LatLng? _driverposition;
  LatLng? get driverposition => _driverposition;
  bool hasDriverposition() => _driverposition != null;

  // "Item" field.
  List<CartItemTypeStruct>? _item;
  List<CartItemTypeStruct> get item => _item ?? const [];
  bool hasItem() => _item != null;

  DocumentReference get parentReference => reference.parent.parent!;

  void _initializeFields() {
    _timetamp = snapshotData['timetamp'] as DateTime?;
    _status = snapshotData['Status'] as String?;
    _sorce = snapshotData['sorce'] as LatLng?;
    _destination = snapshotData['destination'] as LatLng?;
    _driverposition = snapshotData['driverposition'] as LatLng?;
    _item = getStructList(
      snapshotData['Item'],
      CartItemTypeStruct.fromMap,
    );
  }

  static Query<Map<String, dynamic>> collection([DocumentReference? parent]) =>
      parent != null
          ? parent.collection('order')
          : FirebaseFirestore.instance.collectionGroup('order');

  static DocumentReference createDoc(DocumentReference parent, {String? id}) =>
      parent.collection('order').doc(id);

  static Stream<OrderRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => OrderRecord.fromSnapshot(s));

  static Future<OrderRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => OrderRecord.fromSnapshot(s));

  static OrderRecord fromSnapshot(DocumentSnapshot snapshot) => OrderRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static OrderRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      OrderRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'OrderRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is OrderRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createOrderRecordData({
  DateTime? timetamp,
  String? status,
  LatLng? sorce,
  LatLng? destination,
  LatLng? driverposition,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'timetamp': timetamp,
      'Status': status,
      'sorce': sorce,
      'destination': destination,
      'driverposition': driverposition,
    }.withoutNulls,
  );

  return firestoreData;
}

class OrderRecordDocumentEquality implements Equality<OrderRecord> {
  const OrderRecordDocumentEquality();

  @override
  bool equals(OrderRecord? e1, OrderRecord? e2) {
    const listEquality = ListEquality();
    return e1?.timetamp == e2?.timetamp &&
        e1?.status == e2?.status &&
        e1?.sorce == e2?.sorce &&
        e1?.destination == e2?.destination &&
        e1?.driverposition == e2?.driverposition &&
        listEquality.equals(e1?.item, e2?.item);
  }

  @override
  int hash(OrderRecord? e) => const ListEquality().hash([
        e?.timetamp,
        e?.status,
        e?.sorce,
        e?.destination,
        e?.driverposition,
        e?.item
      ]);

  @override
  bool isValidKey(Object? o) => o is OrderRecord;
}
