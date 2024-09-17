import 'package:api_architecture/core/models/repository.dart';
import 'package:dart_frog/src/_internal.dart';

class CarsRepository extends Repository {
  @override
  Future<Response> get(Request request, [Map<String, dynamic>? dynamicRouteParams]) {
    // TODO: implement get
    return super.get(request, dynamicRouteParams);
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