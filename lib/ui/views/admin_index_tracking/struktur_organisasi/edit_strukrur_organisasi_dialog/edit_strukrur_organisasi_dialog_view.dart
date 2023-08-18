import 'package:flutter/material.dart';
import 'package:panti_asuhan/app/themes/app_text.dart';
import 'package:panti_asuhan/ui/widgets/my_button.dart';
import 'package:panti_asuhan/ui/widgets/my_textformfield.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

import './edit_strukrur_organisasi_dialog_view_model.dart';

class EditStrukrurOrganisasiDialogView extends StatelessWidget {
  final DialogRequest? request;
  final Function(DialogResponse)? completer;

  const EditStrukrurOrganisasiDialogView({
    Key? key,
    this.request,
    this.completer,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<EditStrukrurOrganisasiDialogViewModel>.reactive(
      viewModelBuilder: () => EditStrukrurOrganisasiDialogViewModel(),
      onViewModelReady: (EditStrukrurOrganisasiDialogViewModel model) async {
        await model.init(
          request!.data,
        );
      },
      builder: (
        BuildContext context,
        EditStrukrurOrganisasiDialogViewModel model,
        Widget? child,
      ) {
        return Dialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          child: Container(
            padding: const EdgeInsets.all(20),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
            ),
            child: SingleChildScrollView(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Stack(
                    children: [
                      SingleChildScrollView(
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: model.child,
                        ),
                      ),
                      // top right rounded add button
                      // request?.data['tambahan'] == false
                      //     ? const SizedBox()
                      //     :
                      Positioned(
                        top: 0,
                        right: 0,
                        child: GestureDetector(
                          onTap: () {
                            model.addWidget();
                            // model.check();
                          },
                          child: Container(
                            padding: const EdgeInsets.all(5),
                            decoration: BoxDecoration(
                              color: Colors.green,
                              borderRadius: BorderRadius.circular(20),
                            ),
                            child: const Icon(
                              Icons.add,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  SizedBox(
                    width: 150,
                    child: MyButton(
                      text: 'Simpan',
                      onPressed: () {
                        // model.check();
                        model.uploadJabatan();
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

class TheWidget extends ViewModelWidget<EditStrukrurOrganisasiDialogViewModel> {
  final TextEditingController controller;
  final int index;
  @override
  final Key key;

  const TheWidget({
    required this.key,
    required this.controller,
    required this.index,
  }) : super(key: key);

  @override
  Widget build(
      BuildContext context, EditStrukrurOrganisasiDialogViewModel viewModel) {
    return Stack(
      children: [
        Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          // ignore: prefer_const_literals_to_create_immutables
          children: [
            Center(
                child: FotoWidget(
              index: index,
            )),
            const SizedBox(height: 10),
            const Text(
              '   Nama',
              style: regularTextStyle,
            ),
            MyTextFormField(
              controller: controller,
            ),
            const SizedBox(height: 10),
            // straight line divider
            const Divider(
              color: Colors.grey,
              height: 20,
              thickness: 1,
              indent: 0,
              endIndent: 0,
            ),
            const SizedBox(height: 10),
          ],
        ),
        // top right rounded add button
        index == 0
            ? const SizedBox()
            : Positioned(
                top: 0,
                right: 0,
                child: GestureDetector(
                  onTap: () {
                    viewModel.removeWidget(index, key);
                  },
                  child: Container(
                    padding: const EdgeInsets.all(5),
                    decoration: BoxDecoration(
                      color: Colors.red,
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: const Icon(
                      Icons.remove,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
      ],
    );
  }
}

class FotoWidget
    extends ViewModelWidget<EditStrukrurOrganisasiDialogViewModel> {
  final int index;

  const FotoWidget({
    Key? key,
    required this.index,
  }) : super(key: key);

  @override
  Widget build(
      BuildContext context, EditStrukrurOrganisasiDialogViewModel viewModel) {
    return Container(
      width: 100,
      height: 100,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(150),
        // color: Colors.grey,
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            spreadRadius: 2,
            blurRadius: 5,
          ),
        ],
      ),
      child: Stack(
        children: [
          Center(
            child: ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: viewModel.imageBytes['image$index'] == null
                  ? const Icon(
                      Icons.person,
                      size: 90,
                    )
                  : ClipRRect(
                      borderRadius: BorderRadius.circular(50),
                      child: Image.memory(
                        viewModel.imageBytes['image$index']!,
                        width: 100,
                        height: 100,
                        fit: BoxFit.cover,
                      ),
                    ),
            ),
          ),
          Positioned(
            bottom: 0,
            right: 0,
            child: GestureDetector(
              onTap: () {
                viewModel.addImage(index);
              },
              child: Container(
                width: 30,
                height: 30,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(150),
                  color: Colors.grey,
                ),
                child: const Icon(
                  Icons.edit,
                  size: 20,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
