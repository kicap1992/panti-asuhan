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
          body: SingleChildScrollView(
            child: Column(
              children: [
                const SizedBox(height: 10),
                Text(
                  "Laporan Harian",
                  style:
                      boldTextStyle.copyWith(fontSize: 15, color: Colors.black),
                ),
                Container(
                  padding: const EdgeInsets.all(10),
                  height: MediaQuery.of(context).size.height * 0.45,
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
                const SizedBox(
                  height: 30,
                ),
                Text(
                  "Laporan Bulanan",
                  style:
                      boldTextStyle.copyWith(fontSize: 15, color: Colors.black),
                ),
                Container(
                  padding: const EdgeInsets.all(15),
                  width: double.infinity,
                  height: MediaQuery.of(context).size.height * 0.25,
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
                const SizedBox(
                  height: 30,
                ),
                Text(
                  "Laporan Tahunan",
                  style:
                      boldTextStyle.copyWith(fontSize: 15, color: Colors.black),
                ),
                Container(
                  padding: const EdgeInsets.all(15),
                  width: double.infinity,
                  height: MediaQuery.of(context).size.height * 0.25,
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
                  child: model.yearIncomeOutcome.isNotEmpty
                      ? const TahunanWidget()
                      : const Center(
                          child: Text(
                            'Tidak ada data',
                          ),
                        ),
                ),
                const SizedBox(
                  height: 30,
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
                        offset:
                            const Offset(0, 3), // changes position of shadow
                      ),
                    ],
                  ),
                  child: Column(
                    children: [
                      Row(
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
                      const SizedBox(height: 10),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text(
                            'Total Pengeluaran :',
                          ),
                          const Expanded(child: SizedBox()),
                          Text(
                            'Rp. ${OtherFunction().commaFormat(model.totalOutcome)}',
                          )
                        ],
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 30,
                ),
              ],
            ),
          ),
          floatingActionButton: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              if (model.role == 'admin')
                FloatingActionButton(
                  mini: true,
                  heroTag: 'btn11',
                  onPressed: () {
                    model.goToTambahDanaSosial();
                  },
                  child: const Icon(Icons.add),
                ),
              const SizedBox(width: 5),
              FloatingActionButton(
                mini: true,
                heroTag: 'btn22',
                onPressed: () {
                  model.filterDialog(context);
                },
                child: const Icon(Icons.filter_list),
              ),
            ],
          ),
          floatingActionButtonLocation: FloatingActionButtonLocation.miniEndTop,
        );
      },
    );
  }
}

class TahunanWidget extends ViewModelWidget<DanaSosialAdminViewModel> {
  const TahunanWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context, DanaSosialAdminViewModel viewModel) {
    return SingleChildScrollView(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          for (int i = 0; i < viewModel.yearIncomeOutcome.length; i++)
            Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Align(
                  alignment: Alignment.centerLeft,
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        "Tahun ${viewModel.yearIncomeOutcome[i]['tahun']}",
                        style: boldTextStyle.copyWith(
                          decoration: TextDecoration.underline,
                          fontSize: 17,
                        ),
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      if (viewModel.role == 'admin' ||
                          viewModel.role == 'pimpinan')
                        Container(
                          alignment: Alignment.center,
                          width: 30,
                          height: 30,
                          decoration: BoxDecoration(
                            color: mainColor,
                            borderRadius: BorderRadius.circular(50),
                          ),
                          child: IconButton(
                            onPressed: () async {
                              // sini untuk laporan bulanan
                              await viewModel.goToLaporanTahunan(
                                  viewModel.yearIncomeOutcome[i]['tahun']);
                            },
                            icon: const Icon(
                              Icons.list_alt_outlined,
                              color: Colors.white,
                              size: 15,
                            ),
                          ),
                        )
                    ],
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
                        'Rp. ${OtherFunction().commaFormat(viewModel.yearIncomeOutcome[i]['pemasukan'])}',
                        style: italicTextStyle,
                      ))),
                      TableCell(
                          child: Center(
                              child: Text(
                        'Rp. ${OtherFunction().commaFormat(viewModel.yearIncomeOutcome[i]['pengeluaran'])}',
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

class HasilIncomeOutcome extends ViewModelWidget<DanaSosialAdminViewModel> {
  const HasilIncomeOutcome({
    super.key,
  });

  @override
  Widget build(BuildContext context, DanaSosialAdminViewModel viewModel) {
    return SingleChildScrollView(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          for (int i = 0; i < viewModel.monthIncomeOutcome.length; i++)
            Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Align(
                  alignment: Alignment.centerLeft,
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
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
                        width: 10,
                      ),
                      if (viewModel.role == 'admin' ||
                          viewModel.role == 'pimpinan')
                        Container(
                          alignment: Alignment.center,
                          width: 30,
                          height: 30,
                          decoration: BoxDecoration(
                            color: mainColor,
                            borderRadius: BorderRadius.circular(50),
                          ),
                          child: IconButton(
                            onPressed: () async {
                              // sini untuk laporan bulanan
                              await viewModel.goToLaporanBulanan(
                                  viewModel.monthIncomeOutcome[i]['month']);
                            },
                            icon: const Icon(
                              Icons.list_alt_outlined,
                              color: Colors.white,
                              size: 15,
                            ),
                          ),
                        )
                    ],
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
        // viewModel.log.i(viewModel.danaSosialModelList[index].tanggal);

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

class TheDataNewly extends ViewModelWidget<DanaSosialAdminViewModel> {
  const TheDataNewly({
    super.key,
  });

  @override
  Widget build(BuildContext context, DanaSosialAdminViewModel viewModel) {
    return ListView.builder(
      itemCount: viewModel.filteredByDateData.length,
      itemBuilder: (context, index) {
        return Padding(
          padding: const EdgeInsets.only(bottom: 30),
          child: Container(
            padding: const EdgeInsets.all(5),
            decoration: const BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(10)),
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
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text(
                            '${viewModel.filteredByDateData[index]['data'][i]['date']} : ${viewModel.otherFunction.getDayOfWeek(viewModel.filteredByDateData[index]['data'][i]['date'])}',
                            style: italicTextStyle.copyWith(
                                fontWeight: FontWeight.bold, fontSize: 15),
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                          if (viewModel.role == 'admin' ||
                              viewModel.role == 'pimpinan')
                            Container(
                              alignment: Alignment.center,
                              width: 35,
                              height: 35,
                              decoration: BoxDecoration(
                                color: mainColor,
                                borderRadius: BorderRadius.circular(35),
                              ),
                              child: IconButton(
                                onPressed: () {
                                  viewModel.getLaporanHarian(
                                      viewModel.filteredByDateData[index]
                                          ['data'][i]['date'],
                                      viewModel.otherFunction.getDayOfWeek(
                                          viewModel.filteredByDateData[index]
                                              ['data'][i]['date']));
                                },
                                icon: const Icon(
                                  Icons.list_alt_outlined,
                                  color: Colors.white,
                                  size: 20,
                                ),
                              ),
                            )
                        ],
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
                                          spacing: 5,
                                          runSpacing: 10,
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

class JenisIconContainer extends StatelessWidget {
  const JenisIconContainer({
    super.key,
    required this.color,
    required this.icon,
  });

  final Color color;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 20,
      height: 20,
      alignment: Alignment.center,
      decoration: BoxDecoration(
        color: color,
        shape: BoxShape.circle,
      ),
      child: Icon(
        icon,
        color: Colors.white,
        size: 15,
      ),
    );
  }
}
