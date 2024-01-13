import 'package:get/get.dart';
import 'package:wattio_desafio/app/app_routes/app_routes.dart';

class SplashController extends GetxController {
  @override
  void onInit() async {
    await Future.delayed(const Duration(seconds: 3));
    Get.offAllNamed(Routes.home);
    super.onInit();
  }
}
