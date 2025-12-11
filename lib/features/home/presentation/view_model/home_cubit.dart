import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import '../../domain/entites/dental_case.dart';
import '../../domain/use_cases/get_all_cases_use_case.dart';
import '../../domain/use_cases/get_cases_by_category_use_case.dart';

@injectable
class HomeCubit extends Cubit<HomeState> {
  final GetAllCasesUseCase getAllCasesUseCase;
  final GetCasesByCategoryUseCase getCasesByCategoryUseCase;

  HomeCubit(this.getAllCasesUseCase, this.getCasesByCategoryUseCase)
    : super(HomeLoading());

  void fetchAllCases() async {
    emit(HomeLoading());
    final cases = await getAllCasesUseCase.execute();
    emit(HomeLoaded(cases));
  }

  void fetchCasesByCategory(String category) async {
    emit(HomeLoading());
    final cases = await getCasesByCategoryUseCase.execute(category);
    emit(HomeLoaded(cases));
  }
}

abstract class HomeState {}

class HomeLoading extends HomeState {}

class HomeLoaded extends HomeState {
  final List<DentalCase> cases;

  HomeLoaded(this.cases);
}

class HomeError extends HomeState {
  final String message;

  HomeError(this.message);
}
