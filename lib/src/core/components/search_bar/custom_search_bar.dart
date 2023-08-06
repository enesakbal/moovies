import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../config/gen/assets.gen.dart';
import '../../../config/gen/colors.gen.dart';
import '../../extension/text_theme_extension.dart';

class CustomSearchBar extends StatelessWidget {
  const CustomSearchBar({
    super.key,
    required this.controller,
    required this.onChanged,
    this.validator,
  });

  final TextEditingController controller;
  final void Function(String)? onChanged;
  final String? Function(String?)? validator;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      onChanged: onChanged,
      controller: controller,
      validator: validator,
      style: TextStyle(fontSize: 12.sp),
      textAlignVertical: TextAlignVertical.center,
      cursorColor: Colors.white,
      cursorWidth: 1.5,
      decoration: InputDecoration(
        hintText: 'Search',
        prefixIcon: Padding(padding: EdgeInsets.all(10.r), child: Assets.icons.search.svg(color: Colors.black)),
        prefixIconConstraints: BoxConstraints.loose(const Size.fromHeight(45)),
        suffixIcon: GestureDetector(
          onTap: controller.clear,
          child: Padding(
            padding: EdgeInsets.all(10.r),
            child: const Icon(Icons.close, color: Colors.black),
          ),
        ),
        suffixIconConstraints: BoxConstraints.loose(const Size.fromHeight(45)),
        contentPadding: const EdgeInsets.all(14),
        fillColor: AppColors.blue.shade500.withOpacity(1),
        filled: true,
        errorStyle: context.appTextTheme.boldDark.copyWith(color: Colors.red.shade700),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12.r),
          borderSide: const BorderSide(color: Colors.white),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12.r),
          borderSide: const BorderSide(color: Colors.white),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12.r),
          borderSide: const BorderSide(color: Colors.white),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12.r),
          borderSide: BorderSide(color: Colors.red.shade700),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12.r),
          borderSide: BorderSide(color: Colors.red.shade700, width: 2),
        ),
      ),
    );
  }
}
