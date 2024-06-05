import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

import '../../../../app/app.locator.dart';
import '../../../../app/app.logger.dart';
import '../../../../app/app.router.dart';

class PimpinanIndexTrackingViewModel extends IndexTrackingViewModel {
  final log = getLogger('PimpinanIndexTrackingViewModel');
  final _navigationService = locator<NavigationService>();
  final _dialogService = locator<DialogService>();

  final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();

  String header = 'Dana Sosial';

  final _bottomNavBarList = [
    {
      'name': 'List',
      'icon': Icons.people_alt_outlined,
      'header': 'List Anak Panti'
    },
    {'name': 'Dana', 'icon': Icons.money, 'header': 'Dana Sosial'},
    // {'name': 'Dana', 'icon': Icons.money, 'header': 'Dana Sosial Khusus'},
    {
      'name': 'Profil',
      'icon': Icons.person_4_outlined,
      'header': 'Profil Panti Asuhan'
    },
  ];

  List<Map<String, dynamic>> get bottomNavBarList => _bottomNavBarList;
  final List<String> _views = [
    PimpinanIndexTrackingViewRoutes.dataSiswaView,
    PimpinanIndexTrackingViewRoutes.danaSosialAdminView,
    // PimpinanIndexTrackingViewRoutes.danaSosialKhususView,
    PimpinanIndexTrackingViewRoutes.profilView,
  ];
  Future<void> init() async {
    _prefs.then((SharedPreferences prefs) {
      if (prefs.getString('role') == 'pimpinan') {
        setIndex(1);
        // // await 2 seconds to make sure the view is loaded
        // Future.delayed(const Duration(milliseconds: 500));
      } else {
        prefs.setBool('isLogin', false);
        prefs.remove('role');
        _navigationService.clearStackAndShow(Routes.loginScreenView);
      }
    });
  }

  void handleNavigation(int index) {
    log.d("handleNavigation: $index");
    log.d("currentIndex: $currentIndex");

    if (currentIndex == index) return;

    setIndex(index);
    header = _bottomNavBarList[index]['header'] as String;
    _navigationService.navigateTo(
      _views[index],
      id: 4,
    );
  }

  logout() {
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
        _prefs.then((SharedPreferences prefs) {
          prefs.setBool('isLogin', false);
          prefs.remove('role');
          _navigationService.clearStackAndShow(Routes.loginScreenView);
        });
      } else {
        _navigationService.back();
      }
    });
  }
}
