import 'package:flutter/services.dart';

class PhoneNumberFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(
      TextEditingValue oldValue, TextEditingValue newValue) {
    final String newText = newValue.text;

    if (newText.length == 1) {
      // +998 9
      return TextEditingValue(
        text: '+998 $newText',
        selection: const TextSelection.collapsed(offset: 5),
      );
    } else if (newText.length == 5) {
      // +998 9X
      return TextEditingValue(
        text: '$newText ',
        selection: const TextSelection.collapsed(offset: 6),
      );
    } else if (newText.length == 6) {
      // +998 9XX
      return TextEditingValue(
        text: '$newText ',
        selection: const TextSelection.collapsed(offset: 7),
      );
    } else if (newText.length == 10) {
      // +998 9XX XXX
      return TextEditingValue(
        text: '$newText ',
        selection: const TextSelection.collapsed(offset: 11),
      );
    } else if (newText.length == 11) {
      // +998 9XX XXX
      return TextEditingValue(
        text: '$newText ',
        selection: const TextSelection.collapsed(offset: 12),
      );
    } else if (newText.length == 13) {
      // +998 9XX XXX XX
      return TextEditingValue(
        text: newText,
        selection: TextSelection.collapsed(offset: newText.length),
      );
    }

    // Old value is returned if conditions are not met
    return oldValue;
  }
}
