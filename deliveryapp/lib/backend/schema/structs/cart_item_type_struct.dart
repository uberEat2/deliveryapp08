// ignore_for_file: unnecessary_getters_setters

import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import '/flutter_flow/flutter_flow_util.dart';

class CartItemTypeStruct extends FFFirebaseStruct {
  CartItemTypeStruct({
    DocumentReference? item,
    int? quantity,
    String? specialInstructions,
    DocumentReference? itemMrket,
    int? quantity2,
    String? specialInstruction,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _item = item,
        _quantity = quantity,
        _specialInstructions = specialInstructions,
        _itemMrket = itemMrket,
        _quantity2 = quantity2,
        _specialInstruction = specialInstruction,
        super(firestoreUtilData);

  // "Item" field.
  DocumentReference? _item;
  DocumentReference? get item => _item;
  set item(DocumentReference? val) => _item = val;
  bool hasItem() => _item != null;

  // "Quantity" field.
  int? _quantity;
  int get quantity => _quantity ?? 0;
  set quantity(int? val) => _quantity = val;
  void incrementQuantity(int amount) => _quantity = quantity + amount;
  bool hasQuantity() => _quantity != null;

  // "SpecialInstructions" field.
  String? _specialInstructions;
  String get specialInstructions => _specialInstructions ?? '';
  set specialInstructions(String? val) => _specialInstructions = val;
  bool hasSpecialInstructions() => _specialInstructions != null;

  // "ItemMrket" field.
  DocumentReference? _itemMrket;
  DocumentReference? get itemMrket => _itemMrket;
  set itemMrket(DocumentReference? val) => _itemMrket = val;
  bool hasItemMrket() => _itemMrket != null;

  // "Quantity2" field.
  int? _quantity2;
  int get quantity2 => _quantity2 ?? 0;
  set quantity2(int? val) => _quantity2 = val;
  void incrementQuantity2(int amount) => _quantity2 = quantity2 + amount;
  bool hasQuantity2() => _quantity2 != null;

  // "SpecialInstruction" field.
  String? _specialInstruction;
  String get specialInstruction => _specialInstruction ?? '';
  set specialInstruction(String? val) => _specialInstruction = val;
  bool hasSpecialInstruction() => _specialInstruction != null;

  static CartItemTypeStruct fromMap(Map<String, dynamic> data) =>
      CartItemTypeStruct(
        item: data['Item'] as DocumentReference?,
        quantity: castToType<int>(data['Quantity']),
        specialInstructions: data['SpecialInstructions'] as String?,
        itemMrket: data['ItemMrket'] as DocumentReference?,
        quantity2: castToType<int>(data['Quantity2']),
        specialInstruction: data['SpecialInstruction'] as String?,
      );

  static CartItemTypeStruct? maybeFromMap(dynamic data) => data is Map
      ? CartItemTypeStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'Item': _item,
        'Quantity': _quantity,
        'SpecialInstructions': _specialInstructions,
        'ItemMrket': _itemMrket,
        'Quantity2': _quantity2,
        'SpecialInstruction': _specialInstruction,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'Item': serializeParam(
          _item,
          ParamType.DocumentReference,
        ),
        'Quantity': serializeParam(
          _quantity,
          ParamType.int,
        ),
        'SpecialInstructions': serializeParam(
          _specialInstructions,
          ParamType.String,
        ),
        'ItemMrket': serializeParam(
          _itemMrket,
          ParamType.DocumentReference,
        ),
        'Quantity2': serializeParam(
          _quantity2,
          ParamType.int,
        ),
        'SpecialInstruction': serializeParam(
          _specialInstruction,
          ParamType.String,
        ),
      }.withoutNulls;

  static CartItemTypeStruct fromSerializableMap(Map<String, dynamic> data) =>
      CartItemTypeStruct(
        item: deserializeParam(
          data['Item'],
          ParamType.DocumentReference,
          false,
          collectionNamePath: ['restaurants', 'menuItem'],
        ),
        quantity: deserializeParam(
          data['Quantity'],
          ParamType.int,
          false,
        ),
        specialInstructions: deserializeParam(
          data['SpecialInstructions'],
          ParamType.String,
          false,
        ),
        itemMrket: deserializeParam(
          data['ItemMrket'],
          ParamType.DocumentReference,
          false,
          collectionNamePath: ['restaurants', 'menuMarket'],
        ),
        quantity2: deserializeParam(
          data['Quantity2'],
          ParamType.int,
          false,
        ),
        specialInstruction: deserializeParam(
          data['SpecialInstruction'],
          ParamType.String,
          false,
        ),
      );

  @override
  String toString() => 'CartItemTypeStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is CartItemTypeStruct &&
        item == other.item &&
        quantity == other.quantity &&
        specialInstructions == other.specialInstructions &&
        itemMrket == other.itemMrket &&
        quantity2 == other.quantity2 &&
        specialInstruction == other.specialInstruction;
  }

  @override
  int get hashCode => const ListEquality().hash([
        item,
        quantity,
        specialInstructions,
        itemMrket,
        quantity2,
        specialInstruction
      ]);
}

CartItemTypeStruct createCartItemTypeStruct({
  DocumentReference? item,
  int? quantity,
  String? specialInstructions,
  DocumentReference? itemMrket,
  int? quantity2,
  String? specialInstruction,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    CartItemTypeStruct(
      item: item,
      quantity: quantity,
      specialInstructions: specialInstructions,
      itemMrket: itemMrket,
      quantity2: quantity2,
      specialInstruction: specialInstruction,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

CartItemTypeStruct? updateCartItemTypeStruct(
  CartItemTypeStruct? cartItemType, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    cartItemType
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addCartItemTypeStructData(
  Map<String, dynamic> firestoreData,
  CartItemTypeStruct? cartItemType,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (cartItemType == null) {
    return;
  }
  if (cartItemType.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields =
      !forFieldValue && cartItemType.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final cartItemTypeData =
      getCartItemTypeFirestoreData(cartItemType, forFieldValue);
  final nestedData =
      cartItemTypeData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields = cartItemType.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getCartItemTypeFirestoreData(
  CartItemTypeStruct? cartItemType, [
  bool forFieldValue = false,
]) {
  if (cartItemType == null) {
    return {};
  }
  final firestoreData = mapToFirestore(cartItemType.toMap());

  // Add any Firestore field values
  cartItemType.firestoreUtilData.fieldValues
      .forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getCartItemTypeListFirestoreData(
  List<CartItemTypeStruct>? cartItemTypes,
) =>
    cartItemTypes?.map((e) => getCartItemTypeFirestoreData(e, true)).toList() ??
    [];
