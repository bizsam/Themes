import 'package:flutter/material.dart';
import '../../../core/models/user_role.dart';

class DashboardDefinition {
  const DashboardDefinition({
    required this.id,
    required this.title,
    required this.subtitle,
    required this.icon,
    required this.allowedRoles,
    required this.accent,
    required this.builder,
  });

  final String id;
  final String title;
  final String subtitle;
  final IconData icon;
  final Set<UserRole> allowedRoles;
  final Gradient accent;
  final WidgetBuilder builder;
}
