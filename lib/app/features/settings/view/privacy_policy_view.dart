import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:sportsflickr/app/core/general_widgets/sportsflickr_appbar.dart';
import 'package:sportsflickr/app/core/theme/theme.dart';
import 'package:sportsflickr/app/features/settings/view/settings_view.dart';

class PrivacyPolicyView extends ConsumerWidget {
  const PrivacyPolicyView({super.key});

  static const routeName = '/settings/privacy-policy';

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: SportsflickrAppBar(
        title: Text('Privacy Policy', style: redHatDisplayBold14),
        onPressed: () {
          if (Navigator.canPop(context)) {
            context.pop();
          } else {
            context.goNamed(SettingsView.routeName);
          }
        },
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            padding: paddingH24,
            child: Column(
              children: [
                const Text(
                    '''Privacy Policy for Interviewer-Exclusive App(Sportsflickr)

The Interviewer-Exclusive App(Sportsflickr) (the "App") respects your privacy and is committed to protecting it through this Privacy Policy ("Policy"). This Policy describes the types of information that may be collected from you when you use the App and how that information may be used and disclosed.

Information Collected
When you use the App, the developer may collect certain information from you, including but not limited to your name, email address, and any other information you provide. The developer may also collect usage data, such as the date and time of your use of the App, the pages or screens you access, and any actions you take while using the App.

Use of Information
The developer may use the information collected from you to provide you with the services offered by the App, to improve the App and its services, and to communicate with you about the App and related services. The developer may also use the information to respond to your inquiries, to provide customer support, and to enforce the terms and conditions governing your use of the App.

Disclosure of Information
The developer may disclose your information to third parties, such as service providers who assist in operating the App or provide related services. The developer may also disclose your information as required by law or in response to a legal request, such as a subpoena or court order. The developer may also disclose your information if it believes that such disclosure is necessary to protect its rights, property, or safety, or the rights, property, or safety of others.

Data Retention
The developer will retain your information for as long as necessary to fulfill the purposes for which it was collected or as required by law. The developer may retain your information even after you have terminated your use of the App, if necessary to comply with legal obligations, resolve disputes, or enforce agreements.

Security
The developer takes reasonable measures to protect your information from unauthorized access, use, or disclosure. However, no data transmission over the Internet or any wireless network can be guaranteed to be 100% secure, and the developer cannot ensure or warrant the security of any information you transmit to the App.

Children's Privacy
The App is not intended for use by children under the age of 13. The developer does not knowingly collect or solicit any information from anyone under the age of 13 or knowingly allow such persons to use the App. If you are under 13, please do not attempt to use the App or send any information about yourself to the developer.

Changes to Policy
The developer may update this Policy from time to time, and any changes will be effective upon posting the updated Policy on the App. Your continued use of the App after the effective date of any updated Policy constitutes your agreement to be bound by the updated Policy.

Contact Information
If you have any questions or concerns about this Policy or the developer's data practices, please contact the developer at [insert contact information].

By using the App, you acknowledge that you have read, understood, and agreed to this Policy.'''),
                SizedBox(height: 16.h),
                Text(' Sportsflickr Team', style: redHatDisplayBold14)
              ],
            ),
          ),
        ),
      ),
    );
  }
}
