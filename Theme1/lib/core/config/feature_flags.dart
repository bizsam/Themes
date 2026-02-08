class FeatureFlags {
  const FeatureFlags({
    required this.analyticsDashboard,
    required this.activityDashboard,
    required this.personalDashboard,
  });

  final bool analyticsDashboard;
  final bool activityDashboard;
  final bool personalDashboard;

  static const allEnabled = FeatureFlags(
    analyticsDashboard: true,
    activityDashboard: true,
    personalDashboard: true,
  );

  FeatureFlags copyWith({
    bool? analyticsDashboard,
    bool? activityDashboard,
    bool? personalDashboard,
  }) {
    return FeatureFlags(
      analyticsDashboard: analyticsDashboard ?? this.analyticsDashboard,
      activityDashboard: activityDashboard ?? this.activityDashboard,
      personalDashboard: personalDashboard ?? this.personalDashboard,
    );
  }
}
