import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:get/get.dart';
import 'package:letmegrab/controller/login_controller.dart';
import 'package:letmegrab/utils/constant.dart';
import 'package:letmegrab/view/common_widget/common_button.dart';
import 'package:letmegrab/view/common_widget/common_text.dart';
import 'package:letmegrab/view/common_widget/common_textField.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({super.key});

  final loginController = Get.put<AuthController>(AuthController());
  final _key = GlobalKey<FormBuilderState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: FormBuilder(
          key: _key,
          child: SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: Column(
                children: [
                  const SizedBox(height: 35),
                  const CommonText(text: "LOGIN", fontSize: 40, fontWeight: FontWeight.w900),
                  const SizedBox(height: 20),
                  CommonTextField(
                    hintText: "Email",
                    con: loginController.email,
                    borderColor: AppColor.primaryColor,
                    validator: FormBuilderValidators.compose([
                      FormBuilderValidators.required(errorText: "Please enter email"),
                      FormBuilderValidators.email(errorText: "Please enter valid email"),
                    ]),
                  ),
                  const SizedBox(height: 15),
                  CommonTextField(
                    hintText: "Password",
                    obscureText: true,
                    con: loginController.password,
                    borderColor: AppColor.primaryColor,
                    validator: FormBuilderValidators.compose([
                      FormBuilderValidators.required(errorText: "Please enter password"),
                    ]),
                  ),
                  const SizedBox(height: 30),
                  Obx(
                    () => Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        CommonButton(
                          height: 50,
                          buttonColor: AppColor.primaryColor,
                          load: loginController.load.value,
                          onPressed: () {
                            if (_key.currentState!.validate()) {
                              loginController.login();
                            }
                          },
                          label: "LOGIN",
                          labelColor: AppColor.white,
                          labelSize: 20,
                          labelWeight: FontWeight.bold,
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
