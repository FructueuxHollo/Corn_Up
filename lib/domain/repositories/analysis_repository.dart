import 'package:corn_up/data/models/analysis_model.dart';

abstract class AnalysisRepository {
  Future<AnalysisModel> analyze(dynamic input);
}
