// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format width=80

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:get_it/get_it.dart' as _i174;
import 'package:injectable/injectable.dart' as _i526;
import 'package:shared_preferences/shared_preferences.dart' as _i460;

import '../../features/home/domain/repo/case_repository.dart' as _i821;
import '../../features/home/domain/use_cases/get_all_cases_use_case.dart'
    as _i472;
import '../../features/home/domain/use_cases/get_cases_by_category_use_case.dart'
    as _i518;
import '../../features/home/presentation/view_model/home_cubit.dart' as _i940;
import '../../features/home/presentation/view_model/home_states.dart' as _i48;
import '../modules/shared_preferences_module.dart' as _i744;
import '../utils/language_cubit.dart' as _i344;

extension GetItInjectableX on _i174.GetIt {
  // initializes the registration of main-scope dependencies inside of GetIt
  Future<_i174.GetIt> init({
    String? environment,
    _i526.EnvironmentFilter? environmentFilter,
  }) async {
    final gh = _i526.GetItHelper(this, environment, environmentFilter);
    final sharedPreferencesModule = _$SharedPreferencesModule();
    await gh.singletonAsync<_i460.SharedPreferences>(
      () => sharedPreferencesModule.provideSharedPreferences(),
      preResolve: true,
    );
    gh.singleton<_i744.SharedPrefHelper>(
      () => _i744.SharedPrefHelper(gh<_i460.SharedPreferences>()),
    );
    gh.factory<_i472.GetAllCasesUseCase>(
      () => _i472.GetAllCasesUseCase(gh<_i821.CaseRepository>()),
    );
    gh.factory<_i518.GetCasesByCategoryUseCase>(
      () => _i518.GetCasesByCategoryUseCase(gh<_i821.CaseRepository>()),
    );
    gh.factory<_i344.LocaleCubit>(
      () => _i344.LocaleCubit(sharedPrefHelper: gh<_i744.SharedPrefHelper>()),
    );
    gh.factory<_i48.CasesCubit>(
      () => _i48.CasesCubit(gh<_i821.CaseRepository>()),
    );
    gh.factory<_i940.HomeCubit>(
      () => _i940.HomeCubit(
        gh<_i472.GetAllCasesUseCase>(),
        gh<_i518.GetCasesByCategoryUseCase>(),
      ),
    );
    return this;
  }
}

class _$SharedPreferencesModule extends _i744.SharedPreferencesModule {}
