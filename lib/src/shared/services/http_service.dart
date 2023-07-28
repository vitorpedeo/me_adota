import 'package:dio/dio.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

class HttpService {
  late final Dio _client;
  final BaseOptions? options;

  HttpService({
    this.options,
  }) {
    final BaseOptions baseOptions = options ?? BaseOptions();

    _client = Dio(
      baseOptions.copyWith(
        headers: {
          'Content-Type': 'application/json',
        },
      ),
    )..interceptors.add(
        PrettyDioLogger(
          requestHeader: true,
          requestBody: true,
          responseBody: true,
          responseHeader: true,
          error: true,
          compact: true,
          maxWidth: 90,
        ),
      );
  }

  Future<Response<T>> get<T>(
    String path, {
    Options? options,
    Map<String, dynamic>? queryParameters,
  }) async {
    return _client.get<T>(
      path,
      options: options,
      queryParameters: queryParameters,
    );
  }
}
