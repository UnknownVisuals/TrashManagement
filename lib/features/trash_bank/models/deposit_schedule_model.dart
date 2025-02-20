class DepositScheduleModel {
  DepositScheduleModel({
    required this.id,
    required this.desaId,
    required this.hari,
    required this.waktuMulai,
    required this.waktuSelesai,
  });

  final String id, desaId, hari;
  final DateTime waktuMulai, waktuSelesai;

  factory DepositScheduleModel.fromJson(Map<String, dynamic> json) {
    return DepositScheduleModel(
      id: json['id'],
      desaId: json['desaId'],
      hari: json['hari'],
      waktuMulai: DateTime.parse(json['waktuMulai']),
      waktuSelesai: DateTime.parse(json['waktuSelesai']),
    );
  }
}
