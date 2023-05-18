import 'package:flutter/material.dart';
import 'package:panti_asuhan/app/themes/app_colors.dart';
import 'package:stacked/stacked.dart';

import '../../../../app/themes/app_text.dart';
import './dana_sosial_admin_view_model.dart';

class DanaSosialAdminView extends StatelessWidget {
  const DanaSosialAdminView({super.key});

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<DanaSosialAdminViewModel>.reactive(
      viewModelBuilder: () => DanaSosialAdminViewModel(),
      onViewModelReady: (DanaSosialAdminViewModel model) async {
        await model.init();
      },
      builder: (
        BuildContext context,
        DanaSosialAdminViewModel model,
        Widget? child,
      ) {
        return Scaffold(
          body: Column(
            children: [
              Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                width: double.infinity,
                decoration: BoxDecoration(
                  color: mainColor,
                  borderRadius: BorderRadius.circular(10),
                  boxShadow: [
                    BoxShadow(
                      color: mainGrey.withOpacity(0.5),
                      spreadRadius: 5,
                      blurRadius: 7,
                      offset: const Offset(0, 3), // changes position of shadow
                    ),
                  ],
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Dana Sosial Bulan Ini',
                      style: boldTextStyle.copyWith(
                        color: Colors.white,
                        fontSize: 20,
                      ),
                    ),
                    const SizedBox(height: 10),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Total Dana Sosial',
                          style: regularTextStyle.copyWith(
                            color: Colors.white,
                            fontSize: 15,
                          ),
                        ),
                        Text(
                          'Rp. 1.000.000',
                          style: regularTextStyle.copyWith(
                            color: Colors.white,
                            fontSize: 15,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 25),
              Expanded(
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10),
                    boxShadow: [
                      BoxShadow(
                        color: mainGrey.withOpacity(0.5),
                        spreadRadius: 5,
                        blurRadius: 7,
                        offset:
                            const Offset(0, 3), // changes position of shadow
                      ),
                    ],
                  ),
                  child: (model.danaSosialModelList.isEmpty)
                      ? Center(
                          child: Text(
                            'Tidak ada data',
                            style: boldTextStyle.copyWith(
                              fontSize: 20,
                            ),
                          ),
                        )
                      : ListView.builder(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 15, vertical: 10),
                          itemCount: model.danaSosialModelList.length,
                          itemBuilder: (context, index) {
                            return Card(
                              child: ListTile(
                                title: Text(
                                    model.danaSosialModelList[index].tanggal ??
                                        '',
                                    style: boldTextStyle.copyWith(
                                        fontSize: 13, color: mainColor)),
                                subtitle: Text(
                                    'Rp. ${model.danaSosialModelList[index].jumlah}',
                                    style: regularTextStyle.copyWith(
                                        fontSize: 13, color: mainColor)),
                                trailing: Container(
                                  width: 50,
                                  height: 50,
                                  decoration: BoxDecoration(
                                    color: mainColor,
                                    borderRadius: BorderRadius.circular(50),
                                  ),
                                  child: IconButton(
                                    onPressed: () {
                                      // model.goToTambahDanaSosial();
                                    },
                                    icon: const Icon(
                                      Icons.edit,
                                      color: Colors.white,
                                    ),
                                  ),
                                ),
                              ),
                            );
                          },
                        ),
                ),
              ),
            ],
          ),
          floatingActionButton: FloatingActionButton(
            onPressed: () {
              model.goToTambahDanaSosial();
            },
            child: const Icon(Icons.add),
          ),
        );
      },
    );
  }
}
