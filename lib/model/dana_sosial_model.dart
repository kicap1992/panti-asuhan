class DanaSosialModel {
  String? idDanaSosial;
  String? bentuk;
  String? nama;
  String? jumlah;
  String? tanggal;
  String? keterangan;
  String? jenisDonasi;
  String? status;
  String? jenisBarang;
  String? satuan;
  String? jumlahBarang;

  String? createdAt;
  String? updatedAt;

  DanaSosialModel(
      {this.idDanaSosial,
      this.bentuk,
      this.nama,
      this.jumlah,
      this.tanggal,
      this.keterangan,
      this.jenisDonasi,
      this.status,
      this.jenisBarang,
      this.satuan,
      this.jumlahBarang,
      this.createdAt,
      this.updatedAt});

  DanaSosialModel.fromJson(Map<String, dynamic> json) {
    idDanaSosial = json['id_dana_sosial'];
    bentuk = json['bentuk'];
    nama = json['nama'] ?? '';
    jumlah = json['jumlah'];
    tanggal = json['tanggal'];
    keterangan = json['ket'] ?? '';
    jenisDonasi = json['jenis'];
    status =
        json['status'] == '0' ? 'Belum Dikonfirmasi' : 'Sudah Dikonfirmasi';
    jenisBarang = json['jenis_barang'] ?? '';
    satuan = json['satuan'] ?? '';
    jumlahBarang = json['jumlah_barang'] ?? '';
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id_dana_sosial'] = idDanaSosial;
    data['bentuk'] = bentuk;
    data['nama'] = nama;
    data['jumlah'] = jumlah;
    data['tanggal'] = tanggal;
    data['ket'] = keterangan;
    data['jenis'] = jenisDonasi;
    data['status'] = status;
    data['jenis_barang'] = jenisBarang;
    data['satuan'] = satuan;
    data['jumlah_barang'] = jumlahBarang;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    return data;
  }
}
