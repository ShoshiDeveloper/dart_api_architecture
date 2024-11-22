import 'package:api_architecture/core/models/repository.dart';
import 'package:dart_frog/dart_frog.dart';

Future<Response> onRequest(RequestContext context) async => await _RouteRepository().direct(context.request);

class _RouteRepository extends Repository {
  @override
  Future<Response> get(Request request, [Map<String, dynamic>? dynamicRouteParams]) {
    try {
      
    } catch (e) {
      if(e is! Exception) return;
      e.response
    }
    throw Exception('some exception example');
  }

  @override
  Future<Response> put(Request request, [Map<String, dynamic>? dynamicRouteParams]) {
    // TODO: implement put
    return super.put(request, dynamicRouteParams);
  }

  @override
  Future<Response> delete(Request request, [Map<String, dynamic>? dynamicRouteParams]) {
    // TODO: implement delete
    return super.delete(request, dynamicRouteParams);
  }
}
