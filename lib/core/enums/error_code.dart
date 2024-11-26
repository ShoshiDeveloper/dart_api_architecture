import 'package:api_architecture/exceptions/wrong_bearer_token_exception.dart';
import 'package:dart_frog/dart_frog.dart';
import 'package:supabase/supabase.dart';

/**
 * U - User
 * C - Client
 * S - Server
 * SP - Server - Postgrest
 * SSMTP - Server - SMTP
 */

enum ErrorCodes {
  //User error codes
  unauthorized(httpCode: 401, code: 'U0', message: 'Unauthorized'),
  accessDenied(httpCode: 403, code: 'U1', message: 'Access denied'),

  //Client error codes
  wrongJson(httpCode: 400, code: 'C0', message: 'Received wrong JSON'),
  brokenJson(httpCode: 406, code: 'C1', message: 'Received broken JSON'),
  alreadyExists(httpCode: 409, code: 'C2', message: 'This is already exists'),

  //Server error codes
  undefiend(httpCode: 520, code: 'S0', message: 'Something went wrong'),
  notImplemented(httpCode: 501, code: 'S1', message: 'Not implemented'),
  unvailable(httpCode: 503, code: 'S2', message: 'The service is temporarily unavailable'),

  //Postgrest error codes
  postgress(httpCode: 500, code: 'SP0', message: 'Database error'),

  //SMTP error codes
  smtp(httpCode: 500, code: 'SSMTPP0', message: 'Error sending email');

  const ErrorCodes({required this.httpCode, required this.code, required this.message});

  final int httpCode;
  final String code;
  final String message;

  static ErrorCodes byException(Exception exception) {
    return switch (exception) {
      PostgrestException() => ErrorCodes.postgress,
      WrongBearerTokenException() => ErrorCodes.accessDenied,
      _ => ErrorCodes.undefiend
    };
  }

  Response get response => Response.json(statusCode: this.httpCode, body: {'code': this.code, 'message': this.message});
}
