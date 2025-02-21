class LeaderboardModel {
  LeaderboardModel({
    required this.id,
    required this.namaPemilik,
    required this.totalPoin,
    required this.jumlahPengumpulan,
  });

  final String id, namaPemilik;
  final int totalPoin, jumlahPengumpulan;

  factory LeaderboardModel.fromJson(Map<String, dynamic> json) {
    return LeaderboardModel(
      id: json['id'],
      namaPemilik: json['namaPemilik'],
      totalPoin: json['totalPoin'],
      jumlahPengumpulan: json['jumlahPengumpulan'],
    );
  }
}
