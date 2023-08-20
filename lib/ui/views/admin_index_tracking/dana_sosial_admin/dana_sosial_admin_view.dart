import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

import '../../../../app/themes/app_colors.dart';
import '../../../../app/themes/app_text.dart';
import '../../../../services/other_function.dart';
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
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 15, vertical: 10),
                      width: double.infinity,
                      decoration: BoxDecoration(
                        color: mainColor,
                        borderRadius: BorderRadius.circular(10),
                        boxShadow: [
                          BoxShadow(
                            color: mainGrey.withOpacity(0.5),
                            spreadRadius: 5,
                            blurRadius: 7,
                            offset: const Offset(
                                0, 3), // changes position of shadow
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
                  ),
                  const SizedBox(width: 10),
                  Container(
                    width: 50,
                    height: 50,
                    decoration: const BoxDecoration(
                      shape: BoxShape.circle,
                      color: mainColor,
                    ),
                    child: IconButton(
                      icon: const Icon(
                        Icons.filter_list,
                        color: Colors.white,
                      ),
                      onPressed: () {
                        model.filterDialog(context);
                      },
                    ),
                  ),
                ],
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
                      : const TheData(),
                ),
              ),
            ],
          ),
          floatingActionButton: model.role == 'admin'
              ? FloatingActionButton(
                  onPressed: () {
                    model.goToTambahDanaSosial();
                  },
                  child: const Icon(Icons.add),
                )
              : null,
        );
      },
    );
  }
}

class TheData extends ViewModelWidget<DanaSosialAdminViewModel> {
  const TheData({
    super.key,
  });

  @override
  Widget build(BuildContext context, DanaSosialAdminViewModel viewModel) {
    return ListView.builder(
      padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
      itemCount: viewModel.danaSosialModelList.length,
      itemBuilder: (context, index) {
        String jumlahDonasi = viewModel
                    .danaSosialModelList[index].jenisDonasi !=
                'Barang'
            ? OtherFunction().commaFormat(
                int.parse(viewModel.danaSosialModelList[index].jumlah ?? '0'))
            : '0';
        return Card(
          child: ListTile(
            title: Text(viewModel.danaSosialModelList[index].tanggal ?? '',
                style: boldTextStyle.copyWith(fontSize: 13, color: mainColor)),
            subtitle: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  viewModel.danaSosialModelList[index].bentuk == 'Pemasukan'
                      ? 'Pemasukan'
                      : 'Pengeluaran',
                  style: boldTextStyle.copyWith(
                    fontSize: 14,
                    color: viewModel.danaSosialModelList[index].bentuk ==
                            'Pemasukan'
                        ? Colors.green
                        : Colors.red,
                  ),
                ),
                Text(
                  viewModel.danaSosialModelList[index].nama ?? '-',
                  style: regularTextStyle.copyWith(
                    fontSize: 13,
                    color: viewModel.danaSosialModelList[index].bentuk ==
                            'Pemasukan'
                        ? Colors.green
                        : Colors.red,
                  ),
                ),
                Text(
                  // viewModel.danaSosialModelList[index].jenisDonasi == 'Uang'
                  //     ? (viewModel.isLogin == true ? 'Rp. $jumlahDonasi' : '-')
                  //     : 'Donasi Barang',
                  viewModel.danaSosialModelList[index].bentuk == 'Pemasukan'
                      ? (viewModel.danaSosialModelList[index].jenisDonasi ==
                              'Uang'
                          ? (viewModel.isLogin == true
                              ? 'Rp. $jumlahDonasi'
                              : '-')
                          : 'Donasi Barang')
                      : (viewModel.danaSosialModelList[index].jenisDonasi ==
                              'Uang'
                          ? (viewModel.isLogin == true
                              ? 'Rp. $jumlahDonasi'
                              : '-')
                          : 'Pengeluaran Barang'),
                  style: regularTextStyle.copyWith(
                    fontSize: 13,
                    color: viewModel.danaSosialModelList[index].bentuk ==
                            'Pemasukan'
                        ? Colors.green
                        : Colors.red,
                  ),
                ),
                Text(
                  viewModel.danaSosialModelList[index].status ?? '',
                  style: regularTextStyle.copyWith(
                    fontSize: 13,
                    color: viewModel.danaSosialModelList[index].status ==
                            'Belum Dikonfirmasi'
                        ? Colors.red
                        : Colors.green,
                  ),
                ),
              ],
            ),
            trailing: viewModel.isLogin == null
                ? null
                : (viewModel.isLogin == true
                    ? Container(
                        width: 50,
                        height: 50,
                        decoration: BoxDecoration(
                          color: mainColor,
                          borderRadius: BorderRadius.circular(50),
                        ),
                        child: IconButton(
                          onPressed: () {
                            viewModel.goToEditDanaSosial(int.parse(viewModel
                                .danaSosialModelList[index].idDanaSosial!));
                          },
                          icon: const Icon(
                            Icons.edit,
                            color: Colors.white,
                          ),
                        ),
                      )
                    : null),
          ),
        );
      },
    );
  }
}
