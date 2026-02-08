import 'package:flutter/material.dart';
import '../../core/config/feature_flags.dart';
import '../../core/models/user_role.dart';
import 'models/dashboard_definition.dart';
import 'screens/activity_dashboard_screen.dart';
import 'screens/analytics_dashboard_screen.dart';
import 'screens/personal_dashboard_screen.dart';

class DashboardRegistry {
  const DashboardRegistry(this.flags);

  final FeatureFlags flags;

  List<DashboardDefinition> definitions() {
    return [
      if (flags.analyticsDashboard)
        DashboardDefinition(
          id: 'analytics',
          title: 'Analytics Dashboard',
          subtitle: 'KPI rhythm, performance, and exportable insights.',
          icon: Icons.stacked_line_chart,
          allowedRoles: {UserRole.editor, UserRole.curator, UserRole.member},
          accent: const LinearGradient(colors: [Color(0xFF8B6CFF), Color(0xFF3F8CFF)]),
          builder: (context) => const AnalyticsDashboardScreen(),
        ),
      if (flags.activityDashboard)
        DashboardDefinition(
          id: 'activity',
          title: 'Activity Dashboard',
          subtitle: 'Timeline orchestration, tasks, and alerts.',
          icon: Icons.auto_awesome_motion,
          allowedRoles: {UserRole.editor, UserRole.curator, UserRole.member},
          accent: const LinearGradient(colors: [Color(0xFF3F7D74), Color(0xFFB38B4E)]),
          builder: (context) => const ActivityDashboardScreen(),
        ),
      if (flags.personalDashboard)
        DashboardDefinition(
          id: 'personal',
          title: 'Personal Dashboard',
          subtitle: 'Goals, rituals, and creative wellbeing.',
          icon: Icons.self_improvement,
          allowedRoles: {UserRole.member, UserRole.curator},
          accent: const LinearGradient(colors: [Color(0xFF6B2DFF), Color(0xFFFF6B9A)]),
          builder: (context) => const PersonalDashboardScreen(),
        ),
    ];
  }

  DashboardDefinition? byId(String id) {
    for (final dashboard in definitions()) {
      if (dashboard.id == id) {
        return dashboard;
      }
    }
    return null;
  }
}

DashboardRegistry registryFrom(BuildContext context, FeatureFlags flags) => DashboardRegistry(flags);
