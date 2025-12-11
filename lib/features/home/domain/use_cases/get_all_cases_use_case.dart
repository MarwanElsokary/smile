import 'package:injectable/injectable.dart';

import '../entites/dental_case.dart';
import '../repo/case_repository.dart';

@injectable
class GetAllCasesUseCase {
  final CaseRepository repo;

  GetAllCasesUseCase(this.repo);

  Future<List<DentalCase>> execute() => repo.getAllCases();
}
