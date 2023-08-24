import 'package:flutter/material.dart';
import 'package:panti_asuhan/app/themes/app_colors.dart';
import 'package:panti_asuhan/app/themes/app_text.dart';
import 'package:panti_asuhan/ui/widgets/my_textformfield.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:validatorless/validatorless.dart';

import './edit_dialog_siswa_view_model.dart';

class EditDialogSiswaView extends StatelessWidget {
  final DialogRequest request;
  final Function(DialogResponse) completer;

  const EditDialogSiswaView({
    Key? key,
    required this.request,
    required this.completer,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<EditDialogSiswaViewModel>.reactive(
      viewModelBuilder: () => EditDialogSiswaViewModel(),
      onViewModelReady: (EditDialogSiswaViewModel model) async {
        await model.init(request.data);
      },
      builder: (
        BuildContext context,
        EditDialogSiswaViewModel model,
        Widget? child,
      ) {
        return Dialog(
          child: Container(
            padding: const EdgeInsets.all(20),
            decoration: const BoxDecoration(
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(10),
                topRight: Radius.circular(10),
              ),
            ),
            child: SingleChildScrollView(
              child: Form(
                key: model.formKey,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const Center(
                      child: Text(
                        'Edit Data Siswa',
                        style: boldTextStyle,
                      ),
                    ),
                    const SizedBox(height: 10),
                    Text(
                      '   Nama',
                      style: regularTextStyle.copyWith(
                        fontSize: 12,
                        color: mainColor,
                      ),
                    ),
                    MyTextFormField(
                      hintText: 'Masukkan Nama',
                      controller: model.namaController,
                      validator:
                          Validatorless.required('Nama tidak boleh kosong'),
                    ),
                    const SizedBox(height: 10),
                    Text(
                      '   Tanggal Lahir',
                      style: regularTextStyle.copyWith(
                        fontSize: 12,
                        color: mainColor,
                      ),
                    ),
                    MyTextFormField(
                      controller: model.tanggalLahirController,
                      readOnly: true,
                      validator: Validatorless.required(
                          'Tanggal lahir tidak boleh kosong'),
                      onTap: () {
                        model.changeDate(context);
                      },
                    ),
                    const SizedBox(height: 10),
                    Text(
                      '   Tempat Lahir',
                      style: regularTextStyle.copyWith(
                        fontSize: 12,
                        color: mainColor,
                      ),
                    ),
                    MyTextFormField(
                      hintText: 'Masukkan Tempat Lahir',
                      controller: model.tempatLahirController,
                      validator: Validatorless.required(
                          'Tempat lahir tidak boleh kosong'),
                    ),
                    const SizedBox(height: 10),
                    Text(
                      '   Jenis Kelamin',
                      style: regularTextStyle.copyWith(
                        fontSize: 12,
                        color: mainColor,
                      ),
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
                          value: model.jenisKelamin,
                          onChanged: (String? newValue) {
                            // model.setSelectedJenisKelamin(newValue!);
                            model.log.i(newValue);
                            model.jenisKelamin = newValue!;
                            model.notifyListeners();
                          },
                          items: model.jenisKelaminList.map((String value) {
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
                    const SizedBox(height: 10),
                    Text(
                      '   No. Telepon',
                      style: regularTextStyle.copyWith(
                        fontSize: 12,
                        color: mainColor,
                      ),
                    ),
                    MyTextFormField(
                      hintText: 'Masukkan No. Telepon',
                      controller: model.noTelponController,
                      validator: Validatorless.multiple(
                        [
                          Validatorless.required(
                              'No. telepon tidak boleh kosong'),
                          Validatorless.number(
                              'No. telepon harus berupa angka'),
                        ],
                      ),
                    ),
                    const SizedBox(height: 10),
                    Text(
                      '   Agama',
                      style: regularTextStyle.copyWith(
                        fontSize: 12,
                        color: mainColor,
                      ),
                    ),
                    MyTextFormField(
                      controller: model.agamaController,
                      validator:
                          Validatorless.required('Agama tidak boleh kosong'),
                    ),
                    const SizedBox(height: 10),
                    Text(
                      '   Kewarganegaraan',
                      style: regularTextStyle.copyWith(
                        fontSize: 12,
                        color: mainColor,
                      ),
                    ),
                    MyTextFormField(
                      controller: model.kewarganegaraanController,
                      validator: Validatorless.required(
                          'Kewarganegaraan tidak boleh kosong'),
                    ),
                    const SizedBox(height: 10),
                    Text(
                      '   Alamat',
                      style: regularTextStyle.copyWith(
                        fontSize: 12,
                        color: mainColor,
                      ),
                    ),
                    MyTextFormField(
                      controller: model.alamatController,
                      maxLines: 2,
                      validator:
                          Validatorless.required('Alamat tidak boleh kosong'),
                    ),
                    const SizedBox(height: 10),
                    Text(
                      '   Pendidikan SD',
                      style: regularTextStyle.copyWith(
                        fontSize: 12,
                        color: mainColor,
                      ),
                    ),
                    MyTextFormField(
                      controller: model.pendidikanSDController,
                      validator: Validatorless.required(
                          'Pendidikan SD tidak boleh kosong'),
                    ),
                    const SizedBox(height: 10),
                    Text(
                      '   Pendidikan SMP',
                      style: regularTextStyle.copyWith(
                        fontSize: 12,
                        color: mainColor,
                      ),
                    ),
                    MyTextFormField(
                      controller: model.pendidikanSMPController,
                      validator: Validatorless.required(
                          'Pendidikan SMP tidak boleh kosong'),
                    ),
                    const SizedBox(height: 10),
                    Text(
                      '   Pendidikan SMA',
                      style: regularTextStyle.copyWith(
                        fontSize: 12,
                        color: mainColor,
                      ),
                    ),
                    MyTextFormField(
                      controller: model.pendidikanSMAController,
                      validator: Validatorless.required(
                          'Pendidikan SMA tidak boleh kosong'),
                    ),
                    const SizedBox(height: 10),
                    Text(
                      '   Kemampuan',
                      style: regularTextStyle.copyWith(
                        fontSize: 12,
                        color: mainColor,
                      ),
                    ),
                    MyTextFormField(
                      controller: model.kemampuanController,
                      maxLines: 4,
                      validator: Validatorless.required(
                          'Kemampuan tidak boleh kosong'),
                    ),
                    const SizedBox(height: 10),
                    Text(
                      '   Hobi',
                      style: regularTextStyle.copyWith(
                        fontSize: 12,
                        color: mainColor,
                      ),
                    ),
                    MyTextFormField(
                      controller: model.hobiController,
                      maxLines: 4,
                      validator:
                          Validatorless.required('Hobi tidak boleh kosong'),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        TextButton(
                          onPressed: () {
                            completer(DialogResponse(confirmed: false));
                          },
                          child: const Text(
                            'Batal',
                            style: TextStyle(
                              color: dangerColor,
                            ),
                          ),
                        ),
                        TextButton(
                          onPressed: () async {
                            if (model.formKey.currentState!.validate()) {
                              bool res = await model.updateSiswa();

                              if (res) {
                                Navigator.pop(context);
                                completer(DialogResponse(confirmed: true));
                              }

                              // completer(DialogResponse(confirmed: true));
                            }
                          },
                          child: const Text(
                            'Update',
                            style: TextStyle(
                              color: blueColor,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
