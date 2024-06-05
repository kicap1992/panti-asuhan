import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../app/app.locator.dart';
import '../../../app/app.logger.dart';
import '../../../app/core/custom_base_view_model.dart';
import '../../../model/dana_sosial_model.dart';
import '../../../services/http_services.dart';
import '../../../services/my_easyloading.dart';
import '../../../services/other_function.dart';

class DetailDanaSosialViewModel extends CustomBaseViewModel {
  final log = getLogger('DetailDanaSosialViewModel');
  final _httpService = locator<MyHttpServices>();
  final easyLoading = locator<MyEasyLoading>();

  bool isKhusus = false;

  int? idDanaSosial;
  DanaSosialModel? danaSosialModel;
  bool jenisBool = true;

  String? role;

  TextEditingController namaController = TextEditingController();
  TextEditingController tanggalController = TextEditingController();
  TextEditingController jumlahController = TextEditingController();
  TextEditingController jenisController = TextEditingController();
  TextEditingController keteranganController = TextEditingController();

  TextEditingController bentukController = TextEditingController();

  // my revision syntax
  TextEditingController jenisBarangController = TextEditingController();
  TextEditingController jumlahBarangController = TextEditingController();
  // TextEditingController satuanController = TextEditingController();

  Future<void> init(int id, bool isKhusus) async {
    log.i('init and id: $id');
    this.isKhusus = isKhusus;
    getData(id);
    idDanaSosial = id;
    prefs.then((SharedPreferences prefs) {
      role = prefs.getString('role');
    });
  }

  getData(int id) async {
    setBusy(true);
    easyLoading.showLoading();
    try {
      String url = isKhusus
          ? 'dana_sosial_khusus_detail?id=$id'
          : 'dana_sosial_detail?id=$id';
      var response = await _httpService.get(url);
      log.i(response.data['data']);
      danaSosialModel = DanaSosialModel.fromJson(response.data['data']);
      namaController.text = danaSosialModel!.nama!;
      tanggalController.text = danaSosialModel!.tanggal!;
      jumlahController.text =
          "Rp. ${OtherFunction().commaFormat(danaSosialModel!.jumlah != null ? int.parse(danaSosialModel!.jumlah!) : 0)}";
      jenisController.text = danaSosialModel!.jenisDonasi!;
      keteranganController.text = danaSosialModel!.keterangan!;

      bentukController.text = danaSosialModel!.bentuk!;

      // my revision syntax
      jenisBarangController.text = danaSosialModel!.jenisBarang!;
      jumlahBarangController.text =
          '${danaSosialModel!.jumlahBarang!} ${danaSosialModel!.satuan!}';
      // satuanController.text = danaSosialModel!.satuan! ;

      if (danaSosialModel!.jenisDonasi == 'Uang') {
        jenisBool = true;
      } else {
        jenisBool = false;
      }
      // log.i('status: ${danaSosialModel!.status}');
      setBusy(false);
      notifyListeners();
    } catch (e) {
      log.e(e);
      setBusy(false);
    } finally {
      easyLoading.dismissLoading();
    }
  }

  void handleTtd() {
    dialogService
        .showConfirmationDialog(
      title: 'Konfirmasi',
      description: 'Apakah anda yakin ingin mengkonfirmasi tanda tangan ini?',
      cancelTitle: 'Tidak',
      confirmationTitle: 'Ya',
    )
        .then((value) async {
      if (value!.confirmed) {
        setBusy(true);
        easyLoading.showLoading();
        try {
          FormData formData = FormData.fromMap({
            'id': idDanaSosial,
          });
          String url = isKhusus ? 'dana_sosial_khusus_ttd' : 'dana_sosial_ttd';

          var response = await _httpService.postWithFormData(url, formData);
          log.i(response.data);
          getData(idDanaSosial!);

          setBusy(false);
          notifyListeners();
        } catch (e) {
          log.e(e);
          setBusy(false);
          dialogService.showDialog(
            title: 'Error',
            description: e.toString(),
          );
        } finally {
          easyLoading.dismissLoading();
        }
      }
    });
  }
}
