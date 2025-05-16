import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:go_router/go_router.dart';
import 'package:notesapp/app/app_colors.dart';
import 'package:notesapp/app/app_routes.dart';
import 'package:notesapp/feature/auth/data/models/sign_up_model.dart';
import 'package:notesapp/feature/auth/ui/controllers/sign_up_controller.dart';
import 'package:notesapp/feature/common/widget/show_snackbar_message.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final TextEditingController _emailTEController = TextEditingController();
  final TextEditingController _firstNameTEController = TextEditingController();
  final TextEditingController _lastNameTEController = TextEditingController();
  final TextEditingController _mobileTEController = TextEditingController();
  final TextEditingController _passwordTEController = TextEditingController();

  final GlobalKey<FormState> _formKey = GlobalKey <FormState>();
  final SignUpController _signUpController = Get.find<SignUpController>();

  Future<void> _onTabSignUpButton () async {
    if (_formKey.currentState!.validate()) {
      SignUpModel signUpModel = SignUpModel(
          email: _emailTEController.text.trim(),
          firstName: _firstNameTEController.text.trim(),
          lastName: _lastNameTEController.text.trim(),
          mobile: _mobileTEController.text.trim(),
          password: _passwordTEController.text,
      );
      final bool isSuccess = await _signUpController.signUp(signUpModel);
      if (isSuccess) {
        // Navigator.pushNamed(context, OtpVerifyScreen.name);
        context.go('/signIn');
      } else {
        showSnackBarMessage(context, _signUpController.errorMessage!, true);
      }
    }
  }

  void _onTabSignInButton () {
    context.replace('/signIn');
  }
  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      onPopInvokedWithResult: (result,__){
        context.go('/signIn');
      },
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Form(
            key: _formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Please Registration',style: TextStyle(fontSize: 30 , fontWeight: FontWeight.normal, color: Colors.white),),
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
                  controller: _firstNameTEController,
                  decoration: InputDecoration(
                      hintText: 'First Name'
                  ),
                  validator: (String?value) {
                    if (value?.trim().isEmpty ?? true){
                      return 'Enter Your First name';
                    }
                    return null;
                  },
                ),
                SizedBox(height: 20,),
                TextFormField(
                  controller: _lastNameTEController,
                  decoration: InputDecoration(
                      hintText: 'Last Name'
                  ),
                  validator: (String?value) {
                    if (value?.trim().isEmpty ?? true){
                      return 'Enter Your Last name';
                    }
                    return null;
                  },
                ),
                SizedBox(height: 20,),
                TextFormField(
                  controller: _mobileTEController,
                  decoration: InputDecoration(
                      hintText: 'Mobile Number'
                  ),
                  validator: (String?value) {
                    if (value?.trim().isEmpty ?? true){
                      return 'Enter Your Mobile Number';
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
                    text: 'Have Account? ',
                    style: const TextStyle(
                        color: Colors.grey,
                        fontWeight: FontWeight.w400
                    ),
                    children: [
                      TextSpan(
                          text: ' SignIN',
                          style: const TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.red
                          ),
                          recognizer: TapGestureRecognizer()..onTap = _onTabSignInButton
                      ),
                    ],
                  ),
                ),

                SizedBox(height: 20,),

                GetBuilder<SignUpController>(
                  builder: (controller) {
                    return Visibility(
                        visible: controller.signUpInProgress == false,
                        replacement: CircularProgressIndicator(),
                        child: ElevatedButton(
                          onPressed: _onTabSignUpButton,
                          child: const Text('Register Now'),
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
