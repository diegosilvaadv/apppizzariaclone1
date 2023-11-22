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

String decodificarIMGBase64(String qrcode) {
  // decode "qr code" into base64 and returns an "image"
  List<int> bytes = utf8.encode(qrcode);
  String base64Str = base64.encode(bytes);
  return 'data:image/$qrcode;base64,$base64Str';
}
