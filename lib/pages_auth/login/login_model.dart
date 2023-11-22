import '/auth/supabase_auth/auth_util.dart';
import '/backend/supabase/supabase.dart';
import '/flutter_flow/flutter_flow_button_tabbar.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'login_widget.dart' show LoginWidget;
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class LoginModel extends FlutterFlowModel<LoginWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // State field(s) for TabBar widget.
  TabController? tabBarController;
  int get tabBarCurrentIndex =>
      tabBarController != null ? tabBarController!.index : 0;

  // State field(s) for emaillogin widget.
  FocusNode? emailloginFocusNode;
  TextEditingController? emailloginController;
  String? Function(BuildContext, String?)? emailloginControllerValidator;
  // State field(s) for senhalogin widget.
  FocusNode? senhaloginFocusNode;
  TextEditingController? senhaloginController;
  late bool senhaloginVisibility;
  String? Function(BuildContext, String?)? senhaloginControllerValidator;
  // State field(s) for nome widget.
  FocusNode? nomeFocusNode;
  TextEditingController? nomeController;
  String? Function(BuildContext, String?)? nomeControllerValidator;
  // State field(s) for email widget.
  FocusNode? emailFocusNode;
  TextEditingController? emailController;
  String? Function(BuildContext, String?)? emailControllerValidator;
  // State field(s) for senha widget.
  FocusNode? senhaFocusNode;
  TextEditingController? senhaController;
  late bool senhaVisibility;
  String? Function(BuildContext, String?)? senhaControllerValidator;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {
    senhaloginVisibility = false;
    senhaVisibility = false;
  }

  void dispose() {
    unfocusNode.dispose();
    tabBarController?.dispose();
    emailloginFocusNode?.dispose();
    emailloginController?.dispose();

    senhaloginFocusNode?.dispose();
    senhaloginController?.dispose();

    nomeFocusNode?.dispose();
    nomeController?.dispose();

    emailFocusNode?.dispose();
    emailController?.dispose();

    senhaFocusNode?.dispose();
    senhaController?.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
