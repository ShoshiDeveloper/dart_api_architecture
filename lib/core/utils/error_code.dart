import 'package:api_architecture/exceptions/wrong_bearer_token_exception.dart';
import 'package:api_architecture/exceptions/wrong_json_exception.dart';
import 'package:dart_frog/dart_frog.dart';
import 'package:supabase/supabase.dart';

/**
 * U - User
 * S - Server
 * SP - Server - Postgrest
 * CJ - Client
 */

enum ErrorCodes {
  //User error codes
  unauthorized(httpCode: 401, code: 'U1', message: 'Unauthorized'),
  accessDenied(httpCode: 403, code: 'U3', message: 'Access denied'),

  //Server error codes
  undefiend(httpCode: 500, code: 'S0', message: 'Something went wrong'),
  notImplemented(httpCode: 501, code: 'S1', message: 'Not implemented'),
  unvailable(httpCode: 503, code: 'S3', message: 'The service is temporarily unavailable'),
  
  //Postgrest error codes
  postgress(httpCode: 500, code: 'SP1', message: 'FATAL SERVER ERROR'),

  //Client error codes
  wrongJson(httpCode: 500, code: 'C1', message: 'Received wrong JSON'),
  brokenJson(httpCode: 500, code: 'C2', message: 'Received broken JSON'),
  alreadyExists(httpCode: 409, code: 'C3', message: 'This is already exists');

  const ErrorCodes({required this.httpCode, required this.code, required this.message});

  final int httpCode;
  final String code;
  final String message;

  static ErrorCodes fromException(Exception exception) {
    return switch (exception) {
      PostgrestException() => ErrorCodes.postgress,
      WrongJsonException() => ErrorCodes.wrongJson,
      WrongBearerTokenException() => ErrorCodes.accessDenied,
      _ => ErrorCodes.undefiend
    };
  }

  Response get response => Response.json(
    statusCode: this.httpCode,
    body: {
      'code': this.code,
      'message': this.message
    }
  ); 
}