import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'app_theme_extension.dart';
import 'palette.dart';

final _defaultInputBorderRadius = BorderRadius.circular(16);

final _defaultButtonShape = RoundedRectangleBorder(borderRadius: BorderRadius.circular(16));
const _defaultButtonPadding = EdgeInsets.symmetric(vertical: 12, horizontal: 16);

abstract final class AppTheme {
  static final darkTheme = ThemeData.dark(useMaterial3: true).copyWith(
    scaffoldBackgroundColor: Palette.bg,
    canvasColor: Palette.secondary,
    colorScheme: ColorScheme.fromSeed(
      brightness: Brightness.dark,
      seedColor: Palette.primary,
      primaryContainer: Palette.primaryContainer,
      secondaryContainer: Palette.secondaryContainer,
    ),
    textTheme: GoogleFonts.poppinsTextTheme().apply(
      bodyColor: Palette.elPrimary,
      displayColor: Palette.elPrimary,
    ),
    dialogTheme: DialogTheme(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(24),
      ),
    ),
    inputDecorationTheme: InputDecorationTheme(
      filled: true,
      fillColor: Palette.primaryContainer,
      border: OutlineInputBorder(
        borderRadius: _defaultInputBorderRadius,
        borderSide: BorderSide.none,
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: _defaultInputBorderRadius,
        borderSide: BorderSide.none,
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: _defaultInputBorderRadius,
        borderSide: const BorderSide(color: Palette.secondaryContainer),
      ),
      isDense: true,
      constraints: const BoxConstraints(minHeight: 1),
      contentPadding: const EdgeInsets.symmetric(horizontal: 18, vertical: 10),
      hintStyle: const TextStyle(fontSize: 14, color: Palette.elSecondary),
      labelStyle: const TextStyle(fontSize: 14, color: Palette.elSecondary),
      alignLabelWithHint: true,
      errorMaxLines: 2,
    ),
    textButtonTheme: TextButtonThemeData(
      style: TextButton.styleFrom(
        backgroundColor: Palette.primary,
        shape: _defaultButtonShape,
        foregroundColor: Colors.white,
        padding: _defaultButtonPadding,
        splashFactory: NoSplash.splashFactory,
        visualDensity: VisualDensity.compact,
      ),
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        elevation: 0,
      ),
    ),
    dropdownMenuTheme: DropdownMenuThemeData(
      menuStyle: MenuStyle(
        shape: MaterialStateProperty.all(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
        ),
        elevation: MaterialStateProperty.all(0),
      ),
    ),
    extensions: [
      AppThemeExtension(
        elSecondary: Palette.elSecondary,
        elPrimary: Palette.elPrimary,
      ),
    ],
  );
}
