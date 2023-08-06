import 'package:dartz/dartz.dart';
import 'package:me_adota/features/global/infra/rest_client/rest_client_error.dart';

abstract class RestClient {
  Future<Either<RestClientError, T>> get<T>(String path,
      {Map<String, dynamic>? queryParameters});

  Future<Either<RestClientError, T>> post<T>(String path,
      {Map<String, dynamic>? queryParameters, dynamic body});

  Future<Either<RestClientError, T>> put<T>(String path,
      {Map<String, dynamic>? queryParameters, dynamic body});

  Future<Either<RestClientError, T>> delete<T>(String path,
      {Map<String, dynamic>? queryParameters});
}
