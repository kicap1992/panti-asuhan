import 'package:stacked_services/stacked_services.dart';
import 'package:stacked/stacked_annotations.dart';

import '../services/http_services.dart';
import '../services/my_easyloading.dart';
import '../services/other_function.dart';
import '../ui/views/admin_index_tracking/add_siswa_dialog/add_siswa_dialog/add_siswa_dialog_view.dart';
import '../ui/views/admin_index_tracking/dana_sosial_khusus/add_donatur_dialog/add_donatur_dialog_view.dart';
import '../ui/views/admin_index_tracking/dana_sosial_khusus/dana_sosial_khusus_view.dart';
import '../ui/views/admin_index_tracking/admin_index_tracking_view.dart';
import '../ui/views/admin_index_tracking/dana_sosial_admin/dana_sosial_admin_view.dart';
import '../ui/views/admin_index_tracking/data_siswa/data_siswa_view.dart';
import '../ui/views/admin_index_tracking/edit_siswa/edit_dialog_siswa/edit_dialog_siswa_view.dart';
import '../ui/views/admin_index_tracking/edit_siswa/edit_siswa_view.dart';
import '../ui/views/admin_index_tracking/filter_dialog/filter_dialog_view.dart';
import '../ui/views/admin_index_tracking/profil/profil_view.dart';
import '../ui/views/admin_index_tracking/sejarah/sejarah_view.dart';
import '../ui/views/admin_index_tracking/struktur_organisasi/edit_strukrur_organisasi_dialog/edit_strukrur_organisasi_dialog_view.dart';
import '../ui/views/admin_index_tracking/struktur_organisasi/struktur_organisasi_view.dart';
import '../ui/views/admin_index_tracking/visi_misi/visi_misi_view.dart';
import '../ui/views/detail_dana_sosial/detail_dana_sosial_view.dart';
import '../ui/views/login_screen/login_screen_view.dart';
import '../ui/views/pimpinan_index_tracking/pimpinan_index_tracking/pimpinan_index_tracking_view.dart';
import '../ui/views/splash_screen/splash_screen_view.dart';
import '../ui/views/tambah_dana_sosial/tambah_dana_sosial_view.dart';
import '../ui/views/user_index_tracking/user_index_tracking_view.dart';

@StackedApp(
  routes: [
    MaterialRoute(page: SplashScreenView, initial: true),
    MaterialRoute(page: LoginScreenView),
    MaterialRoute(
      page: AdminIndexTrackingView,
      children: [
        // MaterialRoute(page: AdminIndexView, initial: true),
        MaterialRoute(page: DanaSosialAdminView),
        MaterialRoute(page: DanaSosialKhususView),
        MaterialRoute(page: DataSiswaView),
        MaterialRoute(page: ProfilView),
        MaterialRoute(page: VisiMisiView),
        MaterialRoute(page: SejarahView),
        MaterialRoute(
          page: StrukturOrganisasiView,
        ),
      ],
    ),
    MaterialRoute(page: TambahDanaSosialView),
    MaterialRoute(page: EditSiswaView),
    MaterialRoute(page: DetailDanaSosialView),
    MaterialRoute(
      page: PimpinanIndexTrackingView,
      children: [
        // MaterialRoute(page: AdminIndexView, initial: true),
        MaterialRoute(page: DanaSosialAdminView),
        MaterialRoute(page: DanaSosialKhususView),
        MaterialRoute(page: DataSiswaView),
        MaterialRoute(page: ProfilView),
      ],
    ),
    MaterialRoute(
      page: UserIndexTrackingView,
      children: [
        // MaterialRoute(page: AdminIndexView, initial: true),
        MaterialRoute(page: DanaSosialAdminView),
        MaterialRoute(page: DanaSosialKhususView),
        MaterialRoute(page: DataSiswaView),
        MaterialRoute(page: ProfilView),
        MaterialRoute(page: VisiMisiView),
        MaterialRoute(page: SejarahView),
        MaterialRoute(page: StrukturOrganisasiView),
      ],
    ),
  ],
  dialogs: [
    StackedDialog(classType: AddSiswaDialogView),
    StackedDialog(classType: FilterDialogView),
    StackedDialog(classType: EditStrukrurOrganisasiDialogView),
    StackedDialog(classType: EditDialogSiswaView),
    StackedDialog(classType: AddDonaturDialogView),
  ],
  dependencies: [
    LazySingleton(classType: NavigationService),
    LazySingleton(classType: DialogService),
    LazySingleton(classType: SnackbarService),
    LazySingleton(classType: BottomSheetService),
    //

    LazySingleton(classType: MyEasyLoading),
    LazySingleton(classType: MyHttpServices),
    LazySingleton(classType: OtherFunction),
  ],
  logger: StackedLogger(),
)
class App {}
