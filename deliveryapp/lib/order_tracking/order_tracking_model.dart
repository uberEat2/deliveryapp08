import '/flutter_flow/flutter_flow_util.dart';
import 'order_tracking_widget.dart' show OrderTrackingWidget;
import 'package:flutter/material.dart';

class OrderTrackingModel extends FlutterFlowModel<OrderTrackingWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    unfocusNode.dispose();
  }
}
