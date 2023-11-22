import '/auth/supabase_auth/auth_util.dart';
import '/backend/api_requests/api_calls.dart';
import '/backend/schema/structs/index.dart';
import '/backend/supabase/supabase.dart';
import '/componets/definir_pagamento/definir_pagamento_widget.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import '/flutter_flow/random_data_util.dart' as random_data;
import 'package:badges/badges.dart' as badges;
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'meucarrinho_model.dart';
export 'meucarrinho_model.dart';

class MeucarrinhoWidget extends StatefulWidget {
  const MeucarrinhoWidget({Key? key}) : super(key: key);

  @override
  _MeucarrinhoWidgetState createState() => _MeucarrinhoWidgetState();
}

class _MeucarrinhoWidgetState extends State<MeucarrinhoWidget>
    with TickerProviderStateMixin {
  late MeucarrinhoModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();
  var hasColumnTriggered = false;
  final animationsMap = {
    'rowOnPageLoadAnimation1': AnimationInfo(
      trigger: AnimationTrigger.onPageLoad,
      effects: [
        FadeEffect(
          curve: Curves.easeInOut,
          delay: 380.ms,
          duration: 600.ms,
          begin: 0.0,
          end: 1.0,
        ),
      ],
    ),
    'buttonOnPageLoadAnimation': AnimationInfo(
      trigger: AnimationTrigger.onPageLoad,
      effects: [
        FadeEffect(
          curve: Curves.easeInOut,
          delay: 0.ms,
          duration: 600.ms,
          begin: 0.0,
          end: 1.0,
        ),
        MoveEffect(
          curve: Curves.easeInOut,
          delay: 0.ms,
          duration: 600.ms,
          begin: Offset(38.0, 0.0),
          end: Offset(0.0, 0.0),
        ),
      ],
    ),
    'columnOnPageLoadAnimation': AnimationInfo(
      trigger: AnimationTrigger.onPageLoad,
      applyInitialState: false,
      effects: [
        FadeEffect(
          curve: Curves.easeInOut,
          delay: 0.ms,
          duration: 600.ms,
          begin: 0.0,
          end: 1.0,
        ),
        MoveEffect(
          curve: Curves.easeInOut,
          delay: 0.ms,
          duration: 600.ms,
          begin: Offset(62.0, 0.0),
          end: Offset(0.0, 0.0),
        ),
      ],
    ),
    'columnOnActionTriggerAnimation': AnimationInfo(
      trigger: AnimationTrigger.onActionTrigger,
      applyInitialState: false,
      effects: [
        FadeEffect(
          curve: Curves.easeInOut,
          delay: 0.ms,
          duration: 600.ms,
          begin: 0.0,
          end: 1.0,
        ),
        MoveEffect(
          curve: Curves.easeInOut,
          delay: 0.ms,
          duration: 600.ms,
          begin: Offset(-63.0, 0.0),
          end: Offset(0.0, 0.0),
        ),
      ],
    ),
    'rowOnPageLoadAnimation2': AnimationInfo(
      trigger: AnimationTrigger.onPageLoad,
      effects: [
        FadeEffect(
          curve: Curves.easeInOut,
          delay: 0.ms,
          duration: 600.ms,
          begin: 0.0,
          end: 1.0,
        ),
        ShakeEffect(
          curve: Curves.easeInOut,
          delay: 150.ms,
          duration: 1000.ms,
          hz: 10,
          offset: Offset(0.0, 0.0),
          rotation: 0.087,
        ),
      ],
    ),
    'rowOnPageLoadAnimation3': AnimationInfo(
      trigger: AnimationTrigger.onPageLoad,
      effects: [
        FadeEffect(
          curve: Curves.easeInOut,
          delay: 0.ms,
          duration: 600.ms,
          begin: 0.0,
          end: 1.0,
        ),
        ShakeEffect(
          curve: Curves.easeInOut,
          delay: 150.ms,
          duration: 1000.ms,
          hz: 10,
          offset: Offset(0.0, 0.0),
          rotation: 0.087,
        ),
      ],
    ),
    'rowOnPageLoadAnimation4': AnimationInfo(
      trigger: AnimationTrigger.onPageLoad,
      effects: [
        FadeEffect(
          curve: Curves.easeInOut,
          delay: 0.ms,
          duration: 600.ms,
          begin: 0.0,
          end: 1.0,
        ),
        ShakeEffect(
          curve: Curves.easeInOut,
          delay: 150.ms,
          duration: 1000.ms,
          hz: 10,
          offset: Offset(0.0, 0.0),
          rotation: 0.087,
        ),
      ],
    ),
    'stackOnPageLoadAnimation': AnimationInfo(
      trigger: AnimationTrigger.onPageLoad,
      effects: [
        RotateEffect(
          curve: Curves.elasticOut,
          delay: 0.ms,
          duration: 1530.ms,
          begin: 1.0,
          end: 0.0,
        ),
      ],
    ),
    'textOnPageLoadAnimation': AnimationInfo(
      trigger: AnimationTrigger.onPageLoad,
      effects: [
        FadeEffect(
          curve: Curves.easeInOut,
          delay: 0.ms,
          duration: 630.ms,
          begin: 0.0,
          end: 1.0,
        ),
        MoveEffect(
          curve: Curves.easeInOut,
          delay: 0.ms,
          duration: 210.ms,
          begin: Offset(0.0, -22.0),
          end: Offset(0.0, 0.0),
        ),
      ],
    ),
  };

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => MeucarrinhoModel());

    setupAnimations(
      animationsMap.values.where((anim) =>
          anim.trigger == AnimationTrigger.onActionTrigger ||
          !anim.applyInitialState),
      this,
    );

    SchedulerBinding.instance.addPostFrameCallback((_) {
      animationsMap['columnOnPageLoadAnimation']!.controller.forward(from: 0.0);
    });
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
        appBar: AppBar(
          backgroundColor: FlutterFlowTheme.of(context).secondaryBackground,
          iconTheme:
              IconThemeData(color: FlutterFlowTheme.of(context).primaryText),
          automaticallyImplyLeading: false,
          title: Text(
            'Meu Carrinho',
            style: FlutterFlowTheme.of(context).bodyMedium.override(
                  fontFamily: 'Roboto',
                  fontSize: 30.0,
                  fontWeight: FontWeight.w500,
                ),
          ).animateOnPageLoad(animationsMap['textOnPageLoadAnimation']!),
          actions: [],
          centerTitle: true,
          elevation: 0.0,
        ),
        body: Column(
          mainAxisSize: MainAxisSize.max,
          children: [
            Expanded(
              child: Card(
                clipBehavior: Clip.antiAliasWithSaveLayer,
                color: FlutterFlowTheme.of(context).secondaryBackground,
                elevation: 4.0,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8.0),
                ),
                child: SingleChildScrollView(
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(
                            10.0, 0.0, 10.0, 10.0),
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            if (FFAppState().NumCarrinho != 0)
                              Text(
                                'Finalizar Pedido!',
                                style: FlutterFlowTheme.of(context)
                                    .bodyMedium
                                    .override(
                                      fontFamily: 'Readex Pro',
                                      fontSize: 21.0,
                                    ),
                              ),
                            if (FFAppState().NumCarrinho == 0)
                              Text(
                                'Carrinho Vazio!',
                                style: FlutterFlowTheme.of(context)
                                    .bodyMedium
                                    .override(
                                      fontFamily: 'Readex Pro',
                                      fontSize: 21.0,
                                    ),
                              ),
                          ],
                        ).animateOnPageLoad(
                            animationsMap['rowOnPageLoadAnimation1']!),
                      ),
                      if (FFAppState().NumCarrinho != 0)
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              10.0, 0.0, 10.0, 0.0),
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              FFButtonWidget(
                                onPressed: () async {
                                  setState(() {
                                    FFAppState().NumCarrinho = 0;
                                    FFAppState().pedidosCar = [];
                                    FFAppState().TotalPrice = 0;
                                  });
                                },
                                text: 'Limpar',
                                options: FFButtonOptions(
                                  height: 40.0,
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      10.0, 0.0, 10.0, 0.0),
                                  iconPadding: EdgeInsetsDirectional.fromSTEB(
                                      0.0, 0.0, 0.0, 0.0),
                                  color: Color(0xFFE13C27),
                                  textStyle: FlutterFlowTheme.of(context)
                                      .titleSmall
                                      .override(
                                        fontFamily: 'Readex Pro',
                                        color: Colors.white,
                                        fontSize: 15.0,
                                      ),
                                  elevation: 3.0,
                                  borderSide: BorderSide(
                                    color: Colors.transparent,
                                    width: 1.0,
                                  ),
                                  borderRadius: BorderRadius.circular(8.0),
                                ),
                              ).animateOnPageLoad(
                                  animationsMap['buttonOnPageLoadAnimation']!),
                            ],
                          ),
                        ),
                      Builder(
                        builder: (context) {
                          final pedidos = FFAppState().pedidosCar.toList();
                          return ListView.builder(
                            padding: EdgeInsets.zero,
                            primary: false,
                            shrinkWrap: true,
                            scrollDirection: Axis.vertical,
                            itemCount: pedidos.length,
                            itemBuilder: (context, pedidosIndex) {
                              final pedidosItem = pedidos[pedidosIndex];
                              return Column(
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        10.0, 10.0, 10.0, 10.0),
                                    child: Material(
                                      color: Colors.transparent,
                                      elevation: 6.0,
                                      shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(12.0),
                                      ),
                                      child: Container(
                                        width: double.infinity,
                                        decoration: BoxDecoration(
                                          color: FlutterFlowTheme.of(context)
                                              .primaryBackground,
                                          borderRadius:
                                              BorderRadius.circular(12.0),
                                        ),
                                        child: Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  10.0, 10.0, 10.0, 10.0),
                                          child: Row(
                                            mainAxisSize: MainAxisSize.max,
                                            children: [
                                              ClipRRect(
                                                borderRadius:
                                                    BorderRadius.circular(12.0),
                                                child: Image.network(
                                                  pedidosItem.img,
                                                  width: 70.0,
                                                  height: 90.0,
                                                  fit: BoxFit.cover,
                                                ),
                                              ),
                                              Flexible(
                                                child: Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(
                                                          6.0, 0.0, 0.0, 0.0),
                                                  child: Column(
                                                    mainAxisSize:
                                                        MainAxisSize.max,
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    children: [
                                                      Padding(
                                                        padding:
                                                            EdgeInsetsDirectional
                                                                .fromSTEB(
                                                                    0.0,
                                                                    0.0,
                                                                    0.0,
                                                                    6.0),
                                                        child: Row(
                                                          mainAxisSize:
                                                              MainAxisSize.max,
                                                          children: [
                                                            Expanded(
                                                              child: Padding(
                                                                padding:
                                                                    EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            6.0,
                                                                            0.0,
                                                                            4.0,
                                                                            0.0),
                                                                child: Text(
                                                                  pedidosItem
                                                                      .nomeProduto,
                                                                  style: FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyMedium
                                                                      .override(
                                                                        fontFamily:
                                                                            'Readex Pro',
                                                                        fontSize:
                                                                            18.0,
                                                                      ),
                                                                ),
                                                              ),
                                                            ),
                                                          ],
                                                        ),
                                                      ),
                                                      Padding(
                                                        padding:
                                                            EdgeInsetsDirectional
                                                                .fromSTEB(
                                                                    6.0,
                                                                    0.0,
                                                                    0.0,
                                                                    6.0),
                                                        child: Column(
                                                          mainAxisSize:
                                                              MainAxisSize.max,
                                                          crossAxisAlignment:
                                                              CrossAxisAlignment
                                                                  .start,
                                                          children: [
                                                            Row(
                                                              mainAxisSize:
                                                                  MainAxisSize
                                                                      .max,
                                                              children: [
                                                                Text(
                                                                  formatNumber(
                                                                    pedidosItem
                                                                            .precoTotal *
                                                                        pedidosItem
                                                                            .quanty,
                                                                    formatType:
                                                                        FormatType
                                                                            .custom,
                                                                    currency:
                                                                        'R\$',
                                                                    format:
                                                                        '0.00',
                                                                    locale:
                                                                        'pt_BR',
                                                                  ),
                                                                  style: FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyMedium
                                                                      .override(
                                                                        fontFamily:
                                                                            'Readex Pro',
                                                                        color: Color(
                                                                            0xFF10DA26),
                                                                        fontSize:
                                                                            18.0,
                                                                      ),
                                                                ),
                                                                Padding(
                                                                  padding: EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          4.0,
                                                                          0.0,
                                                                          0.0,
                                                                          0.0),
                                                                  child: Text(
                                                                    'X ${pedidosItem.quanty.toString()}',
                                                                    style: FlutterFlowTheme.of(
                                                                            context)
                                                                        .bodyMedium
                                                                        .override(
                                                                          fontFamily:
                                                                              'Readex Pro',
                                                                          color:
                                                                              FlutterFlowTheme.of(context).secondaryText,
                                                                          fontSize:
                                                                              16.0,
                                                                        ),
                                                                  ),
                                                                ),
                                                              ],
                                                            ),
                                                          ],
                                                        ),
                                                      ),
                                                      Padding(
                                                        padding:
                                                            EdgeInsetsDirectional
                                                                .fromSTEB(
                                                                    6.0,
                                                                    0.0,
                                                                    0.0,
                                                                    6.0),
                                                        child: Column(
                                                          mainAxisSize:
                                                              MainAxisSize.max,
                                                          crossAxisAlignment:
                                                              CrossAxisAlignment
                                                                  .start,
                                                          children: [
                                                            Text(
                                                              '${pedidosItem.nomeBorda}',
                                                              style: FlutterFlowTheme
                                                                      .of(context)
                                                                  .bodyMedium
                                                                  .override(
                                                                    fontFamily:
                                                                        'Readex Pro',
                                                                    color: FlutterFlowTheme.of(
                                                                            context)
                                                                        .primaryText,
                                                                    fontSize:
                                                                        15.0,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .w300,
                                                                  ),
                                                            ),
                                                            Row(
                                                              mainAxisSize:
                                                                  MainAxisSize
                                                                      .max,
                                                              children: [
                                                                if (pedidosItem
                                                                        .precoBorda !=
                                                                    0.0)
                                                                  Text(
                                                                    formatNumber(
                                                                      pedidosItem
                                                                              .precoBorda *
                                                                          pedidosItem
                                                                              .quanty,
                                                                      formatType:
                                                                          FormatType
                                                                              .custom,
                                                                      currency:
                                                                          'R\$',
                                                                      format:
                                                                          '0.00',
                                                                      locale:
                                                                          'pt_BR',
                                                                    ),
                                                                    style: FlutterFlowTheme.of(
                                                                            context)
                                                                        .bodyMedium
                                                                        .override(
                                                                          fontFamily:
                                                                              'Readex Pro',
                                                                          color:
                                                                              Color(0xFF10DA26),
                                                                          fontSize:
                                                                              18.0,
                                                                        ),
                                                                  ),
                                                                if (pedidosItem
                                                                        .precoBorda !=
                                                                    0.0)
                                                                  Padding(
                                                                    padding: EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            4.0,
                                                                            0.0,
                                                                            0.0,
                                                                            0.0),
                                                                    child: Text(
                                                                      'X ${pedidosItem.quanty.toString()}',
                                                                      style: FlutterFlowTheme.of(
                                                                              context)
                                                                          .bodyMedium
                                                                          .override(
                                                                            fontFamily:
                                                                                'Readex Pro',
                                                                            color:
                                                                                FlutterFlowTheme.of(context).secondaryText,
                                                                            fontSize:
                                                                                16.0,
                                                                          ),
                                                                    ),
                                                                  ),
                                                              ],
                                                            ),
                                                          ],
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                              ),
                                              Column(
                                                mainAxisSize: MainAxisSize.max,
                                                mainAxisAlignment:
                                                    MainAxisAlignment.center,
                                                children: [
                                                  Container(
                                                    decoration: BoxDecoration(
                                                      color: FlutterFlowTheme
                                                              .of(context)
                                                          .secondaryBackground,
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              6.0),
                                                    ),
                                                    child: Align(
                                                      alignment:
                                                          AlignmentDirectional(
                                                              0.00, 0.00),
                                                      child: Padding(
                                                        padding:
                                                            EdgeInsetsDirectional
                                                                .fromSTEB(
                                                                    6.0,
                                                                    6.0,
                                                                    6.0,
                                                                    6.0),
                                                        child: Column(
                                                          mainAxisSize:
                                                              MainAxisSize.max,
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .center,
                                                          children: [
                                                            InkWell(
                                                              splashColor: Colors
                                                                  .transparent,
                                                              focusColor: Colors
                                                                  .transparent,
                                                              hoverColor: Colors
                                                                  .transparent,
                                                              highlightColor:
                                                                  Colors
                                                                      .transparent,
                                                              onTap: () async {
                                                                if (pedidosItem
                                                                        .quanty !=
                                                                    1) {
                                                                  setState(() {
                                                                    FFAppState()
                                                                        .TotalPrice = FFAppState()
                                                                            .TotalPrice +
                                                                        (-pedidosItem.precoTotal -
                                                                            pedidosItem.precoBorda);
                                                                    FFAppState()
                                                                        .updatePedidosCarAtIndex(
                                                                      pedidosIndex,
                                                                      (e) => e
                                                                        ..incrementQuanty(
                                                                            -1),
                                                                    );
                                                                  });
                                                                } else {
                                                                  return;
                                                                }
                                                              },
                                                              child: FaIcon(
                                                                FontAwesomeIcons
                                                                    .minus,
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .secondaryText,
                                                                size: 25.0,
                                                              ),
                                                            ),
                                                            Text(
                                                              formatNumber(
                                                                pedidosItem
                                                                    .quanty,
                                                                formatType:
                                                                    FormatType
                                                                        .custom,
                                                                format: '',
                                                                locale: '',
                                                              ),
                                                              style: FlutterFlowTheme
                                                                      .of(context)
                                                                  .bodyMedium
                                                                  .override(
                                                                    fontFamily:
                                                                        'Readex Pro',
                                                                    fontSize:
                                                                        23.0,
                                                                  ),
                                                            ),
                                                            InkWell(
                                                              splashColor: Colors
                                                                  .transparent,
                                                              focusColor: Colors
                                                                  .transparent,
                                                              hoverColor: Colors
                                                                  .transparent,
                                                              highlightColor:
                                                                  Colors
                                                                      .transparent,
                                                              onTap: () async {
                                                                setState(() {
                                                                  FFAppState()
                                                                      .updatePedidosCarAtIndex(
                                                                    pedidosIndex,
                                                                    (e) => e
                                                                      ..incrementQuanty(
                                                                          1),
                                                                  );
                                                                  FFAppState()
                                                                      .TotalPrice = FFAppState()
                                                                          .TotalPrice +
                                                                      pedidosItem
                                                                          .precoTotal +
                                                                      pedidosItem
                                                                          .precoBorda;
                                                                });
                                                              },
                                                              child: FaIcon(
                                                                FontAwesomeIcons
                                                                    .plus,
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .secondaryText,
                                                                size: 25.0,
                                                              ),
                                                            ),
                                                          ],
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                  Padding(
                                                    padding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(0.0, 6.0,
                                                                0.0, 0.0),
                                                    child: Row(
                                                      mainAxisSize:
                                                          MainAxisSize.max,
                                                      children: [
                                                        InkWell(
                                                          splashColor: Colors
                                                              .transparent,
                                                          focusColor: Colors
                                                              .transparent,
                                                          hoverColor: Colors
                                                              .transparent,
                                                          highlightColor: Colors
                                                              .transparent,
                                                          onTap: () async {
                                                            setState(() {
                                                              FFAppState()
                                                                  .removeAtIndexFromPedidosCar(
                                                                      pedidosIndex);
                                                              FFAppState()
                                                                      .NumCarrinho =
                                                                  FFAppState()
                                                                          .NumCarrinho +
                                                                      -1;
                                                              FFAppState()
                                                                  .TotalPrice = FFAppState()
                                                                      .TotalPrice +
                                                                  (-pedidosItem
                                                                              .precoTotal -
                                                                          pedidosItem
                                                                              .precoBorda) *
                                                                      (pedidosItem
                                                                          .quanty);
                                                            });
                                                            if (animationsMap[
                                                                    'columnOnActionTriggerAnimation'] !=
                                                                null) {
                                                              animationsMap[
                                                                      'columnOnActionTriggerAnimation']!
                                                                  .controller
                                                                  .reset();
                                                            }
                                                          },
                                                          child: Icon(
                                                            Icons.delete_sweep,
                                                            color: Color(
                                                                0xFFE13C27),
                                                            size: 24.0,
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              )
                                  .animateOnPageLoad(animationsMap[
                                      'columnOnPageLoadAnimation']!)
                                  .animateOnActionTrigger(
                                      animationsMap[
                                          'columnOnActionTriggerAnimation']!,
                                      hasBeenTriggered: hasColumnTriggered);
                            },
                          );
                        },
                      ),
                      if (FFAppState().NumCarrinho != 0)
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              0.0, 30.0, 0.0, 0.0),
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Column(
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  if (FFAppState().statusPAG == 'Nenhum')
                                    Text(
                                      'Escolher Forma de Pagamento',
                                      style: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .override(
                                            fontFamily: 'Readex Pro',
                                            fontSize: 18.0,
                                          ),
                                    ),
                                  if (FFAppState().statusPAG != 'Nenhum')
                                    Text(
                                      'Forma de Pagamento: ${FFAppState().statusPAG}',
                                      style: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .override(
                                            fontFamily: 'Readex Pro',
                                            fontSize: 18.0,
                                          ),
                                    ),
                                ],
                              ),
                              Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    6.0, 0.0, 0.0, 0.0),
                                child: FFButtonWidget(
                                  onPressed: () async {
                                    await showModalBottomSheet(
                                      isScrollControlled: true,
                                      backgroundColor: Colors.transparent,
                                      enableDrag: false,
                                      context: context,
                                      builder: (context) {
                                        return GestureDetector(
                                          onTap: () => _model
                                                  .unfocusNode.canRequestFocus
                                              ? FocusScope.of(context)
                                                  .requestFocus(
                                                      _model.unfocusNode)
                                              : FocusScope.of(context)
                                                  .unfocus(),
                                          child: Padding(
                                            padding: MediaQuery.viewInsetsOf(
                                                context),
                                            child: DefinirPagamentoWidget(),
                                          ),
                                        );
                                      },
                                    ).then((value) => safeSetState(() {}));
                                  },
                                  text: 'Definir',
                                  options: FFButtonOptions(
                                    height: 35.0,
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        10.0, 0.0, 10.0, 0.0),
                                    iconPadding: EdgeInsetsDirectional.fromSTEB(
                                        0.0, 0.0, 0.0, 0.0),
                                    color:
                                        FlutterFlowTheme.of(context).tertiary,
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
                                    borderRadius: BorderRadius.circular(8.0),
                                  ),
                                ),
                              ),
                            ],
                          ).animateOnPageLoad(
                              animationsMap['rowOnPageLoadAnimation2']!),
                        ),
                      if (FFAppState().NumCarrinho == 0)
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              0.0, 30.0, 0.0, 0.0),
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              ClipRRect(
                                borderRadius: BorderRadius.circular(8.0),
                                child: Image.network(
                                  functions.imgdeco(
                                      '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'),
                                  width: 300.0,
                                  height: 300.0,
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ],
                          ).animateOnPageLoad(
                              animationsMap['rowOnPageLoadAnimation3']!),
                        ),
                      if (FFAppState().NumCarrinho == 0)
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              0.0, 30.0, 0.0, 0.0),
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              ClipRRect(
                                borderRadius: BorderRadius.circular(8.0),
                                child: Image.asset(
                                  'assets/images/empty-cart-7359557-6024626.png',
                                  width: 300.0,
                                  height: 300.0,
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ],
                          ).animateOnPageLoad(
                              animationsMap['rowOnPageLoadAnimation4']!),
                        ),
                    ],
                  ),
                ),
              ),
            ),
            if (FFAppState().NumCarrinho != 0)
              Container(
                width: double.infinity,
                height: 74.0,
                decoration: BoxDecoration(
                  color: FlutterFlowTheme.of(context).secondaryBackground,
                ),
                child: Padding(
                  padding:
                      EdgeInsetsDirectional.fromSTEB(10.0, 10.0, 10.0, 10.0),
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Icon(
                            Icons.info_outline,
                            color: FlutterFlowTheme.of(context).secondaryText,
                            size: 24.0,
                          ),
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                8.0, 0.0, 8.0, 0.0),
                            child: Text(
                              formatNumber(
                                FFAppState().TotalPrice,
                                formatType: FormatType.custom,
                                currency: 'R\$',
                                format: '0.00',
                                locale: 'pt_BR',
                              ),
                              style: FlutterFlowTheme.of(context)
                                  .bodyMedium
                                  .override(
                                    fontFamily: 'Readex Pro',
                                    fontSize: 22.0,
                                  ),
                            ),
                          ),
                        ],
                      ),
                      Flexible(
                        child: Container(
                          width: 215.0,
                          height: 100.0,
                          decoration: BoxDecoration(
                            color: Color(0xFF10DA26),
                            borderRadius: BorderRadius.circular(12.0),
                          ),
                          child: FutureBuilder<List<UsersRow>>(
                            future: UsersTable().querySingleRow(
                              queryFn: (q) => q.eq(
                                'user_id',
                                currentUserUid,
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
                              List<UsersRow> buttonUsersRowList =
                                  snapshot.data!;
                              final buttonUsersRow =
                                  buttonUsersRowList.isNotEmpty
                                      ? buttonUsersRowList.first
                                      : null;
                              return FFButtonWidget(
                                onPressed: () async {
                                  if (FFAppState().statusPAG == 'pix') {
                                    _model.resultadoPagPix =
                                        await PixMercadoPagoCall.call(
                                      chavealetoria: random_data.randomString(
                                        10,
                                        12,
                                        false,
                                        false,
                                        true,
                                      ),
                                      productTitle: 'teste produto',
                                      email: currentUserEmail,
                                      firstName: buttonUsersRow?.nome,
                                      lastName: buttonUsersRow?.nome,
                                      amount: 1.0,
                                    );
                                    if ((_model.resultadoPagPix?.succeeded ??
                                        true)) {
                                      await StatusDosPedidosTable().insert({
                                        'created_at': supaSerialize<DateTime>(
                                            getCurrentTimestamp),
                                        'status': 'Não pago',
                                        'user_id': currentUserUid,
                                        'preco_total':
                                            FFAppState().TotalPrice + 10,
                                      });
                                      setState(() {
                                        FFAppState().pagPixRef = PixPagStruct(
                                          chavepix: PixMercadoPagoCall.chavepix(
                                            (_model.resultadoPagPix?.jsonBody ??
                                                ''),
                                          ).toString(),
                                          idPedido: PixMercadoPagoCall.idStutus(
                                            (_model.resultadoPagPix?.jsonBody ??
                                                ''),
                                          ),
                                          qrcode: PixMercadoPagoCall.qrcode(
                                            (_model.resultadoPagPix?.jsonBody ??
                                                ''),
                                          ).toString(),
                                        );
                                      });
                                      await Future.delayed(
                                          const Duration(milliseconds: 2000));

                                      context.pushNamed(
                                        'pagamento',
                                        extra: <String, dynamic>{
                                          kTransitionInfoKey: TransitionInfo(
                                            hasTransition: true,
                                            transitionType:
                                                PageTransitionType.fade,
                                          ),
                                        },
                                      );
                                    } else {
                                      ScaffoldMessenger.of(context)
                                          .showSnackBar(
                                        SnackBar(
                                          content: Text(
                                            'ERRO PIX',
                                            style: TextStyle(
                                              color:
                                                  FlutterFlowTheme.of(context)
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
                                  } else if (FFAppState().statusPAG ==
                                      'cartao') {
                                    await StatusDosPedidosTable().insert({
                                      'created_at': supaSerialize<DateTime>(
                                          getCurrentTimestamp),
                                      'status': 'Não pago',
                                      'user_id': currentUserUid,
                                      'preco_total':
                                          FFAppState().TotalPrice + 10,
                                    });
                                    await Future.delayed(
                                        const Duration(milliseconds: 2000));

                                    context.pushNamed(
                                      'pagamento',
                                      extra: <String, dynamic>{
                                        kTransitionInfoKey: TransitionInfo(
                                          hasTransition: true,
                                          transitionType:
                                              PageTransitionType.fade,
                                        ),
                                      },
                                    );
                                  } else {
                                    ScaffoldMessenger.of(context).showSnackBar(
                                      SnackBar(
                                        content: Text(
                                          'Escolha a forma de pagamento!',
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
                                  }

                                  setState(() {});
                                },
                                text: 'IR PARA PAGAMENTO',
                                options: FFButtonOptions(
                                  height: 40.0,
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      10.0, 0.0, 10.0, 0.0),
                                  iconPadding: EdgeInsetsDirectional.fromSTEB(
                                      0.0, 0.0, 0.0, 0.0),
                                  color: Color(0xFF10DA26),
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
                                  borderRadius: BorderRadius.circular(8.0),
                                ),
                              );
                            },
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            Padding(
              padding: EdgeInsetsDirectional.fromSTEB(10.0, 10.0, 10.0, 10.0),
              child: Material(
                color: Colors.transparent,
                elevation: 20.0,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12.0),
                ),
                child: Container(
                  width: double.infinity,
                  height: 71.0,
                  decoration: BoxDecoration(
                    color: FlutterFlowTheme.of(context).secondaryBackground,
                    borderRadius: BorderRadius.circular(12.0),
                    border: Border.all(
                      color: FlutterFlowTheme.of(context).secondaryText,
                      width: 1.0,
                    ),
                  ),
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      InkWell(
                        splashColor: Colors.transparent,
                        focusColor: Colors.transparent,
                        hoverColor: Colors.transparent,
                        highlightColor: Colors.transparent,
                        onTap: () async {
                          context.goNamed(
                            'HomePage',
                            extra: <String, dynamic>{
                              kTransitionInfoKey: TransitionInfo(
                                hasTransition: true,
                                transitionType: PageTransitionType.fade,
                                duration: Duration(milliseconds: 0),
                              ),
                            },
                          );
                        },
                        child: Icon(
                          Icons.home_rounded,
                          color: FlutterFlowTheme.of(context).secondaryText,
                          size: 45.0,
                        ),
                      ),
                      InkWell(
                        splashColor: Colors.transparent,
                        focusColor: Colors.transparent,
                        hoverColor: Colors.transparent,
                        highlightColor: Colors.transparent,
                        onTap: () async {
                          context.pushNamed(
                            'pesquisa',
                            extra: <String, dynamic>{
                              kTransitionInfoKey: TransitionInfo(
                                hasTransition: true,
                                transitionType: PageTransitionType.fade,
                                duration: Duration(milliseconds: 0),
                              ),
                            },
                          );
                        },
                        child: Icon(
                          Icons.search,
                          color: FlutterFlowTheme.of(context).secondaryText,
                          size: 35.0,
                        ),
                      ),
                      Align(
                        alignment: AlignmentDirectional(0.00, 0.00),
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Align(
                              alignment: AlignmentDirectional(0.00, 0.00),
                              child: Stack(
                                children: [
                                  Align(
                                    alignment: AlignmentDirectional(0.00, 0.00),
                                    child: InkWell(
                                      splashColor: Colors.transparent,
                                      focusColor: Colors.transparent,
                                      hoverColor: Colors.transparent,
                                      highlightColor: Colors.transparent,
                                      onTap: () async {
                                        context.pushNamed(
                                          'meucarrinho',
                                          extra: <String, dynamic>{
                                            kTransitionInfoKey: TransitionInfo(
                                              hasTransition: true,
                                              transitionType:
                                                  PageTransitionType.fade,
                                            ),
                                          },
                                        );
                                      },
                                      child: Icon(
                                        Icons.local_grocery_store,
                                        color: Color(0xFFE46D1F),
                                        size: 40.0,
                                      ),
                                    ),
                                  ),
                                  Align(
                                    alignment:
                                        AlignmentDirectional(1.00, -1.00),
                                    child: Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          30.0, 0.0, 0.0, 0.0),
                                      child: badges.Badge(
                                        badgeContent: Text(
                                          formatNumber(
                                            FFAppState().NumCarrinho,
                                            formatType: FormatType.custom,
                                            format: '',
                                            locale: '',
                                          ),
                                          style: FlutterFlowTheme.of(context)
                                              .titleSmall
                                              .override(
                                                fontFamily: 'Readex Pro',
                                                color: Colors.white,
                                              ),
                                        ),
                                        showBadge: true,
                                        shape: badges.BadgeShape.circle,
                                        badgeColor: Color(0xFF10DA26),
                                        elevation: 4.0,
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            8.0, 8.0, 8.0, 8.0),
                                        position: badges.BadgePosition.topEnd(),
                                        animationType:
                                            badges.BadgeAnimationType.scale,
                                        toAnimate: true,
                                        child: Text(
                                          '1',
                                          style: FlutterFlowTheme.of(context)
                                              .bodyMedium,
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ).animateOnPageLoad(
                                  animationsMap['stackOnPageLoadAnimation']!),
                            ),
                          ],
                        ),
                      ),
                      InkWell(
                        splashColor: Colors.transparent,
                        focusColor: Colors.transparent,
                        hoverColor: Colors.transparent,
                        highlightColor: Colors.transparent,
                        onTap: () async {
                          context.pushNamed(
                            'MeusPedidos',
                            extra: <String, dynamic>{
                              kTransitionInfoKey: TransitionInfo(
                                hasTransition: true,
                                transitionType: PageTransitionType.fade,
                                duration: Duration(milliseconds: 0),
                              ),
                            },
                          );
                        },
                        child: Icon(
                          Icons.history,
                          color: FlutterFlowTheme.of(context).secondaryText,
                          size: 35.0,
                        ),
                      ),
                      InkWell(
                        splashColor: Colors.transparent,
                        focusColor: Colors.transparent,
                        hoverColor: Colors.transparent,
                        highlightColor: Colors.transparent,
                        onTap: () async {
                          context.pushNamed(
                            'Perfil',
                            extra: <String, dynamic>{
                              kTransitionInfoKey: TransitionInfo(
                                hasTransition: true,
                                transitionType: PageTransitionType.fade,
                                duration: Duration(milliseconds: 0),
                              ),
                            },
                          );
                        },
                        child: Icon(
                          Icons.person,
                          color: FlutterFlowTheme.of(context).secondaryText,
                          size: 40.0,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
