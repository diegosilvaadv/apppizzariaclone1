import '/auth/supabase_auth/auth_util.dart';
import '/backend/api_requests/api_calls.dart';
import '/backend/schema/structs/index.dart';
import '/backend/supabase/supabase.dart';
import '/componets/pedidos_finalizados/pedidos_finalizados_widget.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';
import 'pagamento_model.dart';
export 'pagamento_model.dart';

class PagamentoWidget extends StatefulWidget {
  const PagamentoWidget({Key? key}) : super(key: key);

  @override
  _PagamentoWidgetState createState() => _PagamentoWidgetState();
}

class _PagamentoWidgetState extends State<PagamentoWidget> {
  late PagamentoModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => PagamentoModel());

    _model.textController ??=
        TextEditingController(text: FFAppState().pagPixRef.chavepix);
    _model.textFieldFocusNode ??= FocusNode();
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (isiOS) {
      SystemChrome.setSystemUIOverlayStyle(
        SystemUiOverlayStyle(
          statusBarBrightness: Theme.of(context).brightness,
          systemStatusBarContrastEnforced: true,
        ),
      );
    }

    context.watch<FFAppState>();

    return GestureDetector(
      onTap: () => _model.unfocusNode.canRequestFocus
          ? FocusScope.of(context).requestFocus(_model.unfocusNode)
          : FocusScope.of(context).unfocus(),
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: FlutterFlowTheme.of(context).secondaryBackground,
        body: SafeArea(
          top: true,
          child: FutureBuilder<ApiCallResponse>(
            future: (_model.apiRequestCompleter ??= Completer<ApiCallResponse>()
                  ..complete(StatusPixCall.call(
                    idPix: FFAppState().pagPixRef.idPedido,
                  )))
                .future,
            builder: (context, snapshot) {
              // Customize what your widget looks like when it's loading.
              if (!snapshot.hasData) {
                return Center(
                  child: SizedBox(
                    width: 15.0,
                    height: 15.0,
                    child: SpinKitChasingDots(
                      color: Color(0xFFE46D1F),
                      size: 15.0,
                    ),
                  ),
                );
              }
              final columnStatusPixResponse = snapshot.data!;
              return SingleChildScrollView(
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(
                          10.0, 10.0, 10.0, 10.0),
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Realizar Pagamento',
                            style: FlutterFlowTheme.of(context)
                                .bodyMedium
                                .override(
                                  fontFamily: 'Readex Pro',
                                  fontSize: 30.0,
                                  fontWeight: FontWeight.w600,
                                ),
                          ),
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                0.0, 0.0, 10.0, 0.0),
                            child: FlutterFlowIconButton(
                              borderColor:
                                  FlutterFlowTheme.of(context).secondaryText,
                              borderRadius: 20.0,
                              borderWidth: 1.0,
                              buttonSize: 40.0,
                              fillColor: FlutterFlowTheme.of(context)
                                  .primaryBackground,
                              icon: Icon(
                                Icons.close,
                                color: FlutterFlowTheme.of(context).primaryText,
                                size: 24.0,
                              ),
                              onPressed: () {
                                print('IconButton pressed ...');
                              },
                            ),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(10.0, 0.0, 10.0, 10.0),
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Text(
                            'Preencha as informações para concluir seu pedido.',
                            style: FlutterFlowTheme.of(context)
                                .bodyMedium
                                .override(
                                  fontFamily: 'Readex Pro',
                                  fontSize: 15.0,
                                  fontWeight: FontWeight.w300,
                                ),
                          ),
                        ],
                      ),
                    ),
                    Divider(
                      thickness: 1.0,
                      color: FlutterFlowTheme.of(context).secondaryText,
                    ),
                    if (FFAppState().statusPAG == 'pix')
                      Column(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                10.0, 10.0, 10.0, 0.0),
                            child: Row(
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                Text(
                                  'Realizar Pagamento Via cheve Pix',
                                  style: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .override(
                                        fontFamily: 'Readex Pro',
                                        fontSize: 20.0,
                                      ),
                                ),
                              ],
                            ),
                          ),
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                10.0, 10.0, 10.0, 0.0),
                            child: Row(
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                Expanded(
                                  child: Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        8.0, 0.0, 8.0, 0.0),
                                    child: TextFormField(
                                      controller: _model.textController,
                                      focusNode: _model.textFieldFocusNode,
                                      autofocus: true,
                                      readOnly: true,
                                      obscureText: false,
                                      decoration: InputDecoration(
                                        labelText: 'chavePix',
                                        labelStyle: FlutterFlowTheme.of(context)
                                            .labelMedium,
                                        hintStyle: FlutterFlowTheme.of(context)
                                            .labelMedium,
                                        enabledBorder: OutlineInputBorder(
                                          borderSide: BorderSide(
                                            color: FlutterFlowTheme.of(context)
                                                .secondaryText,
                                            width: 1.0,
                                          ),
                                          borderRadius:
                                              BorderRadius.circular(8.0),
                                        ),
                                        focusedBorder: OutlineInputBorder(
                                          borderSide: BorderSide(
                                            color: FlutterFlowTheme.of(context)
                                                .primary,
                                            width: 1.0,
                                          ),
                                          borderRadius:
                                              BorderRadius.circular(8.0),
                                        ),
                                        errorBorder: OutlineInputBorder(
                                          borderSide: BorderSide(
                                            color: FlutterFlowTheme.of(context)
                                                .error,
                                            width: 1.0,
                                          ),
                                          borderRadius:
                                              BorderRadius.circular(8.0),
                                        ),
                                        focusedErrorBorder: OutlineInputBorder(
                                          borderSide: BorderSide(
                                            color: FlutterFlowTheme.of(context)
                                                .error,
                                            width: 1.0,
                                          ),
                                          borderRadius:
                                              BorderRadius.circular(8.0),
                                        ),
                                        filled: true,
                                        fillColor: FlutterFlowTheme.of(context)
                                            .primaryBackground,
                                      ),
                                      style: FlutterFlowTheme.of(context)
                                          .bodyMedium,
                                      maxLines: 3,
                                      validator: _model.textControllerValidator
                                          .asValidator(context),
                                    ),
                                  ),
                                ),
                                InkWell(
                                  splashColor: Colors.transparent,
                                  focusColor: Colors.transparent,
                                  hoverColor: Colors.transparent,
                                  highlightColor: Colors.transparent,
                                  onTap: () async {
                                    await Clipboard.setData(ClipboardData(
                                        text: _model.textController.text));
                                    ScaffoldMessenger.of(context).showSnackBar(
                                      SnackBar(
                                        content: Text(
                                          'Copiado!',
                                          style: TextStyle(
                                            color: FlutterFlowTheme.of(context)
                                                .primaryText,
                                          ),
                                        ),
                                        duration: Duration(milliseconds: 4000),
                                        backgroundColor:
                                            FlutterFlowTheme.of(context)
                                                .secondary,
                                      ),
                                    );
                                  },
                                  child: Icon(
                                    Icons.content_copy,
                                    color: FlutterFlowTheme.of(context)
                                        .secondaryText,
                                    size: 35.0,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                10.0, 10.0, 10.0, 0.0),
                            child: Row(
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                ClipRRect(
                                  borderRadius: BorderRadius.circular(8.0),
                                  child: Image.network(
                                    'data:image/png;base64, iVBORw0KGgoAAAANSUhEUgAABWQAAAVkAQAAAAB79iscAAANh0lEQVR4Xu3XUZIcOwqF4drB3f8uvYOaMAcSBMrqiZjW3E77Pw9lISH0Zb/59X5Qfr36zk8O2nNBey5ozwXtuaA9F7TngvZc0J4L2nNBey5ozwXtuaA9F7TngvZc0J4L2nNBey5ozwXtuaA9F7TngvZc0J4L2nNBey5ozwXtuaA9F7TngvZc0J4L2nNBey5ozwXtuaA9F7TngvZcqvbV88/vvfj53fvKn9biB5alb/zYQ3btdY2KAXlQY6c++Vpu24YHLVq0aNGiRYvW24YHLVq0aH+oNvdb2Wa+rmdjXK7qB91+bqRdq83ZgjZWaCNo0Spo0Spo0Spo0Spo0SoP1+b9bGtQSz5bb+RBvj2bxzfPd1vpQYtWQYtWQYtWQYtWQYtWQYtW+QO1Cdg9237y0yo53Tkvp9gq+z4wruXnNrRo1YYWrdrQolUbWrRqQ4tWbWjRqu0R2vpOPLGT1VVmmbL7tJxnsWLHuPqu5bYNLVq0aMc7PgntNc9ixY5x9V3LbRtatGjRjnd8EtprnsWKHePqu5bbNrR/rbaVdcguOTjLmGI74+6uJT/X9ibDgxatghatghatghatghatghat8mRtSwz+f/9MBtrv+pkMtN/1Mxlov+tnMtB+189koP2un8lA+10/k4H2u34mA+13/UwG2u/6mYzHaz/k1/XfwduZljjNZl+91gGROjlaPgQtWgUtWgUtWgUtWgUtWgUtWuXJ2l85x+N7N0a75Kjl2V28JebVJ2PAWNm82nwtrepB+0JrQftCa0H7QmtB+0JrQftCa0H7Qmv5udraEdPraplUyyXVPd/2A+uz7E4bI4MWrYIWrYIWrYIWrYIWrYIWrfJkbcY82bsAdtPrj11r3xdDc9T40nYaqa+htWto0eoaWrS6hhatrqFFq2to0eoa2gdrR5YXB/m1ouLGtV6+3rJ8kCWbx/fFULR541qjRetxUQZtBi1aBS1aBS1aBS1a5YdrA+XJ6YunfUHN8lh70Rr2A7JvmbL5Y1xLq9CiVYUWrSq0aFWhRasKLVpVaNGqeo7Wx2Xsgh2kIlJbkhcHtW9+UBb5Rs5ro9bTXI8OtGgVtGgVtGgVtGgVtGgVtGiVH661thwXRj+NvdbSvqW9WFssC2+8Zns5ZTlAizaCFq2CFq2CFq2CFq2CFq3yZK212Sqhy9utefdYTQyoby/Zf9o8veblbO+wFdpN0KJV0KJV0KJV0KJV0KJV0P5I7bUVWYy554Bobte8fI+vb2X7gtoXPD9Ci1ZBi1ZBi1ZBi1ZBi1ZBi1b5E7R52MY5ysp4NvvG3nKj/YwWVywt7TSDdrkxKGjRokW7G4C2XkUbCrRxuvSNveXGoKBFixbtbsD/qrV490Jpp77OwTflB2PuLZ87Ti0pQBvl7u2xh3Y59fXktXL39thDu5z6evJauXt77KFdTn09ea3cvT320C6nvp68Vu7eHntol1NfT14rd2+PPbTLqa8nr5W7t8ce2uXU15PXyt3bYw/tcurryWvl7u2x95dodzy/H2lDxmNxYxy0KTlguTY+zZrRLs+OA7RodYAWrQ7QotUBWrQ6QItWB2gfp/VVJnlR1pb8vnjHV7M5yfWgyeY1tGh7iRZtBC1aBS1aBS1aBS1a5bnafKcOtjJPd/jkLXvthk953+E/3fCg/fJtL9HmLbQqv7zhQfvl216izVtoVX55w4P2y7e9RJu30Kr88oYH7Zdve4k2b/007bu2+a3Gs9MYnC/uyTGvApa7+UZm/AnyFK0FLVoFLVoFLVoFLVoFLVoF7aO1TRGUvGX/+t4CaF+VI30j8a1v+dx6w05b0EZLu9uueR9aC1q0Clq0Clq0Clq0Clq0ys/S+iQbvAC8tERLbba7Ob0BYlT7E+zfuB3qN3KNFq2CFq2CFq2CFq2CFq2CFq3yNG3eWu7XloRGElD3lrJpaznz4RSt7S0lWn8HLVq9gxat3kGLVu+gRat30KLVOw/RJrR6YpUtlbfD20Hc3ZfLKm56/Gj+qdD6Qdzdl2iXVbagLfEjtGgVtGgVtGgVtGgVtP+e1rutI1DNXZsDusPXx9r3RXYHWWbqu2jRKmjRKmjRKmjRKmjRKmjRKk/WpmyJn96kns4BbXL9jEiWy03vQ+vrOaBNRtvipzepp3NAm4y2xU9vUk/ngDYZbYuf3qSezgFtMtoWP71JPZ0D2mS0LX56k3o6B7TJaFv89Cb1dA5ok9G2+OlN6ukc0CajbfHTm9TTOaBN/su1S8ftO76yvTy1tLttXsRu7IdGn7dk0KJV0KJV0KJV0KJV0KJV0KJVnqu9tnQ/oQNgkyLVvfDqgJiSozK7lt0XoB0/GbRorylox2Nor+xa0ObeuIYWbf/JoEV7TUE7HkN7ZdfyX2vfa28OiZXLXk72VeyNd35dp8vdzGjJuy1o0Spo0Spo0Spo0Spo0Spo0SpP1uatJbu9Nth2Rt/N2/UzlnKfvIv2piWDNrPbQ3sTtK9NH9oM2qslgzaz20N7E7SvTR/aDNqrJfNXamfaJF/lY1la84wfhaz15Z4fLJPbNbQtfoR2Bi1aBS1aBS1aBS1aBS1a5RnaUPjU9NyOW/BOiY9sH5TX8vTqVJmpJVq0Clq0Clq0Clq0Clq0Clq0ypO17e33Oi4VdpDuvNGuxd1MHRUDcujuT4AWbZyiRYu23ECLFi3aegMtWrR/mjavtiFe3rZEmcnm+qVt1HSPoI0yg/ZaWqVYkavxxK4lygzaa2mVYkWuxhO7ligzaK+lVYoVuRpP7FqizKC9llYpVuRqPLFriTKD9lpapViRq/HEriXKDNpraZViRa7GE7uWKDNor6VVihW5Gk/sWqLMoL2WVilW5Go8sWuJMoP2Wir1fpZL6juWheLXsozmzAqI02VoHYU2DvxalmgjaNWSQVvLJWjLaoxCGwd+LUu0EbRqyaCt5RK0ZTVGoY0Dv5YlWq9KRx1i96OlfZDlv/q+zOTlgf3rw9qXokUb5bW0Ci1aVWjRqkKLVhVatKrQolX1HG27VQ+WIbflfvW63rbmzPKGx/5e+QdCuzOiRdtXL7QfJt3yWrlfvdB+mHTLa+V+9UL7YdItr5X71Qvth0m3vFbuVy+0Hybd8lq5X73Qfph0y2vlfvVC+2HSLa+V+9XrtDbLdtUP7H5O2rVkufS1AeN0DkU7WrJE+0Y7AW3AOJ1D0Y6WLNG+0U5AGzBO51C0oyVLtG+0E9AGjNM5FO1oyRLt+2na+myW/1xvvzerW0omDqonplhWT5xGc/ahRZuna7VMQtvfeKNFG0FrO2OF9pqMFi1atNcp2n9T61uRplie8MzvG++kcfmMeGSN/W3ix/vqt1zL3CpX0SrxyBq0GbRoFbRoFbRoFbRoFbRolX9Pa+3jxeax5BfEB2WyZfdiuzE+Y34a2ky27F5Ei3ZZoUWLFm1doUWLFm1doX2C1lb/eNmS0HYtb9SW+eGVsitzno2yEi1alWjRqkSLViVatCrRolWJFq3KP0FbZ2b5rh4v6/0+M98ZWebt79o3L9/iRxa0aBW0aBW0aBW0aBW0aBW0aJUna5e4MaFxfxxk7DSaLfXZtveuMj+IvVZ60KJV0KJV0KJV0KJV0KJV0KJVnqzNIdH7gZeKuJEttbn1xYC6Wq6Nb0a7tNRmtF6hRasKLVpVaNGqQotWFVq0qp6kfd9dsCylt2e5rK5xQvnRhOZDftdOW9CiVdCiVdCiVdCiVdCiVdCiVf4EbR38qgCPnSY5Vu0LKiqu1b5linfG6Zjcghatghatghatghatghatghat8lytxZ9Y3tklx+0OEuW7saoyu7v8gdq1iregRaugRaugRaugRaugRaugRas8V9su+N5SttSZsfKDHGAHlvl9ic+/TW1Gi7Yf+N61RIvW4xPQKmjRKmjRKmjRKmifpbUhViZ0Dqk3lr4RO11WdZRNyZZMDEWLFm0ZjBYtWrR1MFq0aNHWwWj/EO0u2VtvRZmDHbpMr6eW2WLxvqXZitpkQYtWQYtWQYtWQYtWQYtWQYtWea623rKkJ8tlzwFx2jz7n7hW301j61tO0Q4eWttvQXtdq++iRat30aLVu2jR6l20aPUu2p+mzf0oK6XFXrzRWtqAWsZeTbv7qh/kQYtWQYtWQYtWQYtWQYtWQYtWebg2J2XZULt3xoCW+JaKakNbFsv10LVEewUtWgUtWgUtWgUtWgUtWgXtn6NtP/XF9lW7j2zlDp+CHBB7HrRoFbRoFbRoFbRoFbRoFbRolT9Sm7EnIn667PlB+5b4qae2igF1NfEetHaAFq0O0KLVAVq0OkCLVgdo0eoA7dO1rdwPib0s616+bYm9cZCjMsv3eQva3EMbp9cS7e+gbftR+ji0ZVQGbexlWffQxum1RPs7aNt+lD4ObRmVQRt7WdY9tHF6LcuzHmtr73z5bF7z5DcvzfW0espHZsu1dy3R/g7aN1oL2jdaC9o3WgvaN1oL2jdaC9r307Q/P2jPBe25oD0XtOeC9lzQngvac0F7LmjPBe25oD0XtOeC9lzQngvac0F7LmjPBe25oD0XtOeC9lzQngvac0F7LmjPBe25oD0XtOeC9lzQngvac0F7LmjPBe25oD0XtOeC9lzQngvac3mY9j8lazyvLnQJ4QAAAABJRU5ErkJggg==',
                                    width: 300.0,
                                    height: 200.0,
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          if (FFAppState().pagPixRef.status != 'approved')
                            Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  10.0, 20.0, 10.0, 10.0),
                              child: Row(
                                mainAxisSize: MainAxisSize.max,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Container(
                                    decoration: BoxDecoration(
                                      color:
                                          FlutterFlowTheme.of(context).tertiary,
                                      borderRadius: BorderRadius.circular(6.0),
                                    ),
                                    child: Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          20.0, 10.0, 20.0, 10.0),
                                      child: Row(
                                        mainAxisSize: MainAxisSize.max,
                                        children: [
                                          Text(
                                            'Pagamento Pendente',
                                            style: FlutterFlowTheme.of(context)
                                                .bodyMedium
                                                .override(
                                                  fontFamily: 'Readex Pro',
                                                  fontSize: 20.0,
                                                ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                  Align(
                                    alignment: AlignmentDirectional(0.00, 0.00),
                                    child: Lottie.asset(
                                      'assets/lottie_animations/Animation_-_1700667862033.json',
                                      width: MediaQuery.sizeOf(context).width *
                                          0.1,
                                      height:
                                          MediaQuery.sizeOf(context).height *
                                              0.1,
                                      fit: BoxFit.contain,
                                      animate: true,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          if (FFAppState().pagPixRef.status == 'approved')
                            Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  10.0, 20.0, 10.0, 20.0),
                              child: Row(
                                mainAxisSize: MainAxisSize.max,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Container(
                                    decoration: BoxDecoration(
                                      color: Color(0xFF10DA26),
                                      borderRadius: BorderRadius.circular(6.0),
                                    ),
                                    child: Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          20.0, 10.0, 20.0, 10.0),
                                      child: Row(
                                        mainAxisSize: MainAxisSize.max,
                                        children: [
                                          Text(
                                            'Pagamento Rezlizado com Sucesso!',
                                            style: FlutterFlowTheme.of(context)
                                                .bodyMedium
                                                .override(
                                                  fontFamily: 'Readex Pro',
                                                  fontSize: 18.0,
                                                ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                        ],
                      ),
                    Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(
                          10.0, 10.0, 10.0, 10.0),
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                0.0, 0.0, 10.0, 0.0),
                            child: Text(
                              'Preços',
                              style: FlutterFlowTheme.of(context)
                                  .bodyMedium
                                  .override(
                                    fontFamily: 'Readex Pro',
                                    fontSize: 20.0,
                                  ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Builder(
                      builder: (context) {
                        final pedidosCarrinho =
                            FFAppState().pedidosCar.toList();
                        return ListView.builder(
                          padding: EdgeInsets.zero,
                          primary: false,
                          shrinkWrap: true,
                          scrollDirection: Axis.vertical,
                          itemCount: pedidosCarrinho.length,
                          itemBuilder: (context, pedidosCarrinhoIndex) {
                            final pedidosCarrinhoItem =
                                pedidosCarrinho[pedidosCarrinhoIndex];
                            return Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  10.0, 0.0, 10.0, 10.0),
                              child: Container(
                                decoration: BoxDecoration(
                                  color: FlutterFlowTheme.of(context)
                                      .primaryBackground,
                                  borderRadius: BorderRadius.circular(12.0),
                                ),
                                child: Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      6.0, 6.0, 6.0, 6.0),
                                  child: Column(
                                    mainAxisSize: MainAxisSize.max,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            10.0, 0.0, 10.0, 6.0),
                                        child: Row(
                                          mainAxisSize: MainAxisSize.max,
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Expanded(
                                              child: Text(
                                                '${pedidosCarrinhoItem.nomeProduto}',
                                                style: FlutterFlowTheme.of(
                                                        context)
                                                    .bodyMedium
                                                    .override(
                                                      fontFamily: 'Readex Pro',
                                                      color:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .secondaryText,
                                                      fontSize: 16.0,
                                                    ),
                                              ),
                                            ),
                                            Text(
                                              'X ${pedidosCarrinhoItem.quanty.toString()}  ${formatNumber(
                                                pedidosCarrinhoItem.precoTotal,
                                                formatType: FormatType.custom,
                                                currency: 'R\$',
                                                format: '0.00',
                                                locale: 'pt_BR',
                                              )}',
                                              style:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyMedium
                                                      .override(
                                                        fontFamily:
                                                            'Readex Pro',
                                                        fontSize: 15.0,
                                                      ),
                                            ),
                                          ],
                                        ),
                                      ),
                                      Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            10.0, 0.0, 10.0, 10.0),
                                        child: Row(
                                          mainAxisSize: MainAxisSize.max,
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          children: [
                                            Expanded(
                                              child: Text(
                                                '${pedidosCarrinhoItem.nomeBorda}',
                                                style: FlutterFlowTheme.of(
                                                        context)
                                                    .bodyMedium
                                                    .override(
                                                      fontFamily: 'Readex Pro',
                                                      color:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .secondaryText,
                                                      fontSize: 16.0,
                                                    ),
                                              ),
                                            ),
                                            if (pedidosCarrinhoItem
                                                    .precoBorda !=
                                                0.0)
                                              Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        10.0, 0.0, 0.0, 0.0),
                                                child: Text(
                                                  'X ${pedidosCarrinhoItem.quanty.toString()}  ${formatNumber(
                                                    pedidosCarrinhoItem
                                                        .precoBorda,
                                                    formatType:
                                                        FormatType.custom,
                                                    currency: 'R\$',
                                                    format: '0.00',
                                                    locale: 'pt_BR',
                                                  )}',
                                                  style: FlutterFlowTheme.of(
                                                          context)
                                                      .bodyMedium
                                                      .override(
                                                        fontFamily:
                                                            'Readex Pro',
                                                        fontSize: 15.0,
                                                      ),
                                                ),
                                              ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            );
                          },
                        );
                      },
                    ),
                    Divider(
                      thickness: 1.0,
                      color: FlutterFlowTheme.of(context).secondaryText,
                    ),
                    Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(10.0, 0.0, 10.0, 10.0),
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Taxa de entrega',
                            style: FlutterFlowTheme.of(context)
                                .bodyMedium
                                .override(
                                  fontFamily: 'Readex Pro',
                                  color: FlutterFlowTheme.of(context)
                                      .secondaryText,
                                  fontSize: 16.0,
                                ),
                          ),
                          Text(
                            'R\$10,00',
                            style: FlutterFlowTheme.of(context)
                                .bodyMedium
                                .override(
                                  fontFamily: 'Readex Pro',
                                  fontSize: 15.0,
                                ),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(
                          10.0, 20.0, 10.0, 10.0),
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    0.0, 0.0, 10.0, 0.0),
                                child: Icon(
                                  Icons.info_outline,
                                  color: FlutterFlowTheme.of(context)
                                      .secondaryText,
                                  size: 24.0,
                                ),
                              ),
                              Text(
                                'Total',
                                style: FlutterFlowTheme.of(context)
                                    .bodyMedium
                                    .override(
                                      fontFamily: 'Readex Pro',
                                      color: FlutterFlowTheme.of(context)
                                          .primaryText,
                                      fontSize: 25.0,
                                    ),
                              ),
                            ],
                          ),
                          Text(
                            formatNumber(
                              FFAppState().TotalPrice + 10,
                              formatType: FormatType.custom,
                              currency: 'R\$',
                              format: '0.00',
                              locale: 'pt_BR',
                            ),
                            style: FlutterFlowTheme.of(context)
                                .bodyMedium
                                .override(
                                  fontFamily: 'Readex Pro',
                                  fontSize: 25.0,
                                  fontWeight: FontWeight.w500,
                                ),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(
                          20.0, 20.0, 20.0, 20.0),
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Column(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    0.0, 10.0, 0.0, 0.0),
                                child: FutureBuilder<List<StatusDosPedidosRow>>(
                                  future:
                                      StatusDosPedidosTable().querySingleRow(
                                    queryFn: (q) => q
                                        .eq(
                                          'user_id',
                                          currentUserUid,
                                        )
                                        .eq(
                                          'status',
                                          'Não pago',
                                        ),
                                  ),
                                  builder: (context, snapshot) {
                                    // Customize what your widget looks like when it's loading.
                                    if (!snapshot.hasData) {
                                      return Center(
                                        child: SizedBox(
                                          width: 15.0,
                                          height: 15.0,
                                          child: SpinKitChasingDots(
                                            color: Color(0xFFE46D1F),
                                            size: 15.0,
                                          ),
                                        ),
                                      );
                                    }
                                    List<StatusDosPedidosRow>
                                        buttonStatusDosPedidosRowList =
                                        snapshot.data!;
                                    final buttonStatusDosPedidosRow =
                                        buttonStatusDosPedidosRowList.isNotEmpty
                                            ? buttonStatusDosPedidosRowList
                                                .first
                                            : null;
                                    return FFButtonWidget(
                                      onPressed: () async {
                                        setState(() =>
                                            _model.apiRequestCompleter = null);
                                        await _model
                                            .waitForApiRequestCompleted();
                                        setState(() {
                                          FFAppState().updatePagPixRefStruct(
                                            (e) => e
                                              ..status = StatusPixCall.status(
                                                columnStatusPixResponse
                                                    .jsonBody,
                                              ).toString(),
                                          );
                                        });
                                        await Future.delayed(
                                            const Duration(milliseconds: 3000));
                                        if (FFAppState().pagPixRef.status ==
                                            'approved') {
                                          if (FFAppState().pedidosCar.length >=
                                              1) {
                                            await StatusDosPedidosTable()
                                                .update(
                                              data: {
                                                'status': 'Preparando',
                                              },
                                              matchingRows: (rows) => rows
                                                  .eq(
                                                    'user_id',
                                                    currentUserUid,
                                                  )
                                                  .eq(
                                                    'status',
                                                    'Não pago',
                                                  ),
                                            );
                                            setState(() {
                                              FFAppState().contador = -1;
                                            });
                                            while (FFAppState().contador <=
                                                FFAppState()
                                                    .pedidosCar
                                                    .length) {
                                              setState(() {
                                                FFAppState().contador =
                                                    FFAppState().contador + 1;
                                              });
                                              await PedidosTable().insert({
                                                'created_at':
                                                    supaSerialize<DateTime>(
                                                        getCurrentTimestamp),
                                                'numero_ped':
                                                    buttonStatusDosPedidosRow
                                                        ?.id,
                                                'nome_produto': FFAppState()
                                                    .pedidosCar[
                                                        FFAppState().contador]
                                                    .nomeProduto,
                                                'preco_produto': FFAppState()
                                                    .pedidosCar[
                                                        FFAppState().contador]
                                                    .precoTotal,
                                                'img': FFAppState()
                                                    .pedidosCar[
                                                        FFAppState().contador]
                                                    .img,
                                                'quanty': FFAppState()
                                                    .pedidosCar[
                                                        FFAppState().contador]
                                                    .quanty,
                                                'nome_borda': FFAppState()
                                                    .pedidosCar[
                                                        FFAppState().contador]
                                                    .nomeBorda,
                                                'preco_borda': FFAppState()
                                                    .pedidosCar[
                                                        FFAppState().contador]
                                                    .precoBorda,
                                                'user_id': currentUserUid,
                                                'massa gratis': FFAppState()
                                                    .pedidosCar[
                                                        FFAppState().contador]
                                                    .massaGratis,
                                              });
                                              showModalBottomSheet(
                                                isScrollControlled: true,
                                                backgroundColor:
                                                    Colors.transparent,
                                                enableDrag: false,
                                                context: context,
                                                builder: (context) {
                                                  return GestureDetector(
                                                    onTap: () => _model
                                                            .unfocusNode
                                                            .canRequestFocus
                                                        ? FocusScope.of(context)
                                                            .requestFocus(_model
                                                                .unfocusNode)
                                                        : FocusScope.of(context)
                                                            .unfocus(),
                                                    child: Padding(
                                                      padding: MediaQuery
                                                          .viewInsetsOf(
                                                              context),
                                                      child:
                                                          PedidosFinalizadosWidget(),
                                                    ),
                                                  );
                                                },
                                              ).then((value) =>
                                                  safeSetState(() {}));
                                            }
                                          } else {
                                            return;
                                          }
                                        } else {
                                          ScaffoldMessenger.of(context)
                                              .showSnackBar(
                                            SnackBar(
                                              content: Text(
                                                'Pagamento ainda não processado!',
                                                style: TextStyle(
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .primaryText,
                                                ),
                                              ),
                                              duration:
                                                  Duration(milliseconds: 4000),
                                              backgroundColor:
                                                  FlutterFlowTheme.of(context)
                                                      .secondary,
                                            ),
                                          );
                                        }
                                      },
                                      text: 'Atualizar Pagamento',
                                      options: FFButtonOptions(
                                        height: 40.0,
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            24.0, 0.0, 24.0, 0.0),
                                        iconPadding:
                                            EdgeInsetsDirectional.fromSTEB(
                                                0.0, 0.0, 0.0, 0.0),
                                        color: FlutterFlowTheme.of(context)
                                            .tertiary,
                                        textStyle: FlutterFlowTheme.of(context)
                                            .titleSmall
                                            .override(
                                              fontFamily: 'Readex Pro',
                                              color: Colors.white,
                                            ),
                                        elevation: 3.0,
                                        borderSide: BorderSide(
                                          color: Colors.transparent,
                                          width: 1.0,
                                        ),
                                        borderRadius:
                                            BorderRadius.circular(8.0),
                                      ),
                                    );
                                  },
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
