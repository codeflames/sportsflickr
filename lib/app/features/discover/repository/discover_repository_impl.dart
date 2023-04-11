import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'discover_repository.dart';

class DiscoverRepositoryImpl extends DiscoverRepository {
  // TODO add your methods here
}

final discoverRepositoryProvider = Provider<DiscoverRepository>((ref) {
  return DiscoverRepositoryImpl();
});
