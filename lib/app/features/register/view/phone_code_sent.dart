import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:sportsflickr/app/core/general_widgets/sportsflickr_appbar.dart';
import 'package:sportsflickr/app/core/theme/theme.dart';
import 'package:sportsflickr/app/features/profile/view/profile_view.dart';
import 'package:sportsflickr/app/features/register/providers/register_providers.dart';
import 'package:sportsflickr/app/features/register/view/add_username_and%20phone_view.dart';

class PhoneCodeSentSentPage extends ConsumerWidget {
  const PhoneCodeSentSentPage({super.key});

  static const routeName = '/register/phone-code-sent';

  static final TextEditingController _controller = TextEditingController();
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // ref.listen(accountSetupControllerProvider, (previousState, nextState) {
    //   if (previousState != nextState && nextState.isVerified == true) {
    //     context
    //         .push('${AccountSetupView.routeName}/${AccountTypeView.routeName}');
    //   }
    // });
    final registerController = ref.watch(registerControllerProvider);

    return Scaffold(
      appBar: SportsflickrAppBar(
        title: Text(
          'Verify phone number',
          style: redHatDisplayBold16,
        ),
        onPressed: () => context.go(AddUsernameAndPhoneView.routeName),
      ),
      body: Padding(
        padding: paddingH24,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            SizedBox(
              height: 24.h,
            ),
            Text(
              'Phone verification sent',
              textAlign: TextAlign.center,
              style: redHatDisplayBold18.copyWith(
                color: zero80B17,
              ),
            ),
            const SizedBox(
              height: 6,
            ),
            Text(
              'A verification SMS has been sent to ${registerController.phoneNumber}. Please enter the code below to continue.',
              textAlign: TextAlign.center,
              style: redHatDisplayRegular14.copyWith(color: zero80B17),
            ),
            SizedBox(
              height: 24.h,
            ),
            TextFormField(
              controller: _controller,
              decoration: inputDecoration.copyWith(labelText: 'Enter code'),
            ),
            SizedBox(
              height: 24.h,
            ),
            ElevatedButton(
              onPressed: () async {
                context.goNamed(ProfileView.routeName);
                // await ref
                // .read(accountSetupControllerProvider.notifier)
                // .verifyAccount(email, _controller.text);
                // if (context.mounted) {
                //   context.pop();
                //   context.push(
                //       '${AccountSetupView.routeName}/${AccountTypeView.routeName}');
                // }
              },
              style: primaryButtonStyle,
              child: const Text(
                'Continue',
              ),
            ),
            SizedBox(
              height: 24.h,
            ),
            // TextButton(
            //   onPressed: () {
            //     ref
            //         .read(accountSetupControllerProvider.notifier)
            //         .resendVerificationRequest(email);
            //   },
            //   style: textButtonStyle,
            //   child: const Text(
            //     'Resend',
            //   ),
            // ),
          ],
        ),
      ),
    );
  }
}
