import 'package:me_adota/src/shared/controllers/localization_controller.dart';
import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';

class LocalizationProviders {
  static final List<SingleChildWidget> all = [
    ChangeNotifierProvider<LocalizationController>(
      create: (context) => LocalizationController(),
    ),
  ];
}
