import '../../../../app/app.logger.dart';
import '../../../../app/core/custom_base_view_model.dart';

class FilterDialogViewModel extends CustomBaseViewModel {
  final log = getLogger('FilterDialogViewModel');

  String jenisDonasi = 'Semua';
  List<String> jenisDonasiList = ['Semua', 'Uang', 'Barang'];

  String bulan = 'Semua';
  List<String> bulanList = [
    'Semua',
    'Januari',
    'Februari',
    'Maret',
    'April',
    'Mei',
    'Juni',
    'Agustus',
    'September',
    'Oktober',
    'November',
    'Desember'
  ];

  String tahun = 'Semua';
  List<String> tahunList = [
    'Semua',
    '2023',
    '2022',
  ];

  String status = 'Semua';
  List<String> statusList = [
    'Semua',
    'Belum Dikonfirmasi',
    'Sudah Dikonfirmasi',
  ];

  Future<void> init() async {}
}
