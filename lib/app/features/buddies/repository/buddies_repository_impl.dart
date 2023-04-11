import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'buddies_repository.dart';

class BuddiesRepositoryImpl extends BuddiesRepository {
  // TODO add your methods here
}

final buddiesRepositoryProvider = Provider<BuddiesRepository>((ref) {
  return BuddiesRepositoryImpl();
});
