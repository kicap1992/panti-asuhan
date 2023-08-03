import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:validatorless/validatorless.dart';

import '../../../app/app.router.dart';
import '../../../app/themes/app_text.dart';
import '../../widgets/my_button.dart';
import '../../widgets/my_textformfield.dart';
import './login_screen_view_model.dart';

class LoginScreenView extends StatelessWidget {
  const LoginScreenView({super.key});

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<LoginScreenViewModel>.reactive(
      viewModelBuilder: () => LoginScreenViewModel(),
      onViewModelReady: (LoginScreenViewModel model) async {
        await model.init();
      },
      builder: (
        BuildContext context,
        LoginScreenViewModel model,
        Widget? child,
      ) {
        return Scaffold(
          body: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
            child: SingleChildScrollView(
              child: Form(
                key: model.formKey,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.2,
                    ),
                    // show the logo.png
                    const Center(
                      child: Image(
                        image: AssetImage("assets/logo.png"),
                        width: 150,
                        height: 150,
                      ),
                    ),
                    const SizedBox(height: 10),
                    Text(
                      "SILAHKAN LOGIN",
                      style: boldTextStyle.copyWith(
                        fontSize: 18,
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    MyTextFormField(
                      hintText: "Username",
                      prefixIcon: const Icon(Icons.person),
                      controller: model.usernameController,
                      validator:
                          Validatorless.required("Username tidak boleh kosong"),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    MyTextFormField(
                      hintText: "Password",
                      prefixIcon: const Icon(Icons.lock),
                      controller: model.passwordController,
                      obscureText: true,
                      validator:
                          Validatorless.required("Password tidak boleh kosong"),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    SizedBox(
                      width: MediaQuery.of(context).size.width * 0.5,
                      child: MyButton(
                        text: "LOGIN",
                        onPressed: () {
                          if (model.formKey.currentState!.validate()) {
                            model.login();
                          }
                        },
                      ),
                    ),
                    TextButton(
                      onPressed: () {
                        model.navigationService
                            .navigateTo(Routes.userIndexTrackingView);
                      },
                      child: const Text(
                        "Kembali ke beranda",
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
