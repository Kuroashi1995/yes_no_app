import 'package:flutter/material.dart';

const _customColor = Color(0xFF5C11D4);
final _colors = [
  _customColor,
  Colors.blue,
  Colors.red,
  Colors.green,
  Colors.yellow,
  Colors.greenAccent
];

class AppTheme {
  final int selectedColor;

  AppTheme({required this.selectedColor})
      : assert(selectedColor >= 0 && selectedColor <= _colors.length - 1,
            "The color number must be between 0 and ${_colors.length - 1}");
  ThemeData theme() {
    return ThemeData(
        useMaterial3: true, colorSchemeSeed: _colors[selectedColor]);
  }
}
