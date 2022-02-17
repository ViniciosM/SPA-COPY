import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

const primaryColor = Color(0xFF029F8C);
const secondColor = Color(0xFF186A9A);

class AppTheme {
  //App Bar Text
  static final TextTheme lightAppBarTextTheme = TextTheme(
    headline1: GoogleFonts.montserrat(
        textStyle: const TextStyle(fontSize: 102, color: Color(0xff495057))),
    headline2: GoogleFonts.montserrat(
        textStyle: const TextStyle(fontSize: 64, color: Color(0xff495057))),
    headline3: GoogleFonts.montserrat(
        textStyle: const TextStyle(fontSize: 51, color: Color(0xff495057))),
    headline4: GoogleFonts.montserrat(
        textStyle: const TextStyle(fontSize: 36, color: Color(0xff495057))),
    headline5: GoogleFonts.montserrat(
        textStyle: const TextStyle(fontSize: 25, color: Color(0xff495057))),
    headline6: GoogleFonts.montserrat(
        textStyle: const TextStyle(fontSize: 18, color: Color(0xff495057))),
    subtitle1: GoogleFonts.montserrat(
        textStyle: const TextStyle(fontSize: 17, color: Color(0xff495057))),
    subtitle2: GoogleFonts.montserrat(
        textStyle: const TextStyle(fontSize: 15, color: Color(0xff495057))),
    bodyText1: GoogleFonts.montserrat(
        textStyle: const TextStyle(fontSize: 16, color: Color(0xff495057))),
    bodyText2: GoogleFonts.montserrat(
        textStyle: const TextStyle(fontSize: 14, color: Color(0xff495057))),
    button: GoogleFonts.montserrat(
        textStyle: const TextStyle(fontSize: 15, color: Colors.white)),
    caption: GoogleFonts.montserrat(
        textStyle: const TextStyle(fontSize: 13, color: Color(0xff495057))),
    overline: GoogleFonts.montserrat(
        textStyle: TextStyle(fontSize: 9, color: const Color(0xff495057).withOpacity(0.5))),
  );
  static final TextTheme darkAppBarTextTheme = TextTheme(
    headline1: GoogleFonts.montserrat(
        textStyle: const TextStyle(fontSize: 102, color: Color(0xffffffff))),
    headline2: GoogleFonts.montserrat(
        textStyle: const TextStyle(fontSize: 64, color: Color(0xffffffff))),
    headline3: GoogleFonts.montserrat(
        textStyle: const TextStyle(fontSize: 51, color: Color(0xffffffff))),
    headline4: GoogleFonts.montserrat(
        textStyle: const TextStyle(fontSize: 36, color: Color(0xffffffff))),
    headline5: GoogleFonts.montserrat(
        textStyle: const TextStyle(fontSize: 25, color: Color(0xffffffff))),
    headline6: GoogleFonts.montserrat(
        textStyle: const TextStyle(fontSize: 20, color: Color(0xffffffff))),
    subtitle1: GoogleFonts.montserrat(
        textStyle: const TextStyle(fontSize: 17, color: Color(0xffffffff))),
    subtitle2: GoogleFonts.montserrat(
        textStyle: const TextStyle(fontSize: 15, color: Color(0xffffffff))),
    bodyText1: GoogleFonts.montserrat(
        textStyle: const TextStyle(fontSize: 16, color: Color(0xffffffff))),
    bodyText2: GoogleFonts.montserrat(
        textStyle: const TextStyle(fontSize: 14, color: Color(0xffffffff))),
    button: GoogleFonts.montserrat(
        textStyle: const TextStyle(fontSize: 15, color: Color(0xffffffff))),
    caption: GoogleFonts.montserrat(
        textStyle: const TextStyle(fontSize: 13, color: Color(0xffffffff))),
    overline: GoogleFonts.montserrat(
        textStyle: TextStyle(fontSize: 9, color: Color(0xffffffff).withOpacity(0.5))),
  );

