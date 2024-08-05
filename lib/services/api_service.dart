import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:stock_scan_parser/models/scan.dart';

class ApiService {
  Future<List<Scan>> fetchScans() async {
    final response = await http.get(Uri.parse('http://coding-assignment.bombayrunning.com/data.json'));

    if (response.statusCode == 200) {
      List jsonResponse = json.decode(response.body);
      return jsonResponse.map((scan) => Scan.fromJson(scan)).toList();
    } else {
      throw Exception('Failed to load scans');
    }
  }
}
