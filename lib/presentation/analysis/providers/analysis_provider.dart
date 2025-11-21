import 'package:flutter/foundation.dart';
import 'package:corn_up/data/repositories/analysis_repository_impl.dart';
import 'package:corn_up/data/models/analysis_model.dart';

class AnalysisProvider extends ChangeNotifier {
  final AnalysisRepositoryImpl repository;

  AnalysisModel? _latest;
  bool _loading = false;

  AnalysisProvider({required this.repository});

  AnalysisModel? get latest => _latest;
  bool get loading => _loading;

  Future<void> analyze(dynamic input) async {
    _loading = true;
    notifyListeners();
    _latest = await repository.analyze(input);
    _loading = false;
    notifyListeners();
  }
}
