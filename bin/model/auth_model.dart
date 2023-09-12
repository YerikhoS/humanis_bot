class AuthModel {
  int? statusCode;
  Data? data;

  AuthModel({this.statusCode, this.data});

  AuthModel.fromJson(Map<String, dynamic> json) {
    statusCode = json['status_code'];
    data = json['data'] != null ? new Data.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status_code'] = this.statusCode;
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    return data;
  }
}

class Data {
  User? user;
  String? base64;

  Data({this.user, this.base64});

  Data.fromJson(Map<String, dynamic> json) {
    user = json['user'] != null ? new User.fromJson(json['user']) : null;
    base64 = json['base64'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.user != null) {
      data['user'] = this.user!.toJson();
    }
    data['base64'] = this.base64;
    return data;
  }
}

class User {
  SafeEmail? safeEmail;
  String? client;
  int? isDbGeneral;
  MPerusahaan? mPerusahaan;
  String? userId;
  String? nik;
  String? statusTxt;
  String? jabatanTxt;
  String? mJabatanId;
  String? bahasa;
  int? menitPassword;
  String? uid;
  String? nama;
  String? email;
  String? tipe;
  String? foto;
  String? fotoProfil;
  String? id;
  String? karyawanPerusahaan;
  String? registrationToken;
  String? karyawanDataId;
  int? isTutorial;
  String? mRolesId;
  int? lastLogin;
  Akses? akses;
  DataLengkap? dataLengkap;
  String? aksesDepartemen;
  List<String>? aksesPerusahaan;
  List<String>? topicFirebase;

  User(
      {this.safeEmail,
      this.client,
      this.isDbGeneral,
      this.mPerusahaan,
      this.userId,
      this.nik,
      this.statusTxt,
      this.jabatanTxt,
      this.mJabatanId,
      this.bahasa,
      this.menitPassword,
      this.uid,
      this.nama,
      this.email,
      this.tipe,
      this.foto,
      this.fotoProfil,
      this.id,
      this.karyawanPerusahaan,
      this.registrationToken,
      this.karyawanDataId,
      this.isTutorial,
      this.mRolesId,
      this.lastLogin,
      this.akses,
      this.dataLengkap,
      this.aksesDepartemen,
      this.aksesPerusahaan,
      this.topicFirebase});

  User.fromJson(Map<String, dynamic> json) {
    safeEmail = json['safeEmail'] != null
        ? new SafeEmail.fromJson(json['safeEmail'])
        : null;
    client = json['client'];
    isDbGeneral = json['is_db_general'];
    mPerusahaan = json['m_perusahaan'] != null
        ? new MPerusahaan.fromJson(json['m_perusahaan'])
        : null;
    userId = json['userId'];
    nik = json['nik'];
    statusTxt = json['statusTxt'];
    jabatanTxt = json['jabatanTxt'];
    mJabatanId = json['m_jabatan_id'];
    bahasa = json['bahasa'];
    menitPassword = json['menitPassword'];
    uid = json['uid'];
    nama = json['nama'];
    email = json['email'];
    tipe = json['tipe'];
    foto = json['foto'];
    fotoProfil = json['foto_profil'];
    id = json['id'];
    karyawanPerusahaan = json['karyawan_perusahaan'];
    registrationToken = json['registrationToken'];
    karyawanDataId = json['karyawan_data_id'];
    isTutorial = json['is_tutorial'];
    mRolesId = json['m_roles_id'];
    lastLogin = json['last_login'];
    akses = json['akses'] != null ? new Akses.fromJson(json['akses']) : null;
    dataLengkap = json['data_lengkap'] != null
        ? new DataLengkap.fromJson(json['data_lengkap'])
        : null;
    aksesDepartemen = json['akses_departemen'];
    if (json['akses_perusahaan'] != null) {
      aksesPerusahaan = <String>[];
      json['akses_perusahaan'].forEach((v) {
        aksesPerusahaan!.add(v);
      });
    }
    topicFirebase = json['topic_firebase'].cast<String>();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.safeEmail != null) {
      data['safeEmail'] = this.safeEmail!.toJson();
    }
    data['client'] = this.client;
    data['is_db_general'] = this.isDbGeneral;
    if (this.mPerusahaan != null) {
      data['m_perusahaan'] = this.mPerusahaan!.toJson();
    }
    data['userId'] = this.userId;
    data['nik'] = this.nik;
    data['statusTxt'] = this.statusTxt;
    data['jabatanTxt'] = this.jabatanTxt;
    data['m_jabatan_id'] = this.mJabatanId;
    data['bahasa'] = this.bahasa;
    data['menitPassword'] = this.menitPassword;
    data['uid'] = this.uid;
    data['nama'] = this.nama;
    data['email'] = this.email;
    data['tipe'] = this.tipe;
    data['foto'] = this.foto;
    data['foto_profil'] = this.fotoProfil;
    data['id'] = this.id;
    data['karyawan_perusahaan'] = this.karyawanPerusahaan;
    data['registrationToken'] = this.registrationToken;
    data['karyawan_data_id'] = this.karyawanDataId;
    data['is_tutorial'] = this.isTutorial;
    data['m_roles_id'] = this.mRolesId;
    data['last_login'] = this.lastLogin;
    if (this.akses != null) {
      data['akses'] = this.akses!.toJson();
    }
    if (this.dataLengkap != null) {
      data['data_lengkap'] = this.dataLengkap!.toJson();
    }
    data['akses_departemen'] = this.aksesDepartemen;
    if (this.aksesPerusahaan != null) {
      data['akses_perusahaan'] =
          this.aksesPerusahaan!.map((v) => v).toList();
    }
    data['topic_firebase'] = this.topicFirebase;
    return data;
  }
}

