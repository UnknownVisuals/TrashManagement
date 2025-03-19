class DepositAsusModel {
  DepositAsusModel({
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

  final String desaId, berat, jenisSampah, rt, rw, userId;
  final double poin;
  final DateTime waktu;
  final bool available;

  Map<String, dynamic> toJson() {
    return {
      'desaId': desaId,
      'berat': berat,
      'jenisSampah': jenisSampah,
      'poin': poin,
      'waktu': waktu.toIso8601String(),
      'rt': rt,
      'rw': rw,
      'userId': userId,
      'available': available,
    };
  }
}
