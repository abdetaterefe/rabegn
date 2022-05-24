import 'package:flex_color_scheme/flex_color_scheme.dart';

class Themes {
//LightTheme
  final lightTheme = FlexThemeData.light(
    fontFamily: 'Outfit',
    scheme: FlexScheme.gold,
    surfaceMode: FlexSurfaceMode.highScaffoldLowSurface,
    blendLevel: 20,
    appBarOpacity: 0.95,
    subThemesData: const FlexSubThemesData(
      blendOnLevel: 20,
      blendOnColors: false,
      cardRadius: 15.0,
    ),
    visualDensity: FlexColorScheme.comfortablePlatformDensity,
    useMaterial3: true,
  );

//DarkTheme
  final darkTheme = FlexThemeData.dark(
    fontFamily: 'Outfit',
    scheme: FlexScheme.gold,
    surfaceMode: FlexSurfaceMode.highScaffoldLowSurface,
    blendLevel: 15,
    appBarStyle: FlexAppBarStyle.background,
    appBarOpacity: 0.90,
    subThemesData: const FlexSubThemesData(
      blendOnLevel: 30,
      cardRadius: 15.0,
    ),
    visualDensity: FlexColorScheme.comfortablePlatformDensity,
    useMaterial3: true,
  );
}
