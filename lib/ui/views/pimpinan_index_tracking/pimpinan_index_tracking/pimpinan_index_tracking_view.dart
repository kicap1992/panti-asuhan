import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:stylish_bottom_bar/model/bar_items.dart';
import 'package:stylish_bottom_bar/stylish_bottom_bar.dart';

import '../../../../app/app.router.dart';
import '../../../../app/themes/app_colors.dart';
import '../../../../app/themes/app_text.dart';
import './pimpinan_index_tracking_view_model.dart';

class PimpinanIndexTrackingView extends StatelessWidget {
  const PimpinanIndexTrackingView({super.key});

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<PimpinanIndexTrackingViewModel>.reactive(
      viewModelBuilder: () => PimpinanIndexTrackingViewModel(),
      onViewModelReady: (PimpinanIndexTrackingViewModel model) async {
        await model.init();
      },
      builder: (
        BuildContext context,
        PimpinanIndexTrackingViewModel model,
        Widget? child,
      ) {
        return Scaffold(
          appBar: AppBar(
            title: Text(
              model.header,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 20,
              ),
            ),
            backgroundColor: mainColor,
            elevation: 0,
            automaticallyImplyLeading: false,
            actions: [
              IconButton(
                onPressed: () {
                  // model.navigationService.navigateTo(Routes.loginScreenView);
                  model.logout();
                },
                icon: const Icon(
                  Icons.logout,
                  color: Colors.white,
                ),
              ),
            ],
          ),
          body: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
            child: ExtendedNavigator(
              navigatorKey: StackedService.nestedNavigationKey(4),
              router: PimpinanIndexTrackingViewRouter(),
              initialRoute: PimpinanIndexTrackingViewRoutes.danaSosialAdminView,
            ),
          ),
          bottomNavigationBar: StylishBottomBar(
            items: [
              for (var item in model.bottomNavBarList)
                BottomBarItem(
                  icon: Icon(item['icon'],
                      color: model.currentIndex ==
                              model.bottomNavBarList.indexOf(item)
                          ? sixthGrey
                          : backgroundColor),
                  title: Text(
                    item['name'],
                    style: regularTextStyle.copyWith(
                      color: model.currentIndex ==
                              model.bottomNavBarList.indexOf(item)
                          ? sixthGrey
                          : Colors.grey,
                    ),
                  ),
                  backgroundColor:
                      model.currentIndex == model.bottomNavBarList.indexOf(item)
                          ? Colors.white
                          : Colors.grey,
                ),
            ],
            currentIndex: model.currentIndex,
            hasNotch: true,
            backgroundColor: mainColor,
            onTap: (value) {
              model.handleNavigation(value);
            },
            option: BubbleBarOptions(
                barStyle: BubbleBarStyle.horizotnal,
                bubbleFillStyle: BubbleFillStyle.fill,
                opacity: 0.3),
          ),
        );
      },
    );
  }
}
