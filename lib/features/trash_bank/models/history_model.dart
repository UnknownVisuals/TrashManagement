class HistoryModel {
  HistoryModel({
    required this.id,
    required this.desaId,
    required this.berat,
    required this.jenisSampah,
    required this.poin,
    required this.waktu,
    required this.rt,
    required this.rw,
    required this.userId,
    required this.available,
  });

  final String id, desaId, berat, jenisSampah, rt, rw, userId;
  final int poin;
  final DateTime waktu;
  final bool available;

  factory HistoryModel.fromJson(Map<String, dynamic> json) {
    return HistoryModel(
      id: json['id'],
      desaId: json['desaId'],
      berat: json['berat'],
      jenisSampah: json['jenisSampah'],
      poin: json['poin'],
      waktu: DateTime.parse(json['waktu']).toLocal(),
      rw: json['rw'],
      rt: json['rt'],
      userId: json['userId'],
      available: json['available'],
    );
  }
}
