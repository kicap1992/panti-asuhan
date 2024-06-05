// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// StackedNavigatorGenerator
// **************************************************************************

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:flutter/material.dart' as _i10;
import 'package:flutter/material.dart';
import 'package:panti_asuhan/ui/views/admin_index_tracking/admin_index_tracking_view.dart'
    as _i4;
import 'package:panti_asuhan/ui/views/admin_index_tracking/dana_sosial_admin/dana_sosial_admin_view.dart'
    as _i11;
import 'package:panti_asuhan/ui/views/admin_index_tracking/dana_sosial_khusus/dana_sosial_khusus_view.dart'
    as _i12;
import 'package:panti_asuhan/ui/views/admin_index_tracking/data_siswa/data_siswa_view.dart'
    as _i13;
import 'package:panti_asuhan/ui/views/admin_index_tracking/edit_siswa/edit_siswa_view.dart'
    as _i6;
import 'package:panti_asuhan/ui/views/admin_index_tracking/profil/profil_view.dart'
    as _i14;
import 'package:panti_asuhan/ui/views/admin_index_tracking/sejarah/sejarah_view.dart'
    as _i16;
import 'package:panti_asuhan/ui/views/admin_index_tracking/struktur_organisasi/struktur_organisasi_view.dart'
    as _i17;
import 'package:panti_asuhan/ui/views/admin_index_tracking/visi_misi/visi_misi_view.dart'
    as _i15;
import 'package:panti_asuhan/ui/views/detail_dana_sosial/detail_dana_sosial_view.dart'
    as _i7;
import 'package:panti_asuhan/ui/views/login_screen/login_screen_view.dart'
    as _i3;
import 'package:panti_asuhan/ui/views/pimpinan_index_tracking/pimpinan_index_tracking/pimpinan_index_tracking_view.dart'
    as _i8;
import 'package:panti_asuhan/ui/views/splash_screen/splash_screen_view.dart'
    as _i2;
import 'package:panti_asuhan/ui/views/tambah_dana_sosial/tambah_dana_sosial_view.dart'
    as _i5;
import 'package:panti_asuhan/ui/views/user_index_tracking/user_index_tracking_view.dart'
    as _i9;
import 'package:stacked/stacked.dart' as _i1;
import 'package:stacked_services/stacked_services.dart' as _i18;

class Routes {
  static const splashScreenView = '/';

  static const loginScreenView = '/login-screen-view';

  static const adminIndexTrackingView = '/admin-index-tracking-view';

  static const tambahDanaSosialView = '/tambah-dana-sosial-view';

  static const editSiswaView = '/edit-siswa-view';

  static const detailDanaSosialView = '/detail-dana-sosial-view';

  static const pimpinanIndexTrackingView = '/pimpinan-index-tracking-view';

  static const userIndexTrackingView = '/user-index-tracking-view';

  static const all = <String>{
    splashScreenView,
    loginScreenView,
    adminIndexTrackingView,
    tambahDanaSosialView,
    editSiswaView,
    detailDanaSosialView,
    pimpinanIndexTrackingView,
    userIndexTrackingView,
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
    _i1.RouteDef(
      Routes.tambahDanaSosialView,
      page: _i5.TambahDanaSosialView,
    ),
    _i1.RouteDef(
      Routes.editSiswaView,
      page: _i6.EditSiswaView,
    ),
    _i1.RouteDef(
      Routes.detailDanaSosialView,
      page: _i7.DetailDanaSosialView,
    ),
    _i1.RouteDef(
      Routes.pimpinanIndexTrackingView,
      page: _i8.PimpinanIndexTrackingView,
    ),
    _i1.RouteDef(
      Routes.userIndexTrackingView,
      page: _i9.UserIndexTrackingView,
    ),
  ];

