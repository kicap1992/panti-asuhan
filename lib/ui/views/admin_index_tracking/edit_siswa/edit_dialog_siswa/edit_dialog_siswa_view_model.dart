import 'package:flutter/cupertino.dart';
import 'package:flutter_holo_date_picker/flutter_holo_date_picker.dart';

import '../../../../../app/app.logger.dart';
import '../../../../../app/core/custom_base_view_model.dart';
import '../../../../../model/siswa_model.dart';

class EditDialogSiswaViewModel extends CustomBaseViewModel {
  final log = getLogger('EditDialogSiswaViewModel');
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
}
