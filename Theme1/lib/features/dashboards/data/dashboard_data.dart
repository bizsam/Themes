class MetricKpi {
  const MetricKpi({
    required this.label,
    required this.value,
    required this.delta,
  });

  final String label;
  final String value;
  final String delta;
}

class TimelineEntry {
  const TimelineEntry({
    required this.time,
    required this.title,
    required this.detail,
    required this.status,
  });

  final String time;
  final String title;
  final String detail;
  final String status;
}

class PersonalGoal {
  const PersonalGoal({
    required this.title,
    required this.progress,
    required this.detail,
  });

  final String title;
  final double progress;
  final String detail;
}

class DashboardMockData {
  static const analyticsKpis = [
    MetricKpi(label: 'Subscribers', value: '84.2K', delta: '+12%'),
    MetricKpi(label: 'Read time', value: '5.4m', delta: '+18%'),
    MetricKpi(label: 'Retention', value: '71%', delta: '+3%'),
  ];

  static const activityTimeline = [
    TimelineEntry(time: '08:12', title: 'Editorial review', detail: 'Layouts approved for Issue 32', status: 'Approved'),
    TimelineEntry(time: '10:45', title: 'Contributor brief', detail: 'Sent to 4 photographers', status: 'Sent'),
    TimelineEntry(time: '12:30', title: 'Studio session', detail: 'Moodboard delivered to team', status: 'Live'),
  ];

  static const personalGoals = [
    PersonalGoal(title: 'Weekly features', progress: 0.72, detail: '5 of 7 published'),
    PersonalGoal(title: 'Audience intimacy', progress: 0.54, detail: '32 handwritten replies'),
    PersonalGoal(title: 'Creative streak', progress: 0.88, detail: '14 days active'),
  ];
}
