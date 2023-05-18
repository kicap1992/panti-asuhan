class SiswaModel {
  String? idSiswa;
  String? nama;
  String? tanggalLahir;
  String? jenisKelamin;
  String? alamat;
  String? kemampuan;
  String? imgUrl;
  String? createdAt;
  String? updatedAt;
  String? tempatLahir;
  String? noTelpon;
  String? agama;
  String? kewarganegaraan;
  String? pendidikanSd;
  String? pendidikanSmp;
  String? pendidikanSma;
  String? hobi;

  SiswaModel(
      {this.idSiswa,
      this.nama,
      this.tanggalLahir,
      this.jenisKelamin,
      this.alamat,
      this.kemampuan,
      this.imgUrl,
      this.createdAt,
      this.updatedAt,
      this.tempatLahir,
      this.noTelpon,
      this.agama,
      this.kewarganegaraan,
      this.pendidikanSd,
      this.pendidikanSmp,
      this.pendidikanSma,
      this.hobi});

  SiswaModel.fromJson(Map<String, dynamic> json) {
    idSiswa = json['id_siswa'];
    nama = json['nama'];
    tanggalLahir = json['tanggal_lahir'];
    jenisKelamin = json['jenis_kelamin'];
    alamat = json['alamat'];
    kemampuan = json['kemampuan'];
    imgUrl = json['img_url'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    tempatLahir = json['tempat_lahir'];
    noTelpon = json['no_telpon'];
    agama = json['agama'];
    kewarganegaraan = json['kewarganegaraan'];
    pendidikanSd = json['pendidikan_sd'];
    pendidikanSmp = json['pendidikan_smp'];
    pendidikanSma = json['pendidikan_sma'];
    hobi = json['hobi'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id_siswa'] = idSiswa;
    data['nama'] = nama;
    data['tanggal_lahir'] = tanggalLahir;
    data['jenis_kelamin'] = jenisKelamin;
    data['alamat'] = alamat;
    data['kemampuan'] = kemampuan;
    data['img_url'] = imgUrl;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    data['tempat_lahir'] = tempatLahir;
    data['no_telpon'] = noTelpon;
    data['agama'] = agama;
    data['kewarganegaraan'] = kewarganegaraan;
    data['pendidikan_sd'] = pendidikanSd;
    data['pendidikan_smp'] = pendidikanSmp;
    data['pendidikan_sma'] = pendidikanSma;
    data['hobi'] = hobi;
    return data;
  }
}
