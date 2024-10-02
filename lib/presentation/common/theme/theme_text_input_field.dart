import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:catbreeds/presentation/common/theme/theme_text_scale_size.dart';
import 'package:catbreeds/utils/util.dart' as utils;
import 'theme_input_decoration.dart';

class CustomTextInputField extends StatelessWidget {
  const CustomTextInputField({
    super.key,
    this.labelTextStr,
    this.labelTextLink,
    this.hintTextStr,
    this.initialValue,
    this.obscureText = false,
    this.keyboardType,
    this.textInputAction,
    this.controller,
    this.validator,
    this.onSaved,
    this.suffixIcon,
    this.onChanged,
    this.inputFormatters,
    this.maxLength,
    this.enabled = true,
    this.readOnly = false,
    this.autofocus = false,
    this.snapshot,
    this.maxLines,
    this.textAlign,
    this.onTap,
    this.onTapLink,
    this.textCapitalization,
    this.focusNode,
    this.hintColor,
    this.hintText,
    this.prefixIcon,
    this.textColor,
    this.fontSize,
    this.onFieldSubmitted,
  });

  final String? labelTextStr;
  final String? labelTextLink;
  final String? hintTextStr;
  final String? initialValue;
  final bool obscureText;
  final TextInputType? keyboardType;
  final TextInputAction? textInputAction;
  final TextEditingController? controller;
  final Function(String? value)? validator;
  final Function? onSaved;
  final Function? onChanged;
  final Function? onTap;
  final Function()? onTapLink;
  final Function(String)? onFieldSubmitted;
  final Widget? suffixIcon;
  final List<TextInputFormatter>? inputFormatters;
  final int? maxLength;
  final int? maxLines;
  final bool? enabled;
  final bool? readOnly;
  final bool? autofocus;
  final TextCapitalization? textCapitalization;
  final AsyncSnapshot? snapshot;
  final TextAlign? textAlign;
  final FocusNode? focusNode;
  final Color? hintColor;
  final Color? textColor;
  final String? hintText;
  final Widget? prefixIcon;
  final double? fontSize;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        width: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            utils.isNullOrEmpty(labelTextStr)
                ? const SizedBox.shrink()
                : Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        labelTextStr!,
                        style: const TextStyle(
                            fontFamily: 'Roboto',
                            fontSize: 12,
                            fontWeight: FontWeight.normal,
                            color: Colors.black87),
                        textScaler: ScaleSize.textScaler(context),
                      ),
                      !utils.isNullOrEmpty(labelTextLink)
                          ? InkWell(
                              onTap: onTapLink,
                              child: Text(
                                labelTextLink!,
                                style: const TextStyle(
                                    fontFamily: 'Roboto',
                                    fontSize: 12,
                                    fontWeight: FontWeight.bold,
                                    color: utils.GlobalConstants.secondary),
                                textScaler: ScaleSize.textScaler(context),
                              ),
                            )
                          : const SizedBox.shrink(),
                    ],
                  ),
            utils.isNullOrEmpty(labelTextStr)
                ? const SizedBox.shrink()
                : const SizedBox(height: 5),
            TextFormField(
                keyboardType: keyboardType,
                textInputAction: textInputAction,
                inputFormatters: inputFormatters,
                maxLength: maxLength,
                maxLines: maxLines,
                maxLengthEnforcement: MaxLengthEnforcement.enforced,
                textAlign: textAlign ?? TextAlign.start,
                style: const TextStyle(
                    fontFamily: 'Roboto',
                    fontWeight: FontWeight.normal,
                    fontSize: 12),
                onSaved: onSaved as void Function(String? x)?,
                onChanged: onChanged as void Function(String? x)?,
                onTap: onTap as void Function()?,
                onFieldSubmitted: onFieldSubmitted,
                validator: validator as String? Function(String? x)?,
                obscureText: obscureText,
                enabled: enabled,
                readOnly: readOnly ?? false,
                autofocus: autofocus ?? false,
                textCapitalization:
                    textCapitalization ?? TextCapitalization.none,
                controller: controller,
                focusNode: focusNode,
                decoration: otpInputDecoration(context, hintText.toString(),
                    suffixIcon, prefixIcon, snapshot)),
          ],
        ));
  }
}
