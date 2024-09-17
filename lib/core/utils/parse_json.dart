import 'dart:convert';

import 'package:api_architecture/exceptions/wrong_json_exception.dart';
import 'package:dart_frog/dart_frog.dart';

Future<Map<String, dynamic>> parseBodyJSON(Request request) async {
  try {
    return jsonDecode(await request.body());
  } catch (e) {
    throw WrongJsonException();
  }
}