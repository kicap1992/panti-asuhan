import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../app/app.logger.dart';
import '../../../app/app.router.dart';
import '../../../app/core/custom_base_view_model.dart';

class LoginScreenViewModel extends CustomBaseViewModel {
  final log = getLogger('LoginScreenViewModel');
  final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();
  Future<void> init() async {}

  final formKey = GlobalKey<FormState>();
  TextEditingController usernameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  login() {
    if (usernameController.text == 'admin' &&
        passwordController.text == 'admin') {
      _prefs.then((SharedPreferences prefs) {
        prefs.setBool('isLogin', true);
        prefs.setString('role', 'admin');
      });
      log.d('goToAdmin');
      navigationService.navigateTo(Routes.adminIndexTrackingView);
    } else if (usernameController.text == 'pimpinan' &&
        passwordController.text == 'pimpinan') {
      _prefs.then((SharedPreferences prefs) {
        prefs.setBool('isLogin', true);
        prefs.setString('role', 'pimpinan');
      });
      log.d('goToPimpinan');
      navigationService.navigateTo(Routes.pimpinanIndexTrackingView);
    } else {
      dialogService.showDialog(
        title: 'Gagal',
        description: 'Username atau password salah',
      );
      _prefs.then((SharedPreferences prefs) {
        prefs.setBool('isLogin', false);
        prefs.remove('role');
      });
    }
  }
}
