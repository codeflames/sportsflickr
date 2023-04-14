import 'package:flutter/material.dart';

import 'colors.dart';
import 'fontstyles.dart';

// // Radii
final borderRadius3 = BorderRadius.circular(3);
final borderRadius4 = BorderRadius.circular(4);

final borderRadius6 = BorderRadius.circular(6);

final borderRadius8 = BorderRadius.circular(8);
final borderRadius10 = BorderRadius.circular(10);
final borderRadius12 = BorderRadius.circular(12);

final borderRadius16 = BorderRadius.circular(16);
final borderRadius22 = BorderRadius.circular(22);
final borderRadius28 = BorderRadius.circular(28);
//50
final borderRadius50 = BorderRadius.circular(50);

const borderRadiusTopLR32 = BorderRadius.only(
  topLeft: Radius.circular(32),
  topRight: Radius.circular(32),
);

const borderRadiusTopLR24 = BorderRadius.only(
  topLeft: Radius.circular(24),
  topRight: Radius.circular(24),
);

const borderRadiusTopRBottomR8 = BorderRadius.only(
  bottomRight: Radius.circular(8),
  topRight: Radius.circular(8),
);

final RoundedRectangleBorder roundBox28 =
    RoundedRectangleBorder(borderRadius: borderRadius28);

final RoundedRectangleBorder roundBox6 =
    RoundedRectangleBorder(borderRadius: borderRadius6);

final inputDecoration = InputDecoration(
  border: OutlineInputBorder(
    borderRadius: BorderRadius.circular(6),
  ),
  // focusedBorder: const OutlineInputBorder(
  //   borderSide: BorderSide(
  //     color: five36BE5,
  //     // color: e7e8ea,
  //   ),
  // ),
  errorBorder: const OutlineInputBorder(
    borderSide: BorderSide(
      color: fF0000,
    ),
  ),
  focusedErrorBorder: const OutlineInputBorder(
      borderSide: BorderSide(
        color: fF0000,
      ),
      borderRadius: BorderRadius.all(Radius.circular(6))),
  contentPadding: const EdgeInsets.fromLTRB(14, 15, 12, 14),
  // enabledBorder: const OutlineInputBorder(
  //   borderSide: BorderSide(
  //     color: e7e8ea,
  //   ),
  // ),
);

final primaryButtonStyle = ElevatedButton.styleFrom(
  padding: const EdgeInsets.symmetric(vertical: 13, horizontal: 32),
  textStyle: redHatDisplayMedium16,
  elevation: 1,
  shape: roundBox6,
);

final outlineButtonStyle = OutlinedButton.styleFrom(
  padding: const EdgeInsets.symmetric(vertical: 13, horizontal: 32),
  // foregroundColor: one92045,
  // backgroundColor: ffffff,
  side: const BorderSide(color: e7e8ea, width: 1),
  textStyle: redHatDisplayMedium16,
  shape: roundBox6,
);

final textButtonStyle = TextButton.styleFrom(
  padding: const EdgeInsets.symmetric(vertical: 13, horizontal: 32),
  shape: roundBox6,
);

const paddingH20 = EdgeInsets.symmetric(horizontal: 20);
const paddingH24 = EdgeInsets.symmetric(horizontal: 24);
const paddingH32 = EdgeInsets.symmetric(horizontal: 32);
const paddingH40 = EdgeInsets.symmetric(horizontal: 40);
const paddingH48 = EdgeInsets.symmetric(horizontal: 48);
const paddingH51 = EdgeInsets.symmetric(horizontal: 51);
const paddingH56 = EdgeInsets.symmetric(horizontal: 56);
const paddingH64 = EdgeInsets.symmetric(horizontal: 64);
