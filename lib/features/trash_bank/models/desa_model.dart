class DesaModel {
  final String id;
  final String nama;
  final String kecamatan;
  final String kabupaten;
  final String provinsi;

  DesaModel({
    required this.id,
    required this.nama,
    required this.kecamatan,
    required this.kabupaten,
    required this.provinsi,
  });

  factory DesaModel.fromJson(Map<String, dynamic> json) {
    return DesaModel(
      id: json['id'],
      nama: json['nama'],
      kecamatan: json['kecamatan'],
      kabupaten: json['kabupaten'],
      provinsi: json['provinsi'],
    );
  }
}
