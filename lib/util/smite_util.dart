import 'dart:convert';

import 'package:crypto/crypto.dart';
import 'package:http/http.dart' as http;
import 'package:intl/intl.dart';

import '../constants.dart';

const _dateFormat = 'yyyyMMddHHmmss';

String _getTimeStamp() {
  final now = DateTime.now().toUtc();
  return DateFormat(_dateFormat).format(now);
}

String _getMD5Hash(String method, String timeStamp) {
  final input = '$smiteDevId$method$smiteAuthKey$timeStamp';
  return md5.convert(utf8.encode(input)).toString();
}

Future<http.Response> smiteFetch(String method, String? session) async {
  final timeStamp = _getTimeStamp();
  final signature = _getMD5Hash(method, timeStamp);
  String uri = '$smiteUrl/${method}Json/$smiteDevId/$signature/';
  if (session != null) {
    uri += '$session/';
  }
  uri += timeStamp;
  if (session != null) {
    uri += '/1';
  }
  return await http.get(Uri.parse(uri));
}
