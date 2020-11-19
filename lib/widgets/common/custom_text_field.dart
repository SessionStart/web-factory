import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField({
    this.labelText,
    this.suffixIcon,
    this.obscureText,
    this.onTap,
    this.onEditingComplete,
    this.icon,
    this.hintText = '',
    this.validator,
    this.onChanged,
    this.controller,
    this.keyboardType,
    this.focusNode,
    this.useTextArea = false,
    this.helperText,
    Key key,
  }) : super(key: key);
  final bool obscureText;
  final String labelText;
  final Widget suffixIcon;
  final Function() onTap;
  final Function() onEditingComplete;
  final IconData icon;
  final String hintText;
  final FormFieldValidator<String> validator;
  final ValueChanged<String> onChanged;
  final TextEditingController controller;
  final TextInputType keyboardType;
  final FocusNode focusNode;
  final bool useTextArea;
  final String helperText;

  @override
  Widget build(BuildContext context) {
    // final themeBloc = Provider.of<ThemeBloc>(context);
    final theme = Theme.of(context);
    InputDecoration decoration;
    if (icon != null) {
      decoration = InputDecoration(
          hintText: hintText,
          // hintStyle: themeBloc.appTheme.hintText,
          labelText: labelText,
          suffixIcon: suffixIcon,
          helperText: helperText,
          icon: Icon(
            icon,
            size: 22,
          ));
    } else {
      decoration = InputDecoration(
        hintText: hintText,
        // hintStyle: themeBloc.appTheme.hintText,
        labelText: labelText,
        suffixIcon: suffixIcon,
      );
    }
    return TextFormField(
      onTap: onTap,
      controller: controller,
      // style: themeBloc.appTheme.mainTextField,
      onChanged: onChanged,
      focusNode: focusNode,
      keyboardType: keyboardType ?? TextInputType.text,
      obscureText: obscureText ?? false,
      cursorColor: theme.accentColor,
      decoration: decoration,
      onEditingComplete: onEditingComplete,
      validator: validator,
      maxLines: useTextArea ?? false ? null : 1,
    );
  }
}
