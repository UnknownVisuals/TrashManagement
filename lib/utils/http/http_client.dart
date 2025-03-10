import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:trash_management/features/trash_bank/models/deposit_model.dart';
import 'package:trash_management/features/trash_bank/models/schedule_model.dart';
import 'package:trash_management/features/trash_bank/models/desa_model.dart';

class REYHttpHelper {
  // Default API base URL
  static String _baseUrl = 'http://62.72.13.119:3001/api';

  // Setter method to change the base URL
  static void setBaseUrl(String baseUrl) {
    _baseUrl = baseUrl;
  }

  // Helper method to make a GET request
  static Future<dynamic> get(String endpoint) async {
    final response = await http.get(Uri.parse('$_baseUrl/$endpoint'));
    return _handleResponse(response);
  }

  // Helper method to make a POST request
  static Future<Map<String, dynamic>> post(
      String endpoint, dynamic data) async {
    final response = await http.post(
      Uri.parse('$_baseUrl/$endpoint'),
      headers: {'Content-Type': 'application/json'},
      body: json.encode(data),
    );
    return _handleResponse(response);
  }

  // Helper method to make a PUT request
  static Future<Map<String, dynamic>> put(String endpoint, dynamic data) async {
    final response = await http.put(
      Uri.parse('$_baseUrl/$endpoint'),
      headers: {'Content-Type': 'application/json'},
      body: json.encode(data),
    );
    return _handleResponse(response);
  }

  // Helper method to make a PATCH request
  static Future<Map<String, dynamic>> patch(
      String endpoint, dynamic data) async {
    final response = await http.patch(
      Uri.parse('$_baseUrl/$endpoint'),
      headers: {'Content-Type': 'application/json'},
      body: json.encode(data),
    );
    return _handleResponse(response);
  }

  // Helper method to make a DELETE request
  static Future<Map<String, dynamic>> delete(String endpoint) async {
    final response = await http.delete(Uri.parse('$_baseUrl/$endpoint'));
    return _handleResponse(response);
  }

  // Handle the HTTP response
  static dynamic _handleResponse(http.Response response) {
    if (response.statusCode == 200) {
      return json.decode(response.body);
    } else {
      throw Exception('Failed to load data: ${response.statusCode}');
    }
  }

  //**
  //  CUSTOM HTTP HANDLER
  // */

  // Helper method to make a login request
  static Future<dynamic> login(Map<String, dynamic> loginData) async {
    final response = await http.post(
      Uri.parse('$_baseUrl/auth/login'),
      headers: {'Content-Type': 'application/json'},
      body: json.encode(loginData),
    );
    return _handleResponse(response);
  }

  // Helper method to make a GET request for deposit schedule
  static Future<List<ScheduleModel>> fetchDepositSchedule(
    String desaId,
  ) async {
    final url = '$_baseUrl/jadwal-pengumpulan?desaId=$desaId';
    final response = await http.get(Uri.parse(url));
    if (response.statusCode == 200) {
      List<dynamic> data = json.decode(response.body);
      return data.map((item) => ScheduleModel.fromJson(item)).toList();
    } else {
      throw Exception('Failed to load deposit schedule');
    }
  }

  // Helper method to make a GET request for desa information
  static Future<List<DesaModel>> fetchDesaInformation() async {
    final response = await http.get(Uri.parse('$_baseUrl/desa'));
    if (response.statusCode == 200) {
      List<dynamic> data = json.decode(response.body);
      return data.map((item) => DesaModel.fromJson(item)).toList();
    } else {
      throw Exception('Failed to load desa information');
    }
  }

  // Helper method to make a GET request for deposit infomation
  static Future<List<DepositModel>> fetchDeposit(String userId) async {
    final url = '$_baseUrl/pengumpulan-sampah/user/$userId';
    final response = await http.get(
      Uri.parse(url),
      headers: {'x-user-role': 'WARGA'},
    );
    if (response.statusCode == 200) {
      List<dynamic> data = json.decode(response.body);
      return data.map((item) => DepositModel.fromJson(item)).toList();
    } else {
      throw Exception('Failed to load deposit schedule');
    }
  }

  // Helper method to update deposit availability
  static Future<void> confirmDeposit(
      DepositModel deposit, String usedId) async {
    final response = await http.post(
      Uri.parse('$_baseUrl/pengumpulan-sampah/user/$usedId'),
      headers: {'Content-Type': 'application/json'},
      body: json.encode({
        'id': deposit.id,
        'desaId': deposit.desaId,
        'berat': deposit.berat,
        'jenisSampah': deposit.jenisSampah,
        'poin': deposit.poin,
        'waktu': deposit.waktu,
        'rt': deposit.rt,
        'rw': deposit.rw,
        'userId': deposit.userId,
        'available': true,
      }),
    );
    _handleResponse(response);
  }

  // Helper method to update leaderboard availability
  static Future<void> updateLeaderboard(
      String leaderboardId, bool available) async {
    final response = await http.patch(
      Uri.parse('$_baseUrl/leaderboard'),
      headers: {'Content-Type': 'application/json'},
      body: json.encode({'id': leaderboardId, 'available': available}),
    );
    _handleResponse(response);
  }
}
