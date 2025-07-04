import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:wled/core/core.dart'; // Assuming Kpadding is defined here or in another import

abstract class AppTheme {
  static const _backgroundColor = Color(0xFF1D1D1D);
  static const _cardColor = Color(0xFF303636);
  static const _titleColor = Colors.white;
  static const _subTitleColor = Color(0xFF5E6766);

  static const _iconTheme = IconThemeData(
    color: _titleColor,
    opacity: 1,
    size: 32,
  );

  static const _iconDisabledTheme = IconThemeData(
    color: _titleColor,
    opacity: 1,
    size: 24,
  );

  static const _headerStyle = TextStyle(
    color: _titleColor,
    fontSize: 22,
    fontWeight: FontWeight.w700,
  );

  static const _titleStyle = TextStyle(
    color: _titleColor,
    fontSize: 15,
    fontWeight: FontWeight.w700,
    shadows: [
      Shadow(
        offset: Offset(0, 1),
        color: Color.fromRGBO(0, 0, 0, 0.1),
      ),
    ],
    overflow: TextOverflow.fade,
  );

  static const _titleSmallStyle = TextStyle(
    color: _titleColor,
    fontSize: 18,
    fontWeight: FontWeight.w400,
  );

  static const _subTitleStyle = TextStyle(
    color: _titleColor,
    fontSize: 13,
    fontWeight: FontWeight.w600,
    shadows: [
      Shadow(
        offset: Offset(0, 1),
        color: Color.fromRGBO(0, 0, 0, 0.1),
      ),
    ],
    overflow: TextOverflow.fade,
  );

  static const _bodyStyle = TextStyle(
    color: _subTitleColor,
    fontSize: 16,
    fontWeight: FontWeight.w400,
  );

  static const _bodyStyleWhite = TextStyle(
    color: _titleColor,
    fontSize: 16,
    fontWeight: FontWeight.w400,
  );

  static const _hintStyle = TextStyle(
    color: _subTitleColor,
    fontSize: 16,
    height: 1.8,
    fontWeight: FontWeight.w400,
  );

  static const _buttonStyle = TextStyle(
    color: _titleColor,
    fontSize: 14,
    fontWeight: FontWeight.w400,
  );

  // --- Start of the single, correct ThemeData definition ---
  static final theme = ThemeData(
    fontFamily: 'Nunito',
    scaffoldBackgroundColor: _backgroundColor,
    appBarTheme: const AppBarTheme(
      actionsIconTheme: _iconTheme,
      backgroundColor: _backgroundColor,
      systemOverlayStyle: SystemUiOverlayStyle(
        statusBarBrightness: Brightness.dark,
        statusBarColor: _backgroundColor,
        statusBarIconBrightness: Brightness.light,
        systemNavigationBarColor: _backgroundColor,
        systemNavigationBarDividerColor: _backgroundColor,
        systemNavigationBarIconBrightness: Brightness.light,
        systemNavigationBarContrastEnforced: true,
        systemStatusBarContrastEnforced: true,
      ),
      centerTitle: false,
      elevation: 0,
      iconTheme: _iconTheme,
    ),
    brightness: Brightness.dark,
    bottomAppBarTheme: const BottomAppBarTheme(
      color: _backgroundColor,
      elevation: 0,
    ),
    bottomNavigationBarTheme: const BottomNavigationBarThemeData(
      backgroundColor: _backgroundColor,
      elevation: 0,
      selectedIconTheme: _iconTheme,
      unselectedIconTheme: _iconDisabledTheme,
      type: BottomNavigationBarType.fixed,
    ),
    cardColor: _cardColor,
    cardTheme: const CardTheme(
      color: _cardColor,
      shadowColor: Colors.black,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(20)),
      ),
      elevation: 0,
    ),
    disabledColor: _subTitleColor,
    dividerColor: _subTitleColor,
    textTheme: const TextTheme(
      titleMedium: _subTitleStyle,
      titleSmall: _subTitleStyle,
      displayLarge: _headerStyle,
      displayMedium: _headerStyle,
      displaySmall: _headerStyle,
      headlineMedium: _titleStyle,
      headlineSmall: _titleStyle,
      titleLarge: _titleSmallStyle,
      bodyLarge: _bodyStyle,
      bodyMedium: _bodyStyleWhite,
      labelLarge: _buttonStyle,
    ),
    floatingActionButtonTheme: const FloatingActionButtonThemeData(
      backgroundColor: _titleColor,
      elevation: 2,
    ),
    progressIndicatorTheme: const ProgressIndicatorThemeData(
      color: _titleColor,
    ),
    bottomSheetTheme: const BottomSheetThemeData(
      modalBackgroundColor: _backgroundColor,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(20)),
      ),
      elevation: 2,
    ),
    dialogTheme: const DialogTheme(
      backgroundColor: _backgroundColor,
      alignment: Alignment.center,
      elevation: 2,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(20)),
      ),
    ),
    inputDecorationTheme: const InputDecorationTheme(
      // Assuming Kpadding.small is defined correctly elsewhere
      contentPadding: EdgeInsets.all(Kpadding.small),
      alignLabelWithHint: true,
      errorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.all(Radius.circular(20)),
        borderSide: BorderSide(color: _backgroundColor),
      ),
      focusedBorder: UnderlineInputBorder(
        borderRadius: BorderRadius.all(Radius.circular(20)),
        borderSide: BorderSide(color: _backgroundColor),
      ),
      border: UnderlineInputBorder(
        borderRadius: BorderRadius.all(Radius.circular(20)),
        borderSide: BorderSide(color: _backgroundColor),
      ),
      enabledBorder: UnderlineInputBorder(
        borderRadius: BorderRadius.all(Radius.circular(20)),
        borderSide: BorderSide(color: _backgroundColor),
      ),
      fillColor: _cardColor,
      filled: true,
      hintStyle: _hintStyle,
      focusColor: _cardColor,
    ),
    colorScheme: const ColorScheme.dark(
      primary: _titleColor,
      secondary: Colors.grey, // Consider defining a specific secondary color
      background: _backgroundColor,
    ).copyWith(
        background:
            _backgroundColor), // .copyWith(background:...) is redundant here
  );
  // --- End of the single, correct ThemeData definition ---
}

// Placeholder for Kpadding if it's not imported from core.dart
// Remove this if Kpadding is correctly defined/imported


