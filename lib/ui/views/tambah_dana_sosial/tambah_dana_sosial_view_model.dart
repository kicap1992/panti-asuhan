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

  String bentukDonasi = 'Pemasukan';
  List<String> bentukDonasiList = ['Pemasukan', 'Pengeluaran'];

  String jenisDonasi = 'Uang';
  List<String> jenisDonasiList = ['Uang', 'Barang'];

  final formKey = GlobalKey<FormState>();

  TextEditingController namaController = TextEditingController();
  TextEditingController jumlahController = TextEditingController();
  TextEditingController jumlahBarangController = TextEditingController();
  TextEditingController tanggalController = TextEditingController();
  TextEditingController keteranganController = TextEditingController();

  // my revision syntax
  List<String> jenisBarangList = [
    'Beras',
    'Minyak',
    'Mi Instan',
    'Telur',
    'Gula',
    'Susu',
    'Pakaian'
  ];

  String jenisBarangSelected = 'Beras';
  String satuanSelected = 'Kg';
  // TextEditingController jumlahBarangController = TextEditingController();

  bool isJenisBarangSelected = true;
  List<String> satuanLiterKg = ['Liter', 'Kg'];
  List<String> satuanBungkusDos = ['Bungkus', 'Dos'];
  List<String> satuanButirRak = ['Butir', 'Rak'];
  List<String> satuanList = ['Liter', 'Kg'];

  // end of my revision syntax

  // the new revision syntax
  bool isKhusus = false;
  List<String> listDonatur = ['-Tiada Donatur-'];
  List<Map<String, dynamic>> listDonaturMap = [];
  String donaturSelected = '-Tiada Donatur-';
  int donaturSelectedIndex = 0;
  // end of the new revision syntax

  Future<void> init(bool isKhusus) async {
    this.isKhusus = isKhusus;

    if (isKhusus) {
      bentukDonasiList = ['Pemasukan'];
      getDonatur();
    }
  }

  getDonatur() async {
    setBusy(true);
    easyLoading.customLoading('Mengambil data...');

    try {
      var response = await _httpService.get('donatur');
      Map<String, dynamic> data = response.data;
      // log.i(data);
      int jumlah = data['jumlah'];
      if (jumlah > 0) {
        listDonatur.clear();
        for (var i = 0; i < data['data'].length; i++) {
          listDonatur.add(data['data'][i]['nama_donatur']);
          listDonaturMap.add(data['data'][i]);
        }
        // get the [id_donatur] of the first [donatur
        donaturSelected = listDonatur[0];
        donaturSelectedIndex = int.parse(listDonaturMap[0]['id_donatur']);
        log.i(donaturSelectedIndex);
      }
    } catch (e) {
      log.e(e);
    } finally {
      setBusy(false);
      easyLoading.dismissLoading();
    }
  }

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
    log.i(donaturSelectedIndex);
    try {
      var formData = FormData.fromMap({
        'bentuk': bentukDonasi,
        'nama': namaController.text,
        'jumlah': jumlahController.text,
        'tanggal': tanggalController.text,
        'ket': keteranganController.text,
        'jenis': jenisDonasi,
        'jenis_barang': jenisDonasi == 'Barang' ? jenisBarangSelected : null,
        'satuan': jenisDonasi == 'Barang' ? satuanSelected : null,
        'jumlah_barang':
            jenisDonasi == 'Barang' ? jumlahBarangController.text : null,
        'donatur': isKhusus ? donaturSelectedIndex : null,
      });

      var response =
          // await _httpService.postWithFormData('dana_sosial', formData);
          await _httpService.postWithFormData(
              !isKhusus ? 'dana_sosial' : 'dana_sosial_khusus', formData);
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

  // my revision syntax
  changeSatuan(String value) {
    jenisBarangSelected = value;
    switch (value) {
      case 'Beras':
        isJenisBarangSelected = true;
        satuanSelected = 'Kg';
        satuanList = satuanLiterKg;

        break;
      case 'Minyak':
        isJenisBarangSelected = false;
        satuanSelected = 'Liter';
        break;
      case 'Mi Instan':
        isJenisBarangSelected = true;
        satuanSelected = 'Bungkus';
        satuanList = satuanBungkusDos;
        break;
      case 'Telur':
        isJenisBarangSelected = true;
        satuanSelected = 'Butir';
        satuanList = satuanButirRak;
        break;
      case 'Gula':
        isJenisBarangSelected = true;
        satuanSelected = 'Kg';
        satuanList = satuanLiterKg;
        break;
      case 'Susu':
        isJenisBarangSelected = false;
        satuanSelected = 'Liter';
        break;
      case 'Pakaian':
        isJenisBarangSelected = false;
        satuanSelected = 'Helai';
        // satuanList = satuanButirRak;
        break;
      default:
        satuanSelected = '';
    }

    // notifyListeners();
  }
}
