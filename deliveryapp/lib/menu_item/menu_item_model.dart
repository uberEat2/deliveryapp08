import '/flutter_flow/flutter_flow_util.dart';
import 'menu_item_widget.dart' show MenuItemWidget;
import 'package:flutter/material.dart';

class MenuItemModel extends FlutterFlowModel<MenuItemWidget> {
  ///  State fields for stateful widgets in this page.

  // State field(s) for SpecialInstruction widget.
  FocusNode? specialInstructionFocusNode;
  TextEditingController? specialInstructionTextController;
  String? Function(BuildContext, String?)?
      specialInstructionTextControllerValidator;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    specialInstructionFocusNode?.dispose();
    specialInstructionTextController?.dispose();
  }
}
