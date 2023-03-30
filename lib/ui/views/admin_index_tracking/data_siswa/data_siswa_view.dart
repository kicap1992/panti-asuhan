import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

import './data_siswa_view_model.dart';

class DataSiswaView extends StatelessWidget {
  const DataSiswaView({super.key});

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<DataSiswaViewModel>.reactive(
      viewModelBuilder: () => DataSiswaViewModel(),
      onViewModelReady: (DataSiswaViewModel model) async {
        await model.init();
      },
      builder: (
        BuildContext context,
        DataSiswaViewModel model,
        Widget? child,
      ) {
        return const Scaffold(
          body: Center(
            child: Text(
              'DataSiswaView',
            ),
          ),
        );
      },
    );
  }
}