class SafeEmail {
  String? safeEmail1;
  String? safeEmail2;
  String? safeEmail3;
  String? safeEmail4;

  SafeEmail(
      {this.safeEmail1, this.safeEmail2, this.safeEmail3, this.safeEmail4});

  SafeEmail.fromJson(Map<String, dynamic> json) {
    safeEmail1 = json['safeEmail1'];
    safeEmail2 = json['safeEmail2'];
    safeEmail3 = json['safeEmail3'];
    safeEmail4 = json['safeEmail4'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['safeEmail1'] = this.safeEmail1;
    data['safeEmail2'] = this.safeEmail2;
    data['safeEmail3'] = this.safeEmail3;
    data['safeEmail4'] = this.safeEmail4;
    return data;
  }
}

class MPerusahaan {
  String? id;
  String? nama;

  MPerusahaan({this.id, this.nama});

  MPerusahaan.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    nama = json['nama'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['nama'] = this.nama;
    return data;
  }
}

class Akses {
  bool? isBonusApproval;
  bool? mApprovalIjin;
  bool? mApprovalLembur;
  bool? mApprovalKasbon;
  bool? mApprovalReimbursement;
  bool? mApprovalPenggajian;
  bool? mApprovalKehadiran;
  bool? mApproval;
  bool? lApprovalPenggajian;
  bool? lApprovalIjin;
  bool? lApprovalLembur;
  bool? lApprovalKasbon;
  bool? lApprovalReimbursement;
  bool? lApprovalKehadiran;
  bool? lApprovalBonus;
  bool? lApproval;
  bool? lPenggajian;
  bool? mIjin;
  bool? mLembur;
  bool? mKasbon;
  bool? mReimbursement;
  bool? mSlip;
  bool? mKontak;
  bool? mInformasi;
  bool? pengalamanKerja;

  Akses(
      {this.isBonusApproval,
      this.mApprovalIjin,
      this.mApprovalLembur,
      this.mApprovalKasbon,
      this.mApprovalReimbursement,
      this.mApprovalPenggajian,
      this.mApprovalKehadiran,
      this.mApproval,
      this.lApprovalPenggajian,
      this.lApprovalIjin,
      this.lApprovalLembur,
      this.lApprovalKasbon,
      this.lApprovalReimbursement,
      this.lApprovalKehadiran,
      this.lApprovalBonus,
      this.lApproval,
      this.lPenggajian,
      this.mIjin,
      this.mLembur,
      this.mKasbon,
      this.mReimbursement,
      this.mSlip,
      this.mKontak,
      this.mInformasi,
      this.pengalamanKerja});

