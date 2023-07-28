import 'package:me_adota/src/shared/services/http_service.dart';
import 'package:me_adota/src/shared/services/localities_http_service.dart';
import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';

class HttpProviders {
  static final List<SingleChildWidget> all = [
    Provider<HttpService>(
      create: (context) => HttpService(),
    ),
    Provider<LocalitiesHttpService>(
      create: (context) => LocalitiesHttpService(),
    ),
  ];
}
