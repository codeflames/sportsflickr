import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:sportsflickr/app/core/general_widgets/sportsflickr_appbar.dart';
import 'package:sportsflickr/app/core/theme/theme.dart';
import 'package:sportsflickr/app/features/login/providers/login_providers.dart';
import 'package:sportsflickr/app/features/register/view/register_view.dart';
import 'package:sportsflickr/app/features/settings/view/about_view.dart';
import 'package:sportsflickr/app/features/settings/view/change_password_view.dart';
import 'package:sportsflickr/app/features/settings/view/contact_us_view.dart';
import 'package:sportsflickr/app/features/settings/view/privacy_policy_view.dart';
import 'package:sportsflickr/app/features/settings/view/terms_of_service_view.dart';
import 'package:sportsflickr/app/features/settings/view/theme_settings_view.dart';
import 'package:sportsflickr/app/features/settings/view/update_email_view.dart';
import 'package:sportsflickr/app/features/settings/view/update_username_view.dart';

class SettingsView extends ConsumerWidget {
  const SettingsView({Key? key}) : super(key: key);

  static const routeName = '/settings';

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return SafeArea(
      child: Scaffold(
          appBar: SportsflickrAppBar(
            title: Text('Settings & Privacy', style: redHatDisplayBold16),
            leading: const SizedBox(),
          ),
          body: Padding(
            padding: paddingH24,
            child: Column(
              children: [
                SizedBox(height: 16.h),
                SettingsWidget(
                  title: 'Change Password',
                  icon: const Icon(Icons.lock_rounded, color: five36BE5),
                  onTap: () => context.goNamed(ChangePasswordView.routeName),
                ),
                SizedBox(height: 16.h),
                SettingsWidget(
                  title: 'Update Email',
                  icon: const Icon(Icons.email_rounded, color: five36BE5),
                  onTap: () => context.goNamed(UpdateEmailView.routeName),
                ),
                SizedBox(height: 16.h),
                SettingsWidget(
                  title: 'Update Username',
                  icon: const Icon(Icons.person_rounded, color: five36BE5),
                  onTap: () => context.goNamed(UpdateUsernameView.routeName),
                ),
                SizedBox(height: 16.h),
                SettingsWidget(
                  title: 'Theme Settings',
                  icon: const Icon(Icons.lightbulb_rounded, color: five36BE5),
                  onTap: () => context.goNamed(ThemeSettingsView.routeName),
                ),
                SizedBox(height: 16.h),
                SettingsWidget(
                  title: 'About',
                  icon: const Icon(Icons.info_rounded, color: five36BE5),
                  onTap: () => context.goNamed(AboutView.routeName),
                ),
                SizedBox(height: 16.h),
                SettingsWidget(
                  title: 'Terms of Service',
                  icon: const Icon(Icons.description_rounded, color: five36BE5),
                  onTap: () => context.goNamed(TermsOfServiceView.routeName),
                ),
                SizedBox(height: 16.h),
                SettingsWidget(
                  title: 'Privacy Policy',
                  icon: const Icon(Icons.privacy_tip_rounded, color: five36BE5),
                  onTap: () => context.goNamed(PrivacyPolicyView.routeName),
                ),
                SizedBox(height: 16.h),
                SettingsWidget(
                  title: 'Contact Us',
                  icon: const Icon(Icons.contact_support_rounded,
                      color: five36BE5),
                  onTap: () => context.goNamed(ContactUsView.routeName),
                ),
                SizedBox(height: 16.h),
                SettingsWidget(
                  title: 'Logout',
                  icon: const Icon(Icons.logout_rounded, color: fF0000),
                  onTap: () {
                    showDialog(
                        context: context,
                        builder: (context) {
                          return AlertDialog(
                            title: Text(
                              'Warning',
                              style: redHatDisplayBold20.copyWith(
                                  fontWeight: FontWeight.w600),
                            ),
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(8)),
                            // contentPadding: ,
                            content: Text(
                              'Are you sure you want to logout?',
                              style: redHatDisplayRegular16,
                            ),
                            actions: [
                              TextButton(
                                  onPressed: () {
                                    context.pop();
                                  },
                                  child: Text('Cancel',
                                      style: redHatDisplayRegular16)),
                              TextButton(
                                  onPressed: () async {
                                    context.pop();
                                    try {
                                      await FirebaseAuth.instance.signOut();
                                      ref
                                          .read(
                                              loginControllerProvider.notifier)
                                          .cleanState();
                                      if (context.mounted) {
                                        context.go(RegisterView.routeName);
                                      }
                                    } catch (e) {
                                      EasyLoading.showError('Unable to logout');
                                    }
                                    //check if context is still valid
                                  },
                                  child: Text('Logout',
                                      style: redHatDisplayRegular16.copyWith(
                                          color: fF0000))),
                            ],
                          );
                        });
                  },
                ),
                SizedBox(height: 16.h),
              ],
            ),
          )),
    );
  }
}

class SettingsWidget extends StatelessWidget {
  const SettingsWidget({super.key, this.onTap, this.title, this.icon});

  final VoidCallback? onTap;
  final String? title;
  final Widget? icon;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 8.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
                height: 32.h,
                width: 32.h,
                child: icon ?? const Icon(Icons.settings_applications_rounded)),
            SizedBox(
              width: 18.w,
            ),
            Expanded(
              child: Text(title ?? '',
                  style: redHatDisplayRegular16.copyWith(
                      color: title?.toLowerCase() == 'logout' ? fF0000 : null)),
            ),
            title?.toLowerCase() == 'logout'
                ? const SizedBox()
                : const Icon(
                    Icons.keyboard_arrow_right,
                    size: 16,
                    color: Colors.blueGrey,
                  )
          ],
        ),
      ),
    );
  }
}
