import 'package:me_adota/src/modules/home/providers/home_provider.dart';
import 'package:me_adota/src/modules/onboard/providers/onboard_provider.dart';
import 'package:me_adota/src/shared/providers/localization_providers.dart';
import 'package:provider/single_child_widget.dart';

class AppProviders {
  static final List<SingleChildWidget> all = [
    // Shared Providers
    ...LocalizationProviders.all,
    // Modules Providers
    ...OnboardProvider.all,
    ...HomeProvider.all,
  ];
}
