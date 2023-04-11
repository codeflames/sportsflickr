import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'settings_repository.dart';

class SettingsRepositoryImpl extends SettingsRepository {
  // TODO add your methods here
}

final settingsRepositoryProvider = Provider<SettingsRepository>((ref) {
  return SettingsRepositoryImpl();
});
