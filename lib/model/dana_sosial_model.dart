class DanaSosialModel {
  String? idDanaSosial;
  String? keterangan;
  String? jumlah;
  String? tanggal;
  String? jenis;
  String? createdAt;
  String? updatedAt;

  DanaSosialModel(
      {this.idDanaSosial,
      this.keterangan,
      this.jumlah,
      this.tanggal,
      this.jenis,
      this.createdAt,
      this.updatedAt});

  DanaSosialModel.fromJson(Map<String, dynamic> json) {
    idDanaSosial = json['id_dana_sosial'];
    keterangan = json['keterangan'];
    jumlah = json['jumlah'];
    tanggal = json['tanggal'];
    jenis = json['jenis'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id_dana_sosial'] = idDanaSosial;
    data['keterangan'] = keterangan;
    data['jumlah'] = jumlah;
    data['tanggal'] = tanggal;
    data['jenis'] = jenis;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    return data;
  }
}
