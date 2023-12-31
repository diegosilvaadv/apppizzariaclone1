import 'dart:convert';
import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:timeago/timeago.dart' as timeago;
import 'lat_lng.dart';
import 'place.dart';
import 'uploaded_file.dart';
import '/backend/schema/structs/index.dart';
import '/backend/supabase/supabase.dart';
import '/auth/supabase_auth/auth_util.dart';

String saudacao() {
  var hour = DateTime.now().hour;
  if (hour < 4) {
    return 'Vai dormir, ';
  }
  if (hour < 12) {
    return 'Bom dia, ';
  }
  if (hour < 17) {
    return 'Boa Tarde, ';
  }
  return 'Boa Noite, ';
}

String decodificarIMGBase64(
  String dataimagepngbase64,
  String qrcode,
) {
  // pegue o "data:image/png;base64" e o "qrcode" e decodifique
// Decode the base64 image data
  final bytes = base64.decode(dataimagepngbase64.split(',').last);

  // If a QR code is provided, decode it
  if (qrcode != null) {
    final decodedQrCode = utf8.decode(base64.decode(qrcode));
    print('Decoded QR code: $decodedQrCode');
  }

  // Return the decoded image data as a string
  return utf8.decode(bytes);
}
