import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:sportsflickr/app/core/theme/theme.dart';
import 'package:sportsflickr/app/features/settings/view/privacy_policy_view.dart';
import 'package:sportsflickr/app/features/settings/view/terms_of_service_view.dart';

class TermsAndPrivacy extends StatelessWidget {
  const TermsAndPrivacy({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text.rich(
      textAlign: TextAlign.center,
      TextSpan(
        text: 'By creating an account, you accept SportFlickr\'s ',
        style: redHatDisplayRegular13,
        children: <TextSpan>[
          TextSpan(
              text: 'Terms of Service',
              style: redHatDisplayMedium13.copyWith(
                color: five36BE5,
              ),
              recognizer: TapGestureRecognizer()
                ..onTap = () {
                  context.pushNamed(TermsOfServiceView.routeName);
                }),
          const TextSpan(
            text: ' and ',
          ),
          TextSpan(
              text: 'Privacy Policy',
              style: redHatDisplayMedium13.copyWith(
                color: five36BE5,
              ),
              recognizer: TapGestureRecognizer()
                ..onTap = () {
                  context.pushNamed(PrivacyPolicyView.routeName);
                }),
        ],
      ),
    );
  }
}
