import '../entites/dental_case.dart';

abstract class CaseRepository {
  Future<List<DentalCase>> getAllCases();
  Future<List<DentalCase>> getCasesByCategory(String category);
}
