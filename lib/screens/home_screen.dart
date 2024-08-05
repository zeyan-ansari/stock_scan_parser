import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:stock_scan_parser/providers/scan_provider.dart';
import 'package:stock_scan_parser/widgets/scan_list.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Stock Scan Parser'),
      ),
      body: Consumer<ScanProvider>(
        builder: (context, scanProvider, _) {
          return scanProvider.isLoading
              ? Center(child: CircularProgressIndicator())
              : ScanList(scans: scanProvider.scans);
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          context.read<ScanProvider>().fetchScans();
        },
        child: Icon(Icons.refresh),
      ),
    );
  }
}