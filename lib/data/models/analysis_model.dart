class AnalysisModel {
  final String id;
  final Map<String, dynamic> results;

  AnalysisModel({required this.id, required this.results});

  factory AnalysisModel.fromJson(Map<String, dynamic> json) => AnalysisModel(
    id: json['id'] as String? ?? '',
    results: Map<String, dynamic>.from(json['results'] ?? {}),
  );

  Map<String, dynamic> toJson() => {'id': id, 'results': results};
}
