import 'package:get/get.dart';
import 'package:wattio_desafio/app/ui/home_page/home_controller.dart';

class HomeBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<HomeController>(() => HomeController());
  }
}
