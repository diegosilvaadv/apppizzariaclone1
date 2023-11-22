import '/flutter_flow/flutter_flow_util.dart';
import 'pizza2sab16_g_g_widget.dart' show Pizza2sab16GGWidget;
import 'package:expandable/expandable.dart';
import 'package:flutter/material.dart';

class Pizza2sab16GGModel extends FlutterFlowModel<Pizza2sab16GGWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // State field(s) for Expandable widget.
  late ExpandableController expandableController1;

  // State field(s) for Expandable widget.
  late ExpandableController expandableController2;

  // State field(s) for Expandable widget.
  late ExpandableController expandableController3;

  /// Initialization and disposal methods.

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    unfocusNode.dispose();
    expandableController1.dispose();
    expandableController2.dispose();
    expandableController3.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
