
import 'package:get/get.dart';
import 'package:notesapp/app/app_urls.dart';
import 'package:notesapp/core/network_caller/network_caller.dart';

class AddNewTaskController extends GetxController {
  bool _InProgress = false;
  bool get InProgress => _InProgress;
  String? _errorMessage;
  String? get errorMessage => _errorMessage;

  Future <bool> AddNewTask (String title, String description , String status) async {
    bool isSuccess = false;
    _InProgress = true;
    update();

    Map <String, dynamic> requestBody = {
      'title' : title,
      'description' : description,
      'status' : status
    };
    final NetworkResponse response = await Get.find<NetworkCaller>().postRequest(url: AppUrls.createUrl, body: requestBody);

    // final NetworkResponse response = await NetworkCaller.postRequest(url: AppUrls.createUrl, body: requestBody);
    if (response.isSuccess) {
      isSuccess = true;
      _errorMessage = null;
    }
    if (response.statusCode == 401 ) {
      _errorMessage = 'Something Wrong';
    }
    _InProgress = false;
    update();
    return isSuccess;
  }
}