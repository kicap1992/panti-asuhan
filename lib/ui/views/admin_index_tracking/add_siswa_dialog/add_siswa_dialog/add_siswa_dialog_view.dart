import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:validatorless/validatorless.dart';

import '../../../../../app/themes/app_colors.dart';
import '../../../../../app/themes/app_text.dart';
import '../../../../widgets/my_textformfield.dart';
import './add_siswa_dialog_view_model.dart';

class DataSiswa {
  final String? nama;

  DataSiswa({required this.nama, r});
}

class AddSiswaDialogView extends StatelessWidget {
  final DialogRequest<DataSiswa> request;
  final Function(DialogResponse) completer;

  const AddSiswaDialogView({
    Key? key,
    required DialogRequest request,
    required this.completer,
  })  : request = request as DialogRequest<DataSiswa>,
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<AddSiswaDialogViewModel>.reactive(
      viewModelBuilder: () => AddSiswaDialogViewModel(),
      onViewModelReady: (AddSiswaDialogViewModel model) async {
        await model.init();
      },
      builder: (
        BuildContext context,
        AddSiswaDialogViewModel model,
        Widget? child,
      ) {
        return Dialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
              ),
              padding: const EdgeInsets.all(10),
              child: SingleChildScrollView(
                child: Form(
                  key: model.formKey,
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        'Tambah Siswa',
                        style: boldTextStyle.copyWith(
                          fontSize: 16,
                        ),
                      ),
                      const SizedBox(height: 10),
                      // create circle avatar
                      Stack(
                        children: [
                          CircleAvatar(
                            radius: 50,
                            backgroundColor: fontParagraphColor,
                            child: model.imageBytes == null
                                ? const Icon(
                                    Icons.person,
                                    size: 50,
                                    color: Colors.white,
                                  )
                                : ClipRRect(
                                    borderRadius: BorderRadius.circular(50),
                                    child: Image.memory(
                                      model.imageBytes!,
                                      width: 100,
                                      height: 100,
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                          ),
                          Positioned(
                            bottom: 0,
                            right: 0,
                            child: CircleAvatar(
                              radius: 15,
                              backgroundColor: blueColor,
                              child: IconButton(
                                  onPressed: () {
                                    model.addImage();
                                  },
                                  icon: const Icon(
                                    Icons.add,
                                    color: lightColor,
                                    size: 15,
                                  )),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 10),
                      MyTextFormField(
                        labelText: 'Nama',
                        controller: model.namaController,
                        validator:
                            Validatorless.required('Nama tidak boleh kosong'),
                      ),
                      const SizedBox(height: 10),
                      MyTextFormField(
                        labelText: 'Tanggal Lahir',
                        controller: model.tanggalLahirController,
                        readOnly: true,
                        validator: Validatorless.required(
                            'Tanggal lahir tidak boleh kosong'),
                        onTap: () {
                          model.changeDate(context);
                        },
                      ),
                      const SizedBox(height: 10),
                      MyTextFormField(
                        labelText: 'Tempat Lahir',
                        controller: model.tempatLahirController,
                        validator: Validatorless.required(
                            'Tempat lahir tidak boleh kosong'),
                      ),

                      const SizedBox(height: 10),
                      // create dropdown button
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
                      MyTextFormField(
                        labelText: 'No. Telepon',
                        controller: model.noTelponController,
                        keyboardType: TextInputType.number,
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
                      MyTextFormField(
                        labelText: 'Agama',
                        controller: model.agamaController,
                        keyboardType: TextInputType.emailAddress,
                        validator:
                            Validatorless.required('Agama tidak boleh kosong'),
                      ),
                      const SizedBox(height: 10),
                      MyTextFormField(
                        labelText: 'Kewarganegaraan',
                        controller: model.kewarganegaraanController,
                        keyboardType: TextInputType.emailAddress,
                        validator: Validatorless.required(
                            'Kewarganegaraan tidak boleh kosong'),
                      ),
                      const SizedBox(height: 10),
                      MyTextFormField(
                        labelText: 'Alamat',
                        controller: model.alamatController,
                        maxLines: 2,
                        validator:
                            Validatorless.required('Alamat tidak boleh kosong'),
                      ),
                      const SizedBox(height: 10),
                      MyTextFormField(
                        labelText: 'Pendidikan SD',
                        controller: model.pendidikanSDController,
                        validator: Validatorless.required(
                            'Pendidikan SD tidak boleh kosong'),
                      ),
                      const SizedBox(height: 10),
                      MyTextFormField(
                        labelText: 'Pendidikan SMP',
                        controller: model.pendidikanSMPController,
                        validator: Validatorless.required(
                            'Pendidikan SMP tidak boleh kosong'),
                      ),
                      const SizedBox(height: 10),
                      MyTextFormField(
                        labelText: 'Pendidikan SMA',
                        controller: model.pendidikanSMAController,
                        validator: Validatorless.required(
                            'Pendidikan SMA tidak boleh kosong'),
                      ),
                      const SizedBox(height: 10),
                      MyTextFormField(
                        labelText: 'Kemampuan',
                        controller: model.kemampuanController,
                        maxLines: 4,
                        validator: Validatorless.required(
                            'Kemampuan tidak boleh kosong'),
                      ),
                      const SizedBox(height: 10),
                      MyTextFormField(
                        labelText: "Hobi",
                        controller: model.hobiController,
                        maxLines: 4,
                        validator:
                            Validatorless.required('Hobi tidak boleh kosong'),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          TextButton(
                            onPressed: () => completer(
                              DialogResponse(
                                confirmed: false,
                              ),
                            ),
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
                                bool res = await model.postData();
                                model.log.i("res: $res");
                                if (res) {
                                  completer(
                                    DialogResponse(
                                      confirmed: true,
                                    ),
                                  );
                                }
                              }
                            },
                            child: const Text(
                              'Simpan',
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
              )),
        );
      },
    );
  }
}
