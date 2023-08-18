import 'dart:typed_data';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:http_parser/http_parser.dart';
import 'package:image_picker/image_picker.dart';

import '../../../../../app/app.locator.dart';
import '../../../../../app/app.logger.dart';
import '../../../../../app/core/custom_base_view_model.dart';
import '../../../../../services/http_services.dart';
import '../../../../../services/my_easyloading.dart';
import 'edit_strukrur_organisasi_dialog_view.dart';

class EditStrukrurOrganisasiDialogViewModel extends CustomBaseViewModel {
  final log = getLogger('EditStrukrurOrganisasiDialogViewModel');
  final easyloading = locator<MyEasyLoading>();
  final _httpService = locator<MyHttpServices>();

  List<Widget> child = [];
  Map<String, TextEditingController> controllers = {};
  int controllerIndex = 1;

  Map<String, Key> keys = {};

  // image picker
  Map<String, String> imagePaths = {};
  ImagePicker picker = ImagePicker();
  Map<String, XFile> imageFiles = {};
  Map<String, Uint8List> imageBytes = {};

  late String name;

  Future<void> init(data) async {
    name = data['jabatan'];
    log.i(data);
    // create controller
    createController('$name$controllerIndex');
    keys['$name$controllerIndex'] = UniqueKey();

    // add theWidget to child
    child.add(TheWidget(
      controller: controllers['$name$controllerIndex']!,
      index: controllerIndex,
      key: keys['$name$controllerIndex']!,
    ));
  }

  void createController(String key) {
    controllers[key] = TextEditingController();
  }

  void addWidget() {
    controllerIndex++;
    createController('$name$controllerIndex');
    keys['$name$controllerIndex'] = UniqueKey();
    child.add(TheWidget(
      controller: controllers['$name$controllerIndex']!,
      index: controllerIndex,
      key: keys['$name$controllerIndex']!,
    ));
    notifyListeners();
  }

  void disposeSingleController(String key) {
    controllers[key]!.dispose();
    controllers.remove(key);
  }

  check() {
    log.i(controllers);
  }

  ///////////  utk gambar //////////////

  void addImage(int index) async {
    try {
      final XFile? image = await picker.pickImage(source: ImageSource.gallery);
      if (image != null) {
        imageFiles['image$index'] = image;
        imagePaths['image$index'] = image.path;
        imageBytes['image$index'] = await image.readAsBytes();

        log.i('image path: ${imagePaths['image$index']}');
        notifyListeners();
      }
    } catch (e) {
      log.e(e);
    }
  }

  uploadJabatan() async {
    Map<String, dynamic> array = {
      'jabatan': name,
      'jumlah': controllers.length.toString(),
    };

    // log.i(imagePaths.values);

    // rearrange the data
    for (var i = 1; i <= controllers.length; i++) {
      String key = controllers.keys.elementAt(i - 1);
      array['nama$i'] = controllers[key]!.text;
      // array['nama$i'] = controllers['$name$i']!.text;
      array['image$i'] = await MultipartFile.fromFile(
        imagePaths.values.elementAt(i - 1),
        filename: imageFiles.values.elementAt(i - 1).name,
        contentType: MediaType.parse('image/jpeg'),
      );
    }

    FormData formData = FormData.fromMap(array);

    // // // log.i(formData.fields);
    var response =
        await _httpService.postWithFormData('edit_jabatan', formData);

    log.i(response.data);

    setBusy(true);
    easyloading.customLoading('Edit Detail Jabatan $name');
    await Future.delayed(const Duration(seconds: 1));
    easyloading.dismissLoading();
    setBusy(false);
  }

  void removeWidget(int index, Key containerKey) {
    log.i('remove widget $index');
    // remove the widget that has key
    child.removeWhere((element) => element.key == containerKey);

    // remove the controller
    disposeSingleController('$name$index');
    // // remove the image
    imageFiles.remove('image$index');
    imagePaths.remove('image$index');
    imageBytes.remove('image$index');

    log.i(controllers);
    log.i(imagePaths);

    notifyListeners();
  }
}
