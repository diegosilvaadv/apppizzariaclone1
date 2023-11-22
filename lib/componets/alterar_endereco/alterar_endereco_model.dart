import '/backend/api_requests/api_calls.dart';
import '/backend/supabase/supabase.dart';
import '/componets/alterar_endereco/alterar_endereco_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'alterar_endereco_widget.dart' show AlterarEnderecoWidget;
import 'dart:async';
import 'package:expandable/expandable.dart';
import 'package:flutter/material.dart';

class AlterarEnderecoModel extends FlutterFlowModel<AlterarEnderecoWidget> {
  ///  State fields for stateful widgets in this component.

  final formKey1 = GlobalKey<FormState>();
  final formKey2 = GlobalKey<FormState>();
  // State field(s) for Expandable widget.
  late ExpandableController expandableController;

  Completer<List<UsersEnderecosRow>>? requestCompleter;
  // State field(s) for cep widget.
  FocusNode? cepFocusNode;
  TextEditingController? cepController;
  String? Function(BuildContext, String?)? cepControllerValidator;
  // Stores action output result for [Backend Call - API (BuscarCEP)] action in Button widget.
  ApiCallResponse? resultadoAPI;
  // State field(s) for endereco widget.
  FocusNode? enderecoFocusNode;
  TextEditingController? enderecoController;
  String? Function(BuildContext, String?)? enderecoControllerValidator;
  // State field(s) for numero widget.
  FocusNode? numeroFocusNode;
  TextEditingController? numeroController;
  String? Function(BuildContext, String?)? numeroControllerValidator;
  String? _numeroControllerValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Campo Numero Obrigatório';
    }

    return null;
  }

  // State field(s) for Complemento widget.
  FocusNode? complementoFocusNode;
  TextEditingController? complementoController;
  String? Function(BuildContext, String?)? complementoControllerValidator;
  // State field(s) for Bairro widget.
  FocusNode? bairroFocusNode;
  TextEditingController? bairroController;
  String? Function(BuildContext, String?)? bairroControllerValidator;
  // State field(s) for Cidade widget.
  FocusNode? cidadeFocusNode;
  TextEditingController? cidadeController;
  String? Function(BuildContext, String?)? cidadeControllerValidator;
  // State field(s) for Estado widget.
  FocusNode? estadoFocusNode;
  TextEditingController? estadoController;
  String? Function(BuildContext, String?)? estadoControllerValidator;
  String? _estadoControllerValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Campo Obrigatório';
    }

    return null;
  }

  /// Initialization and disposal methods.

  @override
  void initState(BuildContext context) {
    numeroControllerValidator = _numeroControllerValidator;
    estadoControllerValidator = _estadoControllerValidator;
  }

  @override
  void dispose() {
    expandableController.dispose();
    cepFocusNode?.dispose();
    cepController?.dispose();

    enderecoFocusNode?.dispose();
    enderecoController?.dispose();

    numeroFocusNode?.dispose();
    numeroController?.dispose();

    complementoFocusNode?.dispose();
    complementoController?.dispose();

    bairroFocusNode?.dispose();
    bairroController?.dispose();

    cidadeFocusNode?.dispose();
    cidadeController?.dispose();

    estadoFocusNode?.dispose();
    estadoController?.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.

  Future waitForRequestCompleted({
    double minWait = 0,
    double maxWait = double.infinity,
  }) async {
    final stopwatch = Stopwatch()..start();
    while (true) {
      await Future.delayed(const Duration(milliseconds: 50));
      final timeElapsed = stopwatch.elapsedMilliseconds;
      final requestComplete = requestCompleter?.isCompleted ?? false;
      if (timeElapsed > maxWait || (requestComplete && timeElapsed > minWait)) {
        break;
      }
    }
  }
}