  Akses.fromJson(Map<String, dynamic> json) {
    isBonusApproval = json['is_bonus_approval'];
    mApprovalIjin = json['m_approval_ijin'];
    mApprovalLembur = json['m_approval_lembur'];
    mApprovalKasbon = json['m_approval_kasbon'];
    mApprovalReimbursement = json['m_approval_reimbursement'];
    mApprovalPenggajian = json['m_approval_penggajian'];
    mApprovalKehadiran = json['m_approval_kehadiran'];
    mApproval = json['m_approval'];
    lApprovalPenggajian = json['l_approval_penggajian'];
    lApprovalIjin = json['l_approval_ijin'];
    lApprovalLembur = json['l_approval_lembur'];
    lApprovalKasbon = json['l_approval_kasbon'];
    lApprovalReimbursement = json['l_approval_reimbursement'];
    lApprovalKehadiran = json['l_approval_kehadiran'];
    lApprovalBonus = json['l_approval_bonus'];
    lApproval = json['l_approval'];
    lPenggajian = json['l_penggajian'];
    mIjin = json['m_ijin'];
    mLembur = json['m_lembur'];
    mKasbon = json['m_kasbon'];
    mReimbursement = json['m_reimbursement'];
    mSlip = json['m_slip'];
    mKontak = json['m_kontak'];
    mInformasi = json['m_informasi'];
    pengalamanKerja = json['pengalaman_kerja'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['is_bonus_approval'] = this.isBonusApproval;
    data['m_approval_ijin'] = this.mApprovalIjin;
    data['m_approval_lembur'] = this.mApprovalLembur;
    data['m_approval_kasbon'] = this.mApprovalKasbon;
    data['m_approval_reimbursement'] = this.mApprovalReimbursement;
    data['m_approval_penggajian'] = this.mApprovalPenggajian;
    data['m_approval_kehadiran'] = this.mApprovalKehadiran;
    data['m_approval'] = this.mApproval;
    data['l_approval_penggajian'] = this.lApprovalPenggajian;
    data['l_approval_ijin'] = this.lApprovalIjin;
    data['l_approval_lembur'] = this.lApprovalLembur;
    data['l_approval_kasbon'] = this.lApprovalKasbon;
    data['l_approval_reimbursement'] = this.lApprovalReimbursement;
    data['l_approval_kehadiran'] = this.lApprovalKehadiran;
    data['l_approval_bonus'] = this.lApprovalBonus;
    data['l_approval'] = this.lApproval;
    data['l_penggajian'] = this.lPenggajian;
    data['m_ijin'] = this.mIjin;
    data['m_lembur'] = this.mLembur;
    data['m_kasbon'] = this.mKasbon;
    data['m_reimbursement'] = this.mReimbursement;
    data['m_slip'] = this.mSlip;
    data['m_kontak'] = this.mKontak;
    data['m_informasi'] = this.mInformasi;
    data['pengalaman_kerja'] = this.pengalamanKerja;
    return data;
  }
}

class DataLengkap {
  String? id;
  String? clientUid;
  String? nama;
  String? gelarDepan;
  String? gelarBelakang;
  int? kewarganegaraan;
  String? noKitas;
  int? jenisIdentitas;
  String? noIdentitas;
  String? noAsuransiSosial;
  String? tglAsuransiSosial;
  String? noBpjsKesehatan;
  String? tglBpjsKesehatan;
  String? noBpjsKetenagakerjaan;
  String? tglBpjsKetenagakerjaan;
  String? mNppBpjsId;
  String? noNpwp;
  String? tglMulaiNpwp;
  int? jenkel;
  int? statusNikah;
  String? jumlahAnak;
  String? tempatLahir;
  String? tglLahir;
  String? agama;
  String? golonganDarah;
  String? wProvinsiId;
  String? wKotaId;
  String? wKecamatanId;
  String? wDesaId;
  String? alamatDetail;
  String? wProvinsiIdDomisili;
  String? wKotaIdDomisili;
  String? wKecamatanIdDomisili;
  String? wDesaIdDomisili;
  String? alamatDetailDomisili;
  String? kodePos;
  String? kodePosDomisili;
  String? noTelepon;
  String? noHp;
  String? email;
  int? twofa;
  String? faKey;
  String? foto;
  String? fotottd;
  String? uid;
  int? isInvited;
  String? noAbsen;
  int? mPtkpId;
  String? mRolesId;
  String? idDevice;
  String? deviceId;
  String? imei;
  String? imeiDevice;
  String? tipeDevice;
  String? versiApps;
  String? deviceVersi;
  String? tipeDeviceDetected;
  int? isTutorial;
  int? isTutorialPerusahaan;
  int? isTutorialDepartemen;
  int? isTutorialJabatan;
  int? isTutorialJadwal;
  int? isTutorialCheckClock;
  String? lastLogin;
  String? tglLastLogin;
  int? requestPassword;
  String? tglResetPassword;
  int? notifAbsenMasuk;
  int? notifAbsenPulang;
  String? listPengumumanId;
  String? listNotifikasiId;
  String? fileKtp;
  String? namaFileKtp;
  String? fileNpwp;
  String? namaFileNpwp;
  String? fileBpjsKesehatan;
  String? namaFileBpjsKesehatan;
  String? fileKetenagakerjaan;
  String? namaFileKetenagakerjaan;
  String? createdBy;
  int? createdAt;
  String? modifiedBy;
  int? modifiedAt;
  String? karyawanDataId;
  String? nik;
  int? tipe;
  String? mPerusahaanId;
  String? gajiPokok;
  int? tipeGaji;
  int? prorata;
  int? bolehLembur;
  int? isJpKaryawan;
  int? statusJht;
  int? statusJp;
  int? statusKesehatan;
  int? tipePengambilanBpjsket;
  int? nominalPengambilanBpjsket;
  int? tipePengambilanBpjskes;
  int? nominalPengambilanBpjskes;
  int? statusPph;
  String? tglMulaiKerja;
  String? mBankId;
  String? noRekening;
  String? atasNama;
  int? status;
  String? tipeSp;
  String? mGenerateSaldoCutiId;
  int? isDeleted;
  int? tipeJadwal;
  String? mJadwalId;
  String? kJabatanId;
  String? mOrganisasiId;
  String? mJabatanId;
  String? atasanLangsungId;
  String? keterangan;
  String? namaJabatan;
  String? parentId;
  String? mJabatanLevelId;
  String? namaOrg;
  String? mPerusahaanNama;
  int? tipeAksesRoles;
  String? namaBank;
  Pendidikan? pendidikan;
  int? usia;
  String? sisaKontrak;
  String? nmAtasan;
  String? lamaBekerja;
  LamaKerja? lamaKerja;
  String? lastKontrak;
  String? tglKontrakAwal;
  String? tglKontrakAkhir;
  String? tglKontrakAwaltxt;
  String? tglKontrakAkhirtxt;
  String? kStatusId;
  String? statusKerja;
  String? tglLahirFormated;
  String? totalKomponenGaji;
  String? tglPtkp;
  int? isSp;

