import 'package:converter/themes/colors.dart';
import 'package:flutter/material.dart';

class StyledDropdown<T> extends StatelessWidget {
  const StyledDropdown({
    super.key,
    this.label,
    required this.initialSelection,
    required this.controller,
    required this.dropdownMenuEntries,
    required this.onChanged,
  });

  final Widget? label;
  final T initialSelection;
  final TextEditingController controller;
  final List<DropdownMenuEntry<T>> dropdownMenuEntries;
  final ValueChanged<T?> onChanged;

  @override
  Widget build(BuildContext context) {
    return DropdownMenu(
      width: 150,
      label: label,
      // dropdown items bg color
      menuStyle: MenuStyle(
        backgroundColor: WidgetStateProperty.resolveWith((states) => Colors.white),
      ),
      initialSelection: initialSelection,
      controller: controller,
      requestFocusOnTap: true,
      dropdownMenuEntries: dropdownMenuEntries,
      // dropdown border color
      inputDecorationTheme: InputDecorationTheme(
        labelStyle: TextStyle(color: AppColors.dimmedBlack),
        enabledBorder: OutlineInputBorder(borderSide: BorderSide(color: AppColors.dimmedBlack,),),
        focusedBorder: OutlineInputBorder(borderSide: BorderSide(color: AppColors.dimmedBlack,),),
        constraints: BoxConstraints.tight(const Size.fromHeight(30)),
        contentPadding: EdgeInsets.symmetric(horizontal: 10, vertical: 3),
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
      ),
      onSelected: onChanged,
    );
  }
}

