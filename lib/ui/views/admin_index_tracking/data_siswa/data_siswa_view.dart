import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

import '../../../../app/themes/app_colors.dart';
import '../../../../app/themes/app_text.dart';
import '../../../../services/other_function.dart';
import './data_siswa_view_model.dart';

class DataSiswaView extends StatelessWidget {
  const DataSiswaView({super.key});

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<DataSiswaViewModel>.reactive(
      viewModelBuilder: () => DataSiswaViewModel(),
      onViewModelReady: (DataSiswaViewModel model) async {
        await model.init();
      },
      builder: (
        BuildContext context,
        DataSiswaViewModel model,
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
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Total Anak Panti',
                      style: regularTextStyle.copyWith(
                        color: Colors.white,
                        fontSize: 15,
                      ),
                    ),
                    Text(
                      '${model.jumlahSiswa} orang',
                      style: regularTextStyle.copyWith(
                        color: Colors.white,
                        fontSize: 15,
                      ),
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
                  child: (model.siswaModelList.isEmpty)
                      ? Center(
                          child: Text(
                            'Tidak ada data',
                            style: boldTextStyle.copyWith(
                              fontSize: 20,
                            ),
                          ),
                        )
                      : // ListView.builder(
                      ListView.builder(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 15, vertical: 10),
                          itemCount: model.siswaModelList.length,
                          itemBuilder: (context, index) {
                            return Card(
                              child: ListTile(
                                  leading: Container(
                                    alignment: Alignment.center,
                                    width: 25,
                                    height: 25,
                                    decoration: BoxDecoration(
                                      color: mainColor,
                                      borderRadius: BorderRadius.circular(50),
                                    ),
                                    child: Text(
                                      '${index + 1}',
                                      style: regularTextStyle.copyWith(
                                          color: Colors.white),
                                    ),
                                  ),
                                  title: Text(
                                      model.otherFunction.capitalizeEachWord(
                                          model.siswaModelList[index].nama!),
                                      style: boldTextStyle.copyWith(
                                          fontSize: 13, color: mainColor)),
                                  subtitle: Text(
                                      'Umur : ${OtherFunction().umur(model.siswaModelList[index].tanggalLahir ?? '')}'),
                                  // circle avatar
                                  trailing: GestureDetector(
                                    onTap: () {
                                      model.log.i(
                                          'Edit${model.siswaModelList[index].idSiswa!}');
                                      model.goToEditSiswa(int.parse(model
                                          .siswaModelList[index].idSiswa!));
                                    },
                                    child: Container(
                                      width: 50,
                                      height: 50,
                                      decoration: BoxDecoration(
                                        color: mainColor,
                                        borderRadius: BorderRadius.circular(50),
                                      ),
                                      child: const Icon(
                                        Icons.person,
                                        color: Colors.white,
                                      ),
                                    ),
                                  )),
                            );
                          },
                        ),
                ),
              ),
            ],
          ),
          floatingActionButton: model.role == 'admin'
              ? FloatingActionButton(
                  onPressed: () {
                    model.addSiswa();
                  },
                  child: const Icon(Icons.add),
                )
              : null,
        );
      },
    );
  }
}
