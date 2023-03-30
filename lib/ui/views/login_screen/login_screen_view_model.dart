import '../../../app/app.logger.dart';
import '../../../app/app.router.dart';
import '../../../app/core/custom_base_view_model.dart';

class LoginScreenViewModel extends CustomBaseViewModel {
  final log = getLogger('LoginScreenViewModel');
  Future<void> init() async {}

  goToAdmin() {
    log.d('goToAdmin');
    navigationService.navigateTo(Routes.adminIndexTrackingView);
  }
}
