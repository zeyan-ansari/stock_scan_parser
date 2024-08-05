import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:stock_scan_parser/providers/scan_provider.dart';
import 'package:stock_scan_parser/screens/home_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => ScanProvider(),
      child: MaterialApp(
        title: 'Stock Scan Parser',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: HomeScreen(),
      ),
    );
  }
}
