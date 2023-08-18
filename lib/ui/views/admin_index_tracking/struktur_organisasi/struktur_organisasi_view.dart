import 'package:flutter/material.dart';
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
                  const KetuaWidget(),
                  const SizedBox(
                    height: 20,
                  ),
                  const SekretarisWidget(),
                  const SizedBox(
                    height: 20,
                  ),
                  const BendaharaWidget(),
                  const SizedBox(
                    height: 20,
                  ),
                  const Text(
                    "Seksi Pengasuh",
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(
                    height: 2,
                  ),
                  Text(
                    '${model.seksiPengasuh1}\n${model.seksiPengasuh2}\n${model.seksiPengasuh3}\n${model.seksiPengasuh4}',
                    style: const TextStyle(
                      fontSize: 20,
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  const Text(
                    "Seksi Ibadah",
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(
                    height: 2,
                  ),
                  Text(
                    '${model.seksiIbadah1}\n${model.seksiIbadah2}\n${model.seksiIbadah3}\n${model.seksiIbadah4}',
                    style: const TextStyle(
                      fontSize: 20,
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  const Text(
                    "Seksi Pendidikan",
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(
                    height: 2,
                  ),
                  Text(
                    '${model.seksiPendidikan1}\n${model.seksiPendidikan2}',
                    style: const TextStyle(
                      fontSize: 20,
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  const Text(
                    "Seksi Kesehatan",
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(
                    height: 2,
                  ),
                  Text(
                    model.seksiKesehatan,
                    style: const TextStyle(
                      fontSize: 20,
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  const Text(
                    "Seksi Kebersihan",
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(
                    height: 2,
                  ),
                  Text(
                    model.seksiKebersihan,
                    style: const TextStyle(
                      fontSize: 20,
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  const Text(
                    "Seksi Keterampilan",
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    model.seksiKeterampilan1,
                    style: const TextStyle(
                      fontSize: 20,
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  const Text(
                    "Seksi Sarana Prasarana",
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    model.seksiSaranaPrasarana1,
                    style: const TextStyle(
                      fontSize: 20,
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  const Text(
                    "Seksi Konsumsi",
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    '${model.seksiKonsumsi1}\n${model.seksiKonsumsi2}',
                    style: const TextStyle(
                      fontSize: 20,
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  const Text(
                    "Seksi Keamanan",
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    '${model.seksiKeamanan1}\n${model.seksiKeamanan2}',
                    style: const TextStyle(
                      fontSize: 20,
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  const Text(
                    "Seksi Gedung",
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    '${model.seksiGedung1}\n${model.seksiGedung2}\n${model.seksiGedung3}\n${model.seksiGedung4}',
                    style: const TextStyle(
                      fontSize: 20,
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  const Text(
                    "Seksi Wisma",
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    '${model.seksiWisma1}\n${model.seksiWisma2}\n${model.seksiWisma3}\n${model.seksiWisma4}\n${model.seksiWisma5}',
                    style: const TextStyle(
                      fontSize: 20,
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  const Text(
                    "Kelompok Putri",
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    '${model.kelompokPutri1}\n${model.kelompokPutri2}\n${model.kelompokPutri3}',
                    style: const TextStyle(
                      fontSize: 20,
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  const Text(
                    "Kelompok Putra",
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    '${model.kelompokPutra1}\n${model.kelompokPutra2}\n${model.kelompokPutra3}',
                    style: const TextStyle(
                      fontSize: 20,
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

class BendaharaWidget extends ViewModelWidget<StrukturOrganisasiViewModel> {
  const BendaharaWidget({
    super.key,
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
              const Text(
                "Bendahara",
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              IconButton(
                onPressed: () {
                  // model.editSekretaris();
                },
                icon: const Icon(Icons.edit),
              )
            ],
          ),
          const SizedBox(
            height: 2,
          ),
          Text(
            viewModel.bendahara,
            style: const TextStyle(
              fontSize: 20,
            ),
          ),
        ],
      ),
    );
  }
}

class SekretarisWidget extends ViewModelWidget<StrukturOrganisasiViewModel> {
  const SekretarisWidget({
    super.key,
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
              const Text(
                "Sekretaris",
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(
                width: 10,
              ),
              IconButton(
                onPressed: () {
                  // model.editSekretaris();
                },
                icon: const Icon(Icons.edit),
              )
            ],
          ),
          const SizedBox(
            height: 2,
          ),
          Text(
            viewModel.sekretaris,
            style: const TextStyle(
              fontSize: 20,
            ),
          ),
        ],
      ),
    );
  }
}

class KetuaWidget extends ViewModelWidget<StrukturOrganisasiViewModel> {
  const KetuaWidget({
    super.key,
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
              const Text(
                "Ketua",
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(
                width: 10,
              ),
              IconButton(
                onPressed: () {
                  viewModel.editData('ketua', false);
                },
                icon: const Icon(Icons.edit),
              )
            ],
          ),
          const SizedBox(
            height: 2,
          ),
          Text(
            viewModel.ketua,
            style: const TextStyle(
              fontSize: 20,
            ),
          ),
        ],
      ),
    );
  }
}
