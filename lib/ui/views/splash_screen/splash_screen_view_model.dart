import '../../../app/app.logger.dart';
import '../../../app/app.router.dart';
import '../../../app/core/custom_base_view_model.dart';

class SplashScreenViewModel extends CustomBaseViewModel {
  final log = getLogger('SplashScreenViewModel');
  Future<void> init() async {
    // wait 2 seconds  then navigate to login
    await Future.delayed(const Duration(seconds: 2));
    await navigationService.navigateTo(
      Routes.loginScreenView,
    );
  }
}
