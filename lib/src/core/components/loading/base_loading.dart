import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../config/gen/colors.gen.dart';

class BaseLoading extends StatelessWidget {
  const BaseLoading({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 15.r,
      height: 15.r,
      child: const CircularProgressIndicator.adaptive(
        backgroundColor: Colors.white,
        strokeWidth: 1.5,
        valueColor: AlwaysStoppedAnimation<Color>(AppColors.dark),
      ),
    );
  }
}
