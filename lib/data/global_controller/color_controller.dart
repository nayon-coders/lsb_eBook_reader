import 'package:flutter/material.dart';

Color getColorByIndex(int index) {
  List<Color> baseColors = Colors.primaries;

  // Get the base color by cycling through the list of primary colors
  Color baseColor = baseColors[index % baseColors.length];

  // Adjust the color by applying different shades using index and opacity
  double factor = (index % 10) * 0.1; // Varies between 0.0 to 1.0

  return baseColor.withOpacity(0.3).withAlpha((factor * 255).toInt());
}

List<Color> generateColorList(int count) {
  List<Color> colors = [];

  for (int i = 0; i < count; i++) {
    colors.add(getColorByIndex(i));
  }

  return colors;
}
