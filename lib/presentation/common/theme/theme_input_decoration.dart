import 'package:catbreeds/utils/util.dart';
import 'package:flutter/material.dart';

InputDecoration otpInputDecoration(BuildContext context, String? hintText,
    Widget? suffixIcon, Widget? prefixIcon, AsyncSnapshot? snapshot) {
  return InputDecoration(
    counterText: "",
    hintText: hintText,
    fillColor: WidgetStateColor.resolveWith((states) =>
        states.contains(WidgetState.focused)
            ? Colors.white
            : const Color(0xFFF9F9F9)),
    filled: true,
    suffixIcon: suffixIcon,
    suffixIconConstraints: const BoxConstraints(minHeight: 24, minWidth: 24),
    prefixIcon: prefixIcon,
    labelStyle: const TextStyle(color: Colors.white),
    floatingLabelBehavior: FloatingLabelBehavior.auto,
    border: border(),
    focusedBorder: focusedBorder(),
    enabledBorder: enabledBorder(),
    errorStyle: const TextStyle(
        fontFamily: 'Roboto',
        fontSize: 12,
        fontWeight: FontWeight.normal,
        height: 0.0,
        color: GlobalConstants.secondary),
    hintStyle:
        const TextStyle(color: Color(0xFFB3B3B3), fontWeight: FontWeight.w400),
    prefixIconColor: WidgetStateColor.resolveWith((states) =>
        states.contains(WidgetState.focused)
            ? const Color(0xFF434343)
            : const Color(0xFFB3B3B3)),
    suffixIconColor: WidgetStateColor.resolveWith((states) =>
        states.contains(WidgetState.focused)
            ? const Color(0xFF434343)
            : const Color(0xFFB3B3B3)),
    contentPadding: const EdgeInsets.fromLTRB(12, 8, 12, 8),
  );
}

OutlineInputBorder border() {
  return OutlineInputBorder(
      borderRadius: BorderRadius.circular(0),
      borderSide: const BorderSide(width: 1, color: Color(0xFFF9F9F9)));
}

OutlineInputBorder focusedBorder() {
  return OutlineInputBorder(
    borderRadius: BorderRadius.circular(0),
    borderSide:
        const BorderSide(color: Color.fromARGB(255, 151, 188, 218), width: 2.5),
  );
}

OutlineInputBorder enabledBorder() {
  return OutlineInputBorder(
      borderRadius: BorderRadius.circular(0),
      borderSide: const BorderSide(color: Color(0xFFCACACA), width: 0.8));
}
