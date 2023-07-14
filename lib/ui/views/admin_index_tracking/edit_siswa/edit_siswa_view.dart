import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:stacked/stacked.dart';
import 'package:validatorless/validatorless.dart';

import '../../../../app/themes/app_colors.dart';
import '../../../widgets/my_textformfield.dart';
import './edit_siswa_view_model.dart';

class EditSiswaView extends StatelessWidget {
  final int idSiswa;

  const EditSiswaView({required this.idSiswa, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<EditSiswaViewModel>.reactive(
      viewModelBuilder: () => EditSiswaViewModel(),
      onViewModelReady: (EditSiswaViewModel model) async {
        await model.init(
          idSiswa,
        );
      },
      builder: (
        BuildContext context,
        EditSiswaViewModel model,
        Widget? child,
      ) {
        return Scaffold(
          appBar: AppBar(
            title: const Text(
              "Informasi Data Siswa",
              style: TextStyle(
                color: Colors.white,
                fontSize: 20,
              ),
            ),
            backgroundColor: mainColor,
            elevation: 0,
            // back button color to white
            iconTheme: const IconThemeData(color: Colors.white),
          ),
          body: Padding(
            padding: const EdgeInsets.all(20.0),
            child: SingleChildScrollView(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Center(
                    child: Stack(
                      children: [
                        CircleAvatar(
                          radius: 50,
                          backgroundColor: fontParagraphColor,
                          backgroundImage: model.siswaModel != null
                              ? NetworkImage(
                                  '${dotenv.env['url']}${model.siswaModel!.imgUrl}',
                                )
                              : null,
                          child: model.siswaModel == null
                              ? const Icon(
                                  Icons.person,
                                  size: 50,
                                  color: Colors.white,
                                )
                              : null,
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 10),
                  MyTextFormField(
                    labelText: 'Nama',
                    controller: model.namaController,
                    validator:
                        Validatorless.required('Nama tidak boleh kosong'),
                    enabled: false,
                  ),
                  const SizedBox(height: 10),
                  MyTextFormField(
                    labelText: 'Tanggal Lahir',
                    controller: model.tanggalLahirController,
                    readOnly: true,
                    validator: Validatorless.required(
                        'Tanggal lahir tidak boleh kosong'),
                    enabled: false,
                    onTap: () {
                      // model.changeDate(context);
                    },
                  ),
                  const SizedBox(height: 10),
                  MyTextFormField(
                    labelText: 'Tempat Lahir',
                    controller: model.tempatLahirController,
                    enabled: false,
                    validator: Validatorless.required(
                        'Tempat lahir tidak boleh kosong'),
                  ),
                  const SizedBox(height: 10),
                  // create dropdown button
                  MyTextFormField(
                    labelText: 'Jenis Kelamin',
                    controller: model.jkController,
                    enabled: false,
                    validator: Validatorless.required(
                        'Pendidikan SMP tidak boleh kosong'),
                  ),
                  const SizedBox(height: 10),
                  MyTextFormField(
                    labelText: 'No. Telepon',
                    controller: model.noTelponController,
                    enabled: false,
                    keyboardType: TextInputType.number,
                    validator: Validatorless.multiple(
                      [
                        Validatorless.required(
                            'No. telepon tidak boleh kosong'),
                        Validatorless.number('No. telepon harus berupa angka'),
                      ],
                    ),
                  ),
                  const SizedBox(height: 10),
                  MyTextFormField(
                    labelText: 'Agama',
                    controller: model.agamaController,
                    enabled: false,
                    keyboardType: TextInputType.emailAddress,
                    validator:
                        Validatorless.required('Agama tidak boleh kosong'),
                  ),
                  const SizedBox(height: 10),
                  MyTextFormField(
                    labelText: 'Kewarganegaraan',
                    controller: model.kewarganegaraanController,
                    enabled: false,
                    keyboardType: TextInputType.emailAddress,
                    validator: Validatorless.required(
                        'Kewarganegaraan tidak boleh kosong'),
                  ),
                  const SizedBox(height: 10),
                  MyTextFormField(
                    labelText: 'Alamat',
                    controller: model.alamatController,
                    enabled: false,
                    maxLines: 2,
                    validator:
                        Validatorless.required('Alamat tidak boleh kosong'),
                  ),
                  const SizedBox(height: 10),
                  MyTextFormField(
                    labelText: 'Pendidikan SD',
                    controller: model.pendidikanSDController,
                    enabled: false,
                    validator: Validatorless.required(
                        'Pendidikan SD tidak boleh kosong'),
                  ),
                  const SizedBox(height: 10),
                  MyTextFormField(
                    labelText: 'Pendidikan SMP',
                    controller: model.pendidikanSMPController,
                    enabled: false,
                    validator: Validatorless.required(
                        'Pendidikan SMP tidak boleh kosong'),
                  ),
                  const SizedBox(height: 10),
                  MyTextFormField(
                    labelText: 'Pendidikan SMA',
                    controller: model.pendidikanSMAController,
                    enabled: false,
                    validator: Validatorless.required(
                        'Pendidikan SMA tidak boleh kosong'),
                  ),
                  const SizedBox(height: 10),
                  MyTextFormField(
                    labelText: 'Kemampuan',
                    controller: model.kemampuanController,
                    enabled: false,
                    maxLines: 4,
                    validator:
                        Validatorless.required('Kemampuan tidak boleh kosong'),
                  ),
                  const SizedBox(height: 10),
                  MyTextFormField(
                    labelText: "Hobi",
                    controller: model.hobiController,
                    enabled: false,
                    maxLines: 4,
                    validator:
                        Validatorless.required('Hobi tidak boleh kosong'),
                  ),
                  // Row(
                  //   mainAxisAlignment: MainAxisAlignment.end,
                  //   children: [
                  //     TextButton(
                  //       onPressed: () {},
                  //       child: const Text(
                  //         'Batal',
                  //         style: TextStyle(
                  //           color: dangerColor,
                  //         ),
                  //       ),
                  //     ),
                  //     TextButton(
                  //       onPressed: () async {
                  //         // if (model.formKey.currentState!.validate()) {
                  //         //   bool res = await model.postData();
                  //         //   model.log.i("res: $res");
                  //         //   if (res) {
                  //         //     completer(
                  //         //       DialogResponse(
                  //         //         confirmed: true,
                  //         //       ),
                  //         //     );
                  //         //   }
                  //         // }
                  //       },
                  //       child: const Text(
                  //         'Simpan',
                  //         style: TextStyle(
                  //           color: blueColor,
                  //         ),
                  //       ),
                  //     ),
                  //   ],
                  // ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
