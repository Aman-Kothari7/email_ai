import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';

import '../constants/colors.dart';

final ThemeData lightTheme = ThemeData.light().copyWith();
final TextTheme textThemeLight = TextTheme(
  titleLarge: GoogleFonts.notoSans(fontSize: 20, fontWeight: FontWeight.w600, letterSpacing: 0.15, color: AppColor.textColor),
  titleMedium: GoogleFonts.notoSans(fontSize: 18, fontWeight: FontWeight.w600, letterSpacing: 0.15, color: AppColor.textColor),
  titleSmall: GoogleFonts.notoSans(fontSize: 14, fontWeight: FontWeight.w600, letterSpacing: 0.1, color: AppColor.textColor),
  bodyLarge: GoogleFonts.notoSans(fontSize: 16, fontWeight: FontWeight.w600, letterSpacing: 0.5, color: AppColor.textColor),
  bodyMedium: GoogleFonts.notoSans(fontSize: 14, fontWeight: FontWeight.w400, letterSpacing: 0.25, color: AppColor.textLightGreyColor),
  bodySmall: GoogleFonts.notoSans(fontSize: 12, fontWeight: FontWeight.w400, letterSpacing: 0.4, color: AppColor.textLightGreyColor),
  labelLarge: GoogleFonts.notoSans(fontSize: 16, fontWeight: FontWeight.w500, letterSpacing: 1.25, color: AppColor.textLightGreyColor),
  labelSmall: GoogleFonts.notoSans(fontSize: 10, fontWeight: FontWeight.w500, letterSpacing: 1.5, color: AppColor.textLightGreyColor),
  labelMedium: GoogleFonts.notoSans(fontSize: 14, fontWeight: FontWeight.w500, letterSpacing: 1.5, color: AppColor.textColor),
);

final TextTheme textThemeDark = TextTheme(
  titleLarge: GoogleFonts.notoSans(fontSize: 20, fontWeight: FontWeight.w600, letterSpacing: 0.15, color: AppColor.textColorDark),
  titleMedium: GoogleFonts.notoSans(fontSize: 18, fontWeight: FontWeight.w600, letterSpacing: 0.15, color: AppColor.textColorDark),
  titleSmall: GoogleFonts.notoSans(fontSize: 14, fontWeight: FontWeight.w600, letterSpacing: 0.1, color: AppColor.textColorDark),
  bodyLarge: GoogleFonts.notoSans(fontSize: 16, fontWeight: FontWeight.w600, letterSpacing: 0.5, color: AppColor.textColorDark),
  bodyMedium: GoogleFonts.notoSans(fontSize: 14, fontWeight: FontWeight.w400, letterSpacing: 0.25, color: AppColor.textLightGreyColor),
  bodySmall: GoogleFonts.notoSans(fontSize: 12, fontWeight: FontWeight.w400, letterSpacing: 0.4, color: AppColor.textLightGreyColor),
  labelLarge: GoogleFonts.notoSans(fontSize: 16, fontWeight: FontWeight.w500, letterSpacing: 1.25, color: AppColor.textLightGreyColor),
  labelSmall: GoogleFonts.notoSans(fontSize: 10, fontWeight: FontWeight.w500, letterSpacing: 1.5, color: AppColor.textLightGreyColor),
  labelMedium: GoogleFonts.notoSans(fontSize: 14, fontWeight: FontWeight.w500, letterSpacing: 1.5, color: AppColor.textColorDark),
);

class ThemeDataStyle {
  static ThemeData light = ThemeData(
    useMaterial3: true,
    textTheme: GoogleFonts.notoSansTextTheme(textThemeLight),
    brightness: Brightness.light,
    colorScheme: ColorScheme.light(
      background: AppColor.backgroundColor,
      primary: AppColor.backgroundColor,
    ),
    bottomSheetTheme: BottomSheetThemeData(
      backgroundColor: AppColor.backgroundColor,
    ),
    cardColor: AppColor.whiteColor,
    scaffoldBackgroundColor: AppColor.backgroundColor,
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      backgroundColor: AppColor.backgroundBottomBarColor,
    ),
    appBarTheme: const AppBarTheme(
      backgroundColor: AppColor.backgroundColor,
      elevation: 0,
    ),
  );

  static ThemeData dark = ThemeData(
    useMaterial3: true,
    textTheme: GoogleFonts.notoSansTextTheme(textThemeDark),
    brightness: Brightness.dark,
    colorScheme: ColorScheme.dark(
      background: AppColor.backgroundColorDark,
      primary: AppColor.backgroundColorDark,
    ),
    bottomSheetTheme: BottomSheetThemeData(
      backgroundColor: AppColor.backgroundColorDark,
    ),
    cardColor: AppColor.backgroundColorContainerDark,
    scaffoldBackgroundColor: AppColor.backgroundColorDark,
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      backgroundColor: AppColor.backgroundColorContainerDark,
    ),
    appBarTheme: const AppBarTheme(
      backgroundColor: AppColor.backgroundColorDark,
      elevation: 0,
    ),
  );
}
