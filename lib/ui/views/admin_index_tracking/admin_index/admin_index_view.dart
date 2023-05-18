import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

import './admin_index_view_model.dart';

class AdminIndexView extends StatelessWidget {
  const AdminIndexView({super.key});

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<AdminIndexViewModel>.reactive(
      viewModelBuilder: () => AdminIndexViewModel(),
      onViewModelReady: (AdminIndexViewModel model) async {
        await model.init();
      },
      builder: (
        BuildContext context,
        AdminIndexViewModel model,
        Widget? child,
      ) {
        return const Scaffold(
          body: Center(
              child: CircularProgressIndicator(
            color: Colors.grey,
          )),
        );
      },
    );
  }
}
