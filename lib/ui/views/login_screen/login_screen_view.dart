import 'package:flutter/material.dart';
import 'package:panti_asuhan/ui/widgets/my_button.dart';
import 'package:panti_asuhan/ui/widgets/my_textformfield.dart';
import 'package:stacked/stacked.dart';

import '../../../app/themes/app_text.dart';
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
                const MyTextFormField(
                  hintText: "Username",
                  prefixIcon: Icon(Icons.person),
                  // controller: model.usernameController,
                ),
                const SizedBox(
                  height: 10,
                ),
                const MyTextFormField(
                  hintText: "Password",
                  prefixIcon: Icon(Icons.lock),
                  // controller: model.passwordController,
                ),
                const SizedBox(
                  height: 10,
                ),
                SizedBox(
                  width: MediaQuery.of(context).size.width * 0.5,
                  child: MyButton(
                    text: "LOGIN",
                    onPressed: () {
                      model.goToAdmin();
                    },
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
