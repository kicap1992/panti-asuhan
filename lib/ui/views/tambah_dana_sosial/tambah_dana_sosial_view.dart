import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:validatorless/validatorless.dart';

import '../../../app/themes/app_colors.dart';
import '../../../app/themes/app_text.dart';
import '../../widgets/my_button.dart';
import '../../widgets/my_textformfield.dart';
import './tambah_dana_sosial_view_model.dart';

class TambahDanaSosialView extends StatelessWidget {
  const TambahDanaSosialView({super.key});

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<TambahDanaSosialViewModel>.reactive(
      viewModelBuilder: () => TambahDanaSosialViewModel(),
      onViewModelReady: (TambahDanaSosialViewModel model) async {
        await model.init();
      },
      builder: (
        BuildContext context,
        TambahDanaSosialViewModel model,
        Widget? child,
      ) {
        return Scaffold(
          appBar: AppBar(
            title: const Text(
              "Form Dana Sosial",
              style: TextStyle(
                color: Colors.white,
                fontSize: 20,
              ),
            ),
            backgroundColor: mainColor,
            elevation: 0,
          ),
          body: Center(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
              child: Form(
                key: model.formKey,
                child: SingleChildScrollView(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Bentuk Donasi",
                        style: regularTextStyle.copyWith(color: mainColor),
                      ),
                      Container(
                        width: double.infinity,
                        height: 60,
                        padding: const EdgeInsets.symmetric(horizontal: 10),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(25),
                          border: Border.all(
                            color: mainColor,
                          ),
                        ),
                        child: DropdownButtonHideUnderline(
                          child: DropdownButton<String>(
                            value: model.bentukDonasi,
                            onChanged: (String? newValue) {
                              // model.setSelectedbentukDonasi(newValue!);
                              model.log.i(newValue);
                              model.bentukDonasi = newValue!;
                              model.notifyListeners();
                            },
                            items: model.bentukDonasiList.map((String value) {
                              return DropdownMenuItem<String>(
                                value: value,
                                child: Text(
                                  value,
                                  style: regularTextStyle.copyWith(
                                    fontSize: 16,
                                  ),
                                ),
                              );
                            }).toList(),
                          ),
                        ),
                      ),
                      const SizedBox(height: 20),
                      Visibility(
                        visible: model.bentukDonasi == 'Pemasukan',
                        child: Text(
                          "Nama Donator",
                          style: regularTextStyle.copyWith(color: mainColor),
                        ),
                      ),
                      Visibility(
                        visible: model.bentukDonasi == 'Pemasukan',
                        child: MyTextFormField(
                          hintText: "Nama Donatur",
                          controller: model.namaController,
                          maxLines: 1,
                          // validator: Validatorless.required(
                          //     'Nama Donatur tidak boleh kosong'),
                        ),
                      ),
                      Visibility(
                        visible: model.bentukDonasi == 'Pemasukan',
                        child: const SizedBox(height: 20),
                      ),
                      Text(
                        "Jenis Donasi / Pengeluaran",
                        style: regularTextStyle.copyWith(color: mainColor),
                      ),
                      Container(
                        width: double.infinity,
                        height: 60,
                        padding: const EdgeInsets.symmetric(horizontal: 10),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(25),
                          border: Border.all(
                            color: mainColor,
                          ),
                        ),
                        child: DropdownButtonHideUnderline(
                          child: DropdownButton<String>(
                            value: model.jenisDonasi,
                            onChanged: (String? newValue) {
                              // model.setSelectedjenisDonasi(newValue!);
                              model.log.i(newValue);
                              model.jenisDonasi = newValue!;
                              model.notifyListeners();
                            },
                            items: model.jenisDonasiList.map((String value) {
                              return DropdownMenuItem<String>(
                                value: value,
                                child: Text(
                                  value,
                                  style: regularTextStyle.copyWith(
                                    fontSize: 16,
                                  ),
                                ),
                              );
                            }).toList(),
                          ),
                        ),
                      ),
                      Visibility(
                        visible: model.jenisDonasi == 'Uang',
                        child: const SizedBox(height: 20),
                      ),
                      Visibility(
                        visible: model.jenisDonasi == 'Uang',
                        child: Text(
                          "Jumlah (Rp. )",
                          style: regularTextStyle.copyWith(color: mainColor),
                        ),
                      ),
                      Visibility(
                        visible: model.jenisDonasi == 'Uang',
                        child: MyTextFormField(
                          hintText: "Jumlah (Rp. ) Donasi",
                          keyboardType: TextInputType.number,
                          controller: model.jumlahController,
                          validator: model.jenisDonasi == 'Uang'
                              ? Validatorless.multiple(
                                  [
                                    Validatorless.required(
                                        'Jumlah tidak boleh kosong'),
                                    Validatorless.number('Jumlah harus angka'),
                                  ],
                                )
                              : null,
                        ),
                      ),
                      const SizedBox(height: 20),
                      Text(
                        "Tanggal",
                        style: regularTextStyle.copyWith(color: mainColor),
                      ),
                      MyTextFormField(
                        hintText: ' Pilih Tanggal',
                        readOnly: true,
                        controller: model.tanggalController,
                        validator: Validatorless.required(
                            'Tanggal  tidak boleh kosong'),
                        onTap: () {
                          model.changeDate(context);
                        },
                      ),
                      const SizedBox(height: 20),
                      Visibility(
                        visible: model.jenisDonasi == 'Barang',
                        child: Text(
                          "Keterangan",
                          style: regularTextStyle.copyWith(color: mainColor),
                        ),
                      ),
                      Visibility(
                        visible: model.jenisDonasi == 'Barang',
                        child: MyTextFormField(
                          hintText: 'Masukkan Keterangan',
                          maxLines: 3,
                          controller: model.keteranganController,
                          validator: model.jenisDonasi == 'Barang'
                              ? Validatorless.multiple(
                                  [
                                    Validatorless.required(
                                        'Keterangan tidak boleh kosong'),
                                  ],
                                )
                              : null,
                        ),
                      ),
                      const SizedBox(height: 20),
                      MyButton(
                        text: "Simpan Data",
                        onPressed: () {
                          if (model.formKey.currentState!.validate()) {
                            model.log.i('Form Valid');
                            model.addData();
                          }
                        },
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
