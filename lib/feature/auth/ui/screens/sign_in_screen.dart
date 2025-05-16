import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:go_router/go_router.dart';
import 'package:notesapp/app/app_colors.dart';
import 'package:notesapp/app/app_routes.dart';
import 'package:notesapp/feature/auth/data/models/sign_in_model.dart';
import 'package:notesapp/feature/auth/ui/controllers/sign_in_controller.dart';
import 'package:notesapp/feature/common/widget/show_snackbar_message.dart';

class SignInScreen extends StatefulWidget {
  const SignInScreen({super.key});

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  final TextEditingController _emailTEController = TextEditingController();
  final TextEditingController _passwordTEController = TextEditingController();

  final GlobalKey<FormState> _formKey = GlobalKey <FormState>();
  final SignInController _signInController = Get.find<SignInController>();

  void _onTabSignInButton () async {
    if (_formKey.currentState!.validate()) {
      SignInRequestModel signInRequestModel = SignInRequestModel(email: _emailTEController.text.trim(), password: _passwordTEController.text);
      final bool isSuccess = await _signInController.signIn(signInRequestModel);
      if (isSuccess) {
        context.go('/home');
      } else {
        showSnackBarMessage(context, _signInController.errorMessage!, true);
      }
    }
  }
  void _onTabSignUpButton () {
    context.go('/signUp');
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Form(
          key: _formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Please Login',style: TextStyle(fontSize: 30 , fontWeight: FontWeight.normal, color: Colors.white),),
              SizedBox(height: 20,),
              TextFormField(
                controller: _emailTEController,
                decoration: InputDecoration(
                    hintText: 'Email'
                ),
                validator: (String?value) {
                  if (value?.trim().isEmpty ?? true){
                    return 'Enter Your email address';
                  }
                  return null;
                },
              ),
              SizedBox(height: 20,),
              TextFormField(
                controller: _passwordTEController,
                obscureText: true,
                decoration: InputDecoration(
                    hintText: 'Password'
                ),
                validator: (String?value) {
                  if (value?.isEmpty ?? true){
                    return 'Enter Your Password';
                  }
                  return null;
                },
              ),
              SizedBox(height: 20,),
              RichText(
                text: TextSpan(
                  text: 'Need to Account? ',
                  style: const TextStyle(
                      color: Colors.grey,
                      fontWeight: FontWeight.w400
                  ),
                  children: [
                    TextSpan(
                        text: ' SignUP',
                        style: const TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.green
                        ),
                        recognizer: TapGestureRecognizer()..onTap = _onTabSignUpButton
                    ),
                  ],
                ),
              ),
              SizedBox(height: 20,),
              GetBuilder<SignInController>(
                  builder: (controller) {
                    return Visibility(
                      visible: controller.inProgress == false,
                      replacement: CircularProgressIndicator(),
                      child: ElevatedButton(
                        onPressed: _onTabSignInButton,
                        child: const Text('Login Now'),
                      ),);
                  }
              )
            ],
          ),
        ),
      ),
    );
  }
}
