import 'package:flutter/material.dart';
import 'package:panti_asuhan/app/app.router.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

import '../../../app/app.locator.dart';
import '../../../app/app.logger.dart';

class UserIndexTrackingViewModel extends IndexTrackingViewModel {
  final log = getLogger('PimpinanIndexTrackingViewModel');
  final _navigationService = locator<NavigationService>();
  // final _dialogService = locator<DialogService>();

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
    UserIndexTrackingViewRoutes.dataSiswaView,
    UserIndexTrackingViewRoutes.danaSosialAdminView,
    // UserIndexTrackingViewRoutes.danaSosialKhususView,
    UserIndexTrackingViewRoutes.profilView,
    UserIndexTrackingViewRoutes.visiMisiView,
    UserIndexTrackingViewRoutes.sejarahView,
    UserIndexTrackingViewRoutes.strukturOrganisasiView
  ];

  Future<void> init() async {
    setIndex(1);
  }

  void handleNavigation(int index) {
    log.d("handleNavigation: $index");
    log.d("currentIndex: $currentIndex");

    if (currentIndex == index) return;

    setIndex(index);
    header = _bottomNavBarList[index]['header'] as String;
    _navigationService.navigateTo(
      _views[index],
      id: 5,
    );
  }

  void login() {
    _navigationService.navigateTo(
      Routes.loginScreenView,
    );
  }
}
