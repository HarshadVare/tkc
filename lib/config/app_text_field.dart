import 'package:flutter/material.dart';
import 'package:tkc/theme/app_colors.dart';

class AppTextFiled extends StatefulWidget {
  final String? label;
  final String error;
  final TextEditingController? controller;
  final bool isPassword;
  final bool isSuffixIcon;
  final bool isEnableField;
  final String hint;
  final TextInputType type;

  const AppTextFiled(
      {super.key,
      this.label,
      this.controller,
      required this.error,
      this.isPassword = false,
      this.isSuffixIcon = false,
      this.isEnableField = true,
      this.hint = '',
      this.type = TextInputType.text});

  @override
  State<AppTextFiled> createState() => _AppTextFiledState();
}

class _AppTextFiledState extends State<AppTextFiled> {
  bool _isObscured = true;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      enabled: widget.isEnableField,
      controller: widget.controller,
      obscureText: widget.isPassword ? _isObscured : widget.isPassword,
      decoration: InputDecoration(
        hintText: widget.hint,
        labelText: widget.label,
        suffixIcon: widget.isSuffixIcon
            ? IconButton(
                icon: Icon(
                  widget.isPassword
                      ? _isObscured
                          ? Icons.visibility
                          : Icons.visibility_off
                      : Icons.person_2_outlined,
                ),
                onPressed: widget.isPassword
                    ? () {
                        setState(() {
                          _isObscured =
                              !_isObscured; // Toggle password visibility
                        });
                      }
                    : null,
              )
            : null,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(4.0)),
          borderSide: BorderSide(color: AppColors.dividerColor, width: 2.0),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.all(
              Radius.circular(4.0)), // Square corners for the enabled state
          borderSide: BorderSide(color: AppColors.dividerColor, width: 2.0),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.all(
              Radius.circular(4.0)), // Square corners for the focused state
          borderSide: BorderSide(color: AppColors.dividerColor, width: 2.0),
        ),
      ),
      keyboardType: widget.type,
      validator: (value) {
        if (value == null || value.isEmpty) {
          return widget.error;
        }
        return null;
      },
    );
  }
}