  //Text Themes
  static final TextTheme lightTextTheme = TextTheme(
    headline1: GoogleFonts.montserrat(
        textStyle: const TextStyle(fontSize: 102, color: Color(0xff4a4c4f))),
    headline2: GoogleFonts.montserrat(
        textStyle: const TextStyle(fontSize: 64, color: Color(0xff4a4c4f))),
    headline3: GoogleFonts.montserrat(
        textStyle: const TextStyle(fontSize: 51, color: Color(0xff4a4c4f))),
    headline4: GoogleFonts.montserrat(
        textStyle: const TextStyle(fontSize: 36, color: Color(0xff4a4c4f))),
    headline5: GoogleFonts.montserrat(
        textStyle: const TextStyle(fontSize: 25, color: Color(0xff4a4c4f))),
    headline6: GoogleFonts.montserrat(
        textStyle: const TextStyle(fontSize: 18, color: Color(0xff4a4c4f))),
    subtitle1: GoogleFonts.montserrat(
        textStyle: const TextStyle(fontSize: 17, color: Color(0xff4a4c4f))),
    subtitle2: GoogleFonts.montserrat(
        textStyle: const TextStyle(fontSize: 15, color: Color(0xff4a4c4f))),
    bodyText1: GoogleFonts.montserrat(
        textStyle: const TextStyle(fontSize: 16, color: Color(0xff4a4c4f))),
    bodyText2: GoogleFonts.montserrat(
        textStyle: const TextStyle(fontSize: 14, color: Color(0xff4a4c4f))),
    button: GoogleFonts.montserrat(
        textStyle: const TextStyle(fontSize: 15, color: Color(0xff4a4c4f))),
    caption: GoogleFonts.montserrat(
        textStyle: const TextStyle(fontSize: 13, color: Color(0xff4a4c4f))),
    overline: GoogleFonts.montserrat(
        textStyle: TextStyle(fontSize: 9, color: const Color(0xff4a4c4f).withOpacity(0.2))),
  );

  static final TextTheme darkTextTheme = TextTheme(
    headline1: GoogleFonts.montserrat(
        textStyle: const TextStyle(fontSize: 102, color: Colors.white)),
    headline2: GoogleFonts.montserrat(
        textStyle: const TextStyle(fontSize: 64, color: Colors.white)),
    headline3: GoogleFonts.montserrat(
        textStyle: const TextStyle(fontSize: 51, color: Colors.white)),
    headline4: GoogleFonts.montserrat(
        textStyle: const TextStyle(fontSize: 36, color: Colors.white)),
    headline5: GoogleFonts.montserrat(
        textStyle: const TextStyle(fontSize: 25, color: Colors.white)),
    headline6: GoogleFonts.montserrat(
        textStyle: const TextStyle(fontSize: 18, color: Colors.white)),
    subtitle1: GoogleFonts.montserrat(
        textStyle: const TextStyle(fontSize: 17, color: Colors.white)),
    subtitle2: GoogleFonts.montserrat(
        textStyle: const TextStyle(fontSize: 15, color: Colors.white)),
    bodyText1: GoogleFonts.montserrat(
        textStyle: const TextStyle(fontSize: 16, color: Colors.white)),
    bodyText2: GoogleFonts.montserrat(
        textStyle: const TextStyle(fontSize: 14, color: Colors.white)),
    button: GoogleFonts.montserrat(
        textStyle: const TextStyle(fontSize: 15, color: Colors.white)),
    caption: GoogleFonts.montserrat(
        textStyle: const TextStyle(fontSize: 13, color: Colors.white)),
    overline: GoogleFonts.montserrat(
        textStyle: const TextStyle(fontSize: 9, color: Colors.white)),
  );

