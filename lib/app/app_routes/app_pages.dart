import 'package:get/get.dart';
import 'package:wattio_desafio/app/app_routes/app_routes.dart';
import 'package:wattio_desafio/app/ui/home_page/home_bindings.dart';
import 'package:wattio_desafio/app/ui/home_page/home_page.dart';
import 'package:wattio_desafio/app/ui/splash_page/splash_bindings.dart';
import 'package:wattio_desafio/app/ui/splash_page/splash_page.dart';

class AppPages {
  List<GetPage> get routes => [
        GetPage(
          name: Routes.splash,
          page: () => const SplashPage(),
          binding: SplashBinding(),
        ),
        GetPage(
          name: Routes.home,
          page: () => const HomePage(),
          binding: HomeBinding(),
        ),
      ];
}
