import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:news_app/core/routes/auto_route.dart';
import 'package:news_app/di.dart';
import 'package:news_app/features/theme/presentation/bloc/theme_bloc.dart';
import 'package:news_app/features/theme/presentation/screen/dark_theme.dart';
import 'package:news_app/features/theme/presentation/screen/light__theme.dart';
import 'package:news_app/features/theme/presentation/screen/my_theme.dart';
import 'package:news_app/internet_service.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  configureDependencies();
  InternetService().init();

  runApp(
    MultiBlocProvider(
      providers: [
        BlocProvider(create: (_) => ThemeBloc()),
      ],
        child: MyApp(),

    ),
  );
}

class MyApp extends StatelessWidget {
  final _appRouter = AppRouter();


  @override
  Widget build(BuildContext context) {
    MyTheme light = LightTheme();
    MyTheme dark = DarkTheme();
    return ScreenUtilInit(
        designSize: const Size(393, 852),
        minTextAdapt: true,
        splitScreenMode: true,
        builder: (context, child) =>
            BlocBuilder<ThemeBloc, ThemeState>(
              builder: (context, state) {
                return MaterialApp.router(
                  routerConfig: _appRouter.config(),
                  debugShowCheckedModeBanner: false,
                  theme: light.themeData,
                  darkTheme: dark.themeData,
                  themeMode: state.themeMode,
                  // locale: context.locale,
                  // supportedLocales: context.supportedLocales,
                  // localizationsDelegates: context.localizationDelegates,
                );
              },
            ));
  }
}
