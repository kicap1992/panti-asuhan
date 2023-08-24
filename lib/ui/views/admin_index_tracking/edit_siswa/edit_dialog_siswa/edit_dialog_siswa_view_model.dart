import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_holo_date_picker/flutter_holo_date_picker.dart';

import '../../../../../app/app.locator.dart';
import '../../../../../app/app.logger.dart';
import '../../../../../app/core/custom_base_view_model.dart';
import '../../../../../model/siswa_model.dart';
import '../../../../../services/http_services.dart';
import '../../../../../services/my_easyloading.dart';

class EditDialogSiswaViewModel extends CustomBaseViewModel {
  final log = getLogger('EditDialogSiswaViewModel');
  final easyLoading = locator<MyEasyLoading>();
  final _httpService = locator<MyHttpServices>();
  SiswaModel? siswaModel;
  String jenisKelamin = 'Laki-laki';
  List<String> jenisKelaminList = ['Laki-laki', 'Perempuan'];

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
  final formKey = GlobalKey<FormState>();

  Future<void> init(data) async {
    log.i('data: $data');
    setBusy(true);
    siswaModel = data;
    notifyListeners();
    setBusy(false);
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

    jenisKelamin = siswaModel!.jenisKelamin!;

    notifyListeners();
  }

  void changeDate(BuildContext context) async {
    // get today's date
    var datePicked = await DatePicker.showSimpleDatePicker(
      context,
      initialDate: DateTime(2010),
      firstDate: DateTime(2000),
      lastDate: DateTime(2015),
      dateFormat: "dd-MMMM-yyyy",
      locale: DateTimePickerLocale.id,
      looping: true,
    );

    if (datePicked != null) {
      String date = datePicked.toString().split(' ')[0];
      tanggalLahirController.text = date;
    }
  }

  Future<bool> updateSiswa() async {
    setBusy(true);
    easyLoading.customLoading('Updating data...');

    try {
      var formData = FormData.fromMap({
        'id': siswaModel!.idSiswa,
        'nama': namaController.text,
        'tanggal_lahir': tanggalLahirController.text,
        'tempat_lahir': tempatLahirController.text,
        'jenis_kelamin': jenisKelamin,
        'alamat': alamatController.text,
        'no_telpon': noTelponController.text,
        'agama': agamaController.text,
        'kewarganegaraan': kewarganegaraanController.text,
        'pendidikan_sd': pendidikanSDController.text,
        'pendidikan_smp': pendidikanSMPController.text,
        'pendidikan_sma': pendidikanSMAController.text,
        'kemampuan': kemampuanController.text,
        'hobi': hobiController.text,
      });
      await _httpService.postWithFormData('siswa_edit', formData);
      snackbarService.showSnackbar(message: 'Data berhasil diupdate');
      return true;
    } catch (e) {
      log.e(e);
      return false;
    } finally {
      easyLoading.dismissLoading();
      setBusy(false);
    }
  }
}
