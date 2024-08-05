class Scan {
  final int id;
  final String name;
  final String tag;
  final String color;
  final List<SubCriteria> criteria;

  Scan({
    required this.id,
    required this.name,
    required this.tag,
    required this.color,
    required this.criteria,
  });

  factory Scan.fromJson(Map<String, dynamic> json) {
    var list = json['criteria'] as List;
    List<SubCriteria> criteriaList = list.map((i) => SubCriteria.fromJson(i)).toList();
    return Scan(
      id: json['id'],
      name: json['name'],
      tag: json['tag'],
      color: json['color'],
      criteria: criteriaList,
    );
  }
}

// models/sub_criteria.dart
class SubCriteria {
  final String type;
  final String text;
  final Map<String, Variable>? variable;

  SubCriteria({
    required this.type,
    required this.text,
    this.variable,
  });

  factory SubCriteria.fromJson(Map<String, dynamic> json) {
    Map<String, Variable>? variableMap;
    if (json['variable'] != null) {
      variableMap = (json['variable'] as Map<String, dynamic>).map((key, value) {
        return MapEntry(key, Variable.fromJson(value));
      });
    }
    return SubCriteria(
      type: json['type'],
      text: json['text'],
      variable: variableMap,
    );
  }
}

// models/variable.dart
class Variable {
  final String type;
  final List<dynamic>? values;
  final String? studyType;
  final String? parameterName;
  final int? minValue;
  final int? maxValue;
  final int? defaultValue;

  Variable({
    required this.type,
    this.values,
    this.studyType,
    this.parameterName,
    this.minValue,
    this.maxValue,
    this.defaultValue,
  });

  factory Variable.fromJson(Map<String, dynamic> json) {
    return Variable(
      type: json['type'],
      values: json['values'] != null ? List<dynamic>.from(json['values']) : null,
      studyType: json['study_type'],
      parameterName: json['parameter_name'],
      minValue: json['min_value'],
      maxValue: json['max_value'],
      defaultValue: json['default_value'],
    );
  }
}
