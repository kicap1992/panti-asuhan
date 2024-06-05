import 'package:shared_preferences/shared_preferences.dart';

import '../../../../app/app.dialogs.dart';
import '../../../../app/app.locator.dart';
import '../../../../app/app.logger.dart';
import '../../../../app/core/custom_base_view_model.dart';
import '../../../../services/http_services.dart';
import '../../../../services/my_easyloading.dart';

class StrukturOrganisasiViewModel extends CustomBaseViewModel {
  final log = getLogger('StrukturOrganisasiViewModel');
  final _httpService = locator<MyHttpServices>();
  final easyLoading = locator<MyEasyLoading>();
  String? role;

  Map<String, dynamic> dataKetua = {};
  Map<String, dynamic> dataSekretaris = {};
  Map<String, dynamic> dataBendahara = {};
  Map<String, dynamic> dataWakilBendahara = {};

  Map<String, dynamic> dataPengasuh = {};
  int dataPengasuhLength = 0;

  Map<String, dynamic> dataIbadah = {};
  int dataIbadahLength = 0;

  Map<String, dynamic> dataPendidikan = {};
  int dataPendidikanLength = 0;

  Map<String, dynamic> dataKebersihan = {};
  int dataKebersihanLength = 0;

  Map<String, dynamic> dataKesehatan = {};
  int dataKesehatanLength = 0;

  Map<String, dynamic> dataKeterampilan = {};
  int dataKeterampilanLength = 0;

  Map<String, dynamic> dataSaranaDanPrasarana = {};
  int dataSaranaDanPrasaranaLength = 0;

  Map<String, dynamic> dataKonsumsi = {};
  int dataKonsumsiLength = 0;

  Map<String, dynamic> dataKeamanan = {};
  int dataKeamananLength = 0;

  Map<String, dynamic> dataGedung = {};
  int dataGedungLength = 0;

  Map<String, dynamic> dataWisma = {};
  int dataWismaLength = 0;

  Map<String, dynamic> dataKelompokPutra = {};
  int dataKelompokPutraLength = 0;

  Map<String, dynamic> dataKelompokPutri = {};
  int dataKelompokPutriLength = 0;

  Future<void> init() async {
    prefs.then((SharedPreferences prefs) {
      role = prefs.getString('role');
    });
    getData('Ketua', false, null);
    getData('Sekretaris', false, null);
    getData('Bendahara', false, null);
    getData('Wakil Bendahara', false, null);
    getData('Seksi Pengasuh', true, dataPengasuhLength);
    getData('Seksi Ibadah', true, dataIbadahLength);
    getData('Seksi Pendidikan', true, dataPendidikanLength);
    getData('Seksi Kebersihan', true, dataKebersihanLength);
    getData('Seksi Kesehatan', true, dataKesehatanLength);
    getData('Seksi Keterampilan', true, dataKeterampilanLength);
    getData('Sarana dan Prasarana', true, dataSaranaDanPrasaranaLength);
    getData('Seksi Konsumsi', true, dataKonsumsiLength);
    getData('Seksi Keamanan', true, dataKeamananLength);
    getData('Seksi Gedung', true, dataGedungLength);
    getData('Seksi Wisma', true, dataWismaLength);
    getData('Kelompok Putra', true, dataKelompokPutraLength);
    getData('Kelompok Putri', true, dataKelompokPutriLength);
  }

  getData(String jabatan, bool stat, int? length) async {
    easyLoading.customLoading('Loading Data');
    setBusy(true);

    try {
      var response = await _httpService.get('jabatan?jabatan=$jabatan');
      // log.i(response.data);
      if (response.data['data'].length == 0) return;
      Map<String, dynamic> data = {};
      if (!stat) {
        var datanya = response.data['data'][0];
        data['nama'] = datanya['nama'];
        data['img_url'] = datanya['img_url'];
        // log.i(data);
        // return;
      } else {
        var datanya = response.data['data'];
        length = datanya.length;
        for (var i = 0; i < datanya.length; i++) {
          data['nama$i'] = datanya[i]['nama'];
          data['img_url$i'] = datanya[i]['img_url'];
        }
      }

      if (jabatan == 'Ketua') {
        dataKetua = data;
      } else if (jabatan == 'Sekretaris') {
        dataSekretaris = data;
      } else if (jabatan == 'Bendahara') {
        dataBendahara = data;
      } else if (jabatan == 'Wakil Bendahara') {
        dataWakilBendahara = data;
      } else if (jabatan == 'Seksi Pengasuh') {
        dataPengasuh = data;
        dataPengasuhLength = length!;
      } else if (jabatan == 'Seksi Ibadah') {
        dataIbadah = data;
        dataIbadahLength = length!;
      } else if (jabatan == 'Seksi Pendidikan') {
        dataPendidikan = data;
        dataPendidikanLength = length!;
      } else if (jabatan == 'Seksi Kebersihan') {
        dataKebersihan = data;
        dataKebersihanLength = length!;
      } else if (jabatan == 'Seksi Kesehatan') {
        dataKesehatan = data;
        dataKesehatanLength = length!;
      } else if (jabatan == 'Seksi Keterampilan') {
        dataKeterampilan = data;
        dataKeterampilanLength = length!;
      } else if (jabatan == 'Sarana dan Prasarana') {
        dataSaranaDanPrasarana = data;
        dataSaranaDanPrasaranaLength = length!;
      } else if (jabatan == 'Seksi Konsumsi') {
        dataKonsumsi = data;
        dataKonsumsiLength = length!;
      } else if (jabatan == 'Seksi Keamanan') {
        dataKeamanan = data;
        dataKeamananLength = length!;
      } else if (jabatan == 'Seksi Gedung') {
        dataGedung = data;
        dataGedungLength = length!;
      } else if (jabatan == 'Seksi Wisma') {
        dataWisma = data;
        dataWismaLength = length!;
      } else if (jabatan == 'Kelompok Putra') {
        dataKelompokPutra = data;
        dataKelompokPutraLength = length!;
      } else if (jabatan == 'Kelompok Putri') {
        dataKelompokPutri = data;
        dataKelompokPutriLength = length!;
      }
    } catch (e) {
      log.e(e);
    } finally {
      notifyListeners();
      setBusy(false);
      easyLoading.dismissLoading();
    }
  }

  void editData(String jabatan, bool bool) {
    var res = dialogService.showCustomDialog(
      variant: DialogType.editStrukrurOrganisasiDialogView,
      data: {
        "jabatan": jabatan,
        'tambahan': bool,
      },
    );

    res.whenComplete(() async => {
          // await Future.delayed(Duration(seconds: 1)),
          init(),
        });
  }
}
