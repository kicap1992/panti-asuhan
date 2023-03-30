import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

import './profil_view_model.dart';

class ProfilView extends StatelessWidget {
  const ProfilView({super.key});

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<ProfilViewModel>.reactive(
      viewModelBuilder: () => ProfilViewModel(),
      onViewModelReady: (ProfilViewModel model) async {
        await model.init();
      },
      builder: (
        BuildContext context,
        ProfilViewModel model,
        Widget? child,
      ) {
        return const Scaffold(
          body: Center(
            child: Text(
              'ProfilView',
            ),
          ),
        );
      },
    );
  }
}
