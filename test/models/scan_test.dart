// test/models/scan_test.dart
import 'package:flutter_test/flutter_test.dart';
import 'package:stock_scan_parser/models/scan.dart';

void main() {
  test('Scan fromJson', () {
    final json = {
      'name': 'Test Scan',
      'criteria': [
        {
          'text': 'Criteria 1',
          'hasVariable': false,
          'variable': [],
        },
      ],
    };

    final scan = Scan.fromJson(json);

    expect(scan.name, 'Test Scan');
    expect(scan.criteria.length, 1);
  });
}
