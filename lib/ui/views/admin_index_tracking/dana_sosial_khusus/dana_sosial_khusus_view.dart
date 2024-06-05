import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

import '../../../../app/themes/app_colors.dart';
import '../../../../app/themes/app_text.dart';
import '../../../../services/other_function.dart';
import '../dana_sosial_admin/dana_sosial_admin_view.dart';
import './dana_sosial_khusus_view_model.dart';

class DanaSosialKhususView extends StatelessWidget {
  const DanaSosialKhususView({super.key});

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<DanaSosialKhususViewModel>.reactive(
      viewModelBuilder: () => DanaSosialKhususViewModel(),
      onViewModelReady: (DanaSosialKhususViewModel model) async {
        await model.init();
      },
      builder: (
        BuildContext context,
        DanaSosialKhususViewModel model,
        Widget? child,
      ) {
        return Scaffold(
          body: Column(
            children: [
              // Row(
              //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
              //   children: [
              //     Expanded(
              //       child: Container(
              //         padding: const EdgeInsets.symmetric(
              //             horizontal: 15, vertical: 10),
              //         width: double.infinity,
              //         decoration: BoxDecoration(
              //           color: mainColor,
              //           borderRadius: BorderRadius.circular(10),
              //           boxShadow: [
              //             BoxShadow(
              //               color: mainGrey.withOpacity(0.5),
              //               spreadRadius: 5,
              //               blurRadius: 7,
              //               offset: const Offset(
              //                   0, 3), // changes position of shadow
              //             ),
              //           ],
              //         ),
              //         child: Column(
              //           crossAxisAlignment: CrossAxisAlignment.start,
              //           children: [
              //             Text(
              //               'Dana Sosial Bulan Ini',
              //               style: boldTextStyle.copyWith(
              //                 color: Colors.white,
              //                 fontSize: 20,
              //               ),
              //             ),
              //             const SizedBox(height: 10),
              //             Row(
              //               mainAxisAlignment: MainAxisAlignment.spaceBetween,
              //               children: [
              //                 Text(
              //                   'Total Dana Sosial',
              //                   style: regularTextStyle.copyWith(
              //                     color: Colors.white,
              //                     fontSize: 15,
              //                   ),
              //                 ),
              //                 Text(
              //                   'Rp. ${OtherFunction().commaFormat(model.jumlahDonasi)}',
              //                   style: regularTextStyle.copyWith(
              //                     color: Colors.white,
              //                     fontSize: 15,
              //                   ),
              //                 ),
              //               ],
              //             ),
              //             const SizedBox(height: 10),
              //             Row(
              //               mainAxisAlignment: MainAxisAlignment.spaceBetween,
              //               children: [
              //                 Text(
              //                   'Pengeluaran Dana Sosial',
              //                   style: regularTextStyle.copyWith(
              //                     color: Colors.white,
              //                     fontSize: 15,
              //                   ),
              //                 ),
              //                 Text(
              //                   'Rp. ${OtherFunction().commaFormat(model.jumlahPengeluaran)}',
              //                   style: regularTextStyle.copyWith(
              //                     color: Colors.white,
              //                     fontSize: 15,
              //                   ),
              //                 ),
              //               ],
              //             ),
              //           ],
              //         ),
              //       ),
              //     ),
              //     const SizedBox(width: 10),
              //     Container(
              //       width: 50,
              //       height: 50,
              //       decoration: const BoxDecoration(
              //         shape: BoxShape.circle,
              //         color: mainColor,
              //       ),
              //       child: IconButton(
              //         icon: const Icon(
              //           Icons.filter_list,
              //           color: Colors.white,
              //         ),
              //         onPressed: () {
              //           model.filterDialog(context);
              //         },
              //       ),
              //     ),
              //   ],
              // ),
              const SizedBox(height: 10),
              Expanded(
                flex: 4,
                child: Container(
                  padding: const EdgeInsets.all(10),
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
                      : const TheDataNewly(),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Expanded(
                flex: 2,
                child: Container(
                  padding: const EdgeInsets.all(15),
                  width: double.infinity,
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
                  child: model.monthIncomeOutcome.isEmpty
                      ? const Center(
                          child: Text(
                          'Tidak ada data',
                        ))
                      : const HasilIncomeOutcome(),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Container(
                padding: const EdgeInsets.all(20),
                decoration: BoxDecoration(
                  color: Colors.white,
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
                    const Text(
                      'Total Pemasukan :',
                    ),
                    const Expanded(child: SizedBox()),
                    Text(
                      'Rp. ${OtherFunction().commaFormat(model.totalIncome)}',
                    )
                  ],
                ),
              ),
            ],
          ),
          floatingActionButton: model.role == 'admin'
              ? Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    if (model.role == 'admin')
                      FloatingActionButton(
                        heroTag: 'btn1',
                        onPressed: () {
                          model.goToTambahDanaSosial();
                        },
                        child: const Icon(Icons.add),
                      ),
                    if (model.role == 'admin') const SizedBox(width: 10),
                    if (model.role == 'admin')
                      FloatingActionButton(
                        heroTag: 'btn2',
                        onPressed: () async {
                          bool res = await model.addDonatur();
                          model.log.i(res);
                        },
                        child: const Icon(Icons.person_add_alt),
                      ),
                    const SizedBox(width: 10),
                    FloatingActionButton(
                      heroTag: 'btn3',
                      onPressed: () {
                        model.filterDialog(context);
                      },
                      child: const Icon(Icons.filter_list),
                    ),
                  ],
                )
              : null,
          floatingActionButtonLocation: FloatingActionButtonLocation.miniEndTop,
        );
      },
    );
  }
}

