// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'package:sportsflickr/app/core/general_widgets/sportsflickr_appbar.dart';
import 'package:sportsflickr/app/core/general_widgets/sportsflickr_formatter.dart';
import 'package:sportsflickr/app/core/theme/theme.dart';
import 'package:sportsflickr/app/features/settings/view/settings_view.dart';
import 'package:sportsflickr/app/features/settings/widget/settings_widget.dart';
import 'package:url_launcher/url_launcher.dart';

final _subjectProvider = StateProvider<List<EmailSubject>>((ref) => [
      const EmailSubject(
        subject: 'Question',
        color: Colors.blue,
      ),
      const EmailSubject(
        subject: 'Complaint',
        color: Colors.red,
      ),
      const EmailSubject(
        subject: 'Suggestion',
        color: Colors.green,
      ),
      const EmailSubject(
        subject: 'Bug report',
        color: Colors.amber,
      ),
      const EmailSubject(
        subject: 'Feature request',
        color: Colors.purple,
      ),
      const EmailSubject(
        subject: 'General inquiry',
        color: Colors.lightBlue,
      ),
    ]);

final selectedSubjectProvider = StateProvider<List<EmailSubject>>((ref) => []);

class ContactUsView extends ConsumerWidget {
  const ContactUsView({super.key});

  static const routeName = '/settings/contact-us';

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final selectedSubject = ref.watch(selectedSubjectProvider);
    final subjects = ref.watch(_subjectProvider);
    return Scaffold(
      appBar: SportsflickrAppBar(
        title: Text('Contact Us', style: redHatDisplayBold14),
        onPressed: () {
          ref.read(selectedSubjectProvider.notifier).state = [];
          context.goNamed(SettingsView.routeName);
        },
      ),
      body: SafeArea(
        child: Container(
          height: sportsflickrScreenHeight(context),
          padding: paddingH24,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              SizedBox(height: 24.h),
              Text('Select email subject:', style: redHatDisplayBold14),
              SizedBox(height: 24.h),
              Wrap(
                spacing: 8.w,
                runSpacing: 8.h,
                children: [
                  for (final subject in subjects)
                    GestureDetector(
                      onTap: () {
                        ref.read(selectedSubjectProvider.notifier).state = [];
                        ref
                            .read(selectedSubjectProvider.notifier)
                            .state
                            .add(subject);
                      },
                      child: Container(
                        padding: EdgeInsets.symmetric(
                          horizontal: 8.w,
                          vertical: 4.h,
                        ),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8),
                          border: Border.all(
                            color: subject.color.withOpacity(.4),
                            width: 1,
                          ),
                          color: subject.color.withOpacity(.5),
                        ),
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Text(subject.subject, style: redHatDisplayBold14),
                            SizedBox(width: 8.w),
                            selectedSubject.isNotEmpty &&
                                    selectedSubject[0] == subject
                                ? Container(
                                    width: 20.w,
                                    height: 20.w,
                                    decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      color: subject.color,
                                    ),
                                    child: const Icon(
                                      Icons.check,
                                      color: ffffff,
                                      size: 14,
                                    ))
                                : SizedBox(
                                    width: 20.w,
                                    height: 20.w,
                                  ),
                          ],
                        ),
                      ),
                    ),
                ],
              ),
              const Spacer(),
              ElevatedButton(
                  style: primaryButtonStyle,
                  onPressed: () async {
                    String email = Uri.encodeComponent(
                        "yerekadonald+sportsflickr@gmail.com");
                    String subject =
                        Uri.encodeComponent(selectedSubject[0].subject);
                    String body = Uri.encodeComponent("Hi Sportsflickr,\n\n");
                    log(subject);
                    log(body); //output: Hello%20Flutter
                    Uri mail =
                        Uri.parse("mailto:$email?subject=$subject&body=$body");
                    await launchUrl(mail);
                  },
                  child: const Text('Proceed to email')),
            ],
          ),
        ),
      ),
    );
  }
}
