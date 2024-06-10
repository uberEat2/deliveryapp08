import '/flutter_flow/flutter_flow_util.dart';
import 'bbottum_cont_widget.dart' show BbottumContWidget;
import 'package:flutter/material.dart';

class BbottumContModel extends FlutterFlowModel<BbottumContWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    unfocusNode.dispose();
  }
}