class TheData extends ViewModelWidget<DanaSosialKhususViewModel> {
  const TheData({
    super.key,
  });

  @override
  Widget build(BuildContext context, DanaSosialKhususViewModel viewModel) {
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
                    ? Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Container(
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
                          ),
                          const SizedBox(width: 10),
                          Container(
                            width: 50,
                            height: 50,
                            decoration: BoxDecoration(
                              color: Colors.red,
                              borderRadius: BorderRadius.circular(50),
                            ),
                            child: IconButton(
                              onPressed: () {
                                viewModel.deleteData(int.parse(viewModel
                                    .danaSosialModelList[index].idDanaSosial!));
                              },
                              icon: const Icon(
                                Icons.delete,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ],
                      )
                    : null),
          ),
        );
      },
    );
  }
}

class TheDataNewly extends ViewModelWidget<DanaSosialKhususViewModel> {
  const TheDataNewly({
    super.key,
  });

  @override
  Widget build(BuildContext context, DanaSosialKhususViewModel viewModel) {
    return ListView.builder(
      itemCount: viewModel.filteredByDateData.length,
      itemBuilder: (context, index) {
        return Padding(
          padding: const EdgeInsets.only(bottom: 30),
          child: Container(
            padding: const EdgeInsets.all(5),
            decoration: BoxDecoration(
              borderRadius: const BorderRadius.all(Radius.circular(10)),
              boxShadow: [
                BoxShadow(
                  color: mainGrey.withOpacity(0.2),
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
                  '${viewModel.otherFunction.changeMonthYear(viewModel.filteredByDateData[index]['month'])} ',
                  style: boldTextStyle.copyWith(
                    decoration: TextDecoration.underline,
                    fontSize: 17,
                  ),
                ),
                const SizedBox(height: 10),
                for (int i = 0;
                    i < viewModel.filteredByDateData[index]['data'].length;
                    i++)
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        '${viewModel.filteredByDateData[index]['data'][i]['date']} : ${viewModel.otherFunction.getDayOfWeek(viewModel.filteredByDateData[index]['data'][i]['date'])}',
                        style: italicTextStyle.copyWith(
                            fontWeight: FontWeight.bold, fontSize: 15),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Table(
                        border: TableBorder.all(
                          color: Colors.grey,
                        ),
                        columnWidths: viewModel.role == 'admin'
                            ? const {
                                0: FlexColumnWidth(
                                    1), // 1/3 of the available width
                                1: FlexColumnWidth(
                                    1.5), // 2/3 of the available width
                                2: FlexColumnWidth(
                                    2.5), // 2/3 of the available width
                                3: FlexColumnWidth(
                                    3), // 2/3 of the available width
                                4: FlexColumnWidth(
                                    2), // 2/3 of the available width
                              }
                            : const {
                                0: FlexColumnWidth(
                                    1), // 1/3 of the available width
                                1: FlexColumnWidth(
                                    2), // 2/3 of the available width
                                2: FlexColumnWidth(
                                    2), // 2/3 of the available width
                                3: FlexColumnWidth(
                                    3), // 2/3 of the available width
                              },
                        children: [
                          TableRow(
                            children: [
                              const TableCell(
                                child: Center(
                                  child: Text(
                                    'No',
                                    style: boldTextStyle,
                                  ),
                                ),
                              ),
                              const TableCell(
                                  child: Center(
                                      child: Text(
                                'Jenis',
                                style: boldTextStyle,
                              ))),
                              const TableCell(
                                  child: Center(
                                      child: Text(
                                'Donatur',
                                style: boldTextStyle,
                              ))),
                              const TableCell(
                                child: Center(
                                  child: Text(
                                    'Jumlah /\nKeterangan',
                                    style: boldTextStyle,
                                  ),
                                ),
                              ),
                              if (viewModel.role == 'admin')
                                const TableCell(
                                  child: Center(
                                    child: Text(
                                      'Aksi',
                                      style: boldTextStyle,
                                    ),
                                  ),
                                )
                            ],
                          ),
                          for (int j = 0;
                              j <
                                  viewModel
                                      .filteredByDateData[index]['data'][i]
                                          ['data_dana']
                                      .length;
                              j++)
                            TableRow(
                              children: [
                                TableCell(
                                  child: Padding(
                                    padding: const EdgeInsets.symmetric(
                                      vertical: 4,
                                      horizontal: 4,
                                    ),
                                    child: Center(
                                      child: Text(
                                        '${j + 1}',
                                        style: regularTextStyle,
                                      ),
                                    ),
                                  ),
                                ),
                                TableCell(
                                  child: Padding(
                                    padding: const EdgeInsets.symmetric(
                                      vertical: 4,
                                      horizontal: 4,
                                    ),
                                    child: Center(
                                        // circle icon
                                        child: viewModel
                                                    .filteredByDateData[index]
                                                        ['data'][i]['data_dana']
                                                        [j]
                                                    .bentuk ==
                                                'Pemasukan'
                                            ? const JenisIconContainer(
                                                color: Colors.green,
                                                icon: Icons.arrow_upward,
                                              )
                                            : const JenisIconContainer(
                                                color: Colors.red,
                                                icon: Icons.arrow_downward,
                                              )),
                                  ),
                                ),
                                TableCell(
                                    child: Padding(
                                  padding: const EdgeInsets.symmetric(
                                    vertical: 4,
                                    horizontal: 4,
                                  ),
                                  child: Center(
                                      child: Text(
                                    '${viewModel.filteredByDateData[index]['data'][i]['data_dana'][j].nama == '' ? '-' : viewModel.filteredByDateData[index]['data'][i]['data_dana'][j].nama}',
                                    style: regularTextStyle,
                                  )),
                                )),
                                TableCell(
                                  child: Padding(
                                    padding: const EdgeInsets.symmetric(
                                      vertical: 4,
                                      horizontal: 4,
                                    ),
                                    child: Center(
                                      child: Text(
                                        viewModel
                                                    .filteredByDateData[index]
                                                        ['data'][i]['data_dana']
                                                        [j]
                                                    .jenisDonasi ==
                                                'Uang'
                                            ? 'Rp. ${viewModel.otherFunction.commaFormat(int.parse(viewModel.filteredByDateData[index]['data'][i]['data_dana'][j].jumlah))}'
                                            : viewModel
                                                .filteredByDateData[index]
                                                    ['data'][i]['data_dana'][j]
                                                .keterangan,
                                        style: regularTextStyle,
                                      ),
                                    ),
                                  ),
                                ),
                                if (viewModel.role == 'admin')
                                  TableCell(
                                    child: Center(
                                      child: Padding(
                                        padding: const EdgeInsets.symmetric(
                                          vertical: 4,
                                          horizontal: 4,
                                        ),
                                        child: Wrap(
                                          runSpacing: 10,
                                          spacing: 5,
                                          children: [
                                            GestureDetector(
                                              onTap: () {
                                                viewModel.goToEditDanaSosial(
                                                    int.parse(viewModel
                                                        .filteredByDateData[
                                                            index]['data'][i]
                                                            ['data_dana'][j]
                                                        .idDanaSosial));
                                              },
                                              child: JenisIconContainer(
                                                color: Colors.blue[600]!,
                                                icon: Icons.edit,
                                              ),
                                            ),
                                            GestureDetector(
                                              onTap: () {
                                                viewModel.deleteData(
                                                  int.parse(viewModel
                                                      .filteredByDateData[index]
                                                          ['data'][i]
                                                          ['data_dana'][j]
                                                      .idDanaSosial!),
                                                );
                                              },
                                              child: const JenisIconContainer(
                                                color: Colors.red,
                                                icon: Icons.delete,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  )
                              ],
                            ),
                        ],
                      ),
                      const SizedBox(height: 10),
                      // create a horizontal line
                      const Divider(
                        color: Colors.grey,
                        thickness: 1.0,
                      ),
                      const SizedBox(height: 10),
                    ],
                  ),
              ],
            ),
          ),
        );
      },
    );
  }
}

class HasilIncomeOutcome extends ViewModelWidget<DanaSosialKhususViewModel> {
  const HasilIncomeOutcome({
    super.key,
  });

  @override
  Widget build(BuildContext context, DanaSosialKhususViewModel viewModel) {
    return SingleChildScrollView(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          for (int i = 0; i < viewModel.monthIncomeOutcome.length; i++)
            Column(
              children: [
                Text(
                  viewModel.otherFunction.changeMonthYear(
                      viewModel.monthIncomeOutcome[i]['month']),
                  style: boldTextStyle.copyWith(
                    decoration: TextDecoration.underline,
                    fontSize: 17,
                  ),
                ),
                const SizedBox(
                  height: 5,
                ),
                Table(
                  border: TableBorder.all(
                    color: Colors.grey,
                  ),
                  children: [
                    const TableRow(children: [
                      TableCell(
                          child: Center(
                              child: Text(
                        'Pemasukan',
                        style: boldTextStyle,
                      ))),
                      TableCell(
                          child: Center(
                              child: Text(
                        'Pengeluaran',
                        style: boldTextStyle,
                      )))
                    ]),
                    TableRow(children: [
                      TableCell(
                          child: Center(
                              child: Text(
                        'Rp. ${OtherFunction().commaFormat(viewModel.monthIncomeOutcome[i]['income'])}',
                        style: italicTextStyle,
                      ))),
                      TableCell(
                          child: Center(
                              child: Text(
                        'Rp. ${OtherFunction().commaFormat(viewModel.monthIncomeOutcome[i]['outcome'])}',
                        style: italicTextStyle,
                      )))
                    ]),
                  ],
                ),
                const SizedBox(
                  height: 5,
                ),
                const Divider(
                  color: Colors.grey,
                  thickness: 1,
                ),
                const SizedBox(
                  height: 5,
                ),
              ],
            )
        ],
      ),
    );
  }
}
