class LeaderboardModel {
  final String id;
  final String namaPemilik;
  final int totalPoin;
  final int jumlahPengumpulan;

  LeaderboardModel({
    required this.id,
    required this.namaPemilik,
    required this.totalPoin,
    required this.jumlahPengumpulan,
  });

  factory LeaderboardModel.fromJson(Map<String, dynamic> json) {
    return LeaderboardModel(
      id: json['id'],
      namaPemilik: json['namaPemilik'],
      totalPoin: json['totalPoin'],
      jumlahPengumpulan: json['jumlahPengumpulan'],
    );
  }
}
