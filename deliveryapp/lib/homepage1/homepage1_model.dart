import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'homepage1_widget.dart' show Homepage1Widget;
import 'package:flutter/material.dart';

class Homepage1Model extends FlutterFlowModel<Homepage1Widget> {
  ///  Local state fields for this page.

  String? restaurantFilter;

  String? supermarketFilter;

  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // State field(s) for Input widget.
  FocusNode? inputFocusNode;
  TextEditingController? inputTextController;
  String? Function(BuildContext, String?)? inputTextControllerValidator;
  List<RestaurantsRecord> simpleSearchResults = [];

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    unfocusNode.dispose();
    inputFocusNode?.dispose();
    inputTextController?.dispose();
  }
}
