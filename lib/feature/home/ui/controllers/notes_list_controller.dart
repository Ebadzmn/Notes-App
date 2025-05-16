

import 'package:get/get.dart';
import 'package:notesapp/app/app_urls.dart';
import 'package:notesapp/core/network_caller/network_caller.dart';
import 'package:notesapp/feature/home/models/task_model.dart';
import 'package:notesapp/feature/home/ui/controllers/notes_listByStatus_controller.dart';

class NewTaskController extends GetxController {
  bool _InProgress = false;
  bool get InProgress => _InProgress;
  String? _errorMessage;
  String? get errorMessage => _errorMessage;

  TaskListByStatus? _taskListByStatus;
  List<TaskModel> get TaskList => _taskListByStatus?.TaskList ?? [];


  Future <bool> getTaskList () async {
    bool isSuccess = false;
    _InProgress = true;
    update();
    final NetworkResponse response = await Get.find<NetworkCaller>().getRequest(url: AppUrls.listTaskByStatus('new'));
    if (response.isSuccess) {
      isSuccess = true;
      _errorMessage = null;
      _taskListByStatus = TaskListByStatus.fromJson(response.responseData!);
    }
    if (response.statusCode == 401 ) {
      _errorMessage = 'Something is wrong!';
    }
    _InProgress = false;
    update();
    return isSuccess;
  }
}
