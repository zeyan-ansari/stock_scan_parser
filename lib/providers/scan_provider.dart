import 'package:flutter/material.dart';
import 'package:stock_scan_parser/models/scan.dart';
import 'package:stock_scan_parser/services/api_service.dart';

class ScanProvider with ChangeNotifier {
  List<Scan> _scans = [];
  bool _isLoading = false;

  List<Scan> get scans => _scans;
  bool get isLoading => _isLoading;

  Future<void> fetchScans() async {
    _isLoading = true;
    notifyListeners();

    _scans = await ApiService().fetchScans();

    _isLoading = false;
    notifyListeners();
  }
}
