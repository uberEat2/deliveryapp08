import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'home_market_widget.dart' show HomeMarketWidget;
import 'package:flutter/material.dart';

class HomeMarketModel extends FlutterFlowModel<HomeMarketWidget> {
  ///  Local state fields for this page.

  String? marketFilter;

  String? restaurants;

  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode;
  TextEditingController? textController;
  String? Function(BuildContext, String?)? textControllerValidator;
  List<MarketRecord> simpleSearchResults = [];

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    unfocusNode.dispose();
    textFieldFocusNode?.dispose();
    textController?.dispose();
  }
}