  //Color Themes
  static final ThemeData lightTheme = ThemeData(
    brightness: Brightness.light,
    primaryColor: const Color(0xff186A9A),
    canvasColor: const Color(0xfff2f2f2),
    backgroundColor: const Color(0xfff1f1f1),
    scaffoldBackgroundColor: const Color(0xfff1f1f1),
    appBarTheme: AppBarTheme(
      textTheme: lightAppBarTextTheme,
      actionsIconTheme: const IconThemeData(
        color: Color(0xff495057),
      ),
      color: const Color(0xffffffff),
      iconTheme: const IconThemeData(color: Color(0xff495057), size: 24),
    ),
    textButtonTheme: TextButtonThemeData(
      style: TextButton.styleFrom(
        padding: EdgeInsets.zero,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        backgroundColor: Color(0xFFFFFFFF).withOpacity(0.1),
      ),
    ),
    navigationRailTheme: const NavigationRailThemeData(
        selectedIconTheme:
            IconThemeData(color: Color(0xff029F8C), opacity: 1, size: 24),
        unselectedIconTheme:
            IconThemeData(color: Color(0xff495057), opacity: 1, size: 24),
        backgroundColor: Color(0xffffffff),
        elevation: 3,
        selectedLabelTextStyle: TextStyle(color: Color(0xff029F8C)),
        unselectedLabelTextStyle: TextStyle(color: Color(0xff495057))),
    colorScheme: const ColorScheme.light(
        primary: Color(0xff029F8C),
        onPrimary: Colors.white,
        primaryVariant: Color(0xff0055ff),
        secondary: Color(0xff495057),
        error: Color(0xFFA60321),
        secondaryVariant: Color(0xff3cd278),
        onSecondary: Colors.white,
        surface: Color(0xffe2e7f1),
        background: Color(0xfff3f4f7),
        onBackground: Color(0xffffffff)),
    cardTheme: CardTheme(
      color: Colors.white,
      shadowColor: Colors.black.withOpacity(0.4),
      elevation: 1,
      margin: const EdgeInsets.all(0),
    ),
    inputDecorationTheme: const InputDecorationTheme(
      focusedBorder: UnderlineInputBorder(
          borderSide: BorderSide(color: Color(0xFF029F8C))),
      disabledBorder: UnderlineInputBorder(
        borderSide: BorderSide(
          color: Color(0xFFEFEFEF),
        ),
      ),
      labelStyle: TextStyle(
        color: Color(0xFF242424),
      ),
      enabledBorder: UnderlineInputBorder(
        borderSide: BorderSide(color: Color(0xFF242424)),
      ),
    ),
    splashColor: Colors.white.withAlpha(100),
    iconTheme: const IconThemeData(
      color: Color(0xFF029F8C),
    ),
    textTheme: lightTextTheme,
    indicatorColor: Colors.white,
    disabledColor: const Color(0xffdcc7ff),
    highlightColor: Colors.white,
    floatingActionButtonTheme: FloatingActionButtonThemeData(
        backgroundColor: const Color(0xff029F8C),
        splashColor: Colors.white.withAlpha(100),
        highlightElevation: 8,
        elevation: 4,
        focusColor: const Color(0xff029F8C),
        hoverColor: const Color(0xff029F8C),
        foregroundColor: Colors.white),
    dividerColor: const Color(0xffd1d1d1),
    errorColor: const Color(0xfff0323c),
    cardColor: Colors.white,
    accentColor: const Color(0xff029F8C),
    popupMenuTheme: PopupMenuThemeData(
      color: const Color(0xffffffff),
      textStyle: lightTextTheme.bodyText2!
          .merge(const TextStyle(color: Color(0xff495057))),
    ),
    bottomAppBarTheme:
        const BottomAppBarTheme(color: Color(0xffffffff), elevation: 2),
        bottomSheetTheme: const BottomSheetThemeData(
          backgroundColor: Colors.transparent
        ),
    tabBarTheme: const TabBarTheme(
      unselectedLabelColor: Color(0xff495057),
      labelColor: Color(0xff029F8C),
      indicatorSize: TabBarIndicatorSize.label,
      indicator: UnderlineTabIndicator(
        borderSide: BorderSide(color: Color(0xff029F8C), width: 2.0),
      ),
    ),
    sliderTheme: SliderThemeData(
      activeTrackColor: const Color(0xff029F8C),
      inactiveTrackColor: const Color(0xff029F8C).withAlpha(140),
      trackShape: const RoundedRectSliderTrackShape(),
      trackHeight: 4.0,
      thumbColor: const Color(0xff029F8C),
      thumbShape: const RoundSliderThumbShape(enabledThumbRadius: 10.0),
      overlayShape: const RoundSliderOverlayShape(overlayRadius: 24.0),
      tickMarkShape: const RoundSliderTickMarkShape(),
      inactiveTickMarkColor: Colors.red[100],
      valueIndicatorShape: const PaddleSliderValueIndicatorShape(),
      valueIndicatorTextStyle: const TextStyle(
        color: Colors.white,
      ),
    ),
  );
  static ThemeData darkTheme = ThemeData(
      brightness: Brightness.dark,
      canvasColor: const Color(0xff029F8C),
      primaryColor: const Color(0xff029F8C),
      scaffoldBackgroundColor: Color(0xff464c52),
      backgroundColor: const Color(0xff464c52),
      appBarTheme: AppBarTheme(
        textTheme: darkAppBarTextTheme,
        actionsIconTheme: IconThemeData(
          color: Color(0xffffffff),
        ),
        color: const Color(0xff2e343b),
        iconTheme: const IconThemeData(color: Color(0xffffffff), size: 24),
      ),
      colorScheme: const ColorScheme.dark(
        primary: Color(0xff029F8C),
        primaryVariant: Color(0xff029F8C),
        secondary: Color(0xff00cc77),
        secondaryVariant: Color(0xff00cc77),
        background: Color(0xff343a40),
        onPrimary: Colors.white,
        onBackground: Colors.white,
        onSecondary: Colors.white,
        surface: Color(0xff585e63),
      ),
      cardTheme: const CardTheme(
        color: Color(0xff37404a),
        shadowColor: Color(0xff000000),
        elevation: 1,
        margin: EdgeInsets.all(0),
      ),
      iconTheme: const IconThemeData(
        color: Colors.white,
      ),
      textTheme: darkTextTheme,
      indicatorColor: Colors.white,
      disabledColor: const Color(0xffa3a3a3),
      highlightColor: Colors.white,
      inputDecorationTheme: const InputDecorationTheme(
        focusedBorder: UnderlineInputBorder(
            borderSide: BorderSide(color: Color(0xFF029F8C))),
        disabledBorder: UnderlineInputBorder(
          borderSide: BorderSide(
            color: Color(0xFF242424),
          ),
        ),
        labelStyle: TextStyle(
          color: Color(0xFF029F8C),
        ),
        enabledBorder: UnderlineInputBorder(
          borderSide: BorderSide(color: Color(0xFF029F8C)),
        ),
      ),
      dividerColor: const Color(0xffd1d1d1),
      errorColor: Colors.orange,
      cardColor: const Color(0xff282a2b),
      splashColor: Colors.white.withAlpha(100),
      floatingActionButtonTheme: FloatingActionButtonThemeData(
          backgroundColor: const Color(0xff029F8C),
          splashColor: Colors.white.withAlpha(100),
          highlightElevation: 8,
          elevation: 4,
          focusColor: const Color(0xff029F8C),
          hoverColor: const Color(0xff029F8C),
          foregroundColor: Colors.white),
      accentColor: const Color(0xff029F8C),
      popupMenuTheme: PopupMenuThemeData(
        color: const Color(0xff37404a),
        textStyle: lightTextTheme.bodyText2!
            .merge(TextStyle(color: Color(0xffffffff))),
      ),
      bottomAppBarTheme:
          const BottomAppBarTheme(color: Color(0xff464c52), elevation: 2),
          bottomSheetTheme: const BottomSheetThemeData(
          backgroundColor: Colors.transparent
        ),
      tabBarTheme: const TabBarTheme(
        unselectedLabelColor: Color(0xff495057),
        labelColor: Color(0xff029F8C),
        indicatorSize: TabBarIndicatorSize.label,
        indicator: UnderlineTabIndicator(
          borderSide: BorderSide(color: Color(0xff029F8C), width: 2.0),
        ),
      ),
      sliderTheme: SliderThemeData(
        activeTrackColor: const Color(0xff029F8C),
        inactiveTrackColor: const Color(0xff029F8C).withAlpha(100),
        trackShape: const RoundedRectSliderTrackShape(),
        trackHeight: 4.0,
        thumbColor: const Color(0xff029F8C),
        thumbShape: const RoundSliderThumbShape(enabledThumbRadius: 10.0),
        overlayShape: const RoundSliderOverlayShape(overlayRadius: 24.0),
        tickMarkShape: const RoundSliderTickMarkShape(),
        inactiveTickMarkColor: Colors.red[100],
        valueIndicatorShape: const PaddleSliderValueIndicatorShape(),
        valueIndicatorTextStyle: const TextStyle(
          color: Colors.white,
        ),
      ),
      cupertinoOverrideTheme: const CupertinoThemeData());
}
