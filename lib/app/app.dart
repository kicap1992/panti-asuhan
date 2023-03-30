import 'package:panti_asuhan/ui/views/admin_index_tracking/admin_index/admin_index_view.dart';
import 'package:panti_asuhan/ui/views/admin_index_tracking/dana_sosial_admin/dana_sosial_admin_view.dart';
import 'package:panti_asuhan/ui/views/admin_index_tracking/data_siswa/data_siswa_view.dart';
import 'package:panti_asuhan/ui/views/admin_index_tracking/profil/profil_view.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:stacked/stacked_annotations.dart';

import '../services/http_services.dart';
import '../services/my_easyloading.dart';
import '../ui/views/admin_index_tracking/admin_index_tracking_view.dart';
import '../ui/views/login_screen/login_screen_view.dart';
import '../ui/views/splash_screen/splash_screen_view.dart';

@StackedApp(
  routes: [
    MaterialRoute(page: SplashScreenView, initial: true),
    MaterialRoute(page: LoginScreenView),
    MaterialRoute(
      page: AdminIndexTrackingView,
      children: [
        MaterialRoute(page: AdminIndexView, initial: true),
        MaterialRoute(page: DanaSosialAdminView),
        MaterialRoute(page: DataSiswaView),
        MaterialRoute(page: ProfilView),
      ],
    ),
  ],
  dependencies: [
    LazySingleton(classType: NavigationService),
    LazySingleton(classType: DialogService),
    LazySingleton(classType: SnackbarService),
    LazySingleton(classType: BottomSheetService),
    //

    LazySingleton(classType: MyEasyLoading),
    LazySingleton(classType: MyHttpServices),
  ],
  logger: StackedLogger(),
)
class App {}
