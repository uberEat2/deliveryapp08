import '/flutter_flow/flutter_flow_util.dart';
import 'restaurants_info_widget.dart' show RestaurantsInfoWidget;
import 'package:flutter/material.dart';

class RestaurantsInfoModel extends FlutterFlowModel<RestaurantsInfoWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    unfocusNode.dispose();
  }
}
