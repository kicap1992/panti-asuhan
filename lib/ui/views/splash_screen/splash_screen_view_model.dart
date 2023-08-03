import 'package:shared_preferences/shared_preferences.dart';

import '../../../app/app.logger.dart';
import '../../../app/app.router.dart';
import '../../../app/core/custom_base_view_model.dart';

class SplashScreenViewModel extends CustomBaseViewModel {
  final log = getLogger('SplashScreenViewModel');
  Future<void> init() async {
    // wait 2 seconds  then navigate to login
    await Future.delayed(const Duration(seconds: 2));
    prefs.then((SharedPreferences prefs) {
      if (prefs.getBool('isLogin') != true) {
        return navigationService.navigateTo(
          Routes.userIndexTrackingView,
        );
      }

      if (prefs.getString('role') == 'admin') {
        return navigationService.navigateTo(
          Routes.adminIndexTrackingView,
        );
      }

      if (prefs.getString('role') == 'pimpinan') {
        return navigationService.navigateTo(
          Routes.pimpinanIndexTrackingView,
        );
      }
    });

    // await navigationService.navigateTo(
    //   // Routes.loginScreenView,
    //   Routes.userIndexTrackingView,
    // );
  }
}
