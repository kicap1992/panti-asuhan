import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

import '../../../app/app.locator.dart';
import '../../../app/app.logger.dart';
import '../../../app/app.router.dart';

class AdminIndexTrackingViewModel extends IndexTrackingViewModel {
  final log = getLogger('AdminIndexTrackingViewModel');
  final _navigationService = locator<NavigationService>();
  final _dialogService = locator<DialogService>();
  final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();

  final _bottomNavBarList = [
    {
      'name': 'Siswa',
      'icon': Icons.people_alt_outlined,
      'header': 'List Siswa'
    },
    {'name': 'Dana', 'icon': Icons.money, 'header': 'Dana Sosial'},
    {
      'name': 'Profil',
      'icon': Icons.person_4_outlined,
      'header': 'Profil Panti Asuhan'
    },
    {'name': 'V & M', 'icon': Icons.list_alt_rounded, 'header': 'Visi & Misi'},
    {'name': 'Sejarah', 'icon': Icons.list_outlined, 'header': 'Sejarah'},
    {
      'name': 'S O',
      'icon': Icons.people_alt_outlined,
      'header': 'Struktur Organisasi'
    },
  ];

  List<Map<String, dynamic>> get bottomNavBarList => _bottomNavBarList;

  final List<String> _views = [
    AdminIndexTrackingViewRoutes.dataSiswaView,
    AdminIndexTrackingViewRoutes.danaSosialAdminView,
    AdminIndexTrackingViewRoutes.profilView,
    AdminIndexTrackingViewRoutes.visiMisiView,
    AdminIndexTrackingViewRoutes.sejarahView,
    AdminIndexTrackingViewRoutes.strukturOrganisasiView
  ];

  String header = 'Dana Sosial';

  Future<void> init() async {
    setIndex(1);
    // await 2 seconds to make sure the view is loaded
    // await Future.delayed(const Duration(milliseconds: 500));
    // _navigationService.navigateTo(
    //   _views[1],
    //   id: 3,
    // );
  }

  void handleNavigation(int index) {
    log.d("handleNavigation: $index");
    log.d("currentIndex: $currentIndex");

    if (currentIndex == index) return;

    setIndex(index);
    header = _bottomNavBarList[index]['header'] as String;
    _navigationService.navigateTo(
      _views[index],
      id: 3,
    );
  }

  logout(BuildContext context) {
    _dialogService
        .showConfirmationDialog(
      title: 'Logout',
      description: 'Apakah anda yakin ingin logout?',
      cancelTitle: 'Ya',
      confirmationTitle: 'Tidak',
      // barrierDismissible: true,
    )
        .then((value) {
      if (!value!.confirmed) {
        log.d('logout');
        _prefs.then((SharedPreferences prefs) {
          prefs.setBool('isLogin', false);
          prefs.remove('role');
          _navigationService.clearStackAndShow(Routes.loginScreenView);
        });
      } else {
        // _navigationService.back();
        // close dialog
        Navigator.pop(context);
        // Navigator.of(StackedService.navigatorKey! as BuildContext).pop();
        // log.d('cancel logout');
      }
    });
  }
}
