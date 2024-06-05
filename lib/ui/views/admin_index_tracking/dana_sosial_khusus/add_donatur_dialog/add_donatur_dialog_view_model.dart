import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

import '../../../../../app/app.locator.dart';
import '../../../../../app/app.logger.dart';
import '../../../../../app/core/custom_base_view_model.dart';
import '../../../../../services/http_services.dart';
import '../../../../../services/my_easyloading.dart';

class AddDonaturDialogViewModel extends CustomBaseViewModel {
  final log = getLogger('AddDonaturDialogViewModel');
  final _httpService = locator<MyHttpServices>();
  final easyLoading = locator<MyEasyLoading>();

  final formKey = GlobalKey<FormState>();
  TextEditingController namaController = TextEditingController();

  Future<void> init() async {}

  Future<bool> addDonatur() async {
    setBusy(true);
    easyLoading.showLoading();
    try {
      await _httpService.postWithFormData(
          'donatur',
          FormData.fromMap({
            'nama_donatur': namaController.text,
          }));

      return true;
    } catch (e) {
      log.e(e);
      return false;
    } finally {
      setBusy(false);
      easyLoading.dismissLoading();
    }
  }
}
