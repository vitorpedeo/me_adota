import 'package:me_adota/features/global/infra/rest_client/rest_client_error.dart';

class RestClientErrorImpl implements RestClientError {
  @override
  final int statusCode;

  @override
  final String message;

  RestClientErrorImpl({
    required this.statusCode,
    required this.message,
  });
}
