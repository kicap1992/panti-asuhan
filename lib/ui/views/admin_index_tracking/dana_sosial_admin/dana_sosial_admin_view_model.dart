import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../../app/app.dialogs.dart';
import '../../../../app/app.locator.dart';
import '../../../../app/app.logger.dart';
import '../../../../app/app.router.dart';
import '../../../../app/core/custom_base_view_model.dart';
import '../../../../model/dana_sosial_model.dart';
import '../../../../services/http_services.dart';
import '../../../../services/my_easyloading.dart';
import '../../../../services/other_function.dart';

class DanaSosialAdminViewModel extends CustomBaseViewModel {
  final log = getLogger('DanaSosialAdminViewModel');
  final _httpService = locator<MyHttpServices>();
  final easyLoading = locator<MyEasyLoading>();

  List<DanaSosialModel> danaSosialModelList = [];

  String? role;
  bool? isLogin;

  Future<void> init() async {
    await getData();
    prefs.then((SharedPreferences prefs) {
      role = prefs.getString('role');
      isLogin = prefs.getBool('isLogin');
    });
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

  getFilter(String sql) async {
    setBusy(true);
    easyLoading.showLoading();
    FormData formData = FormData.fromMap({
      'sql': sql,
    });
    try {
      var response = await _httpService.postWithFormData(
        'filter_dana',
        formData,
      );
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

  filterDialog(BuildContext context) async {
    // create a dialog
    final res = await dialogService.showCustomDialog(
      variant: DialogType.filterDialogView,
    );

    if (res!.confirmed) {
      String jenisDonasi = res.data['jenisDonasi'] == 'Semua'
          ? ''
          : "jenis = '${res.data['jenisDonasi']}' and ";
      String bulan = res.data['bulan'] == 'Semua'
          ? ''
          : "tanggal like '%-${OtherFunction().changeMonth(res.data['bulan'])}-%' and ";
      String tahun = res.data['tahun'] == 'Semua'
          ? ''
          : 'tanggal like "%${res.data['tahun']}-%" and ';
      String status = res.data['status'] == 'Semua'
          ? ''
          : (res.data['status'] == 'Belum Dikonfirmasi')
              ? 'status = 0'
              : 'status = 1';

      if (jenisDonasi == 'Semua' &&
          bulan == 'Semua' &&
          tahun == 'Semua' &&
          status == 'Semua') {
        getData();
        return;
      }

      String sql =
          'Select * from tb_dana_sosial where $jenisDonasi$bulan$tahun$status';

      // check the last 3 character if it is 'or ' then remove it
      // if (sql.substring(sql.length - 3) == 'or ') {
      //   sql = sql.substring(0, sql.length - 3);
      // }
      if (sql.substring(sql.length - 4) == 'and ') {
        sql = sql.substring(0, sql.length - 4);
      }

      log.i(sql);

      getFilter(sql);
    }
  }

  goToEditDanaSosial(int id) async {
    navigationService.navigateTo(
      Routes.detailDanaSosialView,
      arguments: DetailDanaSosialViewArguments(
        id: id,
      ),
    );
  }
}
