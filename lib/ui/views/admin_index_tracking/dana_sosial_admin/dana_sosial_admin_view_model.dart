import '../../../../app/app.locator.dart';
import '../../../../app/app.logger.dart';
import '../../../../app/app.router.dart';
import '../../../../app/core/custom_base_view_model.dart';
import '../../../../model/dana_sosial_model.dart';
import '../../../../services/http_services.dart';
import '../../../../services/my_easyloading.dart';

class DanaSosialAdminViewModel extends CustomBaseViewModel {
  final log = getLogger('DanaSosialAdminViewModel');
  final _httpService = locator<MyHttpServices>();
  final easyLoading = locator<MyEasyLoading>();

  List<DanaSosialModel> danaSosialModelList = [];

  Future<void> init() async {
    await getData();
  }

  getData() async {
    setBusy(true);
    easyLoading.showLoading();
    try {
      var response = await _httpService.get('dana_sosial');
      log.i(response.data);
      danaSosialModelList = [];

      var datanya = response.data['data'];
      // log.i(datanya.length);
      if (datanya.length > 0) {
        for (var item in datanya) {
          danaSosialModelList.add(DanaSosialModel.fromJson(item));
        }
      }

      setBusy(false);
      notifyListeners();
      log.i(danaSosialModelList);
    } catch (e) {
      log.e(e);
      setBusy(false);
    } finally {
      easyLoading.dismissLoading();
    }
  }

  goToTambahDanaSosial() {
    navigationService.navigateTo(Routes.tambahDanaSosialView);
  }
}
