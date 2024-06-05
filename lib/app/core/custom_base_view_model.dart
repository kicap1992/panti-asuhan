import 'package:shared_preferences/shared_preferences.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

import '../../services/other_function.dart';
import '../app.locator.dart';

class CustomBaseViewModel extends BaseViewModel {
  final dialogService = locator<DialogService>();
  final navigationService = locator<NavigationService>();
  final bottomSheetService = locator<BottomSheetService>();
  final snackbarService = locator<SnackbarService>();
  final Future<SharedPreferences> prefs = SharedPreferences.getInstance();
  final otherFunction = locator<OtherFunction>();

  void back() {
    navigationService.back();
  }
}