  final _pagesMap = <Type, _i1.StackedRouteFactory>{
    _i2.SplashScreenView: (data) {
      return _i10.MaterialPageRoute<dynamic>(
        builder: (context) => const _i2.SplashScreenView(),
        settings: data,
        maintainState: false,
      );
    },
    _i3.LoginScreenView: (data) {
      return _i10.MaterialPageRoute<dynamic>(
        builder: (context) => const _i3.LoginScreenView(),
        settings: data,
        maintainState: false,
      );
    },
    _i4.AdminIndexTrackingView: (data) {
      return _i10.MaterialPageRoute<dynamic>(
        builder: (context) => const _i4.AdminIndexTrackingView(),
        settings: data,
        maintainState: false,
      );
    },
    _i5.TambahDanaSosialView: (data) {
      final args = data.getArgs<TambahDanaSosialViewArguments>(
        orElse: () => const TambahDanaSosialViewArguments(),
      );
      return _i10.MaterialPageRoute<dynamic>(
        builder: (context) =>
            _i5.TambahDanaSosialView(key: args.key, isKhusus: args.isKhusus),
        settings: data,
        maintainState: false,
      );
    },
    _i6.EditSiswaView: (data) {
      final args = data.getArgs<EditSiswaViewArguments>(nullOk: false);
      return _i10.MaterialPageRoute<dynamic>(
        builder: (context) =>
            _i6.EditSiswaView(idSiswa: args.idSiswa, key: args.key),
        settings: data,
        maintainState: false,
      );
    },
    _i7.DetailDanaSosialView: (data) {
      final args = data.getArgs<DetailDanaSosialViewArguments>(nullOk: false);
      return _i10.MaterialPageRoute<dynamic>(
        builder: (context) => _i7.DetailDanaSosialView(
            key: args.key, id: args.id, isKhusus: args.isKhusus),
        settings: data,
        maintainState: false,
      );
    },
    _i8.PimpinanIndexTrackingView: (data) {
      return _i10.MaterialPageRoute<dynamic>(
        builder: (context) => const _i8.PimpinanIndexTrackingView(),
        settings: data,
        maintainState: false,
      );
    },
    _i9.UserIndexTrackingView: (data) {
      return _i10.MaterialPageRoute<dynamic>(
        builder: (context) => const _i9.UserIndexTrackingView(),
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

class TambahDanaSosialViewArguments {
  const TambahDanaSosialViewArguments({
    this.key,
    this.isKhusus = false,
  });

  final _i10.Key? key;

  final bool isKhusus;

  @override
  String toString() {
    return '{"key": "$key", "isKhusus": "$isKhusus"}';
  }
}

class EditSiswaViewArguments {
  const EditSiswaViewArguments({
    required this.idSiswa,
    this.key,
  });

  final int idSiswa;

  final _i10.Key? key;

  @override
  String toString() {
    return '{"idSiswa": "$idSiswa", "key": "$key"}';
  }
}

class DetailDanaSosialViewArguments {
  const DetailDanaSosialViewArguments({
    this.key,
    required this.id,
    this.isKhusus = false,
  });

  final _i10.Key? key;

  final int id;

  final bool isKhusus;

  @override
  String toString() {
    return '{"key": "$key", "id": "$id", "isKhusus": "$isKhusus"}';
  }
}

class AdminIndexTrackingViewRoutes {
  static const danaSosialAdminView = 'dana-sosial-admin-view';

  static const danaSosialKhususView = 'dana-sosial-khusus-view';

  static const dataSiswaView = 'data-siswa-view';

  static const profilView = 'profil-view';

  static const visiMisiView = 'visi-misi-view';

  static const sejarahView = 'sejarah-view';

  static const strukturOrganisasiView = 'struktur-organisasi-view';

  static const all = <String>{
    danaSosialAdminView,
    danaSosialKhususView,
    dataSiswaView,
    profilView,
    visiMisiView,
    sejarahView,
    strukturOrganisasiView,
  };
}

class AdminIndexTrackingViewRouter extends _i1.RouterBase {
  final _routes = <_i1.RouteDef>[
    _i1.RouteDef(
      AdminIndexTrackingViewRoutes.danaSosialAdminView,
      page: _i11.DanaSosialAdminView,
    ),
    _i1.RouteDef(
      AdminIndexTrackingViewRoutes.danaSosialKhususView,
      page: _i12.DanaSosialKhususView,
    ),
    _i1.RouteDef(
      AdminIndexTrackingViewRoutes.dataSiswaView,
      page: _i13.DataSiswaView,
    ),
    _i1.RouteDef(
      AdminIndexTrackingViewRoutes.profilView,
      page: _i14.ProfilView,
    ),
    _i1.RouteDef(
      AdminIndexTrackingViewRoutes.visiMisiView,
      page: _i15.VisiMisiView,
    ),
    _i1.RouteDef(
      AdminIndexTrackingViewRoutes.sejarahView,
      page: _i16.SejarahView,
    ),
    _i1.RouteDef(
      AdminIndexTrackingViewRoutes.strukturOrganisasiView,
      page: _i17.StrukturOrganisasiView,
    ),
  ];

  final _pagesMap = <Type, _i1.StackedRouteFactory>{
    _i11.DanaSosialAdminView: (data) {
      return _i10.MaterialPageRoute<dynamic>(
        builder: (context) => const _i11.DanaSosialAdminView(),
        settings: data,
        maintainState: false,
      );
    },
    _i12.DanaSosialKhususView: (data) {
      return _i10.MaterialPageRoute<dynamic>(
        builder: (context) => const _i12.DanaSosialKhususView(),
        settings: data,
        maintainState: false,
      );
    },
    _i13.DataSiswaView: (data) {
      return _i10.MaterialPageRoute<dynamic>(
        builder: (context) => const _i13.DataSiswaView(),
        settings: data,
        maintainState: false,
      );
    },
    _i14.ProfilView: (data) {
      return _i10.MaterialPageRoute<dynamic>(
        builder: (context) => const _i14.ProfilView(),
        settings: data,
        maintainState: false,
      );
    },
    _i15.VisiMisiView: (data) {
      return _i10.MaterialPageRoute<dynamic>(
        builder: (context) => const _i15.VisiMisiView(),
        settings: data,
        maintainState: false,
      );
    },
    _i16.SejarahView: (data) {
      return _i10.MaterialPageRoute<dynamic>(
        builder: (context) => const _i16.SejarahView(),
        settings: data,
        maintainState: false,
      );
    },
    _i17.StrukturOrganisasiView: (data) {
      return _i10.MaterialPageRoute<dynamic>(
        builder: (context) => const _i17.StrukturOrganisasiView(),
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

class PimpinanIndexTrackingViewRoutes {
  static const danaSosialAdminView = 'dana-sosial-admin-view';

  static const danaSosialKhususView = 'dana-sosial-khusus-view';

  static const dataSiswaView = 'data-siswa-view';

  static const profilView = 'profil-view';

  static const all = <String>{
    danaSosialAdminView,
    danaSosialKhususView,
    dataSiswaView,
    profilView,
  };
}

class PimpinanIndexTrackingViewRouter extends _i1.RouterBase {
  final _routes = <_i1.RouteDef>[
    _i1.RouteDef(
      PimpinanIndexTrackingViewRoutes.danaSosialAdminView,
      page: _i11.DanaSosialAdminView,
    ),
    _i1.RouteDef(
      PimpinanIndexTrackingViewRoutes.danaSosialKhususView,
      page: _i12.DanaSosialKhususView,
    ),
    _i1.RouteDef(
      PimpinanIndexTrackingViewRoutes.dataSiswaView,
      page: _i13.DataSiswaView,
    ),
    _i1.RouteDef(
      PimpinanIndexTrackingViewRoutes.profilView,
      page: _i14.ProfilView,
    ),
  ];

  final _pagesMap = <Type, _i1.StackedRouteFactory>{
    _i11.DanaSosialAdminView: (data) {
      return _i10.MaterialPageRoute<dynamic>(
        builder: (context) => const _i11.DanaSosialAdminView(),
        settings: data,
        maintainState: false,
      );
    },
    _i12.DanaSosialKhususView: (data) {
      return _i10.MaterialPageRoute<dynamic>(
        builder: (context) => const _i12.DanaSosialKhususView(),
        settings: data,
        maintainState: false,
      );
    },
    _i13.DataSiswaView: (data) {
      return _i10.MaterialPageRoute<dynamic>(
        builder: (context) => const _i13.DataSiswaView(),
        settings: data,
        maintainState: false,
      );
    },
    _i14.ProfilView: (data) {
      return _i10.MaterialPageRoute<dynamic>(
        builder: (context) => const _i14.ProfilView(),
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

class UserIndexTrackingViewRoutes {
  static const danaSosialAdminView = 'dana-sosial-admin-view';

  static const danaSosialKhususView = 'dana-sosial-khusus-view';

  static const dataSiswaView = 'data-siswa-view';

  static const profilView = 'profil-view';

  static const visiMisiView = 'visi-misi-view';

  static const sejarahView = 'sejarah-view';

  static const strukturOrganisasiView = 'struktur-organisasi-view';

  static const all = <String>{
    danaSosialAdminView,
    danaSosialKhususView,
    dataSiswaView,
    profilView,
    visiMisiView,
    sejarahView,
    strukturOrganisasiView,
  };
}

class UserIndexTrackingViewRouter extends _i1.RouterBase {
  final _routes = <_i1.RouteDef>[
    _i1.RouteDef(
      UserIndexTrackingViewRoutes.danaSosialAdminView,
      page: _i11.DanaSosialAdminView,
    ),
    _i1.RouteDef(
      UserIndexTrackingViewRoutes.danaSosialKhususView,
      page: _i12.DanaSosialKhususView,
    ),
    _i1.RouteDef(
      UserIndexTrackingViewRoutes.dataSiswaView,
      page: _i13.DataSiswaView,
    ),
    _i1.RouteDef(
      UserIndexTrackingViewRoutes.profilView,
      page: _i14.ProfilView,
    ),
    _i1.RouteDef(
      UserIndexTrackingViewRoutes.visiMisiView,
      page: _i15.VisiMisiView,
    ),
    _i1.RouteDef(
      UserIndexTrackingViewRoutes.sejarahView,
      page: _i16.SejarahView,
    ),
    _i1.RouteDef(
      UserIndexTrackingViewRoutes.strukturOrganisasiView,
      page: _i17.StrukturOrganisasiView,
    ),
  ];

  final _pagesMap = <Type, _i1.StackedRouteFactory>{
    _i11.DanaSosialAdminView: (data) {
      return _i10.MaterialPageRoute<dynamic>(
        builder: (context) => const _i11.DanaSosialAdminView(),
        settings: data,
        maintainState: false,
      );
    },
    _i12.DanaSosialKhususView: (data) {
      return _i10.MaterialPageRoute<dynamic>(
        builder: (context) => const _i12.DanaSosialKhususView(),
        settings: data,
        maintainState: false,
      );
    },
    _i13.DataSiswaView: (data) {
      return _i10.MaterialPageRoute<dynamic>(
        builder: (context) => const _i13.DataSiswaView(),
        settings: data,
        maintainState: false,
      );
    },
    _i14.ProfilView: (data) {
      return _i10.MaterialPageRoute<dynamic>(
        builder: (context) => const _i14.ProfilView(),
        settings: data,
        maintainState: false,
      );
    },
    _i15.VisiMisiView: (data) {
      return _i10.MaterialPageRoute<dynamic>(
        builder: (context) => const _i15.VisiMisiView(),
        settings: data,
        maintainState: false,
      );
    },
    _i16.SejarahView: (data) {
      return _i10.MaterialPageRoute<dynamic>(
        builder: (context) => const _i16.SejarahView(),
        settings: data,
        maintainState: false,
      );
    },
    _i17.StrukturOrganisasiView: (data) {
      return _i10.MaterialPageRoute<dynamic>(
        builder: (context) => const _i17.StrukturOrganisasiView(),
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

extension NavigatorStateExtension on _i18.NavigationService {
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

  Future<dynamic> navigateToTambahDanaSosialView({
    _i10.Key? key,
    bool isKhusus = false,
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  }) async {
    return navigateTo<dynamic>(Routes.tambahDanaSosialView,
        arguments: TambahDanaSosialViewArguments(key: key, isKhusus: isKhusus),
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToEditSiswaView({
    required int idSiswa,
    _i10.Key? key,
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  }) async {
    return navigateTo<dynamic>(Routes.editSiswaView,
        arguments: EditSiswaViewArguments(idSiswa: idSiswa, key: key),
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToDetailDanaSosialView({
    _i10.Key? key,
    required int id,
    bool isKhusus = false,
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  }) async {
    return navigateTo<dynamic>(Routes.detailDanaSosialView,
        arguments:
            DetailDanaSosialViewArguments(key: key, id: id, isKhusus: isKhusus),
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToPimpinanIndexTrackingView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return navigateTo<dynamic>(Routes.pimpinanIndexTrackingView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToUserIndexTrackingView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return navigateTo<dynamic>(Routes.userIndexTrackingView,
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

  Future<dynamic>
      navigateToNestedDanaSosialKhususViewInAdminIndexTrackingViewRouter([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return navigateTo<dynamic>(
        AdminIndexTrackingViewRoutes.danaSosialKhususView,
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

  Future<dynamic> navigateToNestedVisiMisiViewInAdminIndexTrackingViewRouter([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return navigateTo<dynamic>(AdminIndexTrackingViewRoutes.visiMisiView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToNestedSejarahViewInAdminIndexTrackingViewRouter([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return navigateTo<dynamic>(AdminIndexTrackingViewRoutes.sejarahView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic>
      navigateToNestedStrukturOrganisasiViewInAdminIndexTrackingViewRouter([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return navigateTo<dynamic>(
        AdminIndexTrackingViewRoutes.strukturOrganisasiView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic>
      navigateToNestedDanaSosialAdminViewInPimpinanIndexTrackingViewRouter([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return navigateTo<dynamic>(
        PimpinanIndexTrackingViewRoutes.danaSosialAdminView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic>
      navigateToNestedDanaSosialKhususViewInPimpinanIndexTrackingViewRouter([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return navigateTo<dynamic>(
        PimpinanIndexTrackingViewRoutes.danaSosialKhususView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic>
      navigateToNestedDataSiswaViewInPimpinanIndexTrackingViewRouter([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return navigateTo<dynamic>(PimpinanIndexTrackingViewRoutes.dataSiswaView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToNestedProfilViewInPimpinanIndexTrackingViewRouter([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return navigateTo<dynamic>(PimpinanIndexTrackingViewRoutes.profilView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic>
      navigateToNestedDanaSosialAdminViewInUserIndexTrackingViewRouter([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return navigateTo<dynamic>(UserIndexTrackingViewRoutes.danaSosialAdminView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic>
      navigateToNestedDanaSosialKhususViewInUserIndexTrackingViewRouter([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return navigateTo<dynamic>(UserIndexTrackingViewRoutes.danaSosialKhususView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToNestedDataSiswaViewInUserIndexTrackingViewRouter([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return navigateTo<dynamic>(UserIndexTrackingViewRoutes.dataSiswaView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToNestedProfilViewInUserIndexTrackingViewRouter([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return navigateTo<dynamic>(UserIndexTrackingViewRoutes.profilView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToNestedVisiMisiViewInUserIndexTrackingViewRouter([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return navigateTo<dynamic>(UserIndexTrackingViewRoutes.visiMisiView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToNestedSejarahViewInUserIndexTrackingViewRouter([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return navigateTo<dynamic>(UserIndexTrackingViewRoutes.sejarahView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic>
      navigateToNestedStrukturOrganisasiViewInUserIndexTrackingViewRouter([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return navigateTo<dynamic>(
        UserIndexTrackingViewRoutes.strukturOrganisasiView,
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

  Future<dynamic> replaceWithTambahDanaSosialView({
    _i10.Key? key,
    bool isKhusus = false,
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  }) async {
    return replaceWith<dynamic>(Routes.tambahDanaSosialView,
        arguments: TambahDanaSosialViewArguments(key: key, isKhusus: isKhusus),
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> replaceWithEditSiswaView({
    required int idSiswa,
    _i10.Key? key,
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  }) async {
    return replaceWith<dynamic>(Routes.editSiswaView,
        arguments: EditSiswaViewArguments(idSiswa: idSiswa, key: key),
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> replaceWithDetailDanaSosialView({
    _i10.Key? key,
    required int id,
    bool isKhusus = false,
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  }) async {
    return replaceWith<dynamic>(Routes.detailDanaSosialView,
        arguments:
            DetailDanaSosialViewArguments(key: key, id: id, isKhusus: isKhusus),
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> replaceWithPimpinanIndexTrackingView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return replaceWith<dynamic>(Routes.pimpinanIndexTrackingView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> replaceWithUserIndexTrackingView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return replaceWith<dynamic>(Routes.userIndexTrackingView,
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

  Future<dynamic>
      replaceWithNestedDanaSosialKhususViewInAdminIndexTrackingViewRouter([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return replaceWith<dynamic>(
        AdminIndexTrackingViewRoutes.danaSosialKhususView,
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

  Future<dynamic> replaceWithNestedVisiMisiViewInAdminIndexTrackingViewRouter([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return replaceWith<dynamic>(AdminIndexTrackingViewRoutes.visiMisiView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> replaceWithNestedSejarahViewInAdminIndexTrackingViewRouter([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return replaceWith<dynamic>(AdminIndexTrackingViewRoutes.sejarahView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic>
      replaceWithNestedStrukturOrganisasiViewInAdminIndexTrackingViewRouter([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return replaceWith<dynamic>(
        AdminIndexTrackingViewRoutes.strukturOrganisasiView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic>
      replaceWithNestedDanaSosialAdminViewInPimpinanIndexTrackingViewRouter([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return replaceWith<dynamic>(
        PimpinanIndexTrackingViewRoutes.danaSosialAdminView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic>
      replaceWithNestedDanaSosialKhususViewInPimpinanIndexTrackingViewRouter([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return replaceWith<dynamic>(
        PimpinanIndexTrackingViewRoutes.danaSosialKhususView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic>
      replaceWithNestedDataSiswaViewInPimpinanIndexTrackingViewRouter([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return replaceWith<dynamic>(PimpinanIndexTrackingViewRoutes.dataSiswaView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> replaceWithNestedProfilViewInPimpinanIndexTrackingViewRouter([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return replaceWith<dynamic>(PimpinanIndexTrackingViewRoutes.profilView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic>
      replaceWithNestedDanaSosialAdminViewInUserIndexTrackingViewRouter([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return replaceWith<dynamic>(UserIndexTrackingViewRoutes.danaSosialAdminView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic>
      replaceWithNestedDanaSosialKhususViewInUserIndexTrackingViewRouter([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return replaceWith<dynamic>(
        UserIndexTrackingViewRoutes.danaSosialKhususView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> replaceWithNestedDataSiswaViewInUserIndexTrackingViewRouter([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return replaceWith<dynamic>(UserIndexTrackingViewRoutes.dataSiswaView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> replaceWithNestedProfilViewInUserIndexTrackingViewRouter([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return replaceWith<dynamic>(UserIndexTrackingViewRoutes.profilView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> replaceWithNestedVisiMisiViewInUserIndexTrackingViewRouter([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return replaceWith<dynamic>(UserIndexTrackingViewRoutes.visiMisiView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> replaceWithNestedSejarahViewInUserIndexTrackingViewRouter([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return replaceWith<dynamic>(UserIndexTrackingViewRoutes.sejarahView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic>
      replaceWithNestedStrukturOrganisasiViewInUserIndexTrackingViewRouter([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return replaceWith<dynamic>(
        UserIndexTrackingViewRoutes.strukturOrganisasiView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }
}
