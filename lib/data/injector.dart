import 'package:dio/dio.dart';
import 'package:provider/provider.dart';

final dioProvider = Provider<Dio>(create: (_){
  final dio = Dio();
  dio.options.headers["Content-Type"] = "application/json";
  return dio;
} );