import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

import '../../../../app/themes/app_text.dart';
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
        return Scaffold(
          body: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
            child: Column(
              children: [
                const Center(
                  child: Image(
                    image: AssetImage("assets/logo.png"),
                    width: 200,
                    height: 200,
                  ),
                ),
                const SizedBox(height: 10),
                Text(
                  "PANTI ASUHAN ABADI AISYIYAH",
                  style: boldTextStyle.copyWith(
                    fontSize: 20,
                  ),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 10),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: const [
                    Icon(Icons.phone),
                    SizedBox(width: 15),
                    Expanded(
                      child: Text(
                        "085 298 962 023",
                        textAlign: TextAlign.justify,
                        style: regularTextStyle,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 10),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: const [
                    Icon(Icons.location_on),
                    SizedBox(width: 15),
                    Expanded(
                      child: Text(
                        "Jln Panti Asuhan No. 3 Ujung Lare, Kec. Soreang, Kota Parepare, Sulawesi Selatan 91133",
                        textAlign: TextAlign.justify,
                        style: regularTextStyle,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
