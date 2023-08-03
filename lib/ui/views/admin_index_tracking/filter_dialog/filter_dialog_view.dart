import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

import '../../../../app/themes/app_colors.dart';
import '../../../../app/themes/app_text.dart';
import './filter_dialog_view_model.dart';

class FilterDialogView extends StatelessWidget {
  final DialogRequest? request;
  final Function(DialogResponse)? completer;

  const FilterDialogView({
    Key? key,
    this.request,
    this.completer,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<FilterDialogViewModel>.reactive(
      viewModelBuilder: () => FilterDialogViewModel(),
      onViewModelReady: (FilterDialogViewModel model) async {
        await model.init();
      },
      builder: (
        BuildContext context,
        FilterDialogViewModel model,
        Widget? child,
      ) {
        return Dialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
            ),
            padding: const EdgeInsets.all(10),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(
                  "FILTER LAPORAN",
                  style: boldTextStyle.copyWith(
                    fontSize: 16,
                  ),
                ),
                const SizedBox(height: 10),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    "Jenis Dana Sosial",
                    style: regularTextStyle.copyWith(color: mainColor),
                    textAlign: TextAlign.left,
                  ),
                ),
                Container(
                  width: double.infinity,
                  height: 60,
                  padding: const EdgeInsets.all(15),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(25),
                    border: Border.all(
                      color: mainColor,
                    ),
                  ),
                  child: DropdownButtonHideUnderline(
                    child: DropdownButton<String>(
                      value: model.jenisDonasi,
                      onChanged: (String? newValue) {
                        // model.setSelectedjenisDonasi(newValue!);
                        model.log.i(newValue);
                        model.jenisDonasi = newValue!;
                        model.notifyListeners();
                      },
                      items: model.jenisDonasiList.map((String value) {
                        return DropdownMenuItem<String>(
                          value: value,
                          child: Text(
                            value,
                            style: regularTextStyle.copyWith(
                              fontSize: 16,
                            ),
                          ),
                        );
                      }).toList(),
                    ),
                  ),
                ),
                const SizedBox(height: 10),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    "Filter Bulan",
                    style: regularTextStyle.copyWith(color: mainColor),
                    textAlign: TextAlign.left,
                  ),
                ),
                Container(
                  width: double.infinity,
                  height: 60,
                  padding: const EdgeInsets.all(15),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(25),
                    border: Border.all(
                      color: mainColor,
                    ),
                  ),
                  child: DropdownButtonHideUnderline(
                    child: DropdownButton<String>(
                      value: model.bulan,
                      onChanged: (String? newValue) {
                        // model.setSelectedbulan(newValue!);
                        model.log.i(newValue);
                        model.bulan = newValue!;
                        model.notifyListeners();
                      },
                      items: model.bulanList.map((String value) {
                        return DropdownMenuItem<String>(
                          value: value,
                          child: Text(
                            value,
                            style: regularTextStyle.copyWith(
                              fontSize: 16,
                            ),
                          ),
                        );
                      }).toList(),
                    ),
                  ),
                ),
                const SizedBox(height: 10),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    "Filter Tahun",
                    style: regularTextStyle.copyWith(color: mainColor),
                    textAlign: TextAlign.left,
                  ),
                ),
                Container(
                  width: double.infinity,
                  height: 60,
                  padding: const EdgeInsets.all(15),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(25),
                    border: Border.all(
                      color: mainColor,
                    ),
                  ),
                  child: DropdownButtonHideUnderline(
                    child: DropdownButton<String>(
                      value: model.tahun,
                      onChanged: (String? newValue) {
                        // model.setSelectedtahun(newValue!);
                        model.log.i(newValue);
                        model.tahun = newValue!;
                        model.notifyListeners();
                      },
                      items: model.tahunList.map((String value) {
                        return DropdownMenuItem<String>(
                          value: value,
                          child: Text(
                            value,
                            style: regularTextStyle.copyWith(
                              fontSize: 16,
                            ),
                          ),
                        );
                      }).toList(),
                    ),
                  ),
                ),
                const SizedBox(height: 10),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    "Filter Status",
                    style: regularTextStyle.copyWith(color: mainColor),
                    textAlign: TextAlign.left,
                  ),
                ),
                Container(
                  width: double.infinity,
                  height: 60,
                  padding: const EdgeInsets.all(15),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(25),
                    border: Border.all(
                      color: mainColor,
                    ),
                  ),
                  child: DropdownButtonHideUnderline(
                    child: DropdownButton<String>(
                      value: model.status,
                      onChanged: (String? newValue) {
                        // model.setSelectedstatus(newValue!);
                        model.log.i(newValue);
                        model.status = newValue!;
                        model.notifyListeners();
                      },
                      items: model.statusList.map((String value) {
                        return DropdownMenuItem<String>(
                          value: value,
                          child: Text(
                            value,
                            style: regularTextStyle.copyWith(
                              fontSize: 16,
                            ),
                          ),
                        );
                      }).toList(),
                    ),
                  ),
                ),
                const SizedBox(height: 15),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Expanded(
                      child: TextButton(
                        onPressed: () {
                          // model.filter();
                          // model.filter();
                          completer!(
                            DialogResponse(
                              confirmed: true,
                              data: {
                                'jenisDonasi': model.jenisDonasi,
                                'bulan': model.bulan,
                                'tahun': model.tahun,
                                'status': model.status,
                              },
                            ),
                          );
                        },
                        style: TextButton.styleFrom(
                          backgroundColor: mainColor,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(25),
                          ),
                        ),
                        child: Text(
                          "Filter",
                          style: boldTextStyle.copyWith(
                            fontSize: 16,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(width: 10),
                    Expanded(
                      child: TextButton(
                        onPressed: () {
                          completer!(DialogResponse(confirmed: false));
                        },
                        style: TextButton.styleFrom(
                          backgroundColor: mainGrey,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(25),
                          ),
                        ),
                        child: Text(
                          "Close",
                          style: boldTextStyle.copyWith(
                            fontSize: 16,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
        );
      },
    );
  }
}
