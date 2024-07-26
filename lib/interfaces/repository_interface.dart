import 'package:dart_frog/dart_frog.dart';

abstract class IRepository {
  Future<Response> direct(Request request) async => switch(request.method) {
    HttpMethod.get => get(),
    HttpMethod.post => post(),
    HttpMethod.put => put(),
    HttpMethod.delete => delete(),
    HttpMethod.head => head(),
    HttpMethod.options => options(),
    HttpMethod.patch => patch()
  };

  Future<Response> get() async => throw UnimplementedError('Not implemented');
  Future<Response> post() async => throw UnimplementedError('Not implemented');
  Future<Response> put() async => throw UnimplementedError('Not implemented');
  Future<Response> delete() async => throw UnimplementedError('Not implemented');
  Future<Response> head() async => throw UnimplementedError('Not implemented');
  Future<Response> options() async => throw UnimplementedError('Not implemented');
  Future<Response> patch() async => throw UnimplementedError('Not implemented');


}