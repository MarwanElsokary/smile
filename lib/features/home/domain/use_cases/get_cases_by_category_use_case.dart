import 'package:injectable/injectable.dart';

import '../entites/dental_case.dart';
import '../repo/case_repository.dart';

@injectable
class GetCasesByCategoryUseCase {
  final CaseRepository repo;

  GetCasesByCategoryUseCase(this.repo);

  Future<List<DentalCase>> execute(String category) =>
      repo.getCasesByCategory(category);
}
