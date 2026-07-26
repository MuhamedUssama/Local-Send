import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:local_send/core/service_locator/service_locator.dart';
import 'package:local_send/core/services/shared_preferences_services.dart';
import 'package:local_send/features/app_config/cubit/app_config_cubit.dart';
import 'package:local_send/features/app_config/cubit/app_config_states.dart';
import 'core/l10n/app_localizations.dart';
import 'core/router/app_router.dart';
import 'core/router/routes_name.dart';
import 'core/theme/app_theme.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  configureDependencies();
  await SharedPreferencesServices.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt.get<AppConfigCubit>(),
      child: BlocBuilder<AppConfigCubit, AppConfigStates>(
        builder: (context, state) {
          return MaterialApp(
            title: 'LocalSend 🚀',
            debugShowCheckedModeBanner: false,
            theme: AppTheme.lightTheme,
            darkTheme: AppTheme.darkTheme,
            themeMode: state.themeMode,
            locale: state.locale,
            localizationsDelegates: const [
              AppLocalizations.delegate,
              GlobalMaterialLocalizations.delegate,
              GlobalWidgetsLocalizations.delegate,
              GlobalCupertinoLocalizations.delegate,
            ],
            supportedLocales: const [Locale('en'), Locale('ar')],
            initialRoute: RoutesName.splash,
            onGenerateRoute: AppRouter.onGenerateRoute,
          );
        },
      ),
    );
  }
}
