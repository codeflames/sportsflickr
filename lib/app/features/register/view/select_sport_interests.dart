import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:sportsflickr/app/core/general_widgets/sportsflickr_appbar.dart';
import 'package:sportsflickr/app/core/general_widgets/sportsflickr_formatter.dart';
import 'package:sportsflickr/app/core/theme/theme.dart';
import 'package:sportsflickr/app/features/register/model/sports_interest_state.dart';
import 'package:sportsflickr/app/features/register/view/phone_code_sent.dart';

class SelectSportsInterestPage extends ConsumerWidget {
  SelectSportsInterestPage({Key? key}) : super(key: key);

  static const routeName = '/select-sports-interest';

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final sportsList = ref.watch(sportsInterestControllerProvider);
    return Scaffold(
      appBar: const SportsflickrAppBar(
        leading: SizedBox.shrink(),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            height: sportsflickrScreenHeight(context),
            padding: paddingH24,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              // mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  // add a smiling emoji after one more step
                  'One more step 🥳',
                  style: redHatDisplayBold20,
                ),
                SizedBox(height: 16.h),
                Text(
                  'Select your sports interests(at least 5)',
                  style: redHatDisplayMedium16,
                ),

                SizedBox(height: 48.h),
                // List of selectable chips
                sportsList.interests.isNotEmpty
                    ? Wrap(
                        spacing: 8.w,
                        runSpacing: 8.h,
                        children: [
                          for (final interest in sportsList.interests)
                            ChoiceChip(
                              label: Text(interest['name']!),
                              selected: sportsList.selectedInterests
                                  .contains(interest),
                              selectedColor: Colors.green.withOpacity(.5),
                              onSelected: (selected) {
                                ref
                                    .read(sportsInterestControllerProvider
                                        .notifier)
                                    .addInterestToSelectedInterests(interest);
                              },
                            ),
                        ],
                      )
                    :
                    // show an Empty List widget
                    SizedBox(
                        height: 200.h,
                        child: const Center(
                          child: Text('No interests found'),
                        ),
                      ),
                const Spacer(),
                SizedBox(
                  height: 48.h,
                ),
                ElevatedButton(
                    style: primaryButtonStyle,
                    onPressed: () async {
                      if (sportsList.selectedInterests.length < 5) {
                        EasyLoading.showError('Select at least 5 interests');
                        return;
                      } else {
                        try {
                          EasyLoading.show(status: 'Saving your interests...');
                          await ref
                              .read(sportsInterestControllerProvider.notifier)
                              .saveSelectedInterests();
                          await ref
                              .read(sportsInterestControllerProvider.notifier)
                              .getUserSelectedSportsInterest();
                          EasyLoading.showSuccess('Saved your interests');
                          if (context.mounted) {
                            context.goNamed(PhoneCodeSentSentPage.routeName);
                          }
                        } catch (e) {
                          log(e.toString());
                          EasyLoading.showError(
                              'Failed to save your interests');
                        }
                      }
                    },
                    child: const Text('Next'))
              ],
            ),
          ),
        ),
      ),
    );
  }
}
