// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// StackedDialogGenerator
// **************************************************************************

import 'package:stacked_services/stacked_services.dart';

import 'app.locator.dart';
import '../ui/views/admin_index_tracking/add_siswa_dialog/add_siswa_dialog/add_siswa_dialog_view.dart';
import '../ui/views/admin_index_tracking/dana_sosial_khusus/add_donatur_dialog/add_donatur_dialog_view.dart';
import '../ui/views/admin_index_tracking/edit_siswa/edit_dialog_siswa/edit_dialog_siswa_view.dart';
import '../ui/views/admin_index_tracking/filter_dialog/filter_dialog_view.dart';
import '../ui/views/admin_index_tracking/struktur_organisasi/edit_strukrur_organisasi_dialog/edit_strukrur_organisasi_dialog_view.dart';

enum DialogType {
  addSiswaDialogView,
  filterDialogView,
  editStrukrurOrganisasiDialogView,
  editDialogSiswaView,
  addDonaturDialogView,
}

void setupDialogUi() {
  final dialogService = locator<DialogService>();

  final Map<DialogType, DialogBuilder> builders = {
    DialogType.addSiswaDialogView: (context, request, completer) =>
        AddSiswaDialogView(request: request, completer: completer),
    DialogType.filterDialogView: (context, request, completer) =>
        FilterDialogView(request: request, completer: completer),
    DialogType.editStrukrurOrganisasiDialogView:
        (context, request, completer) => EditStrukrurOrganisasiDialogView(
            request: request, completer: completer),
    DialogType.editDialogSiswaView: (context, request, completer) =>
        EditDialogSiswaView(request: request, completer: completer),
    DialogType.addDonaturDialogView: (context, request, completer) =>
        AddDonaturDialogView(request: request, completer: completer),
  };

  dialogService.registerCustomDialogBuilders(builders);
}
