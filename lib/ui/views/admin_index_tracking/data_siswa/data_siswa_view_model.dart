import '../../../../app/app.dialogs.dart';
import '../../../../app/app.locator.dart';
import '../../../../app/app.logger.dart';
import '../../../../app/core/custom_base_view_model.dart';
import '../../../../model/siswa_model.dart';
import '../../../../services/http_services.dart';
import '../../../../services/my_easyloading.dart';
import '../add_siswa_dialog/add_siswa_dialog/add_siswa_dialog_view.dart';

class DataSiswaViewModel extends CustomBaseViewModel {
  final log = getLogger('DataSiswaViewModel');
  final _httpService = locator<MyHttpServices>();
  final easyLoading = locator<MyEasyLoading>();

  List<SiswaModel> siswaModelList = [];

  Future<void> init() async {
    await getData();
  }

  getData() async {
    setBusy(true);
    easyLoading.showLoading();
    try {
      var response = await _httpService.get('siswa');
      log.i(response.data);
      siswaModelList = [];

      var datanya = response.data['data'];
      // log.i(datanya.length);
      if (datanya.length > 0) {
        for (var item in datanya) {
          siswaModelList.add(SiswaModel.fromJson(item));
        }
      }

      setBusy(false);
      notifyListeners();
      log.i(siswaModelList);
    } catch (e) {
      log.e(e);
      setBusy(false);
    } finally {
      easyLoading.dismissLoading();
    }
  }

  void addSiswa() async {
    final res = await dialogService.showCustomDialog(
      variant: DialogType.addSiswaDialogView,
      data: DataSiswa(nama: null),
    );

    if (res?.confirmed != true) return;
    siswaModelList = [];
    await getData();
  }
}