  DataLengkap(
      {this.id,
      this.clientUid,
      this.nama,
      this.gelarDepan,
      this.gelarBelakang,
      this.kewarganegaraan,
      this.noKitas,
      this.jenisIdentitas,
      this.noIdentitas,
      this.noAsuransiSosial,
      this.tglAsuransiSosial,
      this.noBpjsKesehatan,
      this.tglBpjsKesehatan,
      this.noBpjsKetenagakerjaan,
      this.tglBpjsKetenagakerjaan,
      this.mNppBpjsId,
      this.noNpwp,
      this.tglMulaiNpwp,
      this.jenkel,
      this.statusNikah,
      this.jumlahAnak,
      this.tempatLahir,
      this.tglLahir,
      this.agama,
      this.golonganDarah,
      this.wProvinsiId,
      this.wKotaId,
      this.wKecamatanId,
      this.wDesaId,
      this.alamatDetail,
      this.wProvinsiIdDomisili,
      this.wKotaIdDomisili,
      this.wKecamatanIdDomisili,
      this.wDesaIdDomisili,
      this.alamatDetailDomisili,
      this.kodePos,
      this.kodePosDomisili,
      this.noTelepon,
      this.noHp,
      this.email,
      this.twofa,
      this.faKey,
      this.foto,
      this.fotottd,
      this.uid,
      this.isInvited,
      this.noAbsen,
      this.mPtkpId,
      this.mRolesId,
      this.idDevice,
      this.deviceId,
      this.imei,
      this.imeiDevice,
      this.tipeDevice,
      this.versiApps,
      this.deviceVersi,
      this.tipeDeviceDetected,
      this.isTutorial,
      this.isTutorialPerusahaan,
      this.isTutorialDepartemen,
      this.isTutorialJabatan,
      this.isTutorialJadwal,
      this.isTutorialCheckClock,
      this.lastLogin,
      this.tglLastLogin,
      this.requestPassword,
      this.tglResetPassword,
      this.notifAbsenMasuk,
      this.notifAbsenPulang,
      this.listPengumumanId,
      this.listNotifikasiId,
      this.fileKtp,
      this.namaFileKtp,
      this.fileNpwp,
      this.namaFileNpwp,
      this.fileBpjsKesehatan,
      this.namaFileBpjsKesehatan,
      this.fileKetenagakerjaan,
      this.namaFileKetenagakerjaan,
      this.createdBy,
      this.createdAt,
      this.modifiedBy,
      this.modifiedAt,
      this.karyawanDataId,
      this.nik,
      this.tipe,
      this.mPerusahaanId,
      this.gajiPokok,
      this.tipeGaji,
      this.prorata,
      this.bolehLembur,
      this.isJpKaryawan,
      this.statusJht,
      this.statusJp,
      this.statusKesehatan,
      this.tipePengambilanBpjsket,
      this.nominalPengambilanBpjsket,
      this.tipePengambilanBpjskes,
      this.nominalPengambilanBpjskes,
      this.statusPph,
      this.tglMulaiKerja,
      this.mBankId,
      this.noRekening,
      this.atasNama,
      this.status,
      this.tipeSp,
      this.mGenerateSaldoCutiId,
      this.isDeleted,
      this.tipeJadwal,
      this.mJadwalId,
      this.kJabatanId,
      this.mOrganisasiId,
      this.mJabatanId,
      this.atasanLangsungId,
      this.keterangan,
      this.namaJabatan,
      this.parentId,
      this.mJabatanLevelId,
      this.namaOrg,
      this.mPerusahaanNama,
      this.tipeAksesRoles,
      this.namaBank,
      this.pendidikan,
      this.usia,
      this.sisaKontrak,
      this.nmAtasan,
      this.lamaBekerja,
      this.lamaKerja,
      this.lastKontrak,
      this.tglKontrakAwal,
      this.tglKontrakAkhir,
      this.tglKontrakAwaltxt,
      this.tglKontrakAkhirtxt,
      this.kStatusId,
      this.statusKerja,
      this.tglLahirFormated,
      this.totalKomponenGaji,
      this.tglPtkp,
      this.isSp});

