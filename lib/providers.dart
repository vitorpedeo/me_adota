import 'package:me_adota/src/shared/providers/localization_providers.dart';
import 'package:provider/single_child_widget.dart';

class AppProviders {
  static final List<SingleChildWidget> all = [
    // Shared Providers
    ...LocalizationProviders.all,
  ];
}
