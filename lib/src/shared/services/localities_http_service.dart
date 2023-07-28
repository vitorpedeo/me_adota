import 'package:dio/dio.dart';
import 'package:me_adota/src/shared/services/http_service.dart';

class LocalitiesHttpService {
  late final HttpService _httpService;
  final String _baseUrl = 'https://servicodados.ibge.gov.br/api/v1/localidades';

  LocalitiesHttpService() {
    _httpService = HttpService(
      options: BaseOptions(
        baseUrl: _baseUrl,
      ),
    );
  }

  Future<Response<T>> getCitiesByState<T>({
    required String state,
  }) async {
    return _httpService.get<T>(
      '/estados/${state}/municipios',
    );
  }
}
