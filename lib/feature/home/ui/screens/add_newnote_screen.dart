import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:go_router/go_router.dart';
import 'package:notesapp/app/app_colors.dart';
import 'package:notesapp/app/app_routes.dart';
import 'package:notesapp/feature/auth/data/models/sign_in_model.dart';
import 'package:notesapp/feature/auth/ui/controllers/sign_in_controller.dart';
import 'package:notesapp/feature/common/widget/show_snackbar_message.dart';
import 'package:notesapp/feature/home/models/task_model.dart';
import 'package:notesapp/feature/home/ui/controllers/add_newNote_controller.dart';

class AddNewNote extends StatefulWidget {
  const AddNewNote({super.key});

  @override
  State<AddNewNote> createState() => _AddNewNoteState();
}

class _AddNewNoteState extends State<AddNewNote> {
  final TextEditingController _titleTEController = TextEditingController();
  final TextEditingController _descriptionTEController = TextEditingController();

  final GlobalKey<FormState> _formKey = GlobalKey <FormState>();
  final AddNewTaskController _addNewTaskController = Get.find<AddNewTaskController>();

  void _addNew () async {
    if (_formKey.currentState!.validate()) {
      final bool isSuccess = await _addNewTaskController.AddNewTask(
        _titleTEController.text,
        _descriptionTEController.text,
        'new'
      );

      if (isSuccess) {
        context.go('/home');
      } else {
        showSnackBarMessage(context, _addNewTaskController.errorMessage!, true);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      onPopInvokedWithResult: (result,__){
        context.go('/home');
      },
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Form(
            key: _formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 150,),
                Center(child: Text('New Note',style: TextStyle(fontSize: 30 , fontWeight: FontWeight.normal, color: Colors.white),)),
                SizedBox(height: 20,),
                TextFormField(
                  controller: _titleTEController,
                  decoration: InputDecoration(
                      hintText: 'Title' ,
                  ),
                  textAlign: TextAlign.center,
                  validator: (String?value) {
                    if (value?.trim().isEmpty ?? true){
                      return 'Enter Title';
                    }
                    return null;
                  },
                ),
                SizedBox(height: 20,),
                TextFormField(
                  controller: _descriptionTEController,
                  decoration: InputDecoration(
                      hintText: 'Description'
                  ),
                  textAlign: TextAlign.center,
                  validator: (String?value) {
                    if (value?.isEmpty ?? true){
                      return 'Enter description';
                    }
                    return null;
                  },
                  maxLines: 5,
                ),
                SizedBox(height: 20,),
                GetBuilder<AddNewTaskController>(
                    builder: (controller) {
                      return Visibility(
                        visible: controller.InProgress == false,
                        replacement: Center(child: CircularProgressIndicator()),
                        child: Center(
                          child: ElevatedButton(
                            onPressed: _addNew,
                            child: const Text('Post'),
                          ),
                        ),);
                    }
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
