import '../constants/regexp_constants.dart';

extension TextValidationExtension on String {
  String? get isValidSearchText => contains(RegExp(RegExpContants.search)) && isNotEmpty
      ? null
      : 'Please enter a text with at least two characters and\n no special characters.';
}
