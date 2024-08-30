import 'package:flutter/material.dart';

class MKDropdownButton<T> extends StatelessWidget {
  final List<DropdownMenuItem<T>>? items;
  final bool isActive;
  final T? value;
  final Function(T? value) onChanged;
  final String hint;

  const MKDropdownButton({
    Key? key,
    required this.items,
    required this.isActive,
    required this.value,
    required this.onChanged,
    required this.hint,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final themeSecond = theme.bottomNavigationBarTheme;
    return Container(
      alignment: Alignment.centerLeft,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(5.0),
        color: theme.cardColor,
      ),
      padding: const EdgeInsets.fromLTRB(20, 2, 8, 2),
      child: DropdownButton<T>(
        items: items,
        onChanged: isActive ? onChanged : null,
        value: value,
        hint: Text(
          hint,
          style: TextStyle(
            color: themeSecond.selectedItemColor,
          ),
        ),
        style: TextStyle(
          color: themeSecond.selectedItemColor,
          fontSize: 14,
        ),
        underline: Container(),
        isExpanded: true,
        disabledHint: Text(
          hint,
          style: TextStyle(
            color: themeSecond.unselectedItemColor,
          ),
        ),
      ),
    );
  }
}
