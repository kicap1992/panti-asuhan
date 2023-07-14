class DanaSosialModel {
  String? idDanaSosial;
  String? nama;
  String? jumlah;
  String? tanggal;

  String? createdAt;
  String? updatedAt;

  DanaSosialModel(
      {this.idDanaSosial,
      this.nama,
      this.jumlah,
      this.tanggal,
      this.createdAt,
      this.updatedAt});

  DanaSosialModel.fromJson(Map<String, dynamic> json) {
    idDanaSosial = json['id_dana_sosial'];
    nama = json['nama'];
    jumlah = json['jumlah'];
    tanggal = json['tanggal'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id_dana_sosial'] = idDanaSosial;
    data['nama'] = nama;
    data['jumlah'] = jumlah;
    data['tanggal'] = tanggal;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    return data;
  }
}
