import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:sportsflickr/app/core/general_widgets/sportsflickr_appbar.dart';
import 'package:sportsflickr/app/core/general_widgets/sportsflickr_form_fields.dart';
import 'package:sportsflickr/app/core/general_widgets/sportsflickr_formatter.dart';
import 'package:sportsflickr/app/core/theme/theme.dart';
import 'package:sportsflickr/app/features/profile/view/profile_view.dart';
import 'package:sportsflickr/app/features/settings/view/settings_view.dart';

class UpdateUsernameView extends ConsumerWidget {
  UpdateUsernameView({super.key});

  static const routeName = '/settings/update-username';

  final TextEditingController _newUsernameController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return WillPopScope(
      onWillPop: () async {
        context.goNamed(SettingsView.routeName);
        return false;
      },
      child: Scaffold(
        appBar: SportsflickrAppBar(
          title: Text('Update Username', style: redHatDisplayBold14),
          onPressed: () => context.goNamed(SettingsView.routeName),
        ),
        body: SingleChildScrollView(
          child: Container(
            height: sportsflickrScreenHeight(context),
            padding: paddingH24,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                SizedBox(height: 24.h),
                Text(
                    'Warning:\nYour buddies might be confused if you change your username.\nAnother person can claim the username after you change it',
                    style: redHatDisplayBold14.copyWith(color: fF0000)),
                SizedBox(height: 24.h),
                Text(
                  'Enter your current username and your new username below.',
                  style: redHatDisplayBold14,
                ),
                SizedBox(height: 24.h),
                // SportsflickrTextFormField(
                //   labelText: 'Your current username',
                //   controller: _currentUsernameController,
                // ),
                SizedBox(height: 24.h),
                Form(
                  key: _formKey,
                  child: SportsflickrTextFormField(
                    labelText: 'Your new username',
                    controller: _newUsernameController,
                  ),
                ),
                SizedBox(height: 48.h),
                ElevatedButton(
                  style: primaryButtonStyle,
                  onPressed: () async {
                    if (_formKey.currentState!.validate()) {
                      EasyLoading.show(status: 'Updating username...');
                      try {
                        await FirebaseAuth.instance.currentUser!
                            .updateDisplayName(
                                _newUsernameController.text.trim());
                        EasyLoading.showSuccess('Username updated');
                        if (context.mounted) {
                          context.goNamed(ProfileView.routeName);
                        }
                      } catch (e) {
                        EasyLoading.showError('Error updating username');
                      }
                      FirebaseAnalytics.instance.logEvent(
                          name: 'update_username',
                          parameters: {
                            'username': _newUsernameController.text
                          });
                    }
                  },
                  child: Text('Update Username', style: redHatDisplayBold14),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
