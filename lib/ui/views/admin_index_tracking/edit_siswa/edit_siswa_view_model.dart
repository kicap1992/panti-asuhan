import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../../app/app.dialogs.dart';
import '../../../../app/app.locator.dart';
import '../../../../app/app.logger.dart';
import '../../../../app/core/custom_base_view_model.dart';
import '../../../../model/siswa_model.dart';
import '../../../../services/http_services.dart';
import '../../../../services/my_easyloading.dart';

class EditSiswaViewModel extends CustomBaseViewModel {
  final log = getLogger('EditSiswaViewModel');
  final _httpService = locator<MyHttpServices>();
  final easyLoading = locator<MyEasyLoading>();
  String? role;
  SiswaModel? siswaModel;
  List<String> jenisKelaminList = ['Laki-laki', 'Perempuan'];
  String jenisKelamin = 'Laki-laki';

  TextEditingController namaController = TextEditingController();
  TextEditingController tanggalLahirController = TextEditingController();
  TextEditingController tempatLahirController = TextEditingController();
  TextEditingController alamatController = TextEditingController();
  TextEditingController noTelponController = TextEditingController();
  TextEditingController agamaController = TextEditingController();
  TextEditingController kewarganegaraanController = TextEditingController();
  TextEditingController pendidikanSDController = TextEditingController();
  TextEditingController pendidikanSMPController = TextEditingController();
  TextEditingController pendidikanSMAController = TextEditingController();
  TextEditingController kemampuanController = TextEditingController();
  TextEditingController hobiController = TextEditingController();
  TextEditingController jkController = TextEditingController();

  Future<void> init(int idSiswa) async {
    log.i('idSiswa: $idSiswa');
    getData(idSiswa);
    prefs.then((SharedPreferences prefs) {
      role = prefs.getString('role');
    });
  }

  getData(int idSiswa) async {
    // log.i('idSiswa: $idSiswa');
    setBusy(true);
    easyLoading.showLoading();
    try {
      var response = await _httpService.get('siswa_detail?id=$idSiswa');
      var datanya = response.data['data'];
      siswaModel = SiswaModel.fromJson(datanya);
      notifyListeners();
      log.i(siswaModel!.imgUrl);
      namaController.text = siswaModel!.nama!;
      tanggalLahirController.text = siswaModel!.tanggalLahir!;
      tempatLahirController.text = siswaModel!.tempatLahir!;
      alamatController.text = siswaModel!.alamat!;
      noTelponController.text = siswaModel!.noTelpon!;
      agamaController.text = siswaModel!.agama!;
      kewarganegaraanController.text = siswaModel!.kewarganegaraan!;
      pendidikanSDController.text = siswaModel!.pendidikanSd!;
      pendidikanSMPController.text = siswaModel!.pendidikanSmp!;
      pendidikanSMAController.text = siswaModel!.pendidikanSma!;
      kemampuanController.text = siswaModel!.kemampuan!;
      hobiController.text = siswaModel!.hobi!;
      jkController.text = siswaModel!.jenisKelamin!;
    } catch (e) {
      log.e(e);
    } finally {
      setBusy(false);
      easyLoading.dismissLoading();
    }
  }

  void deleteData() async {
    setBusy(true);
    easyLoading.showLoading();
    try {
      var response = await _httpService.postWithFormData(
        'siswa_delete',
        FormData.fromMap(
          {
            'id': siswaModel!.idSiswa,
          },
        ),
      );
      log.i(response.data);

      snackbarService.showSnackbar(
        message: 'Data berhasil dihapus',
        title: 'Berhasil',
        duration: const Duration(seconds: 2),
      );
      // navigationService.back();
    } catch (e) {
      snackbarService.showSnackbar(
        message: 'Data gagal dihapus',
        title: 'Gagal',
        duration: const Duration(seconds: 2),
      );
      log.e(e);
    } finally {
      setBusy(false);
      easyLoading.dismissLoading();
    }
  }

  editData() async {
    var res = await dialogService.showCustomDialog(
      variant: DialogType.editDialogSiswaView,
      data: siswaModel,
    );

    if (res?.confirmed != true) {
      init(int.parse(siswaModel!.idSiswa!));
    }
  }
}
