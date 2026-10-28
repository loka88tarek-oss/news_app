import 'package:flutter/material.dart';

extension WidgetExtension on Widget {
  Widget allPadding({double value = 0}) {
    return Padding(padding: EdgeInsets.all(value), child: this);
  }

  Widget onlyPadding({
    double left = 0.0,
    double top = 0.0,
    double right = 0.0,
    double bottom = 0.0,
  }) {
    return Padding(
      padding: EdgeInsets.only(
        top: top,
        left: left,
        right: right,
        bottom: bottom,
      ),
      child: this,
    );
  }

  Widget symmetricPadding({double vertical = 0.0, double horizontal = 0.0}) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: horizontal, vertical: vertical),
      child: this,
    );
  }
}
