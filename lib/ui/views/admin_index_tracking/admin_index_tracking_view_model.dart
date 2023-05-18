import 'package:flutter/material.dart';
import 'package:panti_asuhan/app/app.router.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

import '../../../app/app.locator.dart';
import '../../../app/app.logger.dart';

class AdminIndexTrackingViewModel extends IndexTrackingViewModel {
  final log = getLogger('AdminIndexTrackingViewModel');
  final _navigationService = locator<NavigationService>();

  final _bottomNavBarList = [
    {
      'name': 'Siswa',
      'icon': Icons.people_alt_outlined,
      'header': 'List Siswa'
    },
    {'name': 'Dana Sosial', 'icon': Icons.money, 'header': 'Dana Sosial'},
    {
      'name': 'Profil',
      'icon': Icons.list_alt_rounded,
      'header': 'Profil Panti Asuhan'
    }
  ];

  List<Map<String, dynamic>> get bottomNavBarList => _bottomNavBarList;

  final List<String> _views = [
    AdminIndexTrackingViewRoutes.dataSiswaView,
    AdminIndexTrackingViewRoutes.danaSosialAdminView,
    AdminIndexTrackingViewRoutes.profilView,
  ];

  String header = 'Dana Sosial';

  Future<void> init() async {
    setIndex(1);
    // await 2 seconds to make sure the view is loaded
    await Future.delayed(const Duration(milliseconds: 500));
    _navigationService.navigateTo(
      _views[1],
      id: 3,
    );
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
}
