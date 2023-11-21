import '/backend/schema/structs/index.dart';
import '/backend/supabase/supabase.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'package:expandable/expandable.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'detalhes_pizzas_model.dart';
export 'detalhes_pizzas_model.dart';

class DetalhesPizzasWidget extends StatefulWidget {
  const DetalhesPizzasWidget({
    Key? key,
    required this.detalhesProdutos,
  }) : super(key: key);

  final ProdutosRow? detalhesProdutos;

  @override
  _DetalhesPizzasWidgetState createState() => _DetalhesPizzasWidgetState();
}

class _DetalhesPizzasWidgetState extends State<DetalhesPizzasWidget> {
  late DetalhesPizzasModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => DetalhesPizzasModel());

    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      setState(() {
        FFAppState().bordasRef = BordasRefStruct.fromSerializableMap(
            jsonDecode('{\"nome_borda\":\"borda\",\"preco_borda\":\"0\"}'));
        FFAppState().quanty = 1;
        FFAppState().Sabores = SaboresRefStruct.fromSerializableMap(jsonDecode(
            '{\"NomeSabor1\":\"nome\",\"NomeSabor2\":\"nome\",\"NomeSabor3\":\"nome\",\"NomeSabor4\":\"nome\",\"PrecoSabor1\":\"0\",\"PrecoSabor2\":\"0\",\"PrecoSabor3\":\"0\",\"PrecoSabor4\":\"0\"}'));
        FFAppState().CondicaoGeral = 0;
        FFAppState().CondicaoBordas = 0;
      });
    });

    _model.expandableController = ExpandableController(initialExpanded: false);
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
                      Container(
                        width: double.infinity,
                        height: 251.0,
                        decoration: BoxDecoration(
                          color:
                              FlutterFlowTheme.of(context).secondaryBackground,
                        ),
                        child: Stack(
                          children: [
                            Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  10.0, 10.0, 10.0, 10.0),
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(8.0),
                                child: Image.network(
                                  widget.detalhesProdutos!.img!,
                                  width: double.infinity,
                                  height: double.infinity,
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                            Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  15.0, 30.0, 15.0, 0.0),
                              child: Row(
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  InkWell(
                                    splashColor: Colors.transparent,
                                    focusColor: Colors.transparent,
                                    hoverColor: Colors.transparent,
                                    highlightColor: Colors.transparent,
                                    onTap: () async {
                                      context.safePop();
                                    },
                                    child: Card(
                                      clipBehavior: Clip.antiAliasWithSaveLayer,
                                      color: FlutterFlowTheme.of(context)
                                          .primaryBackground,
                                      elevation: 4.0,
                                      shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(8.0),
                                      ),
                                      child: Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            6.0, 6.0, 6.0, 6.0),
                                        child: Icon(
                                          Icons.chevron_left,
                                          color: FlutterFlowTheme.of(context)
                                              .primaryText,
                                          size: 24.0,
                                        ),
                                      ),
                                    ),
                                  ),
                                  Expanded(
                                    child: Card(
                                      clipBehavior: Clip.antiAliasWithSaveLayer,
                                      color: FlutterFlowTheme.of(context)
                                          .primaryBackground,
                                      elevation: 4.0,
                                      shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(8.0),
                                      ),
                                      child: Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            8.0, 6.0, 8.0, 6.0),
                                        child: Text(
                                          valueOrDefault<String>(
                                            widget
                                                .detalhesProdutos?.nomeProduto,
                                            'NomeProduto',
                                          ),
                                          style: FlutterFlowTheme.of(context)
                                              .bodyMedium
                                              .override(
                                                fontFamily: 'Readex Pro',
                                                fontSize: 20.0,
                                              ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(
                            10.0, 10.0, 10.0, 10.0),
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Expanded(
                              child: Text(
                                formatNumber(
                                  widget.detalhesProdutos!.valorProduto! / 2,
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
                                      fontWeight: FontWeight.w600,
                                    ),
                              ),
                            ),
                            Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  0.0, 0.0, 10.0, 0.0),
                              child: Text(
                                'Pizza de 8 Pedaços',
                                style: FlutterFlowTheme.of(context)
                                    .bodyMedium
                                    .override(
                                      fontFamily: 'Readex Pro',
                                      fontSize: 16.0,
                                      fontWeight: FontWeight.w500,
                                    ),
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
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Expanded(
                              child: Text(
                                valueOrDefault<String>(
                                  widget.detalhesProdutos?.descricao,
                                  'descricao',
                                ),
                                style: FlutterFlowTheme.of(context)
                                    .bodyMedium
                                    .override(
                                      fontFamily: 'Readex Pro',
                                      fontSize: 16.0,
                                      fontWeight: FontWeight.w300,
                                    ),
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
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Expanded(
                              child: Text(
                                valueOrDefault<String>(
                                  widget.detalhesProdutos?.tag,
                                  'tags',
                                ),
                                style: FlutterFlowTheme.of(context)
                                    .bodyMedium
                                    .override(
                                      fontFamily: 'Readex Pro',
                                      fontSize: 16.0,
                                      fontWeight: FontWeight.w500,
                                      fontStyle: FontStyle.italic,
                                    ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Row(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Expanded(
                            child: Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  10.0, 10.0, 10.0, 10.0),
                              child: Material(
                                color: Colors.transparent,
                                elevation: 6.0,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(12.0),
                                ),
                                child: Container(
                                  width: 100.0,
                                  decoration: BoxDecoration(
                                    color: FlutterFlowTheme.of(context)
                                        .primaryBackground,
                                    borderRadius: BorderRadius.circular(12.0),
                                  ),
                                  child: Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        10.0, 10.0, 10.0, 10.0),
                                    child: Container(
                                      width: double.infinity,
                                      color: Color(0x00FFFFFF),
                                      child: ExpandableNotifier(
                                        controller: _model.expandableController,
                                        child: ExpandablePanel(
                                          header: Row(
                                            mainAxisSize: MainAxisSize.max,
                                            children: [
                                              Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        0.0, 0.0, 6.0, 0.0),
                                                child: Card(
                                                  clipBehavior: Clip
                                                      .antiAliasWithSaveLayer,
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .secondaryBackground,
                                                  elevation: 6.0,
                                                  shape: RoundedRectangleBorder(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            6.0),
                                                  ),
                                                  child: Padding(
                                                    padding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(6.0, 6.0,
                                                                6.0, 6.0),
                                                    child: Icon(
                                                      Icons.local_pizza,
                                                      color:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .secondaryText,
                                                      size: 24.0,
                                                    ),
                                                  ),
                                                ),
                                              ),
                                              Expanded(
                                                child: Text(
                                                  'Preferência de Massa',
                                                  style: FlutterFlowTheme.of(
                                                          context)
                                                      .displaySmall
                                                      .override(
                                                        fontFamily: 'Outfit',
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .primaryText,
                                                        fontSize: 25.0,
                                                      ),
                                                ),
                                              ),
                                            ],
                                          ),
                                          collapsed: Container(),
                                          expanded: Column(
                                            mainAxisSize: MainAxisSize.max,
                                            children: [
                                              if (FFAppState().CondicaoBordas ==
                                                  0)
                                                Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(10.0, 10.0,
                                                          10.0, 10.0),
                                                  child: FutureBuilder<
                                                      List<ProdutosRow>>(
                                                    future: ProdutosTable()
                                                        .queryRows(
                                                      queryFn: (q) => q
                                                          .eq(
                                                            'tag',
                                                            'Bordas',
                                                          )
                                                          .order('id',
                                                              ascending: true),
                                                    ),
                                                    builder:
                                                        (context, snapshot) {
                                                      // Customize what your widget looks like when it's loading.
                                                      if (!snapshot.hasData) {
                                                        return Center(
                                                          child: SizedBox(
                                                            width: 15.0,
                                                            height: 15.0,
                                                            child:
                                                                SpinKitChasingDots(
                                                              color: Color(
                                                                  0xFFE46D1F),
                                                              size: 15.0,
                                                            ),
                                                          ),
                                                        );
                                                      }
                                                      List<ProdutosRow>
                                                          listViewProdutosRowList =
                                                          snapshot.data!;
                                                      return ListView.builder(
                                                        padding:
                                                            EdgeInsets.zero,
                                                        primary: false,
                                                        shrinkWrap: true,
                                                        scrollDirection:
                                                            Axis.vertical,
                                                        itemCount:
                                                            listViewProdutosRowList
                                                                .length,
                                                        itemBuilder: (context,
                                                            listViewIndex) {
                                                          final listViewProdutosRow =
                                                              listViewProdutosRowList[
                                                                  listViewIndex];
                                                          return InkWell(
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
                                                                        .bordasRef =
                                                                    BordasRefStruct(
                                                                  nomeBorda:
                                                                      listViewProdutosRow
                                                                          .nomeProduto,
                                                                  precoBorda:
                                                                      listViewProdutosRow
                                                                          .valorProduto,
                                                                );
                                                                FFAppState()
                                                                        .CondicaoGeral =
                                                                    FFAppState()
                                                                            .CondicaoGeral +
                                                                        1;
                                                                FFAppState()
                                                                        .CondicaoBordas =
                                                                    FFAppState()
                                                                            .CondicaoBordas +
                                                                        1;
                                                              });
                                                            },
                                                            child: Card(
                                                              clipBehavior: Clip
                                                                  .antiAliasWithSaveLayer,
                                                              color: FlutterFlowTheme
                                                                      .of(context)
                                                                  .secondaryBackground,
                                                              elevation: 4.0,
                                                              shape:
                                                                  RoundedRectangleBorder(
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                            8.0),
                                                              ),
                                                              child: Padding(
                                                                padding: EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        10.0,
                                                                        10.0,
                                                                        10.0,
                                                                        10.0),
                                                                child: Column(
                                                                  mainAxisSize:
                                                                      MainAxisSize
                                                                          .max,
                                                                  children: [
                                                                    Row(
                                                                      mainAxisSize:
                                                                          MainAxisSize
                                                                              .max,
                                                                      mainAxisAlignment:
                                                                          MainAxisAlignment
                                                                              .spaceBetween,
                                                                      children: [
                                                                        Text(
                                                                          listViewProdutosRow
                                                                              .nomeProduto!,
                                                                          style: FlutterFlowTheme.of(context)
                                                                              .bodyMedium
                                                                              .override(
                                                                                fontFamily: 'Readex Pro',
                                                                                fontSize: 18.0,
                                                                              ),
                                                                        ),
                                                                        Text(
                                                                          formatNumber(
                                                                            listViewProdutosRow.valorProduto!,
                                                                            formatType:
                                                                                FormatType.custom,
                                                                            currency:
                                                                                'R\$',
                                                                            format:
                                                                                '0.00',
                                                                            locale:
                                                                                'pt_BR',
                                                                          ),
                                                                          style: FlutterFlowTheme.of(context)
                                                                              .bodyMedium
                                                                              .override(
                                                                                fontFamily: 'Readex Pro',
                                                                                color: valueOrDefault<Color>(
                                                                                  () {
                                                                                    if (widget.detalhesProdutos?.valorProduto == 0.0) {
                                                                                      return Color(0xFF10DA26);
                                                                                    } else if (widget.detalhesProdutos?.valorProduto != 0.0) {
                                                                                      return FlutterFlowTheme.of(context).primaryText;
                                                                                    } else {
                                                                                      return FlutterFlowTheme.of(context).primaryText;
                                                                                    }
                                                                                  }(),
                                                                                  FlutterFlowTheme.of(context).primaryText,
                                                                                ),
                                                                                fontSize: 18.0,
                                                                              ),
                                                                        ),
                                                                      ],
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
                                                ),
                                              if (FFAppState().CondicaoBordas !=
                                                  0)
                                                Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(10.0, 10.0,
                                                          10.0, 10.0),
                                                  child: Row(
                                                    mainAxisSize:
                                                        MainAxisSize.max,
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .spaceBetween,
                                                    children: [
                                                      Expanded(
                                                        child: Text(
                                                          FFAppState()
                                                              .bordasRef
                                                              .nomeBorda,
                                                          style: FlutterFlowTheme
                                                                  .of(context)
                                                              .bodyMedium
                                                              .override(
                                                                fontFamily:
                                                                    'Readex Pro',
                                                                fontSize: 18.0,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w500,
                                                              ),
                                                        ),
                                                      ),
                                                      Text(
                                                        formatNumber(
                                                          FFAppState()
                                                              .bordasRef
                                                              .precoBorda,
                                                          formatType:
                                                              FormatType.custom,
                                                          currency: 'R\$',
                                                          format: '0.00',
                                                          locale: 'pt_BR',
                                                        ),
                                                        style: FlutterFlowTheme
                                                                .of(context)
                                                            .bodyMedium
                                                            .override(
                                                              fontFamily:
                                                                  'Readex Pro',
                                                              color: Color(
                                                                  0xFF10DA26),
                                                              fontSize: 20.0,
                                                            ),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                              if (FFAppState().CondicaoBordas !=
                                                  0)
                                                Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(10.0, 10.0,
                                                          10.0, 10.0),
                                                  child: Row(
                                                    mainAxisSize:
                                                        MainAxisSize.max,
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .center,
                                                    children: [
                                                      FFButtonWidget(
                                                        onPressed: () async {
                                                          setState(() {
                                                            FFAppState()
                                                                    .bordasRef =
                                                                BordasRefStruct
                                                                    .fromSerializableMap(
                                                                        jsonDecode(
                                                                            '{\"nome_borda\":\"borda\",\"preco_borda\":\"0\"}'));
                                                            FFAppState()
                                                                    .CondicaoGeral =
                                                                FFAppState()
                                                                        .CondicaoGeral +
                                                                    -1;
                                                            FFAppState()
                                                                    .CondicaoBordas =
                                                                FFAppState()
                                                                        .CondicaoBordas +
                                                                    -1;
                                                          });
                                                        },
                                                        text: 'Alterar Borda',
                                                        options:
                                                            FFButtonOptions(
                                                          height: 40.0,
                                                          padding:
                                                              EdgeInsetsDirectional
                                                                  .fromSTEB(
                                                                      24.0,
                                                                      0.0,
                                                                      24.0,
                                                                      0.0),
                                                          iconPadding:
                                                              EdgeInsetsDirectional
                                                                  .fromSTEB(
                                                                      0.0,
                                                                      0.0,
                                                                      0.0,
                                                                      0.0),
                                                          color:
                                                              Color(0xFFE46D1F),
                                                          textStyle:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .titleSmall
                                                                  .override(
                                                                    fontFamily:
                                                                        'Readex Pro',
                                                                    color: Colors
                                                                        .white,
                                                                  ),
                                                          elevation: 3.0,
                                                          borderSide:
                                                              BorderSide(
                                                            color: Colors
                                                                .transparent,
                                                            width: 1.0,
                                                          ),
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                                      8.0),
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                            ],
                                          ),
                                          theme: ExpandableThemeData(
                                            tapHeaderToExpand: true,
                                            tapBodyToExpand: false,
                                            tapBodyToCollapse: false,
                                            headerAlignment:
                                                ExpandablePanelHeaderAlignment
                                                    .center,
                                            hasIcon: true,
                                            iconSize: 25.0,
                                            iconColor:
                                                FlutterFlowTheme.of(context)
                                                    .secondaryText,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Container(
              width: double.infinity,
              height: 74.0,
              decoration: BoxDecoration(
                color: FlutterFlowTheme.of(context).secondaryBackground,
              ),
              child: Padding(
                padding: EdgeInsetsDirectional.fromSTEB(10.0, 10.0, 10.0, 10.0),
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      width: 140.0,
                      height: 100.0,
                      decoration: BoxDecoration(
                        color: FlutterFlowTheme.of(context).primaryBackground,
                        borderRadius: BorderRadius.circular(12.0),
                      ),
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                8.0, 0.0, 0.0, 0.0),
                            child: InkWell(
                              splashColor: Colors.transparent,
                              focusColor: Colors.transparent,
                              hoverColor: Colors.transparent,
                              highlightColor: Colors.transparent,
                              onTap: () async {
                                if (FFAppState().quanty != 1) {
                                  setState(() {
                                    FFAppState().quanty =
                                        FFAppState().quanty + -1;
                                  });
                                } else {
                                  return;
                                }
                              },
                              child: FaIcon(
                                FontAwesomeIcons.minus,
                                color:
                                    FlutterFlowTheme.of(context).secondaryText,
                                size: 25.0,
                              ),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                8.0, 0.0, 8.0, 0.0),
                            child: Text(
                              formatNumber(
                                FFAppState().quanty,
                                formatType: FormatType.custom,
                                format: '',
                                locale: '',
                              ),
                              style: FlutterFlowTheme.of(context)
                                  .bodyMedium
                                  .override(
                                    fontFamily: 'Readex Pro',
                                    fontSize: 25.0,
                                  ),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                0.0, 0.0, 8.0, 0.0),
                            child: InkWell(
                              splashColor: Colors.transparent,
                              focusColor: Colors.transparent,
                              hoverColor: Colors.transparent,
                              highlightColor: Colors.transparent,
                              onTap: () async {
                                if (FFAppState().quanty != 100) {
                                  setState(() {
                                    FFAppState().quanty =
                                        FFAppState().quanty + 1;
                                  });
                                } else {
                                  return;
                                }
                              },
                              child: FaIcon(
                                FontAwesomeIcons.plus,
                                color:
                                    FlutterFlowTheme.of(context).secondaryText,
                                size: 25.0,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Flexible(
                      child: InkWell(
                        splashColor: Colors.transparent,
                        focusColor: Colors.transparent,
                        hoverColor: Colors.transparent,
                        highlightColor: Colors.transparent,
                        onTap: () async {
                          if (FFAppState().CondicaoGeral == 1) {
                            setState(() {
                              FFAppState().TotalPrice = FFAppState()
                                      .TotalPrice +
                                  (widget.detalhesProdutos!.valorProduto! / 2 +
                                          FFAppState().bordasRef.precoBorda) *
                                      FFAppState().quanty;
                            });
                            setState(() {
                              FFAppState().addToPedidosCar(PedidosStruct(
                                nomeProduto:
                                    widget.detalhesProdutos?.nomeProduto,
                                img: widget.detalhesProdutos?.img,
                                quanty: FFAppState().quanty,
                                precoTotal:
                                    widget.detalhesProdutos!.valorProduto! / 2,
                                precoBorda: FFAppState().bordasRef.precoBorda,
                                nomeBorda: FFAppState().bordasRef.nomeBorda,
                                massaGratis:
                                    FFAppState().bordasRef.precoBorda == 0.0,
                              ));
                              FFAppState().quanty = 1;
                              FFAppState().CondicaoGeral = 0;
                              FFAppState().bordasRef = BordasRefStruct
                                  .fromSerializableMap(jsonDecode(
                                      '{\"nome_borda\":\"borda\",\"preco_borda\":\"0\"}'));
                              FFAppState().Sabores = SaboresRefStruct
                                  .fromSerializableMap(jsonDecode(
                                      '{\"NomeSabor1\":\"nome\",\"NomeSabor2\":\"nome\",\"NomeSabor3\":\"nome\",\"NomeSabor4\":\"nome\",\"PrecoSabor1\":\"0\",\"PrecoSabor2\":\"0\",\"PrecoSabor3\":\"0\",\"PrecoSabor4\":\"0\"}'));
                              FFAppState().NumCarrinho =
                                  FFAppState().NumCarrinho + 1;
                            });

                            context.goNamed('meucarrinho');
                          } else {
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(
                                content: Text(
                                  'Escolha a opção de Borda para continuar.',
                                  style: TextStyle(
                                    color: FlutterFlowTheme.of(context)
                                        .primaryText,
                                  ),
                                ),
                                duration: Duration(milliseconds: 4000),
                                backgroundColor: Color(0xFFC05A16),
                              ),
                            );
                          }
                        },
                        child: Container(
                          width: 220.0,
                          height: 100.0,
                          decoration: BoxDecoration(
                            color: () {
                              if (FFAppState().CondicaoGeral == 0) {
                                return FlutterFlowTheme.of(context)
                                    .primaryBackground;
                              } else if (FFAppState().CondicaoGeral != 0) {
                                return Color(0xFF10DA26);
                              } else {
                                return Color(0xFF10DA26);
                              }
                            }(),
                            borderRadius: BorderRadius.circular(12.0),
                          ),
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    10.0, 0.0, 0.0, 0.0),
                                child: Text(
                                  'Adicionar',
                                  style: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .override(
                                        fontFamily: 'Readex Pro',
                                        fontSize: 20.0,
                                      ),
                                ),
                              ),
                              Flexible(
                                child: Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      0.0, 0.0, 8.0, 0.0),
                                  child: Text(
                                    formatNumber(
                                      (widget.detalhesProdutos!.valorProduto! /
                                                  2 +
                                              FFAppState()
                                                  .bordasRef
                                                  .precoBorda) *
                                          FFAppState().quanty,
                                      formatType: FormatType.custom,
                                      currency: 'R\$',
                                      format: '0.00',
                                      locale: 'pt_BR',
                                    ),
                                    style: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .override(
                                          fontFamily: 'Readex Pro',
                                          fontSize: 18.0,
                                        ),
                                  ),
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
            ),
          ],
        ),
      ),
    );
  }
}
