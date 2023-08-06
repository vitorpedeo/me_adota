abstract class RestClientError {
  final int statusCode;
  final String message;

  RestClientError({
    required this.statusCode,
    required this.message,
  });
}
