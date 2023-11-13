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

  int bulan = DateTime.now().month;

  List<DanaSosialModel> danaSosialModelList = [];

  String? role;
  bool? isLogin;

  int jumlahDonasi = 0;

  Future<void> init() async {
    await getData();
    await getJumlahDonasi();
    prefs.then((SharedPreferences prefs) {
      role = prefs.getString('role');
      isLogin = prefs.getBool('isLogin');
    });
    // log.i(bulan);
  }

  getJumlahDonasi() async {
    setBusy(true);
    easyLoading.showLoading();
    // get the month
    var bulan = DateTime.now().month;
    log.i(bulan);
    // change bulan to string and add 0 if it is less than 10
    String bulanString = bulan.toString().length == 1 ? '0$bulan' : '$bulan';
    log.i(bulanString);
    try {
      var response = await _httpService.get('pemasukan?bulan=$bulanString');
      log.i(response.data['jumlah']);
      // var theJumlahDonasi = response.data['jumlah'];
      jumlahDonasi = response.data['jumlah'];
    } catch (e) {
      log.e(e);
    } finally {
      setBusy(false);
      easyLoading.dismissLoading();
    }
  }

  getData() async {
    setBusy(true);
    easyLoading.showLoading();
    try {
      var response = await _httpService.get('dana_sosial');
      // log.i(response.data);
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
      // log.i(response.data);
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

  deleteData(int parse) async {
    await dialogService
        .showDialog(
      title: 'Hapus Data',
      description: 'Apakah anda yakin ingin menghapus data ini?',
      buttonTitle: 'Hapus',
      cancelTitle: 'Batal',
      buttonTitleColor: Colors.red,
      cancelTitleColor: Colors.green,
    )
        .then(
      (value) async {
        if (value!.confirmed) {
          easyLoading.showLoading();
          setBusy(true);
          try {
            var response = await _httpService.postWithFormData(
                'hapus_dana_sosial',
                FormData.fromMap({
                  'id_dana_sosial': parse,
                }));
            log.i(response.data);
            easyLoading.dismissLoading();
            easyLoading.showSuccess('Data berhasil dihapus');
            getData();
            getJumlahDonasi();
          } on DioError catch (e) {
            // easyLoading.dismissLoading();
            log.e(e);
            easyLoading.showError('Terjadi kesalahan');
          } finally {
            setBusy(false);
            easyLoading.dismissLoading();
          }
        } else {
          log.i('cancel');
          return;
        }
      },
    );
  }
}
