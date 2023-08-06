import 'package:flutter/material.dart';

import '../../config/gen/colors.gen.dart';

extension AppTextThemeExtension on BuildContext {
  TextTheme get appTextTheme => Theme.of(this).textTheme;
}

extension AppTextStyleExtension on TextTheme {
  TextStyle get boldDark => bodyMedium!.copyWith(
        fontSize: 14,
        fontWeight: FontWeight.w700,
        color: AppColors.dark,
      );

  TextStyle get regularDark => bodyMedium!.copyWith(
        fontSize: 14,
        color: AppColors.dark,
      );

  TextStyle get thinDark => bodyMedium!.copyWith(
        fontSize: 14,
        fontWeight: FontWeight.w300,
        color: AppColors.dark,
      );

  TextStyle get boldGrey => bodyMedium!.copyWith(
        fontSize: 14,
        color: AppColors.grey,
        fontWeight: FontWeight.w700,
      );

  TextStyle get regularGrey => bodyMedium!.copyWith(
        fontSize: 14,
        color: AppColors.grey,
      );

  TextStyle get thinGrey => bodyMedium!.copyWith(
        fontSize: 14,
        fontWeight: FontWeight.w300,
        color: AppColors.grey,
      );

  TextStyle get boldWhite => bodyMedium!.copyWith(
        fontSize: 14,
        fontWeight: FontWeight.w700,
        color: Colors.white,
      );

  TextStyle get regularWhite => bodyMedium!.copyWith(
        color: Colors.white,
        fontSize: 14,
      );

  TextStyle get thinWhite => bodyMedium!.copyWith(
        color: Colors.white,
        fontSize: 14,
        fontWeight: FontWeight.w300,
      );
}
