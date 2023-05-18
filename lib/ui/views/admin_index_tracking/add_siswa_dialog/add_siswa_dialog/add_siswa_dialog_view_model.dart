import 'dart:typed_data';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_holo_date_picker/flutter_holo_date_picker.dart';
import 'package:image_picker/image_picker.dart';
import 'package:panti_asuhan/app/app.locator.dart';
import 'package:panti_asuhan/app/core/custom_base_view_model.dart';

import '../../../../../app/app.logger.dart';
import '../../../../../services/http_services.dart';
import '../../../../../services/my_easyloading.dart';

class AddSiswaDialogViewModel extends CustomBaseViewModel {
  final log = getLogger('AddSiswaDialogViewModel');
  final _httpService = locator<MyHttpServices>();
  final easyLoading = locator<MyEasyLoading>();
  List<String> jenisKelaminList = ['Laki-laki', 'Perempuan'];

  String jenisKelamin = 'Laki-laki';

  // image picker
  String? _imagePath;
  final ImagePicker _picker = ImagePicker();
  XFile? imageFile;
  Uint8List? imageBytes;

  // form and text controller
  final formKey = GlobalKey<FormState>();

  TextEditingController nisController = TextEditingController();
  TextEditingController namaController = TextEditingController();
  TextEditingController tanggalLahirController = TextEditingController();
  TextEditingController alamatController = TextEditingController();
  TextEditingController keahlianController = TextEditingController();

  Future<void> init() async {}

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

  void addImage() async {
    try {
      final XFile? image = await _picker.pickImage(source: ImageSource.gallery);
      if (image != null) {
        imageFile = image;
        _imagePath = image.path;
        imageBytes = await image.readAsBytes();

        log.i('image path: $_imagePath');
        notifyListeners();
      }
    } catch (e) {
      log.e(e);
    }
  }

  Future<bool> postData() async {
    if (imageBytes == null) {
      easyLoading.showError('Foto belum dipilih');
      return false;
    }

    easyLoading.customLoading('Menambahkan data...');
    try {
      var formData = FormData.fromMap({
        'nis': nisController.text,
        'nama': namaController.text,
        'jenis_kelamin': jenisKelamin,
        'tanggal_lahir': tanggalLahirController.text,
        'alamat': alamatController.text,
        'keahlian': keahlianController.text,
        'foto': await MultipartFile.fromFile(_imagePath!),
      });

      var response = await _httpService.postWithFormData('siswa', formData);
      easyLoading.dismissLoading();
      log.i(response.data);
      easyLoading.showSuccess('Siswa berhasil ditambahkan');
      return true;
    } catch (e) {
      easyLoading.dismissLoading();
      snackbarService.showSnackbar(
        message: 'Terjadi kesalahan',
        title: 'Gagal',
        duration: const Duration(seconds: 4),
      );
      log.e(e);
      return false;
    }

    // completer(
    //   DialogResponse(
    //     confirmed: true,
    //   ),
    // );
  }
}