  DataLengkap.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    clientUid = json['client_uid'];
    nama = json['nama'];
    gelarDepan = json['gelar_depan'];
    gelarBelakang = json['gelar_belakang'];
    kewarganegaraan = json['kewarganegaraan'];
    noKitas = json['no_kitas'];
    jenisIdentitas = json['jenis_identitas'];
    noIdentitas = json['no_identitas'];
    noAsuransiSosial = json['no_asuransi_sosial'];
    tglAsuransiSosial = json['tgl_asuransi_sosial'];
    noBpjsKesehatan = json['no_bpjs_kesehatan'];
    tglBpjsKesehatan = json['tgl_bpjs_kesehatan'];
    noBpjsKetenagakerjaan = json['no_bpjs_ketenagakerjaan'];
    tglBpjsKetenagakerjaan = json['tgl_bpjs_ketenagakerjaan'];
    mNppBpjsId = json['m_npp_bpjs_id'];
    noNpwp = json['no_npwp'];
    tglMulaiNpwp = json['tgl_mulai_npwp'];
    jenkel = json['jenkel'];
    statusNikah = json['status_nikah'];
    jumlahAnak = json['jumlah_anak'];
    tempatLahir = json['tempat_lahir'];
    tglLahir = json['tgl_lahir'];
    agama = json['agama'];
    golonganDarah = json['golongan_darah'];
    wProvinsiId = json['w_provinsi_id'];
    wKotaId = json['w_kota_id'];
    wKecamatanId = json['w_kecamatan_id'];
    wDesaId = json['w_desa_id'];
    alamatDetail = json['alamat_detail'];
    wProvinsiIdDomisili = json['w_provinsi_id_domisili'];
    wKotaIdDomisili = json['w_kota_id_domisili'];
    wKecamatanIdDomisili = json['w_kecamatan_id_domisili'];
    wDesaIdDomisili = json['w_desa_id_domisili'];
    alamatDetailDomisili = json['alamat_detail_domisili'];
    kodePos = json['kode_pos'];
    kodePosDomisili = json['kode_pos_domisili'];
    noTelepon = json['no_telepon'];
    noHp = json['no_hp'];
    email = json['email'];
    twofa = json['twofa'];
    faKey = json['fa_key'];
    foto = json['foto'];
    fotottd = json['fotottd'];
    uid = json['uid'];
    isInvited = json['is_invited'];
    noAbsen = json['no_absen'];
    mPtkpId = json['m_ptkp_id'];
    mRolesId = json['m_roles_id'];
    idDevice = json['id_device'];
    deviceId = json['device_id'];
    imei = json['imei'];
    imeiDevice = json['imei_device'];
    tipeDevice = json['tipe_device'];
    versiApps = json['versi_apps'];
    deviceVersi = json['device_versi'];
    tipeDeviceDetected = json['tipe_device_detected'];
    isTutorial = json['is_tutorial'];
    isTutorialPerusahaan = json['is_tutorial_perusahaan'];
    isTutorialDepartemen = json['is_tutorial_departemen'];
    isTutorialJabatan = json['is_tutorial_jabatan'];
    isTutorialJadwal = json['is_tutorial_jadwal'];
    isTutorialCheckClock = json['is_tutorial_check_clock'];
    lastLogin = json['last_login'];
    tglLastLogin = json['tgl_last_login'];
    requestPassword = json['request_password'];
    tglResetPassword = json['tgl_reset_password'];
    notifAbsenMasuk = json['notif_absen_masuk'];
    notifAbsenPulang = json['notif_absen_pulang'];
    listPengumumanId = json['list_pengumuman_id'];
    listNotifikasiId = json['list_notifikasi_id'];
    fileKtp = json['file_ktp'];
    namaFileKtp = json['nama_file_ktp'];
    fileNpwp = json['file_npwp'];
    namaFileNpwp = json['nama_file_npwp'];
    fileBpjsKesehatan = json['file_bpjs_kesehatan'];
    namaFileBpjsKesehatan = json['nama_file_bpjs_kesehatan'];
    fileKetenagakerjaan = json['file_ketenagakerjaan'];
    namaFileKetenagakerjaan = json['nama_file_ketenagakerjaan'];
    createdBy = json['created_by'];
    createdAt = json['created_at'];
    modifiedBy = json['modified_by'];
    modifiedAt = json['modified_at'];
    karyawanDataId = json['karyawan_data_id'];
    nik = json['nik'];
    tipe = json['tipe'];
    mPerusahaanId = json['m_perusahaan_id'];
    gajiPokok = json['gaji_pokok'];
    tipeGaji = json['tipe_gaji'];
    prorata = json['prorata'];
    bolehLembur = json['boleh_lembur'];
    isJpKaryawan = json['is_jp_karyawan'];
    statusJht = json['status_jht'];
    statusJp = json['status_jp'];
    statusKesehatan = json['status_kesehatan'];
    tipePengambilanBpjsket = json['tipe_pengambilan_bpjsket'];
    nominalPengambilanBpjsket = json['nominal_pengambilan_bpjsket'];
    tipePengambilanBpjskes = json['tipe_pengambilan_bpjskes'];
    nominalPengambilanBpjskes = json['nominal_pengambilan_bpjskes'];
    statusPph = json['status_pph'];
    tglMulaiKerja = json['tgl_mulai_kerja'];
    mBankId = json['m_bank_id'];
    noRekening = json['no_rekening'];
    atasNama = json['atas_nama'];
    status = json['status'];
    tipeSp = json['tipe_sp'];
    mGenerateSaldoCutiId = json['m_generate_saldo_cuti_id'];
    isDeleted = json['is_deleted'];
    tipeJadwal = json['tipe_jadwal'];
    mJadwalId = json['m_jadwal_id'];
    kJabatanId = json['k_jabatan_id'];
    mOrganisasiId = json['m_organisasi_id'];
    mJabatanId = json['m_jabatan_id'];
    atasanLangsungId = json['atasan_langsung_id'];
    keterangan = json['keterangan'];
    namaJabatan = json['nama_jabatan'];
    parentId = json['parent_id'];
    mJabatanLevelId = json['m_jabatan_level_id'];
    namaOrg = json['nama_org'];
    mPerusahaanNama = json['m_perusahaan_nama'];
    tipeAksesRoles = json['tipe_akses_roles'];
    namaBank = json['nama_bank'];
    pendidikan = json['pendidikan'] != null
        ? new Pendidikan.fromJson(json['pendidikan'])
        : null;
    usia = json['usia'];
    sisaKontrak = json['sisa_kontrak'];
    nmAtasan = json['nm_atasan'];
    lamaBekerja = json['lama_bekerja'];
    lamaKerja = json['lama_kerja'] != null
        ? new LamaKerja.fromJson(json['lama_kerja'])
        : null;
    lastKontrak = json['last_kontrak'];
    tglKontrakAwal = json['tgl_kontrak_awal'];
    tglKontrakAkhir = json['tgl_kontrak_akhir'];
    tglKontrakAwaltxt = json['tgl_kontrak_awaltxt'];
    tglKontrakAkhirtxt = json['tgl_kontrak_akhirtxt'];
    kStatusId = json['k_status_id'];
    statusKerja = json['status_kerja'];
    tglLahirFormated = json['tgl_lahir_formated'];
    totalKomponenGaji = json['total_komponen_gaji'];
    tglPtkp = json['tgl_ptkp'];
    isSp = json['is_sp'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['client_uid'] = this.clientUid;
    data['nama'] = this.nama;
    data['gelar_depan'] = this.gelarDepan;
    data['gelar_belakang'] = this.gelarBelakang;
    data['kewarganegaraan'] = this.kewarganegaraan;
    data['no_kitas'] = this.noKitas;
    data['jenis_identitas'] = this.jenisIdentitas;
    data['no_identitas'] = this.noIdentitas;
    data['no_asuransi_sosial'] = this.noAsuransiSosial;
    data['tgl_asuransi_sosial'] = this.tglAsuransiSosial;
    data['no_bpjs_kesehatan'] = this.noBpjsKesehatan;
    data['tgl_bpjs_kesehatan'] = this.tglBpjsKesehatan;
    data['no_bpjs_ketenagakerjaan'] = this.noBpjsKetenagakerjaan;
    data['tgl_bpjs_ketenagakerjaan'] = this.tglBpjsKetenagakerjaan;
    data['m_npp_bpjs_id'] = this.mNppBpjsId;
    data['no_npwp'] = this.noNpwp;
    data['tgl_mulai_npwp'] = this.tglMulaiNpwp;
    data['jenkel'] = this.jenkel;
    data['status_nikah'] = this.statusNikah;
    data['jumlah_anak'] = this.jumlahAnak;
    data['tempat_lahir'] = this.tempatLahir;
    data['tgl_lahir'] = this.tglLahir;
    data['agama'] = this.agama;
    data['golongan_darah'] = this.golonganDarah;
    data['w_provinsi_id'] = this.wProvinsiId;
    data['w_kota_id'] = this.wKotaId;
    data['w_kecamatan_id'] = this.wKecamatanId;
    data['w_desa_id'] = this.wDesaId;
    data['alamat_detail'] = this.alamatDetail;
    data['w_provinsi_id_domisili'] = this.wProvinsiIdDomisili;
    data['w_kota_id_domisili'] = this.wKotaIdDomisili;
    data['w_kecamatan_id_domisili'] = this.wKecamatanIdDomisili;
    data['w_desa_id_domisili'] = this.wDesaIdDomisili;
    data['alamat_detail_domisili'] = this.alamatDetailDomisili;
    data['kode_pos'] = this.kodePos;
    data['kode_pos_domisili'] = this.kodePosDomisili;
    data['no_telepon'] = this.noTelepon;
    data['no_hp'] = this.noHp;
    data['email'] = this.email;
    data['twofa'] = this.twofa;
    data['fa_key'] = this.faKey;
    data['foto'] = this.foto;
    data['fotottd'] = this.fotottd;
    data['uid'] = this.uid;
    data['is_invited'] = this.isInvited;
    data['no_absen'] = this.noAbsen;
    data['m_ptkp_id'] = this.mPtkpId;
    data['m_roles_id'] = this.mRolesId;
    data['id_device'] = this.idDevice;
    data['device_id'] = this.deviceId;
    data['imei'] = this.imei;
    data['imei_device'] = this.imeiDevice;
    data['tipe_device'] = this.tipeDevice;
    data['versi_apps'] = this.versiApps;
    data['device_versi'] = this.deviceVersi;
    data['tipe_device_detected'] = this.tipeDeviceDetected;
    data['is_tutorial'] = this.isTutorial;
    data['is_tutorial_perusahaan'] = this.isTutorialPerusahaan;
    data['is_tutorial_departemen'] = this.isTutorialDepartemen;
    data['is_tutorial_jabatan'] = this.isTutorialJabatan;
    data['is_tutorial_jadwal'] = this.isTutorialJadwal;
    data['is_tutorial_check_clock'] = this.isTutorialCheckClock;
    data['last_login'] = this.lastLogin;
    data['tgl_last_login'] = this.tglLastLogin;
    data['request_password'] = this.requestPassword;
    data['tgl_reset_password'] = this.tglResetPassword;
    data['notif_absen_masuk'] = this.notifAbsenMasuk;
    data['notif_absen_pulang'] = this.notifAbsenPulang;
    data['list_pengumuman_id'] = this.listPengumumanId;
    data['list_notifikasi_id'] = this.listNotifikasiId;
    data['file_ktp'] = this.fileKtp;
    data['nama_file_ktp'] = this.namaFileKtp;
    data['file_npwp'] = this.fileNpwp;
    data['nama_file_npwp'] = this.namaFileNpwp;
    data['file_bpjs_kesehatan'] = this.fileBpjsKesehatan;
    data['nama_file_bpjs_kesehatan'] = this.namaFileBpjsKesehatan;
    data['file_ketenagakerjaan'] = this.fileKetenagakerjaan;
    data['nama_file_ketenagakerjaan'] = this.namaFileKetenagakerjaan;
    data['created_by'] = this.createdBy;
    data['created_at'] = this.createdAt;
    data['modified_by'] = this.modifiedBy;
    data['modified_at'] = this.modifiedAt;
    data['karyawan_data_id'] = this.karyawanDataId;
    data['nik'] = this.nik;
    data['tipe'] = this.tipe;
    data['m_perusahaan_id'] = this.mPerusahaanId;
    data['gaji_pokok'] = this.gajiPokok;
    data['tipe_gaji'] = this.tipeGaji;
    data['prorata'] = this.prorata;
    data['boleh_lembur'] = this.bolehLembur;
    data['is_jp_karyawan'] = this.isJpKaryawan;
    data['status_jht'] = this.statusJht;
    data['status_jp'] = this.statusJp;
    data['status_kesehatan'] = this.statusKesehatan;
    data['tipe_pengambilan_bpjsket'] = this.tipePengambilanBpjsket;
    data['nominal_pengambilan_bpjsket'] = this.nominalPengambilanBpjsket;
    data['tipe_pengambilan_bpjskes'] = this.tipePengambilanBpjskes;
    data['nominal_pengambilan_bpjskes'] = this.nominalPengambilanBpjskes;
    data['status_pph'] = this.statusPph;
    data['tgl_mulai_kerja'] = this.tglMulaiKerja;
    data['m_bank_id'] = this.mBankId;
    data['no_rekening'] = this.noRekening;
    data['atas_nama'] = this.atasNama;
    data['status'] = this.status;
    data['tipe_sp'] = this.tipeSp;
    data['m_generate_saldo_cuti_id'] = this.mGenerateSaldoCutiId;
    data['is_deleted'] = this.isDeleted;
    data['tipe_jadwal'] = this.tipeJadwal;
    data['m_jadwal_id'] = this.mJadwalId;
    data['k_jabatan_id'] = this.kJabatanId;
    data['m_organisasi_id'] = this.mOrganisasiId;
    data['m_jabatan_id'] = this.mJabatanId;
    data['atasan_langsung_id'] = this.atasanLangsungId;
    data['keterangan'] = this.keterangan;
    data['nama_jabatan'] = this.namaJabatan;
    data['parent_id'] = this.parentId;
    data['m_jabatan_level_id'] = this.mJabatanLevelId;
    data['nama_org'] = this.namaOrg;
    data['m_perusahaan_nama'] = this.mPerusahaanNama;
    data['tipe_akses_roles'] = this.tipeAksesRoles;
    data['nama_bank'] = this.namaBank;
    if (this.pendidikan != null) {
      data['pendidikan'] = this.pendidikan!.toJson();
    }
    data['usia'] = this.usia;
    data['sisa_kontrak'] = this.sisaKontrak;
    data['nm_atasan'] = this.nmAtasan;
    data['lama_bekerja'] = this.lamaBekerja;
    if (this.lamaKerja != null) {
      data['lama_kerja'] = this.lamaKerja!.toJson();
    }
    data['last_kontrak'] = this.lastKontrak;
    data['tgl_kontrak_awal'] = this.tglKontrakAwal;
    data['tgl_kontrak_akhir'] = this.tglKontrakAkhir;
    data['tgl_kontrak_awaltxt'] = this.tglKontrakAwaltxt;
    data['tgl_kontrak_akhirtxt'] = this.tglKontrakAkhirtxt;
    data['k_status_id'] = this.kStatusId;
    data['status_kerja'] = this.statusKerja;
    data['tgl_lahir_formated'] = this.tglLahirFormated;
    data['total_komponen_gaji'] = this.totalKomponenGaji;
    data['tgl_ptkp'] = this.tglPtkp;
    data['is_sp'] = this.isSp;
    return data;
  }
}

class Pendidikan {
  String? tingkatPendidikan;
  String? jurusan;
  String? institusi;
  String? tahunSelesai;

  Pendidikan(
      {this.tingkatPendidikan,
      this.jurusan,
      this.institusi,
      this.tahunSelesai});

  Pendidikan.fromJson(Map<String, dynamic> json) {
    tingkatPendidikan = json['tingkat_pendidikan'];
    jurusan = json['jurusan'];
    institusi = json['institusi'];
    tahunSelesai = json['tahun_selesai'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['tingkat_pendidikan'] = this.tingkatPendidikan;
    data['jurusan'] = this.jurusan;
    data['institusi'] = this.institusi;
    data['tahun_selesai'] = this.tahunSelesai;
    return data;
  }
}

class LamaKerja {
  int? tahun;
  int? bulan;

  LamaKerja({this.tahun, this.bulan});

  LamaKerja.fromJson(Map<String, dynamic> json) {
    tahun = json['tahun'];
    bulan = json['bulan'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['tahun'] = this.tahun;
    data['bulan'] = this.bulan;
    return data;
  }
}
