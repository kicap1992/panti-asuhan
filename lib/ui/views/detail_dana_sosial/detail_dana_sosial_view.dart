import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

import '../../../app/themes/app_colors.dart';
import '../../../app/themes/app_text.dart';
import '../../widgets/my_textformfield.dart';
import './detail_dana_sosial_view_model.dart';

class DetailDanaSosialView extends StatelessWidget {
  final int id;

  const DetailDanaSosialView({Key? key, required this.id}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<DetailDanaSosialViewModel>.reactive(
      viewModelBuilder: () => DetailDanaSosialViewModel(),
      onViewModelReady: (DetailDanaSosialViewModel model) async {
        await model.init(id);
      },
      builder: (
        BuildContext context,
        DetailDanaSosialViewModel model,
        Widget? child,
      ) {
        return Scaffold(
          appBar: AppBar(
            title: const Text('Detail Dana Sosial',
                style: TextStyle(color: Colors.white)),
            backgroundColor: mainColor,
            iconTheme: const IconThemeData(color: Colors.white),
          ),
          body: Padding(
            padding: const EdgeInsets.all(15),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    "Nama Donator",
                    style: regularTextStyle.copyWith(color: mainColor),
                  ),
                ),
                MyTextFormField(
                  controller: model.namaController,
                  maxLines: 1,
                  readOnly: true,
                ),
                const SizedBox(
                  height: 15,
                ),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    "Tanggal",
                    style: regularTextStyle.copyWith(color: mainColor),
                  ),
                ),
                MyTextFormField(
                  controller: model.tanggalController,
                  maxLines: 1,
                  readOnly: true,
                ),
                const SizedBox(
                  height: 15,
                ),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    "Jenis",
                    style: regularTextStyle.copyWith(color: mainColor),
                  ),
                ),
                MyTextFormField(
                  controller: model.jenisController,
                  maxLines: 1,
                  readOnly: true,
                ),
                Visibility(
                  visible: model.jenisBool,
                  child: const SizedBox(
                    height: 15,
                  ),
                ),
                Visibility(
                  visible: model.jenisBool,
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      "Jumlah",
                      style: regularTextStyle.copyWith(color: mainColor),
                    ),
                  ),
                ),
                Visibility(
                  visible: model.jenisBool,
                  child: MyTextFormField(
                    controller: model.jumlahController,
                    maxLines: 1,
                    readOnly: true,
                  ),
                ),
                Visibility(
                  visible: !model.jenisBool,
                  child: const SizedBox(
                    height: 15,
                  ),
                ),
                Visibility(
                  visible: !model.jenisBool,
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      "Keterangan",
                      style: regularTextStyle.copyWith(color: mainColor),
                    ),
                  ),
                ),
                Visibility(
                  visible: !model.jenisBool,
                  child: MyTextFormField(
                    controller: model.keteranganController,
                    maxLines: 2,
                    readOnly: true,
                  ),
                ),
                const SizedBox(
                  height: 15,
                ),
                Expanded(
                  child: Align(
                    alignment: Alignment.centerRight,
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(
                          "Tanda Tangan",
                          style: regularTextStyle.copyWith(color: mainColor),
                        ),
                        SizedBox(
                          height: 150,
                          width: 150,
                          child: model.danaSosialModel == null
                              ? Container(
                                  decoration: BoxDecoration(
                                    border: Border.all(color: mainColor),
                                  ),
                                )
                              : (model.danaSosialModel!.status! ==
                                      'Belum Dikonfirmasi'
                                  ? const TtdWidget()
                                  : Image.asset(
                                      'assets/qrcode.png',
                                      fit: BoxFit.cover,
                                    )),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Text(
                          "Dr. Andi Fitriani D, S.Ag, M.Pd",
                          style: regularTextStyle.copyWith(
                            color: mainColor,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        // create a horizontal line
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}

class TtdWidget extends ViewModelWidget<DetailDanaSosialViewModel> {
  const TtdWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context, DetailDanaSosialViewModel viewModel) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(color: mainColor),
      ),
      child: viewModel.role == 'pimpinan'
          ? InkWell(
              onTap: () {
                viewModel.handleTtd();
              },
              child: Center(
                child: Text(
                  "Tanda Tangan",
                  style: regularTextStyle.copyWith(
                    color: mainColor,
                    fontStyle: FontStyle.italic,
                  ),
                ),
              ),
            )
          : null,
    );
  }
}
