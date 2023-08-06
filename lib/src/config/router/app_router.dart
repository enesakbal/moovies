import 'package:auto_route/auto_route.dart';

import '../../core/constants/path_constants.dart';
import '../../presentation/view/home_view.dart';
import '../../presentation/view/splash_view.dart';

part 'app_router.gr.dart';

@AutoRouterConfig(replaceInRouteName: 'View|Widget,Route')
class AppRouter extends _$AppRouter {
  @override
  final List<AutoRoute> routes = [
    RedirectRoute(path: '/', redirectTo: PathConstants.splash),
    CustomRoute(page: SplashRoute.page, path: PathConstants.splash, transitionsBuilder: TransitionsBuilders.fadeIn),
    CustomRoute(page: HomeRoute.page, path: PathConstants.home, transitionsBuilder: TransitionsBuilders.fadeIn),
  ];
}
