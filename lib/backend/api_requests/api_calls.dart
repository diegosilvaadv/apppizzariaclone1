import 'dart:convert';
import 'dart:typed_data';

import '/flutter_flow/flutter_flow_util.dart';
import 'api_manager.dart';

export 'api_manager.dart' show ApiCallResponse;

const _kPrivateApiFunctionName = 'ffPrivateApiCall';

class BuscarCEPCall {
  static Future<ApiCallResponse> call({
    String? cep = '',
  }) async {
    return ApiManager.instance.makeApiCall(
      callName: 'BuscarCEP',
      apiUrl: 'viacep.com.br/ws/${cep}/json/',
      callType: ApiCallType.GET,
      headers: {},
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
    );
  }

  static dynamic cep(dynamic response) => getJsonField(
        response,
        r'''$.cep''',
      );
  static dynamic endereco(dynamic response) => getJsonField(
        response,
        r'''$.logradouro''',
      );
  static dynamic completo(dynamic response) => getJsonField(
        response,
        r'''$.complemento''',
      );
  static dynamic bairro(dynamic response) => getJsonField(
        response,
        r'''$.bairro''',
      );
  static dynamic cidade(dynamic response) => getJsonField(
        response,
        r'''$.localidade''',
      );
  static dynamic estado(dynamic response) => getJsonField(
        response,
        r'''$.uf''',
      );
}

class PixMercadoPagoCall {
  static Future<ApiCallResponse> call({
    String? chavealetoria = '',
    String? productTitle = '',
    String? email = '',
    String? firstName = '',
    String? lastName = '',
    String? identificationType = '',
    String? numberCpf = '',
    double? amount,
  }) async {
    final ffApiRequestBody = '''
{
  "transaction_amount": ${amount},
  "payment_method_id": "pix",
  "payer": {
    "email": "${email}",
    "first_name": "${firstName}",
    "last_name": "${lastName}",
    "identification": {
      "type": "${identificationType}",
      "number": "${numberCpf}"
    }
  }
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'Pix Mercado Pago',
      apiUrl: 'https://api.mercadopago.com/v1/payments',
      callType: ApiCallType.POST,
      headers: {
        'Content-Type': 'application/json',
        'X-Idempotency-Key': '0d5020ed-1af6-469c-ae06-${chavealetoria}',
        'Authorization':
            'Bearer APP_USR-2540313967326267-111909-94d7cfcc16413329acb45f48567519c7-433297459',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
    );
  }

  static dynamic idStutus(dynamic response) => getJsonField(
        response,
        r'''$.id''',
      );
  static dynamic qrcode(dynamic response) => getJsonField(
        response,
        r'''$.point_of_interaction.transaction_data.qr_code_base64''',
      );
  static dynamic chavepix(dynamic response) => getJsonField(
        response,
        r'''$.point_of_interaction.transaction_data.qr_code''',
      );
  static dynamic url(dynamic response) => getJsonField(
        response,
        r'''$.point_of_interaction.transaction_data.ticket_url''',
      );
}

class StatusPixCall {
  static Future<ApiCallResponse> call({
    int? idPix,
  }) async {
    return ApiManager.instance.makeApiCall(
      callName: 'Status Pix',
      apiUrl: 'https://api.mercadopago.com/v1/payments/${idPix}',
      callType: ApiCallType.GET,
      headers: {
        'Authorization':
            'Bearer APP_USR-2540313967326267-111909-94d7cfcc16413329acb45f48567519c7-433297459',
      },
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
    );
  }

  static dynamic status(dynamic response) => getJsonField(
        response,
        r'''$.status''',
      );
}

class CriarClienteMPCall {
  static Future<ApiCallResponse> call({
    String? id = '',
    String? zipCode = '',
    String? streetName = '',
    int? streetNumber,
    String? city = '',
    String? defaultAddress = '',
    String? defaultCard = '',
    String? description = '',
    String? email = '',
    String? firstName = '',
    String? cpf = '',
    String? lastName = '',
    String? dd = '',
    String? numerotel = '',
  }) async {
    final ffApiRequestBody = '''
{
  "address": {
    "id": "${id}",
    "zip_code": "${zipCode}",
    "street_name": "${streetName}",
    "street_number": ${streetNumber},
    "city": {
      "nome": "${city}"
    }
  },
  "date_registered": "2021-10-20T11:37:30.000-04:00",
  "default_address": "${defaultAddress}",
  "default_card": "${defaultCard}",
  "description": "${description}",
  "email": "${email}",
  "first_name": "${firstName}",
  "identification": {
    "type": "CPF",
    "number": "${cpf}"
  },
  "last_name": "${lastName}",
  "phone": {
    "area_code": "${dd}",
    "number": "${numerotel}"
  }
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'CriarClienteMP',
      apiUrl: 'https://api.mercadopago.com/v1/customers',
      callType: ApiCallType.POST,
      headers: {
        'Content-Type': 'application/json',
        'Authorization':
            'Bearer TEST-2540313967326267-111909-fb5a28f57f4f44cf184b71afeb38980d-433297459',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
    );
  }

  static dynamic idCliente(dynamic response) => getJsonField(
        response,
        r'''$.id''',
      );
}

class StatusClienteCall {
  static Future<ApiCallResponse> call({
    String? email = '',
  }) async {
    return ApiManager.instance.makeApiCall(
      callName: 'statusCliente',
      apiUrl: 'https://api.mercadopago.com/v1/customers/search?email=${email}',
      callType: ApiCallType.GET,
      headers: {
        'Content-Type': 'application/json',
        'Authorization':
            'Bearer TEST-2540313967326267-111909-fb5a28f57f4f44cf184b71afeb38980d-433297459',
      },
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
    );
  }

