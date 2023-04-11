import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:sportsflickr/app/core/general_widgets/sportsflickr_formatter.dart';
import 'package:sportsflickr/app/core/theme/theme.dart';

final sportsListProvider = Provider((ref) => [
      "Football",
      "Basketball",
      "Baseball",
      "Hockey",
      "Soccer",
      "Tennis",
      "Golf",
      "Boxing",
      "MMA",
      "Auto Racing"
    ]);

class ProfileView extends ConsumerWidget {
  const ProfileView({Key? key}) : super(key: key);

  static const routeName = '/profile';

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final sportsList = ref.watch(sportsListProvider);
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Container(
            padding: paddingH24,
            height: sportsflickrScreenHeight(context),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              mainAxisSize: MainAxisSize.min,
              children: [
                Center(
                  child: Container(
                      height: 150.h,
                      width: 180.w,
                      decoration: const BoxDecoration(
                        shape: BoxShape.circle,
                        // color: zero0000,
                      ),
                      // color: Colors.red,
                      child: Stack(children: [
                        const Center(child: TripleRingWidget()),
                        Align(
                          alignment: Alignment.centerRight,
                          child: Container(
                            margin: const EdgeInsets.only(left: 50),
                            child: Icon(Icons.camera_alt,
                                size: 24.h, color: five36BE5.withOpacity(.8)),
                          ),
                        ),
                      ])),
                ),
                SizedBox(height: 16.h),
                Text('Yereka',
                    style: redHatDisplayBold16, textAlign: TextAlign.center),
                SizedBox(height: 8.h),
                //email
                Text('yerekadonald@gmail.com',
                    style: redHatDisplayMedium12, textAlign: TextAlign.center),
                // Interests
                SizedBox(height: 32.h),
                Text(
                  'Interests',
                  style: redHatDisplayBold16,
                ),
                SizedBox(height: 16.h),

                GridView.builder(
                  itemCount: sportsList.sublist(0, 6).length,
                  physics: const NeverScrollableScrollPhysics(),
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      childAspectRatio: 1.5,
                      crossAxisSpacing: 8,
                      mainAxisSpacing: 8,
                      crossAxisCount: 3),
                  shrinkWrap: true,
                  itemBuilder: (context, index) {
                    return InterestWidget(sport: sportsList[index]);
                  },
                ),
                sportsList.length > 6
                    ? Align(
                        alignment: Alignment.centerRight,
                        child: TextButton(
                          style: textButtonStyle.copyWith(
                              padding: MaterialStateProperty.all<EdgeInsets>(
                                  EdgeInsets.symmetric(horizontal: 4.w))),
                          onPressed: () {},
                          child: const Text(
                            'See More Interests',
                          ),
                        ),
                      )
                    : Container(),
                SizedBox(height: 24.h),
                Text(
                  'Messages',
                  style: redHatDisplayBold16,
                ),
                SizedBox(height: 16.h),
                Row(
                  children: [
                    Icon(Icons.email, color: five36BE5.withOpacity(.8)),
                    SizedBox(width: 8.w),
                    Text(
                      'You have 3 unread messages',
                      style: redHatDisplayMedium14,
                    ),
                    const Spacer(),
                    Icon(Icons.arrow_forward_ios,
                        size: 16.h, color: five36BE5.withOpacity(.8)),
                  ],
                ),
                SizedBox(height: 24.h),
                Text(
                  'Favorite Teams',
                  style: redHatDisplayBold16,
                ),
                SizedBox(height: 16.h),
                Expanded(
                  child: ListView.builder(
                    shrinkWrap: true,
                    scrollDirection: Axis.horizontal,
                    itemCount: 5,
                    itemBuilder: (context, index) {
                      return Container(
                        // height: 10.h,
                        width: 150.w,

                        margin: const EdgeInsets.only(right: 8),
                        padding: const EdgeInsets.all(8),
                        decoration: BoxDecoration(
                          color: five36BE5.withOpacity(.03),
                          borderRadius: borderRadius4,
                        ),
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              height: 30.h,
                              width: 30.h,
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: five36BE5.withOpacity(.1),
                              ),
                              child: const Center(
                                child: Icon(
                                  Icons.sports_baseball,
                                  color: five36BE5,
                                  size: 18,
                                ),
                              ),
                            ),
                            SizedBox(width: 8.w),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Text(
                                    'Team Name and team name',
                                    style: redHatDisplayRegular14,
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                  Text(
                                    'Sport Name',
                                    style: redHatDisplayRegular10,
                                  ),
                                  SizedBox(height: 4.h),
                                  index == 1
                                      ? Column(
                                          children: [
                                            Text(
                                              'Playing Now',
                                              style: redHatDisplayRegular10,
                                            ),
                                          ],
                                        )
                                      : Text('Next Game: 12/12/2023',
                                          style: redHatDisplayRegular10),
                                ],
                              ),
                            ),
                          ],
                        ),
                      );
                    },
                  ),
                ),
                // SizedBox(height: 16.h),
                const Spacer(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class TripleRingWidget extends StatelessWidget {
  const TripleRingWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        border: Border.all(
          color: five36BE5.withOpacity(.03),
          width: 2,
        ),
        boxShadow: [
          BoxShadow(
            color: five36BE5.withOpacity(0.1),
            blurRadius: 3,
            offset: const Offset(1, 1),
          ),
        ],
      ),
      child: Container(
        padding: const EdgeInsets.all(10),
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          border: Border.all(
            color: five36BE5.withOpacity(.05),
            width: 2,
          ),
          boxShadow: [
            BoxShadow(
              color: five36BE5.withOpacity(0.1),
              blurRadius: 3,
              offset: const Offset(1, 1),
            ),
          ],
        ),
        child: Container(
          padding: const EdgeInsets.all(10),
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            border: Border.all(
              color: five36BE5.withOpacity(.1),
              width: 2,
            ),
            boxShadow: [
              BoxShadow(
                color: five36BE5.withOpacity(0.2),
                blurRadius: 5,
                offset: const Offset(1, 1),
              ),
            ],
          ),
          child: Container(
              height: 100.h,
              width: 100.h,
              decoration: const BoxDecoration(
                shape: BoxShape.circle,
                color: zero0000,
              ),
              child: Center(child: FlutterLogo(size: 50.h))),
        ),
      ),
    );
  }
}

class InterestWidget extends StatelessWidget {
  const InterestWidget({super.key, this.sport});
  final String? sport;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: five36BE5.withOpacity(.1),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Row(
        children: [
          Container(
            height: 20.h,
            width: 20.h,
            decoration: const BoxDecoration(
              shape: BoxShape.circle,
              color: five36BE5,
            ),
          ),
          SizedBox(width: 8.w),
          Text(sport ?? 'Sport', style: redHatDisplayMedium12),
        ],
      ),
    );
  }
}
