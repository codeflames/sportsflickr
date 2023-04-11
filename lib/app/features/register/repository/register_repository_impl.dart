import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'register_repository.dart';

class RegisterRepositoryImpl extends RegisterRepository {
  // TODO add your methods here
}

final registerRepositoryProvider = Provider<RegisterRepository>((ref) {
  return RegisterRepositoryImpl();
});
