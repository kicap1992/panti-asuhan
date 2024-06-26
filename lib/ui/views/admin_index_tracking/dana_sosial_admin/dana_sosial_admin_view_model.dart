import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_file_downloader/flutter_file_downloader.dart';
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
  // final otherF
  String url = dotenv.env['url']!;

  int bulan = DateTime.now().month;

  List<DanaSosialModel> danaSosialModelList = [];
  List<Map<String, dynamic>> filteredByDateData = []; // newly added
  List<Map<String, dynamic>> monthIncomeOutcome = []; // newly added
  List<Map<String, dynamic>> yearIncomeOutcome = []; // newly added
  int totalIncome = 0; // newly added
  int totalOutcome = 0; // newly added

  String? role;
  bool? isLogin;

  int jumlahDonasi = 0;
  int jumlahPengeluaran = 0;

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
    // log.i(bulan);
    // change bulan to string and add 0 if it is less than 10
    String bulanString = bulan.toString().length == 1 ? '0$bulan' : '$bulan';
    // log.i(bulanString);
    try {
      var response = await _httpService.get('pemasukan?bulan=$bulanString');
      // log.i(response.data['jumlah']);
      // var theJumlahDonasi = response.data['jumlah'];
      jumlahDonasi = response.data['jumlah'];
      jumlahPengeluaran = response.data['jumlah_pengeluaran'];
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

      changeByDate(danaSosialModelList);
      getTahunan();
      notifyListeners();
      // log.i(danaSosialModelList.length);
    } catch (e) {
      log.e(e);
    } finally {
      setBusy(false);
      easyLoading.dismissLoading();
    }
  }

  getTahunan() async {
    try {
      var response = await _httpService.get('data_tahunan');

      var datanya = response.data['data'];
      log.i(datanya.length);
      for (int i = 0; i < datanya.length; i++) {
        log.i(datanya[i]);
        yearIncomeOutcome.add(datanya[i]);
      }
      notifyListeners();
    } catch (e) {
      log.e(e);
    }
  }

  //newly added
  changeByDate(List<DanaSosialModel> data) {
    filteredByDateData = [];

    for (var item in data) {
      var monthKey =
          item.tanggal!.substring(0, 7); // Extracting the year and month
      var dateKey = item.tanggal; // The full date

      var monthData = filteredByDateData.firstWhere(
          (element) => element['month'] == monthKey,
          orElse: () => {
                'month': monthKey,
                'data': [],
              });

      var dateData =
          monthData['data'].firstWhere((element) => element['date'] == dateKey,
              orElse: () => {
                    'date': dateKey,
                    'data_dana': [],
                  });

      dateData['data_dana'].add(item);

      if (!monthData['data'].contains(dateData)) {
        monthData['data'].add(dateData);
      }

      if (!filteredByDateData.contains(monthData)) {
        filteredByDateData.add(monthData);
      }
    }
    filteredByDateData.sort((a, b) => a['month'].compareTo(b['month']));
    // log.i(filteredByDateData);

    // group the data by month

    monthIncomeOutcome = [];

    for (var item in filteredByDateData) {
      var income = 0;
      var outcome = 0;

      for (var dateData in item['data']) {
        for (var danaSosialModel in dateData['data_dana']) {
          if (danaSosialModel.bentuk == 'Pemasukan' &&
              danaSosialModel.jenisDonasi == 'Uang') {
            income += int.parse(danaSosialModel.jumlah ?? '0');
          } else if (danaSosialModel.bentuk == 'Pengeluaran' &&
              danaSosialModel.jenisDonasi == 'Uang') {
            outcome += int.parse(danaSosialModel.jumlah ?? '0');
          }
        }
      }

      monthIncomeOutcome.add({
        'month': item['month'],
        'income': income,
        'outcome': outcome,
      });
    }

    // log.i(monthIncomeOutcome);
    totalIncome = 0;
    totalOutcome = 0;

    for (var item in monthIncomeOutcome) {
      totalIncome += int.parse(item['income'].toString());
      totalOutcome += int.parse(item['outcome'].toString());
    }

    log.i(totalIncome);
    log.i(totalOutcome);
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
      jumlahDonasi = response.data['jumlah_donasi'];
      jumlahPengeluaran = response.data['jumlah_pengeluaran'];
      // log.i(datanya.length);
      if (datanya.length > 0) {
        for (var item in datanya) {
          danaSosialModelList.add(DanaSosialModel.fromJson(item));
        }
      }

      setBusy(false);
      changeByDate(danaSosialModelList);
      notifyListeners();
      // log.i(danaSosialModelList);
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

      // log.i(sql);

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
            await _httpService.postWithFormData(
                'hapus_dana_sosial',
                FormData.fromMap({
                  'id_dana_sosial': parse,
                }));
            // log.i(response.data);
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
          // log.i('cancel');
          return;
        }
      },
    );
  }

  goToLaporanBulanan(data) async {
    // seeperate by "-", the first index is year, the second index is month
    String year = data.substring(0, data.indexOf('-'));
    String month = data.substring(data.indexOf('-') + 1);

    try {
      setBusy(true);
      easyLoading.customLoading("Mengunduh Laporan Bulanan...");
      await _httpService.get('laporan_bulanan?tahun=$year&bulan=$month');

      // if (response.data) {

      String urlPdf = '${url}assets/pdf/laporan_bulanan_$month,$year.pdf';
      log.i(urlPdf);
      FileDownloader.downloadFile(
          url: urlPdf,
          // name: "THE FILE NAME AFTER DOWNLOADING", //(optional)
          onProgress: (fileName, progress) {
            // change progress to 0-1
            double progressPercent = progress / 100;

            easyLoading.showProgress(
              progressPercent,
              "Downloading: $progress%",
            );
          },
          onDownloadCompleted: (String path) {
            easyLoading.dismissLoading();
            snackbarService.showSnackbar(
              message: "Laporan Bulanan Berhasil Tersimpan di $path",
              duration: const Duration(seconds: 3),
            );
          },
          onDownloadError: (String error) {
            // log.i('DOWNLOAD ERROR: $error');
            snackbarService.showSnackbar(
              message: "Laporan Bulanan Gagal Tersimpan: $error",
              duration: const Duration(seconds: 3),
            );
          });
      // }
    } catch (e) {
      log.e(e);
    } finally {
      setBusy(false);
      easyLoading.dismissLoading();
    }
  }

  getLaporanHarian(String filteredByDateData, String dayOfWeek) async {
    String date = filteredByDateData;
    String day = dayOfWeek;

    try {
      setBusy(true);
      easyLoading.customLoading("Mengunduh Laporan Harian...");
      await _httpService.get('laporan_harian?tanggal=$date&hari=$day');

      String urlPdf = '${url}assets/pdf/laporan_harian_$day,$date.pdf';
      log.i(urlPdf);

      FileDownloader.downloadFile(
          url: urlPdf,
          // name: "THE FILE NAME AFTER DOWNLOADING", //(optional)
          onProgress: (fileName, progress) {
            // change progress to 0-1
            double progressPercent = progress / 100;

            easyLoading.showProgress(
              progressPercent,
              "Downloading: $progress%",
            );
          },
          onDownloadCompleted: (String path) {
            easyLoading.dismissLoading();
            snackbarService.showSnackbar(
              message: "Laporan Harian Berhasil Tersimpan di $path",
              duration: const Duration(seconds: 3),
            );
          },
          onDownloadError: (String error) {
            // log.i('DOWNLOAD ERROR: $error');
            snackbarService.showSnackbar(
              message: "Laporan Harian Gagal Tersimpan: $error",
              duration: const Duration(seconds: 3),
            );
          });
    } catch (e) {
      log.e(e);
    } finally {
      setBusy(false);
      easyLoading.dismissLoading();
    }
  }

  goToLaporanTahunan(String yearIncomeOutcome) async {
    // log.i(yearIncomeOutcome);

    try {
      setBusy(true);
      easyLoading.customLoading("Mengunduh Laporan Tahun...");
      await _httpService.get('laporan_tahunan?tahun=$yearIncomeOutcome');

      // if (response.data) {

      String urlPdf = '${url}assets/pdf/laporan_tahunan_$yearIncomeOutcome.pdf';
      log.i(urlPdf);
      FileDownloader.downloadFile(
          url: urlPdf,
          // name: "THE FILE NAME AFTER DOWNLOADING", //(optional)
          onProgress: (fileName, progress) {
            // change progress to 0-1
            double progressPercent = progress / 100;

            easyLoading.showProgress(
              progressPercent,
              "Downloading: $progress%",
            );
          },
          onDownloadCompleted: (String path) {
            easyLoading.dismissLoading();
            snackbarService.showSnackbar(
              message: "Laporan Tahunan Berhasil Tersimpan di $path",
              duration: const Duration(seconds: 3),
            );
          },
          onDownloadError: (String error) {
            // log.i('DOWNLOAD ERROR: $error');
            snackbarService.showSnackbar(
              message: "Laporan Tahunan Gagal Tersimpan: $error",
              duration: const Duration(seconds: 3),
            );
          });
      // }
    } catch (e) {
      log.e(e);
    } finally {
      setBusy(false);
      easyLoading.dismissLoading();
    }
  }
}
