import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

import '../../../app/app.locator.dart';
import '../../../app/app.logger.dart';
import '../../../app/app.router.dart';
import '../../../app/core/custom_base_view_model.dart';
import '../../../services/http_services.dart';
import '../../../services/my_easyloading.dart';

class TambahDanaSosialViewModel extends CustomBaseViewModel {
  final log = getLogger('TambahDanaSosialViewModel');
  final _httpService = locator<MyHttpServices>();
  final easyLoading = locator<MyEasyLoading>();

  String jenisDana = 'Pemasukan';
  List<String> jenisDanaList = ['Pemasukan', 'Pengeluaran'];

  final formKey = GlobalKey<FormState>();

  TextEditingController namaController = TextEditingController();
  TextEditingController jumlahController = TextEditingController();
  TextEditingController tanggalController = TextEditingController();

  Future<void> init() async {}

  void changeDate(BuildContext context) async {
    // get today's date
    var datePicked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2000),
      // last date is today's date
      lastDate: DateTime.now(),
    );

    if (datePicked != null) {
      String date = datePicked.toString().split(' ')[0];
      tanggalController.text = date;
    }
  }

  void addData() async {
    easyLoading.customLoading('Menambahkan data...');
    try {
      var formData = FormData.fromMap({
        'nama': namaController.text,
        'jumlah': jumlahController.text,
        'tanggal': tanggalController.text,
      });
      var response =
          await _httpService.postWithFormData('dana_sosial', formData);
      log.i(response.data);
      easyLoading.showSuccess(" Data berhasil ditambahkan");
      navigationService.navigateTo(Routes.adminIndexTrackingView);
    } catch (e) {
      log.e(e);
      snackbarService.showSnackbar(
        message: 'Gagal menambahkan data',
        title: 'Error',
        duration: const Duration(seconds: 4),
      );
    } finally {
      easyLoading.dismissLoading();
    }
  }
}
