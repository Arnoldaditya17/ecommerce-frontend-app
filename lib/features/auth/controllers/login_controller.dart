
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import '../../../../core/routes/app_pages.dart';
import '../../../repository/repository.dart';
import '../../../utils/popups/full_screen_loader.dart';
import '../../../utils/popups/loaders.dart';
import '../models/get_storage_key.dart';


class LoginController extends GetxController {
  Repository repository;

  LoginController(this.repository);

  final GetStorage _getStorage = GetStorage();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();


  @override
  void onClose() {
    emailController.dispose();
    passwordController.dispose();
  }

  void validateLogin() async {
    if (emailController.text.isEmpty || passwordController.text.isEmpty) {
      TLoaders.errorSnackBar(
        title: "Validation Error",
        message: "Email and Password cannot be empty",
      );
      return;
    }

    try {
      // Start loading animation
      TFullScreenLoader.openLoadingDialog(
          'loading....', "assets/images/animations/Animation-1728393917852.json");

      Map<String, dynamic> data = {
        "email": emailController.text,
        "password": passwordController.text,
      };

      // Using try-catch for error handling instead of onError
      try {
        final value = await repository.login(data);

        // Stop the loading once login is successful
        TFullScreenLoader.stopLoading();
        _getStorage.write(GetStorageKey.accessToken, value.accessToken);
        _getStorage.write(GetStorageKey.refreshToken, value.refreshToken);

        TLoaders.successSnackBar(
          title: 'Hurray!!',
          message: "Login Successful",
        );
        Get.offAllNamed(Routes.appNavigation);
      } catch (error) {
        // Stop the loading and show error message if login fails
        TFullScreenLoader.stopLoading();
        TLoaders.errorSnackBar(
          title: "Error",
          message: error.toString(),
        );
      }
    } catch (exception) {
      // In case of unexpected error, stop loading and show error
      TFullScreenLoader.stopLoading();
      TLoaders.errorSnackBar(
        title: "Error",
        message: 'Something Went Wrong',
      );
    }
  }

}
