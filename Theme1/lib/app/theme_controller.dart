import 'package:flutter_riverpod/flutter_riverpod.dart';

enum AppMood {
  warmEditorial,
  nordicMinimal,
  darkCinematic,
  vibrantArtistic,
}

class MoodController extends StateNotifier<AppMood> {
  MoodController() : super(AppMood.warmEditorial);

  void setMood(AppMood mood) {
    state = mood;
  }
}

final moodControllerProvider = StateNotifierProvider<MoodController, AppMood>(
  (ref) => MoodController(),
);
