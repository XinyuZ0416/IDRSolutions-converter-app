import 'package:flutter/material.dart';

class StyledCheckbox extends StatefulWidget {
  const StyledCheckbox({
    super.key,
    required this.isChecked,
    required this.onChanged,
  });

  final bool isChecked;
  final ValueChanged<bool> onChanged;

  @override
  State<StyledCheckbox> createState() => _StyledCheckboxState();
}

class _StyledCheckboxState extends State<StyledCheckbox> {
  late bool _isChecked;

  @override
  void initState() {
    super.initState();
    _isChecked = widget.isChecked;
  }

  @override
  Widget build(BuildContext context) {
    return Checkbox(
        shape: CircleBorder(),
        splashRadius: 10,
        checkColor: Theme.of(context).primaryColor,
        activeColor: Colors.transparent,
        value: _isChecked,
        onChanged: (newVal) {
          if (newVal != null) {
            setState(() {
              _isChecked = newVal;
            });
            widget.onChanged(newVal);
          }
        });
  }
}
