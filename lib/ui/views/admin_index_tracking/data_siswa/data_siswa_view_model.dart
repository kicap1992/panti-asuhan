import 'package:panti_asuhan/app/core/custom_base_view_model.dart';

import '../../../../app/app.dialogs.dart';
import '../../../../app/app.logger.dart';
import '../add_siswa_dialog/add_siswa_dialog/add_siswa_dialog_view.dart';

class DataSiswaViewModel extends CustomBaseViewModel {
  final log = getLogger('DataSiswaViewModel');
  Future<void> init() async {}

  void addSiswa() async {
    final res = await dialogService.showCustomDialog(
      variant: DialogType.addSiswaDialogView,
      data: DataSiswa(nama: null),
    );

    if (res?.confirmed != true) return;
  }
}
