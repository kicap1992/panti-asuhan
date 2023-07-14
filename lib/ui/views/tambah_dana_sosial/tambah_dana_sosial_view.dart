import 'package:flutter/material.dart';
import 'package:panti_asuhan/app/themes/app_colors.dart';
import 'package:panti_asuhan/app/themes/app_text.dart';
import 'package:panti_asuhan/ui/widgets/my_button.dart';
import 'package:panti_asuhan/ui/widgets/my_textformfield.dart';
import 'package:stacked/stacked.dart';
import 'package:validatorless/validatorless.dart';

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
                        "Nama Donator",
                        style: regularTextStyle.copyWith(color: mainColor),
                      ),
                      MyTextFormField(
                        hintText: "Nama Donatur",
                        controller: model.namaController,
                        maxLines: 1,
                        validator: Validatorless.required(
                            'Nama Donatur tidak boleh kosong'),
                      ),
                      const SizedBox(height: 20),
                      Text(
                        "Jumlah (Rp. )",
                        style: regularTextStyle.copyWith(color: mainColor),
                      ),
                      MyTextFormField(
                        hintText: "Jumlah (Rp. )",
                        keyboardType: TextInputType.number,
                        controller: model.jumlahController,
                        validator: Validatorless.multiple(
                          [
                            Validatorless.required('Jumlah tidak boleh kosong'),
                            Validatorless.number('Jumlah harus angka'),
                          ],
                        ),
                      ),
                      const SizedBox(height: 20),
                      Text(
                        "Tanggal",
                        style: regularTextStyle.copyWith(color: mainColor),
                      ),
                      MyTextFormField(
                        hintText: 'Tanggal',
                        readOnly: true,
                        controller: model.tanggalController,
                        validator: Validatorless.required(
                            'Tanggal  tidak boleh kosong'),
                        onTap: () {
                          model.changeDate(context);
                        },
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
