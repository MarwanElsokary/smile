import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'core/di/di.dart';
import 'core/l10n/app_localizations.dart';
import 'core/route/routes.dart';
import 'core/theme/app_theme.dart';
import 'core/utils/caching/caching_helper.dart';
import 'core/utils/language_cubit.dart';
import 'features/splash/splash_view.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // await Firebase.initializeApp();
  await configureDependencies();
  await CacheService.cacheInitialization();
  final prefs = await SharedPreferences.getInstance();
  final token = prefs.getString('token');

  runApp(MyApp(token: token));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key, this.token});

  final String? token;

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 813),
      builder: (_, __) => BlocProvider(
        create: (_) => getIt<LocaleCubit>(),
        child: BlocBuilder<LocaleCubit, Locale>(
          builder: (context, locale) {
            return MaterialApp(
              debugShowCheckedModeBanner: false,
              title: "Smile Care",
              locale: locale,
              theme: AppTheme.lightTheme,
              home: SplashView(token: token),
              onGenerateRoute: Routes.generateRoute,
            );
          },
        ),
      ),
    );
  }
}
