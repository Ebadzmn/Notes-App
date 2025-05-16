import 'package:get/get.dart';
import 'package:notesapp/core/network_caller/network_caller.dart';
import 'package:notesapp/feature/auth/ui/controllers/auth_controller.dart';
import 'package:notesapp/feature/auth/ui/controllers/sign_in_controller.dart';
import 'package:notesapp/feature/auth/ui/controllers/sign_up_controller.dart';
import 'package:notesapp/feature/home/ui/controllers/add_newNote_controller.dart';

class ControllerBinder extends Bindings {
  @override
  void dependencies() {
    Get.put(SignUpController());
    Get.put(SignInController());
    Get.put(NetworkCaller());
    Get.put(AuthController());
    Get.put(AddNewTaskController());
  }
}