import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:me_adota/features/global/external/rest_client/rest_client_error.dart';
import 'package:me_adota/features/global/infra/rest_client/rest_client.dart';
import 'package:me_adota/features/global/infra/rest_client/rest_client_error.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

class RestClientImpl implements RestClient {
  late final Dio _client;
  final BaseOptions _baseOptions = BaseOptions(
    headers: {
      'Content-Type': 'application/json',
    },
  );

  RestClientImpl() {
    _client = Dio(_baseOptions)
      ..interceptors.add(
        PrettyDioLogger(
          requestHeader: true,
          requestBody: true,
          responseBody: true,
          responseHeader: false,
          error: true,
          compact: true,
          maxWidth: 90,
        ),
      );
  }

  @override
  Future<Either<RestClientError, T>> get<T>(String path,
      {Map<String, dynamic>? queryParameters}) async {
    final Response<T> response =
        await _client.get<T>(path, queryParameters: queryParameters);

    if (response.statusCode != 200) {
      return Left(
        RestClientErrorImpl(
          statusCode: response.statusCode!,
          message: response.statusMessage!,
        ),
      );
    }

    if (response.data == null) {
      return Left(
        RestClientErrorImpl(
          statusCode: response.statusCode!,
          message: 'Data is null',
        ),
      );
    }

    return Right(response.data as T);
  }

  @override
  Future<Either<RestClientError, T>> post<T>(String path,
      {Map<String, dynamic>? queryParameters, body}) {
    // TODO: implement post
    throw UnimplementedError();
  }

  @override
  Future<Either<RestClientError, T>> put<T>(String path,
      {Map<String, dynamic>? queryParameters, body}) {
    // TODO: implement put
    throw UnimplementedError();
  }

  @override
  Future<Either<RestClientError, T>> delete<T>(String path,
      {Map<String, dynamic>? queryParameters}) {
    // TODO: implement delete
    throw UnimplementedError();
  }
}
