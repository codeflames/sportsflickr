import 'package:flutter/material.dart';
import 'package:sportsflickr/app/core/theme/theme.dart';

class SportsflickrBackButton extends StatelessWidget {
  const SportsflickrBackButton({super.key, this.color, this.onPressed});

  final Color? color;
  final Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: Row(children: [
        const Icon(
          Icons.arrow_back_ios,
          size: 14,
        ),
        Text('Back', style: redHatDisplayMedium14.copyWith(color: color))
      ]),
      color: color,
      tooltip: MaterialLocalizations.of(context).backButtonTooltip,
      onPressed: () {
        if (onPressed != null) {
          onPressed!();
        } else {
          Navigator.maybePop(context);
        }
      },
    );
  }
}
