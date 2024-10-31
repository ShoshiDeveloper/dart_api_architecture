import 'dart:developer' as developer;
import 'package:dart_frog/dart_frog.dart';
import 'package:supabase/supabase.dart';

enum LogColors {
  error(31),
  warning(33),
  apiCall(36),
  apiResult(32),
  success(32),
  message(37),
  notification(34);

  const LogColors(this.colorCode);
  final int colorCode;
}

final class Logger {
  Logger._();
  static Logger instance = Logger._();

  void _log(String msg, LogColors logColor) {
    final now = DateTime.now();
    final out = msg.split('\n').map((l) => '\x1B[${logColor.colorCode}m$l\x1B[0m').join('\n');
    
    developer.log('[$now] $out');
    print('[$now] $out');
  }

  void e(Object? e, {int stackTraceLength = 7}) {
    final trace = StackTrace.current.toString().split('\n').skip(1).take(stackTraceLength).join('\n');

    if (e is PostgrestException) {
      _log('[postgress-exception] [code] ${e.code}\n[data] ${e.message}', LogColors.error);
    } else if (e is Exception) {
      _log('[exception] $e\n[stacktrace] $trace', LogColors.error);
    } else if (e is Error) {
      _log('[error] $e\n[stacktrace] $trace', LogColors.error);
    } else if (e is String) {
      _log('[error (string)] $e\n[stacktrace] $trace', LogColors.error);
    } else {
      // If we get here, this means that error was neither an error, nor an exception and I don't
      // really know what happened.
      _log('[error (undefined)] Logger.e() fallback warning - e is undefined', LogColors.warning);
      _log('[${e.runtimeType}] $e\n[stacktrace] $trace', LogColors.error);
    }
  }

  void _request(Request request) async {
    _log('[incoming request] ${request.uri.toString()}', LogColors.success);
    _log('[incoming request body] ${await request.body()}', LogColors.success);
  }

  Middleware requestsLoggerMiddleware() {
    return (handler) {
      return (request) {
        _request(request.request);
        return handler(request);
      };
    };
  }
}

