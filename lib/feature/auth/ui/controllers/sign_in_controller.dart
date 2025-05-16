import 'package:get/get.dart';
import 'package:notesapp/app/app_urls.dart';
import 'package:notesapp/core/network_caller/network_caller.dart';
import 'package:notesapp/feature/auth/data/models/sign_in_model.dart';
import 'package:notesapp/feature/auth/data/models/user_model.dart';
import 'package:notesapp/feature/auth/ui/controllers/auth_controller.dart';

class SignInController extends GetxController {
  bool _inProgress = false;

  bool get inProgress => _inProgress;

  String? _errorMessage;

  String? get errorMessage => _errorMessage;


  Future<bool> signIn(SignInRequestModel signRequestModel) async {
    bool isSuccess = false;
    _inProgress = true;
    update();
    final NetworkResponse response =
    await Get.find<NetworkCaller>().postRequest(
      url: AppUrls.loginUrl,
      body: signRequestModel.toJson(),
    );
    if (response.isSuccess) {
      // Save user data
      UserModel userModel = UserModel.fromJson(response.responseData!['data']);
      // Save user token
      String accessToken = response.responseData!['token'];
      await Get.find<AuthController>().saveUserData(accessToken, userModel);
      _errorMessage = null;
      isSuccess = true;
    } else {
      _errorMessage = response.errorMessage;
    }
    _inProgress = false;
    update();
    return isSuccess;
  }
}