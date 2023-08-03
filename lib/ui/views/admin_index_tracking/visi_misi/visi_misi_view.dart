import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

import './visi_misi_view_model.dart';

class VisiMisiView extends StatelessWidget {
  const VisiMisiView({super.key});

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<VisiMisiViewModel>.nonReactive(
      viewModelBuilder: () => VisiMisiViewModel(),
      onViewModelReady: (VisiMisiViewModel model) async {
        await model.init();
      },
      builder: (
        BuildContext context,
        VisiMisiViewModel model,
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
                  const Center(
                    child: Text(
                      'Visi',
                      style: TextStyle(fontSize: 20),
                    ),
                  ),
                  const SizedBox(height: 10),
                  Text(
                    model.visi,
                    style: const TextStyle(fontSize: 18),
                    textAlign: TextAlign.justify,
                  ),
                  const SizedBox(height: 30),
                  const Center(
                    child: Text(
                      'Misi',
                      style: TextStyle(fontSize: 20),
                    ),
                  ),
                  const SizedBox(height: 10),
                  Text(
                    '${model.misi1}\n\n${model.misi2}\n\n${model.misi3}\n\n${model.misi4}\n\n${model.misi5}',
                    style: const TextStyle(fontSize: 18),
                    textAlign: TextAlign.justify,
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
