import 'package:api_architecture/config.dart';
import 'package:api_architecture/core/services/logger.dart';
import 'package:api_architecture/core/utils/error_code.dart';
import 'package:dart_frog/dart_frog.dart';
import 'package:supabase/supabase.dart';

Future<Response> errorParse(Exception e) async {
  Logger.instance.e(e);
  
  return Response.json(
    statusCode: ErrorCodes.fromException(e).httpCode,
    body: !Config.instance.isDev ? {
      "message": ErrorCodes.fromException(e).message,
      "code": ErrorCodes.fromException(e).code,
    }: switch (e) {
      PostgrestException() => {
        "message": e.message,
        "code": e.code,
      },
      _ => {
        "message": e.toString()
      }
    }
  );
}