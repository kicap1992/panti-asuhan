import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:stacked/stacked.dart';

import './struktur_organisasi_view_model.dart';

class StrukturOrganisasiView extends StatelessWidget {
  const StrukturOrganisasiView({super.key});

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<StrukturOrganisasiViewModel>.reactive(
      viewModelBuilder: () => StrukturOrganisasiViewModel(),
      onViewModelReady: (StrukturOrganisasiViewModel model) async {
        await model.init();
      },
      builder: (
        BuildContext context,
        StrukturOrganisasiViewModel model,
        Widget? child,
      ) {
        return Scaffold(
          body: Padding(
            padding: const EdgeInsets.all(20),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  const Center(
                    child: Image(
                      image: AssetImage("assets/logo.png"),
                      width: 150,
                      height: 150,
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  FirstWidget(
                    title: "Ketua",
                    data: model.dataKetua,
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  FirstWidget(
                    title: 'Sekretaris',
                    data: model.dataSekretaris,
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  FirstWidget(
                    title: 'Bendahara',
                    data: model.dataBendahara,
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  SecondWidget(
                    title: 'Seksi Pengasuh',
                    data: model.dataPengasuh,
                    length: model.dataPengasuhLength,
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  SecondWidget(
                    title: 'Seksi Ibadah',
                    data: model.dataIbadah,
                    length: model.dataIbadahLength,
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  SecondWidget(
                    title: 'Seksi Pendidikan',
                    data: model.dataPendidikan,
                    length: model.dataPendidikanLength,
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  SecondWidget(
                    title: 'Seksi Kesehatan',
                    data: model.dataKesehatan,
                    length: model.dataKesehatanLength,
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  SecondWidget(
                    title: 'Seksi Kebersihan',
                    data: model.dataKebersihan,
                    length: model.dataKebersihanLength,
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  SecondWidget(
                    title: 'Seksi Keterampilan',
                    data: model.dataKeterampilan,
                    length: model.dataKeterampilanLength,
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  SecondWidget(
                    title: 'Sarana dan Prasarana',
                    data: model.dataSaranaDanPrasarana,
                    length: model.dataSaranaDanPrasaranaLength,
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  SecondWidget(
                    title: 'Seksi Konsumsi',
                    data: model.dataKonsumsi,
                    length: model.dataKonsumsiLength,
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  SecondWidget(
                    title: 'Seksi Keamanan',
                    data: model.dataKeamanan,
                    length: model.dataKeamananLength,
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  SecondWidget(
                    title: 'Seksi Gedung',
                    data: model.dataGedung,
                    length: model.dataGedungLength,
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  SecondWidget(
                    title: 'Seksi Wisma',
                    data: model.dataWisma,
                    length: model.dataWismaLength,
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  SecondWidget(
                    title: 'Kelompok Putra',
                    data: model.dataKelompokPutra,
                    length: model.dataKelompokPutraLength,
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  SecondWidget(
                    title: 'Kelompok Putri',
                    data: model.dataKelompokPutri,
                    length: model.dataKelompokPutriLength,
                  ),
                  const SizedBox(
                    height: 20,
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

class SecondWidget extends ViewModelWidget<StrukturOrganisasiViewModel> {
  final String title;
  final Map<String, dynamic> data;
  final int length;

  const SecondWidget({
    super.key,
    required this.title,
    required this.data,
    required this.length,
  });

  @override
  Widget build(BuildContext context, StrukturOrganisasiViewModel viewModel) {
    return Card(
      elevation: 4,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                title,
                style: const TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(
                width: 10,
              ),
              IconButton(
                onPressed: () {
                  viewModel.editData(title, true);
                },
                icon: const Icon(Icons.edit),
              )
            ],
          ),
          for (var i = 0; i < length; i++)
            Column(
              children: [
                Center(
                  child: data.isEmpty
                      ? null
                      : ClipRRect(
                          borderRadius: BorderRadius.circular(50),
                          child: Image.network(
                            '${dotenv.env['url']}${data['img_url$i']}',
                            width: 100,
                            height: 100,
                            fit: BoxFit.cover,
                          ),
                        ),
                ),
                const SizedBox(
                  height: 2,
                ),
                Text(
                  data['nama$i'] ?? '...',
                  style: const TextStyle(
                    fontSize: 20,
                  ),
                ),
                const SizedBox(
                  height: 5,
                ),
                // create a line
                const Divider(
                  color: Colors.black,
                  height: 20,
                  thickness: 1,
                  indent: 20,
                  endIndent: 20,
                ),
                const SizedBox(height: 5),
              ],
            ),
        ],
      ),
    );
  }
}

class FirstWidget extends ViewModelWidget<StrukturOrganisasiViewModel> {
  final String title;
  final Map<String, dynamic> data;

  const FirstWidget({
    super.key,
    required this.title,
    required this.data,
  });

  @override
  Widget build(BuildContext context, StrukturOrganisasiViewModel viewModel) {
    return Card(
      elevation: 4,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                title,
                style: const TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(
                width: 10,
              ),
              IconButton(
                onPressed: () {
                  viewModel.editData(title, false);
                },
                icon: const Icon(Icons.edit),
              )
            ],
          ),
          Center(
            child: data.isEmpty
                ? null
                : ClipRRect(
                    borderRadius: BorderRadius.circular(50),
                    child: Image.network(
                      '${dotenv.env['url']}${data['img_url']}',
                      width: 100,
                      height: 100,
                      fit: BoxFit.cover,
                    ),
                  ),
          ),
          const SizedBox(
            height: 2,
          ),
          Text(
            data['nama'] ?? '...',
            style: const TextStyle(
              fontSize: 20,
            ),
          ),
        ],
      ),
    );
  }
}
