class DepositModel {
  final String id, desaId, namaPemilik, berat, jenisSampah, rt, rw;
  final DateTime waktu;
  final int poin;

  DepositModel({
    required this.id,
    required this.desaId,
    required this.namaPemilik,
    required this.berat,
    required this.jenisSampah,
    required this.rt,
    required this.rw,
    required this.waktu,
    required this.poin,
  });

  factory DepositModel.fromJson(Map<String, dynamic> json) {
    return DepositModel(
      id: json['id'],
      desaId: json['desaId'],
      namaPemilik: json['namaPemilik'],
      berat: json['berat'],
      jenisSampah: json['jenisSampah'],
      rw: json['rw'],
      rt: json['rt'],
      waktu: DateTime.parse(json['waktu']),
      poin: json['poin'],
    );
  }
}
