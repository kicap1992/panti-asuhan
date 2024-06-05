import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

import '../../../app/themes/app_colors.dart';
import '../../../app/themes/app_text.dart';
import '../../widgets/my_textformfield.dart';
import './detail_dana_sosial_view_model.dart';

class DetailDanaSosialView extends StatelessWidget {
  final int id;

  final bool isKhusus;

  const DetailDanaSosialView(
      {Key? key, required this.id, this.isKhusus = false})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<DetailDanaSosialViewModel>.reactive(
      viewModelBuilder: () => DetailDanaSosialViewModel(),
      onViewModelReady: (DetailDanaSosialViewModel model) async {
        await model.init(id, isKhusus);
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
            child: model.danaSosialModel == null
                ? const Center(
                    child: CircularProgressIndicator(),
                  )
                : (model.danaSosialModel!.bentuk == 'Pemasukan'
                    ? const SafeArea(child: PemasukanWidget())
                    : const PengeluaranWidget()),
          ),
        );
      },
    );
  }
}

class PengeluaranWidget extends ViewModelWidget<DetailDanaSosialViewModel> {
  const PengeluaranWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context, DetailDanaSosialViewModel viewModel) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Align(
          alignment: Alignment.centerLeft,
          child: Text(
            "Bentuk",
            style: regularTextStyle.copyWith(color: mainColor),
          ),
        ),
        MyTextFormField(
          controller: viewModel.bentukController,
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
          controller: viewModel.tanggalController,
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
          controller: viewModel.jenisController,
          maxLines: 1,
          readOnly: true,
        ),
        Visibility(
          visible: viewModel.jenisBool,
          child: const SizedBox(
            height: 15,
          ),
        ),
        Visibility(
          visible: viewModel.jenisBool,
          child: Align(
            alignment: Alignment.centerLeft,
            child: Text(
              "Jumlah",
              style: regularTextStyle.copyWith(color: mainColor),
            ),
          ),
        ),
        Visibility(
          visible: viewModel.jenisBool,
          child: MyTextFormField(
            controller: viewModel.jumlahController,
            maxLines: 1,
            readOnly: true,
          ),
        ),
        Visibility(
          visible: !viewModel.jenisBool,
          child: const SizedBox(
            height: 15,
          ),
        ),
        Visibility(
          visible: !viewModel.jenisBool,
          child: Align(
            alignment: Alignment.centerLeft,
            child: Text(
              "Keterangan",
              style: regularTextStyle.copyWith(color: mainColor),
            ),
          ),
        ),
        Visibility(
          visible: !viewModel.jenisBool,
          child: MyTextFormField(
            controller: viewModel.keteranganController,
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
                  child: viewModel.danaSosialModel == null
                      ? Container(
                          decoration: BoxDecoration(
                            border: Border.all(color: mainColor),
                          ),
                        )
                      : (viewModel.danaSosialModel!.status! ==
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
    );
  }
}

class PemasukanWidget extends ViewModelWidget<DetailDanaSosialViewModel> {
  const PemasukanWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context, DetailDanaSosialViewModel viewModel) {
    return SingleChildScrollView(
      child: SizedBox(
        height: MediaQuery.of(context).size.height,
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
              controller: viewModel.namaController,
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
              controller: viewModel.tanggalController,
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
              controller: viewModel.jenisController,
              maxLines: 1,
              readOnly: true,
            ),
            Visibility(
              visible: viewModel.jenisBool,
              child: const SizedBox(
                height: 15,
              ),
            ),
            Visibility(
              visible: viewModel.jenisBool,
              child: Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  "Jumlah",
                  style: regularTextStyle.copyWith(color: mainColor),
                ),
              ),
            ),
            Visibility(
              visible: viewModel.jenisBool,
              child: MyTextFormField(
                controller: viewModel.jumlahController,
                maxLines: 1,
                readOnly: true,
              ),
            ),
            Visibility(
              visible: !viewModel.jenisBool,
              child: const SizedBox(
                height: 15,
              ),
            ),
            if (!viewModel.jenisBool)
              Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Jenis Barang",
                    style: regularTextStyle.copyWith(color: mainColor),
                  ),
                  MyTextFormField(
                    controller: viewModel.jenisBarangController,
                    maxLines: 1,
                    readOnly: true,
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  Text(
                    "Jumlah Barang",
                    style: regularTextStyle.copyWith(color: mainColor),
                  ),
                  MyTextFormField(
                    controller: viewModel.jumlahBarangController,
                    maxLines: 1,
                    readOnly: true,
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                ],
              ),
            Visibility(
              visible: !viewModel.jenisBool,
              child: Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  "Keterangan",
                  style: regularTextStyle.copyWith(color: mainColor),
                ),
              ),
            ),
            Visibility(
              visible: !viewModel.jenisBool,
              child: MyTextFormField(
                controller: viewModel.keteranganController,
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
                      child: viewModel.danaSosialModel == null
                          ? Container(
                              decoration: BoxDecoration(
                                border: Border.all(color: mainColor),
                              ),
                            )
                          : (viewModel.danaSosialModel!.status! ==
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
                      "DRA. HJ. CIA",
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
      child: viewModel.role == 'pimpinan' || viewModel.role == 'admin'
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
