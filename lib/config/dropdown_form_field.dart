import 'package:flutter/material.dart';
import 'package:tkc/theme/app_colors.dart';

class CustomDropdown extends StatefulWidget {
  final List<DropdownMenuItem<String>> items;
  final String? label;
  final String? value;
  final Function(String?) onChanged;
  final IconData suffixIcon;
  final String? error;

  const CustomDropdown({
    super.key,
    required this.items,
    this.label,
    this.value,
    required this.onChanged,
    this.suffixIcon = Icons.arrow_drop_down,
    this.error,
  });

  @override
  State<CustomDropdown> createState() => _CustomDropdownState();
}

class _CustomDropdownState extends State<CustomDropdown> {
  @override
  Widget build(BuildContext context) {
    return DropdownButtonFormField<String>(
      dropdownColor: AppColors.background,
      value: widget.value,
      items: widget.items,
      onChanged: widget.onChanged,
      decoration: InputDecoration(
        labelText: widget.label,
        // suffixIcon: widget.isSuffixIcon
        //     ? Icon(widget.suffixIcon, color: AppColors.dividerColor)
        //     : null,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(4.0)),
          borderSide: BorderSide(color: AppColors.dividerColor, width: 2.0),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(4.0)),
          borderSide: BorderSide(color: AppColors.dividerColor, width: 2.0),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(4.0)),
          borderSide: BorderSide(color: AppColors.dividerColor, width: 2.0),
        ),
      ),
      validator: (value) {
        if (value == null || value.isEmpty) {
          return widget.error;
        }
        return null;
      },
    );
  }
}
