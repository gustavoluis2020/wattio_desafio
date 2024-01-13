import 'package:get/get.dart';
import 'package:wattio_desafio/app/ui/splash_page/splash_controller.dart';

class SplashBinding implements Bindings {
  @override
  void dependencies() {
    Get.put(SplashController());
  }
}
