import '/flutter_flow/flutter_flow_util.dart';
import 'detalhes_pizzas_widget.dart' show DetalhesPizzasWidget;
import 'package:expandable/expandable.dart';
import 'package:flutter/material.dart';

class DetalhesPizzasModel extends FlutterFlowModel<DetalhesPizzasWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // State field(s) for Expandable widget.
  late ExpandableController expandableController;

  /// Initialization and disposal methods.

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    unfocusNode.dispose();
    expandableController.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
