class ProfileModel {
  ProfileModel({
    required this.username,
    required this.email,
    required this.rt,
    required this.rw,
    required this.desa,
    required this.kecamatan,
    required this.kabupaten,
    required this.provinsi,
  });

  final String username, email, rt, rw, desa, kecamatan, kabupaten, provinsi;

  factory ProfileModel.fromJson(Map<String, dynamic> json) {
    return ProfileModel(
      username: json['username'],
      email: json['email'],
      rt: json['rt'],
      rw: json['rw'],
      desa: json['desa'],
      kecamatan: json['kecamatan'],
      kabupaten: json['kabupaten'],
      provinsi: json['provinsi'],
    );
  }
}
