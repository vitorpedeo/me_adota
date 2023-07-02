import 'package:flutter/material.dart';
import 'package:me_adota/src/modules/home/controllers/home_controller.dart';
import 'package:me_adota/src/modules/home/widgets/current_location/current_location.dart';
import 'package:me_adota/src/shared/styles/theme.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppTheme.background,
      body: SafeArea(
        child: Container(
          padding: const EdgeInsets.only(
            top: 32,
            right: 32,
            bottom: 48,
            left: 32,
          ),
          width: double.infinity,
          height: double.infinity,
          child:
              Consumer<HomeController>(builder: (context, controller, child) {
            if (controller.status == HomeState.idle) {
              return const SizedBox.shrink();
            }

            if (controller.status == HomeState.loading) {
              return const Center(
                child: CircularProgressIndicator(
                  color: AppTheme.pink,
                ),
              );
            }

            if (controller.status == HomeState.error) {
              return const Center(
                child: Text('Erro ao carregar dados'),
              );
            }

            return Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: const [
                CurrentLocation(),
              ],
            );
          }),
        ),
      ),
    );
  }
}
