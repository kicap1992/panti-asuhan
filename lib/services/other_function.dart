import 'package:intl/intl.dart';

class OtherFunction {
  int umur(String tanggalLahir) {
    // change tanggalLahir to DateTime
    DateTime date = DateTime.parse(tanggalLahir);
    // get current date
    DateTime now = DateTime.now();
    // get difference in year
    int year = now.year - date.year;
    return year;
  }

  String commaFormat(int number) {
    final formatter = NumberFormat('#,###');
    return formatter.format(number);
  }

  String changeMonth(String month) {
    switch (month) {
      case 'Januari':
        return '01';
      case 'Februari':
        return '02';
      case 'Maret':
        return '03';
      case 'April':
        return '04';
      case 'Mei':
        return '05';
      case 'Juni':
        return '06';
      case 'Juli':
        return '07';
      case 'Agustus':
        return '08';
      case 'September':
        return '09';
      case 'Oktober':
        return '10';
      case 'November':
        return '11';
      case 'Desember':
        return '12';
      default:
        return '';
    }
  }
}
