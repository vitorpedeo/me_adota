import 'package:me_adota/src/modules/onboard/controllers/onboard_controller.dart';
import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';

class OnboardProvider {
  static final List<SingleChildWidget> all = [
    ChangeNotifierProvider<OnboardController>(
      create: (context) => OnboardController(),
    ),
  ];
}
