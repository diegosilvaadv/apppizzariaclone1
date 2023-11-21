import '/auth/supabase_auth/auth_util.dart';
import '/backend/supabase/supabase.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'package:badges/badges.dart' as badges;
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'meus_pedidos_model.dart';
export 'meus_pedidos_model.dart';

class MeusPedidosWidget extends StatefulWidget {
  const MeusPedidosWidget({Key? key}) : super(key: key);

  @override
  _MeusPedidosWidgetState createState() => _MeusPedidosWidgetState();
}

class _MeusPedidosWidgetState extends State<MeusPedidosWidget>
    with TickerProviderStateMixin {
  late MeusPedidosModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  final animationsMap = {
    'rowOnPageLoadAnimation1': AnimationInfo(
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
          begin: Offset(0.0, -53.0),
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
        MoveEffect(
          curve: Curves.easeInOut,
          delay: 0.ms,
          duration: 360.ms,
          begin: Offset(-59.0, 0.0),
          end: Offset(0.0, 0.0),
        ),
      ],
    ),
    'containerOnPageLoadAnimation': AnimationInfo(
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
          duration: 780.ms,
          begin: Offset(-50.0, 0.0),
          end: Offset(0.0, 0.0),
        ),
      ],
    ),
    'iconOnPageLoadAnimation': AnimationInfo(
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
  };

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => MeusPedidosModel());
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
        backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
        body: Column(
          mainAxisSize: MainAxisSize.max,
          children: [
            Padding(
              padding: EdgeInsetsDirectional.fromSTEB(10.0, 30.0, 10.0, 10.0),
              child: Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Meus Pedidos',
                    textAlign: TextAlign.start,
                    style: FlutterFlowTheme.of(context).bodyMedium.override(
                          fontFamily: 'Readex Pro',
                          fontSize: 30.0,
                          fontWeight: FontWeight.w500,
                        ),
                  ),
                ],
              ).animateOnPageLoad(animationsMap['rowOnPageLoadAnimation1']!),
            ),
            Padding(
              padding: EdgeInsetsDirectional.fromSTEB(10.0, 20.0, 10.0, 10.0),
              child: Row(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Text(
                    'Pedidos Pententes',
                    style: FlutterFlowTheme.of(context).bodyMedium.override(
                          fontFamily: 'Readex Pro',
                          fontSize: 19.0,
                        ),
                  ),
                ],
              ).animateOnPageLoad(animationsMap['rowOnPageLoadAnimation2']!),
            ),
            Expanded(
              child: FutureBuilder<List<StatusDosPedidosRow>>(
                future: StatusDosPedidosTable().queryRows(
                  queryFn: (q) => q
                      .eq(
                    'user_id',
                    currentUserUid,
                  )
                      .in_(
                    'status',
                    ['Preparando', 'Entregando'],
                  ).order('created_at'),
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
                  List<StatusDosPedidosRow> listViewStatusDosPedidosRowList =
                      snapshot.data!;
                  return ListView.builder(
                    padding: EdgeInsets.zero,
                    primary: false,
                    scrollDirection: Axis.vertical,
                    itemCount: listViewStatusDosPedidosRowList.length,
                    itemBuilder: (context, listViewIndex) {
                      final listViewStatusDosPedidosRow =
                          listViewStatusDosPedidosRowList[listViewIndex];
                      return Padding(
                        padding:
                            EdgeInsetsDirectional.fromSTEB(6.0, 6.0, 6.0, 6.0),
                        child: Container(
                          width: double.infinity,
                          decoration: BoxDecoration(
                            color: FlutterFlowTheme.of(context)
                                .secondaryBackground,
                            borderRadius: BorderRadius.circular(12.0),
                          ),
                          child: Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                10.0, 10.0, 10.0, 10.0),
                            child: Column(
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                Row(
                                  mainAxisSize: MainAxisSize.max,
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    FFButtonWidget(
                                      onPressed: () {
                                        print('Button pressed ...');
                                      },
                                      text: listViewStatusDosPedidosRow.status!,
                                      options: FFButtonOptions(
                                        height: 40.0,
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            24.0, 0.0, 24.0, 0.0),
                                        iconPadding:
                                            EdgeInsetsDirectional.fromSTEB(
                                                0.0, 0.0, 0.0, 0.0),
                                        color: valueOrDefault<Color>(
                                          () {
                                            if (listViewStatusDosPedidosRow
                                                    .status ==
                                                'Preparando') {
                                              return Color(0xFFE46D1F);
                                            } else if (listViewStatusDosPedidosRow
                                                    .status ==
                                                'Entregando') {
                                              return FlutterFlowTheme.of(
                                                      context)
                                                  .secondary;
                                            } else {
                                              return Color(0xFFE46D1F);
                                            }
                                          }(),
                                          Color(0xFFE46D1F),
                                        ),
                                        textStyle: FlutterFlowTheme.of(context)
                                            .titleSmall
                                            .override(
                                              fontFamily: 'Readex Pro',
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .primaryText,
                                            ),
                                        elevation: 3.0,
                                        borderSide: BorderSide(
                                          color: Colors.transparent,
                                          width: 1.0,
                                        ),
                                        borderRadius:
                                            BorderRadius.circular(8.0),
                                      ),
                                    ),
                                    Flexible(
                                      child: Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            10.0, 0.0, 2.0, 0.0),
                                        child: Text(
                                          dateTimeFormat(
                                              'dd/MM/yyyy | kk:mm',
                                              listViewStatusDosPedidosRow
                                                  .createdAt),
                                          style: FlutterFlowTheme.of(context)
                                              .bodyMedium
                                              .override(
                                                fontFamily: 'Readex Pro',
                                                fontSize: 16.0,
                                              ),
                                        ),
                                      ),
                                    ),
                                    FlutterFlowIconButton(
                                      borderColor: FlutterFlowTheme.of(context)
                                          .secondaryText,
                                      borderRadius: 20.0,
                                      borderWidth: 1.0,
                                      buttonSize: 40.0,
                                      fillColor: FlutterFlowTheme.of(context)
                                          .primaryBackground,
                                      icon: Icon(
                                        Icons.more_vert,
                                        color: FlutterFlowTheme.of(context)
                                            .primaryText,
                                        size: 24.0,
                                      ),
                                      onPressed: () {
                                        print('IconButton pressed ...');
                                      },
                                    ),
                                  ],
                                ),
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      0.0, 0.0, 10.0, 0.0),
                                  child: FutureBuilder<List<PedidosRow>>(
                                    future: PedidosTable().queryRows(
                                      queryFn: (q) => q
                                          .eq(
                                            'numero_ped',
                                            listViewStatusDosPedidosRow.id,
                                          )
                                          .eq(
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
                                      List<PedidosRow> columnPedidosRowList =
                                          snapshot.data!;
                                      return Column(
                                        mainAxisSize: MainAxisSize.max,
                                        children: List.generate(
                                            columnPedidosRowList.length,
                                            (columnIndex) {
                                          final columnPedidosRow =
                                              columnPedidosRowList[columnIndex];
                                          return Column(
                                            mainAxisSize: MainAxisSize.max,
                                            children: [
                                              Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        0.0, 20.0, 0.0, 0.0),
                                                child: Row(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceBetween,
                                                  children: [
                                                    Flexible(
                                                      child: Padding(
                                                        padding:
                                                            EdgeInsetsDirectional
                                                                .fromSTEB(
                                                                    10.0,
                                                                    0.0,
                                                                    0.0,
                                                                    0.0),
                                                        child: Text(
                                                          columnPedidosRow
                                                              .nomeProduto!,
                                                          style: FlutterFlowTheme
                                                                  .of(context)
                                                              .bodyMedium
                                                              .override(
                                                                fontFamily:
                                                                    'Readex Pro',
                                                                fontSize: 16.0,
                                                              ),
                                                        ),
                                                      ),
                                                    ),
                                                    Flexible(
                                                      child: Text(
                                                        '${columnPedidosRow.quanty?.toString()} X ${formatNumber(
                                                          columnPedidosRow
                                                              .precoProduto,
                                                          formatType:
                                                              FormatType.custom,
                                                          currency: 'R\$',
                                                          format: '0.00',
                                                          locale: 'pt_BR',
                                                        )}',
                                                        style: FlutterFlowTheme
                                                                .of(context)
                                                            .bodyMedium
                                                            .override(
                                                              fontFamily:
                                                                  'Readex Pro',
                                                              fontSize: 16.0,
                                                            ),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                              Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        10.0, 6.0, 0.0, 0.0),
                                                child: Row(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceBetween,
                                                  children: [
                                                    Expanded(
                                                      child: Text(
                                                        columnPedidosRow
                                                            .nomeBorda!,
                                                        style: FlutterFlowTheme
                                                                .of(context)
                                                            .bodyMedium
                                                            .override(
                                                              fontFamily:
                                                                  'Readex Pro',
                                                              fontSize: 16.0,
                                                            ),
                                                      ),
                                                    ),
                                                    if (columnPedidosRow
                                                            .massaGratis ==
                                                        true)
                                                      Text(
                                                        'Grátis',
                                                        style: FlutterFlowTheme
                                                                .of(context)
                                                            .bodyMedium
                                                            .override(
                                                              fontFamily:
                                                                  'Readex Pro',
                                                              color: Color(
                                                                  0xFF10DA26),
                                                              fontSize: 16.0,
                                                            ),
                                                      ),
                                                    if (columnPedidosRow
                                                            .precoBorda !=
                                                        0.0)
                                                      Text(
                                                        '${columnPedidosRow.quanty?.toString()}X ${formatNumber(
                                                          columnPedidosRow
                                                              .precoBorda,
                                                          formatType:
                                                              FormatType.custom,
                                                          currency: 'R\$',
                                                          format: '0.00',
                                                          locale: 'pt_BR',
                                                        )}',
                                                        style: FlutterFlowTheme
                                                                .of(context)
                                                            .bodyMedium
                                                            .override(
                                                              fontFamily:
                                                                  'Readex Pro',
                                                              fontSize: 16.0,
                                                            ),
                                                      ),
                                                  ],
                                                ),
                                              ),
                                            ],
                                          );
                                        }),
                                      );
                                    },
                                  ),
                                ),
                                Divider(
                                  thickness: 1.0,
                                  color: FlutterFlowTheme.of(context).accent4,
                                ),
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      0.0, 10.0, 0.0, 6.0),
                                  child: Row(
                                    mainAxisSize: MainAxisSize.max,
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        'Taxa de entrega',
                                        style: FlutterFlowTheme.of(context)
                                            .bodyMedium,
                                      ),
                                      Text(
                                        'R\$ 10,00',
                                        style: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .override(
                                              fontFamily: 'Readex Pro',
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .secondaryText,
                                            ),
                                      ),
                                    ],
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      0.0, 0.0, 6.0, 6.0),
                                  child: Row(
                                    mainAxisSize: MainAxisSize.max,
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        'Numero do Pedido: ${listViewStatusDosPedidosRow.id.toString()}',
                                        style: FlutterFlowTheme.of(context)
                                            .bodyMedium,
                                      ),
                                      Text(
                                        'Total',
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
                                      0.0, 0.0, 6.0, 6.0),
                                  child: Row(
                                    mainAxisSize: MainAxisSize.max,
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    children: [
                                      Text(
                                        formatNumber(
                                          listViewStatusDosPedidosRow
                                              .precoTotal!,
                                          formatType: FormatType.custom,
                                          currency: 'R\$',
                                          format: '0.00',
                                          locale: 'pt_BR',
                                        ),
                                        style: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .override(
                                              fontFamily: 'Readex Pro',
                                              color: Color(0xFF10DA26),
                                              fontSize: 20.0,
                                              fontWeight: FontWeight.bold,
                                            ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ).animateOnPageLoad(
                            animationsMap['containerOnPageLoadAnimation']!),
                      );
                    },
                  );
                },
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
                      color: Color(0xFFE46D1F),
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
                                        transitionType: PageTransitionType.fade,
                                        duration: Duration(milliseconds: 0),
                                      ),
                                    },
                                  );
                                },
                                child: Stack(
                                  children: [
                                    Align(
                                      alignment:
                                          AlignmentDirectional(0.00, 0.00),
                                      child: Icon(
                                        Icons.local_grocery_store,
                                        color: FlutterFlowTheme.of(context)
                                            .secondaryText,
                                        size: 40.0,
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
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  8.0, 8.0, 8.0, 8.0),
                                          position:
                                              badges.BadgePosition.topEnd(),
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
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Icon(
                        Icons.history,
                        color: Color(0xFFE46D1F),
                        size: 35.0,
                      ).animateOnPageLoad(
                          animationsMap['iconOnPageLoadAnimation']!),
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
