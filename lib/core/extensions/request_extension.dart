import 'dart:convert';

import 'package:api_architecture/config.dart';
import 'package:api_architecture/core/enums/error_code.dart';
import 'package:api_architecture/exceptions/repository_exception.dart';
import 'package:api_architecture/exceptions/wrong_bearer_token_exception.dart';
import 'package:bearer_token_package/bearer_token.dart';
import 'package:dart_frog/dart_frog.dart';

extension RequestExtension on Request {
  String get userUuid {
    final token = this.headers['Authorization']?.replaceAll('Bearer ', '') ?? "";

    final parsedToken = BearerToken.getData(token, Config.instance.secret);

    if (parsedToken.result == null) throw WrongBearerTokenException();

    return parsedToken.result!;
  }

  Future<Map<String, dynamic>> parsedBody() async {
    try {
      return jsonDecode(await body());
    } catch (e) {
      throw RepositoryException(ErrorCodes.brokenJson);
    }
  }
}
