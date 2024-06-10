import 'dart:convert';
import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:timeago/timeago.dart' as timeago;
import 'lat_lng.dart';
import 'place.dart';
import 'uploaded_file.dart';
import '/backend/backend.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import '/backend/schema/structs/index.dart';
import '/auth/firebase_auth/auth_util.dart';

List<RestaurantsRecord> getRestaurantsList(
  List<RestaurantsRecord> list,
  List<RestaurantsRecord> searchResults,
) {
  return searchResults.length > 0 ? searchResults : list;
}

List<String> getUniqueCategories(List<String> categories) {
  return categories.toSet().toList();
}

double getAverageRating(List<int> rating) {
  int sum = rating.reduce((int value, int element) => value + element);
  return sum / rating.length;
}

List<String> getUniqueCategories2(List<String> categories2) {
  return categories2.toSet().toList();
}

List<MarketRecord> getMarketList2(List<MarketRecord> searchResult) {
  var list2;
  var searchResults2;
  return searchResults2.length > 0 ? searchResults2 : list2;
}

List<MarketRecord> getGroceryList(
  List<GroceryRecord> grocery,
  List<GroceryRecord> searchResults,
) {
  var list;
  return searchResults.length > 0 ? searchResults : list;
}