  static dynamic idCliente(dynamic response) => getJsonField(
        response,
        r'''$.results[:].id''',
      );
}

class ObterClienteCall {
  static Future<ApiCallResponse> call({
    String? idCliente = '',
  }) async {
    return ApiManager.instance.makeApiCall(
      callName: 'ObterCliente',
      apiUrl: 'https://api.mercadopago.com/v1/customers/${idCliente}',
      callType: ApiCallType.GET,
      headers: {
        'Content-Type': 'application/json',
        'Authorization':
            'Bearer TEST-2540313967326267-111909-fb5a28f57f4f44cf184b71afeb38980d-433297459',
      },
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
    );
  }
}

class SalvarCartoMPCall {
  static Future<ApiCallResponse> call({
    String? customerId = '',
    String? token = '',
  }) async {
    final ffApiRequestBody = '''
{
  "token": "${token}"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'Salvar Carto MP',
      apiUrl: 'https://api.mercadopago.com/v1/customers/${customerId}/cards',
      callType: ApiCallType.POST,
      headers: {
        'Content-Type': 'application/json',
        'Authorization':
            'Bearer TEST-2540313967326267-111909-fb5a28f57f4f44cf184b71afeb38980d-433297459',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
    );
  }

  static dynamic idUser(dynamic response) => getJsonField(
        response,
        r'''$.customer_id''',
      );
  static dynamic ultimos6Digitos(dynamic response) => getJsonField(
        response,
        r'''$.first_six_digits''',
      );
  static dynamic id(dynamic response) => getJsonField(
        response,
        r'''$.id''',
      );
  static dynamic pagmetodotype(dynamic response) => getJsonField(
        response,
        r'''$.payment_method.payment_type_id''',
      );
  static dynamic pagmetodo(dynamic response) => getJsonField(
        response,
        r'''$.payment_method.id''',
      );
  static dynamic userid(dynamic response) => getJsonField(
        response,
        r'''$.user_id''',
      );
}

class ObterCartaoClienteCall {
  static Future<ApiCallResponse> call({
    String? customerId = '',
  }) async {
    return ApiManager.instance.makeApiCall(
      callName: 'Obter Cartao Cliente',
      apiUrl: 'https://api.mercadopago.com/v1/customers/${customerId}/cards',
      callType: ApiCallType.GET,
      headers: {
        'Content-Type': 'application/json',
        'Authorization':
            'Bearer TEST-2540313967326267-111909-fb5a28f57f4f44cf184b71afeb38980d-433297459',
      },
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
    );
  }
}

class CriarPagamentoViaCartaoCall {
  static Future<ApiCallResponse> call({
    String? uuidV4 = '',
    String? firstName = '',
    String? lastName = '',
    int? dd,
    String? numero = '',
    int? numeroRua,
    String? cep = '',
    String? cidade = '',
    String? estado = '',
    String? rua = '',
    int? parcelas,
    String? idCustomer = '',
    String? email = '',
    String? cpf = '',
    String? paymentMethodId = '',
    String? token = '',
    double? transactionAmount,
    String? description = '',
    String? issuerId = '',
  }) async {
    final ffApiRequestBody = '''
{
  "transaction_amount": ${transactionAmount},
  "token": "${token}",
  "installments": 1,
  "issuer_id": "${issuerId}",
  "payment_method_id": "${paymentMethodId}",
  "payer": {
    "first_name": "${firstName}",
    "last_name": "${lastName}",
    "email": "${email}",
    "type": "customer",
    "identification": {
      "type": "CPF",
      "number": "${cpf}"
    },
    "address": {
      "zip_code": "${cep}",
      "street_name": ${numeroRua},
      "neighborhood": "vila aurora",
      "city": "${cidade}",
      "federal_unit": "${estado}"
    }
  },
  "description": "${description}"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'Criar Pagamento Via Cartao',
      apiUrl: 'https://api.mercadopago.com/v1/payments',
      callType: ApiCallType.POST,
      headers: {
        'Content-Type': 'application/json',
        'X-Idempotency-Key': '${uuidV4}',
        'Authorization':
            'Bearer TEST-2540313967326267-111909-fb5a28f57f4f44cf184b71afeb38980d-433297459',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
    );
  }
}

class ApiPagingParams {
  int nextPageNumber = 0;
  int numItems = 0;
  dynamic lastResponse;

  ApiPagingParams({
    required this.nextPageNumber,
    required this.numItems,
    required this.lastResponse,
  });

  @override
  String toString() =>
      'PagingParams(nextPageNumber: $nextPageNumber, numItems: $numItems, lastResponse: $lastResponse,)';
}

String _serializeList(List? list) {
  list ??= <String>[];
  try {
    return json.encode(list);
  } catch (_) {
    return '[]';
  }
}

String _serializeJson(dynamic jsonVar, [bool isList = false]) {
  jsonVar ??= (isList ? [] : {});
  try {
    return json.encode(jsonVar);
  } catch (_) {
    return isList ? '[]' : '{}';
  }
}
