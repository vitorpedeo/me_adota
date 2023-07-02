import 'package:me_adota/src/modules/home/controllers/home_controller.dart';
import 'package:me_adota/src/modules/home/widgets/current_location/current_location_controller.dart';
import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';

class HomeProvider {
  static final List<SingleChildWidget> all = [
    ChangeNotifierProvider<HomeController>(
      create: (context) => HomeController(
        localizationController: context.read(),
      )..loadHome(),
    ),
    ChangeNotifierProvider<CurrentLocationController>(
      create: (context) => CurrentLocationController(
        localizationController: context.read(),
        homeController: context.read(),
      ),
    ),
  ];
}
