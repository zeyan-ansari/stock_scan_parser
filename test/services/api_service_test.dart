
// test/services/api_service_test.dart
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:http/http.dart' as http;
import 'package:stock_scan_parser/services/api_service.dart';

class MockClient extends Mock implements http.Client {}

void main() {
  test('fetchScans returns a list of scans if the http call completes successfully', () async {
    final client = MockClient();

    when(client.get(Uri.parse('http://coding-assignment.bombayrunning.com/data.json')))
        .thenAnswer((_) async => http.Response('[{"name": "Test Scan", "criteria": []}]', 200));

    final apiService = ApiService();
    final scans = await apiService.fetchScans();

    expect(scans.length, 1);
    expect(scans[0].name, 'Test Scan');
  });
}
