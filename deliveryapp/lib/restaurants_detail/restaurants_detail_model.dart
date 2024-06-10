import '/flutter_flow/flutter_flow_util.dart';
import 'restaurants_detail_widget.dart' show RestaurantsDetailWidget;
import 'package:flutter/material.dart';

class RestaurantsDetailModel extends FlutterFlowModel<RestaurantsDetailWidget> {
  ///  Local state fields for this page.

  String? restaurantsFilter;

  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    unfocusNode.dispose();
  }
}
