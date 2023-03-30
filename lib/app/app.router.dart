// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// StackedNavigatorGenerator
// **************************************************************************

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:flutter/material.dart' as _i5;
import 'package:flutter/material.dart';
import 'package:panti_asuhan/ui/views/admin_index_tracking/admin_index/admin_index_view.dart'
    as _i6;
import 'package:panti_asuhan/ui/views/admin_index_tracking/admin_index_tracking_view.dart'
    as _i4;
import 'package:panti_asuhan/ui/views/admin_index_tracking/dana_sosial_admin/dana_sosial_admin_view.dart'
    as _i7;
import 'package:panti_asuhan/ui/views/admin_index_tracking/data_siswa/data_siswa_view.dart'
    as _i8;
import 'package:panti_asuhan/ui/views/admin_index_tracking/profil/profil_view.dart'
    as _i9;
import 'package:panti_asuhan/ui/views/login_screen/login_screen_view.dart'
    as _i3;
import 'package:panti_asuhan/ui/views/splash_screen/splash_screen_view.dart'
    as _i2;
import 'package:stacked/stacked.dart' as _i1;
import 'package:stacked_services/stacked_services.dart' as _i10;

class Routes {
  static const splashScreenView = '/';

  static const loginScreenView = '/login-screen-view';

  static const adminIndexTrackingView = '/admin-index-tracking-view';

  static const all = <String>{
    splashScreenView,
    loginScreenView,
    adminIndexTrackingView,
  };
}

class StackedRouter extends _i1.RouterBase {
  final _routes = <_i1.RouteDef>[
    _i1.RouteDef(
      Routes.splashScreenView,
      page: _i2.SplashScreenView,
    ),
    _i1.RouteDef(
      Routes.loginScreenView,
      page: _i3.LoginScreenView,
    ),
    _i1.RouteDef(
      Routes.adminIndexTrackingView,
      page: _i4.AdminIndexTrackingView,
    ),
  ];

  final _pagesMap = <Type, _i1.StackedRouteFactory>{
    _i2.SplashScreenView: (data) {
      return _i5.MaterialPageRoute<dynamic>(
        builder: (context) => const _i2.SplashScreenView(),
        settings: data,
        maintainState: false,
      );
    },
    _i3.LoginScreenView: (data) {
      return _i5.MaterialPageRoute<dynamic>(
        builder: (context) => const _i3.LoginScreenView(),
        settings: data,
        maintainState: false,
      );
    },
    _i4.AdminIndexTrackingView: (data) {
      return _i5.MaterialPageRoute<dynamic>(
        builder: (context) => const _i4.AdminIndexTrackingView(),
        settings: data,
        maintainState: false,
      );
    },
  };

  @override
  List<_i1.RouteDef> get routes => _routes;
  @override
  Map<Type, _i1.StackedRouteFactory> get pagesMap => _pagesMap;
}

class AdminIndexTrackingViewRoutes {
  static const adminIndexView = '';

  static const danaSosialAdminView = 'dana-sosial-admin-view';

  static const dataSiswaView = 'data-siswa-view';

  static const profilView = 'profil-view';

  static const all = <String>{
    adminIndexView,
    danaSosialAdminView,
    dataSiswaView,
    profilView,
  };
}

class AdminIndexTrackingViewRouter extends _i1.RouterBase {
  final _routes = <_i1.RouteDef>[
    _i1.RouteDef(
      AdminIndexTrackingViewRoutes.adminIndexView,
      page: _i6.AdminIndexView,
    ),
    _i1.RouteDef(
      AdminIndexTrackingViewRoutes.danaSosialAdminView,
      page: _i7.DanaSosialAdminView,
    ),
    _i1.RouteDef(
      AdminIndexTrackingViewRoutes.dataSiswaView,
      page: _i8.DataSiswaView,
    ),
    _i1.RouteDef(
      AdminIndexTrackingViewRoutes.profilView,
      page: _i9.ProfilView,
    ),
  ];

  final _pagesMap = <Type, _i1.StackedRouteFactory>{
    _i6.AdminIndexView: (data) {
      return _i5.MaterialPageRoute<dynamic>(
        builder: (context) => const _i6.AdminIndexView(),
        settings: data,
        maintainState: false,
      );
    },
    _i7.DanaSosialAdminView: (data) {
      return _i5.MaterialPageRoute<dynamic>(
        builder: (context) => const _i7.DanaSosialAdminView(),
        settings: data,
        maintainState: false,
      );
    },
    _i8.DataSiswaView: (data) {
      return _i5.MaterialPageRoute<dynamic>(
        builder: (context) => const _i8.DataSiswaView(),
        settings: data,
        maintainState: false,
      );
    },
    _i9.ProfilView: (data) {
      return _i5.MaterialPageRoute<dynamic>(
        builder: (context) => const _i9.ProfilView(),
        settings: data,
        maintainState: false,
      );
    },
  };

  @override
  List<_i1.RouteDef> get routes => _routes;
  @override
  Map<Type, _i1.StackedRouteFactory> get pagesMap => _pagesMap;
}

extension NavigatorStateExtension on _i10.NavigationService {
  Future<dynamic> navigateToSplashScreenView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return navigateTo<dynamic>(Routes.splashScreenView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToLoginScreenView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return navigateTo<dynamic>(Routes.loginScreenView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToAdminIndexTrackingView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return navigateTo<dynamic>(Routes.adminIndexTrackingView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToNestedAdminIndexViewInAdminIndexTrackingViewRouter([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return navigateTo<dynamic>(AdminIndexTrackingViewRoutes.adminIndexView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic>
      navigateToNestedDanaSosialAdminViewInAdminIndexTrackingViewRouter([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return navigateTo<dynamic>(AdminIndexTrackingViewRoutes.danaSosialAdminView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToNestedDataSiswaViewInAdminIndexTrackingViewRouter([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return navigateTo<dynamic>(AdminIndexTrackingViewRoutes.dataSiswaView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToNestedProfilViewInAdminIndexTrackingViewRouter([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return navigateTo<dynamic>(AdminIndexTrackingViewRoutes.profilView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> replaceWithSplashScreenView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return replaceWith<dynamic>(Routes.splashScreenView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> replaceWithLoginScreenView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return replaceWith<dynamic>(Routes.loginScreenView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> replaceWithAdminIndexTrackingView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return replaceWith<dynamic>(Routes.adminIndexTrackingView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic>
      replaceWithNestedAdminIndexViewInAdminIndexTrackingViewRouter([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return replaceWith<dynamic>(AdminIndexTrackingViewRoutes.adminIndexView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic>
      replaceWithNestedDanaSosialAdminViewInAdminIndexTrackingViewRouter([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return replaceWith<dynamic>(
        AdminIndexTrackingViewRoutes.danaSosialAdminView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> replaceWithNestedDataSiswaViewInAdminIndexTrackingViewRouter([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return replaceWith<dynamic>(AdminIndexTrackingViewRoutes.dataSiswaView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> replaceWithNestedProfilViewInAdminIndexTrackingViewRouter([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return replaceWith<dynamic>(AdminIndexTrackingViewRoutes.profilView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }
}
