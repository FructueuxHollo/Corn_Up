import 'package:corn_up/domain/repositories/analysis_repository.dart';
import 'package:corn_up/data/models/analysis_model.dart';

class AnalysisRepositoryImpl implements AnalysisRepository {
  AnalysisRepositoryImpl();

  @override
  Future<AnalysisModel> analyze(dynamic input) async {
    // TODO: implement actual API call / processing
    await Future.delayed(const Duration(seconds: 1));
    return AnalysisModel(id: 'dummy', results: {'status': 'ok'});
  }
}
