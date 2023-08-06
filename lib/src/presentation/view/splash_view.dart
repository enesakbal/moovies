import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../config/gen/assets.gen.dart';
import '../../config/router/app_router.dart';
import '../../core/extension/text_theme_extension.dart';
import '../../injector.dart';

@RoutePage()
class SplashView extends HookWidget {
  const SplashView({super.key});

  @override
  Widget build(BuildContext context) {
    useEffect(
      () {
        Future.delayed(const Duration(seconds: 2), () async {
          injector<AppRouter>().replace(const HomeRoute());
        });
        return () {};
      },
      [],
    );
    return Scaffold(
      body: Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ClipRRect(borderRadius: BorderRadius.circular(100).r, child: Assets.images.appIcon.image(height: 200)),
          20.verticalSpace,
          Text(
            'Moovies',
            style: context.appTextTheme.boldWhite.copyWith(fontSize: 25.sp),
          )
        ],
      )),
    );
  }
}
