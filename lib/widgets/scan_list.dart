import 'package:flutter/material.dart';
import 'package:stock_scan_parser/models/scan.dart';

class ScanList extends StatelessWidget {
  final List<Scan> scans;

  ScanList({required this.scans});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: scans.length,
      itemBuilder: (context, index) {
        return ExpansionTile(
          title: Text(scans[index].name),
          subtitle: Text(scans[index].tag),
          children: scans[index].criteria.map((criteria) {
            return ListTile(
              title: Text(criteria.text),
              subtitle: criteria.variable != null
                  ? Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: criteria.variable!.entries.map((entry) {
                  final variable = entry.value;
                  return Text(
                    "${entry.key}: ${variable.type} ${variable.values != null ? variable.values.toString() : ''} ${variable.studyType != null ? 'study: ${variable.studyType}' : ''} ${variable.parameterName != null ? 'parameter: ${variable.parameterName}' : ''}",
                  );
                }).toList(),
              )
                  : null,
            );
          }).toList(),
        );
      },
    );
  }
}