import 'package:flutter/material.dart';

enum ServiceMenuItem {
  support
}

extension ServiceMenuItemExtension on ServiceMenuItem {
  IconData get icon {
    switch (this) {
      case ServiceMenuItem.support:
        return Icons.support_agent;
    }
  }

  String get label {
    switch (this) {
      case ServiceMenuItem.support:
        return "Комьюнити";
    }
  }

  Color get startColor {
    switch (this) {
      case ServiceMenuItem.support:
        return Color(0xFFFF4E54);
    }
  }

  Color get finishColor {
    switch (this) {
      case ServiceMenuItem.support:
        return Color(0xFFFFD969);
    }
  }

  Widget? get route {
    switch (this) {
      case ServiceMenuItem.support:
        return null;
    }
  }
}
