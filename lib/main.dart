import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import './src/injector.dart' as di;
import 'src/config/router/app_router.dart';
import 'src/core/theme/app_theme.dart';
import 'src/presentation/bloc/search_movie/search_movie_bloc.dart';

Future<void> main() async {
  /// Loading the environment variables.
  await dotenv.load();

  /// Initializing the dependency injection.
  await di.init();

  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => di.injector<SearchMovieBloc>(),
      child: ScreenUtilInit(
        designSize: const Size(360, 800),
        useInheritedMediaQuery: true,
        builder: (context, _) {
          return MaterialApp.router(
            theme: di.injector<AppTheme>().theme,

            builder: (context, child) => MediaQuery(
              data: MediaQuery.of(context).copyWith(textScaleFactor: 1),
              child: child!,
            ),

            //* router
            routerDelegate: AutoRouterDelegate(di.injector<AppRouter>()),
            routeInformationParser: di.injector<AppRouter>().defaultRouteParser(),
            debugShowCheckedModeBanner: false,
          );
        },
      ),
    );
  }
}
