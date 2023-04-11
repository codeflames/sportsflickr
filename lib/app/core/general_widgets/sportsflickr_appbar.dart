import 'package:flutter/material.dart';
import 'package:sportsflickr/app/core/general_widgets/sportsflickr_back_button.dart';
import 'package:sportsflickr/app/core/theme/theme.dart';

class SportsflickrAppBar extends StatelessWidget with PreferredSizeWidget {
  const SportsflickrAppBar({
    Key? key,
    this.title,
    this.onPressed,
    this.actions,
    this.leading,
  }) : super(key: key);
  final Widget? title;
  final Function()? onPressed;
  final List<Widget>? actions;
  final Widget? leading;

  @override
  final Size preferredSize = const Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    // BackButton
    return AppBar(
      title: title ??
          Text(
            '',
            style: redHatDisplayBold16,
          ),
      centerTitle: true,
      leading: leading ??
          Padding(
            padding: const EdgeInsets.only(left: 16),
            child: SportsflickrBackButton(
              onPressed: onPressed,
            ),
          ),
      actions: actions,
      leadingWidth: 100,
      // backgroundColor: ffffff,
      elevation: 0,
    );
  }
}
