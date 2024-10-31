import 'package:api_architecture/core/utils/error_code.dart';
import 'package:dart_frog/dart_frog.dart';

abstract class Repository {
  Future<Response> direct(Request request, [Map<String, dynamic>? dynamicRouteParams]) async => switch(request.method) {
    HttpMethod.get => get(request, dynamicRouteParams),
    HttpMethod.post => post(request, dynamicRouteParams),
    HttpMethod.put => put(request, dynamicRouteParams),
    HttpMethod.delete => delete(request, dynamicRouteParams),
    HttpMethod.head => head(request, dynamicRouteParams),
    HttpMethod.options => options(request, dynamicRouteParams),
    HttpMethod.patch => patch(request, dynamicRouteParams)
  };

  Future<Response> get(Request request, [Map<String, dynamic>? dynamicRouteParams]) async => ErrorCodes.notImplemented.response;
  Future<Response> post(Request request, [Map<String, dynamic>? dynamicRouteParams]) async => ErrorCodes.notImplemented.response;
  Future<Response> put(Request request, [Map<String, dynamic>? dynamicRouteParams]) async => ErrorCodes.notImplemented.response;
  Future<Response> delete(Request request, [Map<String, dynamic>? dynamicRouteParams]) async => ErrorCodes.notImplemented.response;
  Future<Response> head(Request request, [Map<String, dynamic>? dynamicRouteParams]) async => ErrorCodes.notImplemented.response;
  Future<Response> options(Request request, [Map<String, dynamic>? dynamicRouteParams]) async => ErrorCodes.notImplemented.response;
  Future<Response> patch(Request request, [Map<String, dynamic>? dynamicRouteParams]) async => ErrorCodes.notImplemented.response;
}

