class DepositModel {
  final String id;
  final String desaId;
  final String namaPemilik;
  final String berat;
  final String jenisSampah;
  final int poin;
  final String waktu;
  final String rt;
  final String rw;

  DepositModel({
    required this.id,
    required this.desaId,
    required this.namaPemilik,
    required this.berat,
    required this.jenisSampah,
    required this.poin,
    required this.waktu,
    required this.rt,
    required this.rw,
  });

  factory DepositModel.fromJson(Map<String, dynamic> json) {
    return DepositModel(
      id: json['id'],
      desaId: json['desaId'],
      namaPemilik: json['namaPemilik'],
      berat: json['berat'],
      jenisSampah: json['jenisSampah'],
      poin: json['poin'],
      waktu: json['waktu'],
      rt: json['rt'],
      rw: json['rw'],
    );
  }
}
