import 'package:get/get.dart';
import 'package:password_strength/controller/main_controller.dart';

class HomeBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => HomeController());
  }
}
