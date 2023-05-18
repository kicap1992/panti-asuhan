import 'package:flutter/material.dart';
import 'package:panti_asuhan/app/core/custom_base_view_model.dart';

class TambahDanaSosialViewModel extends CustomBaseViewModel {
  String jenisDana = 'Pemasukan';
  List<String> jenisDanaList = ['Pemasukan', 'Pengeluaran'];

  final formKey = GlobalKey<FormState>();

  TextEditingController ketController = TextEditingController();
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
}
