class ScheduleModel {
  ScheduleModel({
    required this.id,
    required this.desaId,
    required this.hari,
    required this.waktuMulai,
    required this.waktuSelesai,
  });

  final String id, desaId, hari;
  final DateTime waktuMulai, waktuSelesai;

  factory ScheduleModel.fromJson(Map<String, dynamic> json) {
    return ScheduleModel(
      id: json['id'],
      desaId: json['desaId'],
      hari: json['hari'],
      waktuMulai: DateTime.parse(json['waktuMulai']),
      waktuSelesai: DateTime.parse(json['waktuSelesai']),
    );
  }
}
