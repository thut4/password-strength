import 'package:get/get.dart';

class HomeController extends GetxController {
  RxString password = ''.obs;
  RxBool isVisible = false.obs;
  RxString displayPassword = 'Enter a password'.obs;
  RxDouble passwordStrength = 0.0.obs;
  RegExp numberRegExpress = RegExp(r".*[0-9].*");
  RegExp letterRegExpress = RegExp(r".*[A-Za-z].*");
  RegExp specialCharacterRegExpress = RegExp(r".*[^A-Za-z0-9].*");

  void toggleVisible() {
    isVisible.value = !isVisible.value;
  }

  void checkPwdStrength(String value) {
    password.value = value.trim();
    if (password.value.isEmpty) {
      passwordStrength.value = 0.0;
      displayPassword.value = "Enter a password";
    } else if (password.value.length < 6) {
      passwordStrength.value = 1 / 4;
      displayPassword.value = "Your Password is too short";
    } else if (password.value.length < 8) {
      passwordStrength.value = 2 / 4;
      displayPassword.value = "Your Password is not strong";
    } else {
      if (!letterRegExpress.hasMatch(password.value) ||
          !numberRegExpress.hasMatch(password.value) ||
          !specialCharacterRegExpress.hasMatch(password.value)) {
        passwordStrength.value = 3 / 4;
        displayPassword.value = "Your Password is too strong";
      } else {
        passwordStrength.value = 1;
        displayPassword.value = "Your Password is strongest";
      }
    }
  }
}
