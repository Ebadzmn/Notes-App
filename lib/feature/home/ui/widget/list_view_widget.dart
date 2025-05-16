import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:notesapp/app/app_urls.dart';
import 'package:notesapp/core/network_caller/network_caller.dart';
import 'package:notesapp/feature/common/widget/show_snackbar_message.dart';
import 'package:notesapp/feature/home/ui/controllers/notes_list_controller.dart';
import 'package:notesapp/feature/home/ui/widget/list_widget.dart';

class ListViewWidget extends StatefulWidget {
  const ListViewWidget({super.key});


  @override
  State<ListViewWidget> createState() => _ListViewWidgetState();
}
int? _deletingIndex;

class _ListViewWidgetState extends State<ListViewWidget> {
  @override
  Widget build(BuildContext context) {
    void _updateTodoStatus(String id, int index,VoidCallback onSuccess) async {
      setState(() {
        _deletingIndex = index;
      });
      final response = await Get.find<NetworkCaller>().getRequest(
        url: AppUrls.updateTaskStatusUrl(id, 'cancelled'),
      );
      setState(() {
        _deletingIndex = null;
      });

      if (response.isSuccess) {
        onSuccess();
      } else {
        showSnackBarMessage(context, 'Delete failed');
      }
    }
    return GetBuilder(
      init: NewTaskController()..getTaskList(),
      builder: (controller) {
        if (controller.InProgress) {
          return Center(child: CircularProgressIndicator());
        }

        return ListView.builder(
          shrinkWrap: true,
          physics: NeverScrollableScrollPhysics(),
          itemCount: controller.TaskList.length,
          itemBuilder: (context, index) {
            final task = controller.TaskList[index];
            return Container(
              margin: EdgeInsets.all(8),
              decoration: BoxDecoration(
                color: Colors.grey[900],
                borderRadius: BorderRadius.circular(16),
              ),
              child: ListWidget(
                task: task,
                isDeleting: _deletingIndex == index,
                onDelete: () {
                  _updateTodoStatus(task.sId!, index, () {
                    controller.TaskList.removeAt(index);
                    controller.update();
                  });
                },
              ),
            );
          },
        );
      },
    );
  }
}