import '../../../../app/app.logger.dart';
import '../../../../app/app.router.dart';
import '../../../../app/core/custom_base_view_model.dart';

class DanaSosialAdminViewModel extends CustomBaseViewModel {
  final log = getLogger('DanaSosialAdminViewModel');
  Future<void> init() async {}

  goToTambahDanaSosial() {
    navigationService.navigateTo(Routes.tambahDanaSosialView);
  }
}
