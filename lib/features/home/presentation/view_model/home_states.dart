import 'package:bloc/bloc.dart';
import 'package:injectable/injectable.dart';
import '../../domain/entites/dental_case.dart';
import '../../domain/repo/case_repository.dart';

abstract class CasesState {}

class CasesInitial extends CasesState {}

class CasesLoading extends CasesState {}

class CasesLoaded extends CasesState {
  final List<DentalCase> cases;

  CasesLoaded(this.cases);
}

class CasesError extends CasesState {
  final String message;

  CasesError(this.message);
}

@injectable
class CasesCubit extends Cubit<CasesState> {
  final CaseRepository repository;

  CasesCubit(this.repository) : super(CasesInitial());

  Future<void> fetchAllCases() async {
    emit(CasesLoading());
    try {
      final cases = await repository.getAllCases();
      emit(CasesLoaded(cases));
    } catch (e) {
      emit(CasesError(e.toString()));
    }
  }

  // أضف الطريق الجديدة
  Future<void> fetchCasesByCategory(String category) async {
    emit(CasesLoading());
    try {
      final cases = await repository.getCasesByCategory(category);
      emit(CasesLoaded(cases));
    } catch (e) {
      emit(CasesError(e.toString()));
    }
  }
}
