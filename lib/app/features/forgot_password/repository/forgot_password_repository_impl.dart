import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'forgot_password_repository.dart';

class ForgotPasswordRepositoryImpl extends ForgotPasswordRepository {
  // TODO add your methods here
}

final forgotPasswordRepositoryProvider =
    Provider<ForgotPasswordRepository>((ref) {
  return ForgotPasswordRepositoryImpl();
});
