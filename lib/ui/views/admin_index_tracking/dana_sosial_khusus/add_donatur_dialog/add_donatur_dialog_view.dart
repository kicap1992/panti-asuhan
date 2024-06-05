import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:validatorless/validatorless.dart';

import '../../../../widgets/my_button.dart';
import '../../../../widgets/my_textformfield.dart';
import './add_donatur_dialog_view_model.dart';

class AddDonaturDialogView extends StatelessWidget {
  final DialogRequest? request;
  final Function(DialogResponse)? completer;

  const AddDonaturDialogView({
    Key? key,
    this.request,
    this.completer,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<AddDonaturDialogViewModel>.reactive(
      viewModelBuilder: () => AddDonaturDialogViewModel(),
      onViewModelReady: (AddDonaturDialogViewModel model) async {
        await model.init();
      },
      builder: (
        BuildContext context,
        AddDonaturDialogViewModel model,
        Widget? child,
      ) {
        return Dialog(
          child: Container(
            padding: const EdgeInsets.all(20),
            child: Form(
              key: model.formKey,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const Text(
                    'Tambah Donatur',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 20),
                  MyTextFormField(
                    controller: model.namaController,
                    hintText: 'Masukkan Nama Donatur',
                    labelText: 'Nama Donatur',
                    validator: Validatorless.required(
                        'Nama Donatur tidak boleh kosong'),
                  ),
                  const SizedBox(height: 20),
                  SizedBox(
                    width: 200,
                    child: MyButton(
                      text: 'Tambah',
                      onPressed: () async {
                        if (model.formKey.currentState!.validate()) {
                          // hide keyboard
                          FocusScope.of(context).unfocus();
                          bool res = await model.addDonatur();
                          if (res) {
                            completer!(DialogResponse(confirmed: true));
                          }
                        }
                      },
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
