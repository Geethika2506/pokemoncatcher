import 'package:flutter/widgets.dart';

class Responsive {
  static bool isSmall(BuildContext context) =>
      MediaQuery.sizeOf(context).width < 360;

  static bool isTablet(BuildContext context) =>
      MediaQuery.sizeOf(context).width >= 600;

  static double gridMaxExtent(BuildContext context) {
    final w = MediaQuery.sizeOf(context).width;
    if (w >= 1000) return 240;
    if (w >= 600) return 220;
    return 180;
  }
}
