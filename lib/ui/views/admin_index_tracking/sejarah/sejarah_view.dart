import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

import './sejarah_view_model.dart';

class SejarahView extends StatelessWidget {
  const SejarahView({super.key});

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<SejarahViewModel>.nonReactive(
      viewModelBuilder: () => SejarahViewModel(),
      onViewModelReady: (SejarahViewModel model) async {
        await model.init();
      },
      builder: (
        BuildContext context,
        SejarahViewModel model,
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
                  const SizedBox(height: 20),
                  Text(
                    '${model.isi1}\n\n${model.isi2}',
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
