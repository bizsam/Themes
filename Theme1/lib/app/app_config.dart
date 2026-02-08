import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../core/config/feature_flags.dart';
import '../core/models/user_role.dart';

final featureFlagsProvider = StateProvider<FeatureFlags>((ref) {
  return FeatureFlags.allEnabled;
});

final userRoleProvider = StateProvider<UserRole>((ref) {
  return UserRole.member;
});
