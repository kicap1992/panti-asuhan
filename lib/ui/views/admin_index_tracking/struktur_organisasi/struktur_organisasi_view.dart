import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

import './struktur_organisasi_view_model.dart';

class StrukturOrganisasiView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<StrukturOrganisasiViewModel>.nonReactive(
      viewModelBuilder: () => StrukturOrganisasiViewModel(),
      onModelReady: (StrukturOrganisasiViewModel model) async {
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
                  const Text(
                    "Ketua",
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(
                    height: 2,
                  ),
                  Text(
                    model.Ketua,
                    style: const TextStyle(
                      fontSize: 20,
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  const Text(
                    "Sekretaris",
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(
                    height: 2,
                  ),
                  Text(
                    model.Sekretaris,
                    style: const TextStyle(
                      fontSize: 20,
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  const Text(
                    "Bendahara",
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(
                    height: 2,
                  ),
                  Text(
                    model.Bendahara,
                    style: const TextStyle(
                      fontSize: 20,
                    ),
                  ),
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
                    '${model.SeksiPengasuh1}\n${model.SeksiPengasuh2}\n${model.SeksiPengasuh3}\n${model.SeksiPengasuh4}',
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
                    '${model.SeksiIbadah1}\n${model.SeksiIbadah2}\n${model.SeksiIbadah3}\n${model.SeksiIbadah4}',
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
                    '${model.SeksiPendidikan1}\n${model.SeksiPendidikan2}',
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
                    model.SeksiKesehatan,
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
                    model.SeksiKebersihan,
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
                    model.SeksiKeterampilan1,
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
                    model.SeksiSaranaPrasarana1,
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
                    '${model.SeksiKonsumsi1}\n${model.SeksiKonsumsi2}',
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
                    '${model.SeksiKeamanan1}\n${model.SeksiKeamanan2}',
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
                    '${model.SeksiGedung1}\n${model.SeksiGedung2}\n${model.SeksiGedung3}\n${model.SeksiGedung4}',
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
                    '${model.SeksiWisma1}\n${model.SeksiWisma2}\n${model.SeksiWisma3}\n${model.SeksiWisma4}\n${model.SeksiWisma5}',
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
                    '${model.KelompokPutri1}\n${model.KelompokPutri2}\n${model.KelompokPutri3}',
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
                    '${model.KelompokPutra1}\n${model.KelompokPutra2}\n${model.KelompokPutra3}',
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
