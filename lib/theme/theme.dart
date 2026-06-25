import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

@immutable
class D2RColorsExtension extends ThemeExtension<D2RColorsExtension> {
  final Color gold;
  final Color goldDark;
  final Color goldLight;
  final Color fire;
  final Color fireGlow;
  final Color blood;
  final Color poison;
  final Color cold;
  final Color lightning;
  final Color panelBg;
  final Color panelBorder;
  final Color terrorPurple;
  final Color demonRed;
  final Color subtleText;

  const D2RColorsExtension({
    required this.gold,
    required this.goldDark,
    required this.goldLight,
    required this.fire,
    required this.fireGlow,
    required this.blood,
    required this.poison,
    required this.cold,
    required this.lightning,
    required this.panelBg,
    required this.panelBorder,
    required this.terrorPurple,
    required this.demonRed,
    required this.subtleText,
  });

  @override
  D2RColorsExtension copyWith({
    Color? gold,
    Color? goldDark,
    Color? goldLight,
    Color? fire,
    Color? fireGlow,
    Color? blood,
    Color? poison,
    Color? cold,
    Color? lightning,
    Color? panelBg,
    Color? panelBorder,
    Color? terrorPurple,
    Color? demonRed,
    Color? subtleText,
  }) =>
      D2RColorsExtension(
        gold: gold ?? this.gold,
        goldDark: goldDark ?? this.goldDark,
        goldLight: goldLight ?? this.goldLight,
        fire: fire ?? this.fire,
        fireGlow: fireGlow ?? this.fireGlow,
        blood: blood ?? this.blood,
        poison: poison ?? this.poison,
        cold: cold ?? this.cold,
        lightning: lightning ?? this.lightning,
        panelBg: panelBg ?? this.panelBg,
        panelBorder: panelBorder ?? this.panelBorder,
        terrorPurple: terrorPurple ?? this.terrorPurple,
        demonRed: demonRed ?? this.demonRed,
        subtleText: subtleText ?? this.subtleText,
      );

  @override
  D2RColorsExtension lerp(covariant ThemeExtension<D2RColorsExtension>? other, double t) {
    if (other is! D2RColorsExtension) return this;
    return D2RColorsExtension(
      gold: Color.lerp(gold, other.gold, t)!,
      goldDark: Color.lerp(goldDark, other.goldDark, t)!,
      goldLight: Color.lerp(goldLight, other.goldLight, t)!,
      fire: Color.lerp(fire, other.fire, t)!,
      fireGlow: Color.lerp(fireGlow, other.fireGlow, t)!,
      blood: Color.lerp(blood, other.blood, t)!,
      poison: Color.lerp(poison, other.poison, t)!,
      cold: Color.lerp(cold, other.cold, t)!,
      lightning: Color.lerp(lightning, other.lightning, t)!,
      panelBg: Color.lerp(panelBg, other.panelBg, t)!,
      panelBorder: Color.lerp(panelBorder, other.panelBorder, t)!,
      terrorPurple: Color.lerp(terrorPurple, other.terrorPurple, t)!,
      demonRed: Color.lerp(demonRed, other.demonRed, t)!,
      subtleText: Color.lerp(subtleText, other.subtleText, t)!,
    );
  }
}

class AppTheme {
  AppTheme._();

  // Spacing
  static const double spacingXs = 4.0;
  static const double spacingSm = 8.0;
  static const double spacingMd = 16.0;
  static const double spacingLg = 24.0;
  static const double spacingXl = 32.0;

  // Radii
  static const double radiusSmall = 4.0;
  static const double radiusMedium = 8.0;
  static const double radiusLarge = 12.0;

  // Borders
  static const double borderDefault = 1.0;
  static const double borderSelected = 2.0;
  static const double borderThick = 3.0;

  // Icon sizes
  static const double iconSm = 16.0;
  static const double iconMd = 24.0;
  static const double iconLg = 32.0;
  static const double iconXl = 48.0;

  // Opacities
  static const double opacityDisabled = 0.38;
  static const double opacityHint = 0.6;
  static const double opacityOverlay = 0.7;

  static const _d2rColors = D2RColorsExtension(
    gold: Color(0xFFC7B377),
    goldDark: Color(0xFF8B7D4A),
    goldLight: Color(0xFFE8D9A0),
    fire: Color(0xFFE85D26),
    fireGlow: Color(0xFFFF8C42),
    blood: Color(0xFFAA2222),
    poison: Color(0xFF00CC00),
    cold: Color(0xFF6688FF),
    lightning: Color(0xFFFFDD00),
    panelBg: Color(0xFF1A1410),
    panelBorder: Color(0xFF4A3C28),
    terrorPurple: Color(0xFFA855F7),
    demonRed: Color(0xFFDC2626),
    subtleText: Color(0xFF8A7D6B),
  );

  static final ThemeData darkTheme = _buildTheme();

  static ThemeData _buildTheme() {
    const bg = Color(0xFF0D0B08);
    const surface = Color(0xFF1A1410);
    const onSurface = Color(0xFFE8D9A0);
    const primary = Color(0xFFC7B377);
    const error = Color(0xFFDC2626);

    final colorScheme = ColorScheme.dark(
      surface: surface,
      primary: primary,
      onPrimary: bg,
      secondary: const Color(0xFFE85D26),
      onSecondary: onSurface,
      error: error,
      onError: onSurface,
      onSurface: onSurface,
      outline: const Color(0xFF4A3C28),
      outlineVariant: const Color(0xFF2A2218),
    );

    final textTheme = _buildTextTheme(colorScheme);

    return ThemeData(
      useMaterial3: true,
      brightness: Brightness.dark,
      colorScheme: colorScheme,
      scaffoldBackgroundColor: bg,
      textTheme: textTheme,
      appBarTheme: AppBarTheme(
        backgroundColor: bg,
        foregroundColor: onSurface,
        elevation: 0,
        centerTitle: true,
        titleTextStyle: textTheme.titleLarge,
      ),
      cardTheme: CardThemeData(
        color: surface,
        elevation: 0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(radiusSmall),
          side: const BorderSide(color: Color(0xFF4A3C28), width: 1.5),
        ),
      ),
      dividerTheme: const DividerThemeData(
        color: Color(0xFF4A3C28),
        thickness: 1,
      ),
      chipTheme: ChipThemeData(
        backgroundColor: surface,
        side: const BorderSide(color: Color(0xFF4A3C28)),
        labelStyle: textTheme.labelMedium,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(radiusSmall),
        ),
      ),
      navigationBarTheme: NavigationBarThemeData(
        backgroundColor: bg,
        indicatorColor: primary.withOpacity(0.15),
        labelTextStyle: WidgetStateProperty.resolveWith((states) {
          if (states.contains(WidgetState.selected)) {
            return textTheme.labelSmall?.copyWith(color: primary);
          }
          return textTheme.labelSmall?.copyWith(color: const Color(0xFF8A7D6B));
        }),
        iconTheme: WidgetStateProperty.resolveWith((states) {
          if (states.contains(WidgetState.selected)) {
            return const IconThemeData(color: primary, size: 24);
          }
          return const IconThemeData(color: Color(0xFF8A7D6B), size: 24);
        }),
      ),
      extensions: const [_d2rColors],
    );
  }

  static TextTheme _buildTextTheme(ColorScheme colorScheme) {
    final base = GoogleFonts.cinzelTextTheme();
    final bodyBase = GoogleFonts.crimsonTextTextTheme();
    return TextTheme(
      headlineLarge: base.headlineLarge?.copyWith(
        fontWeight: FontWeight.bold,
        color: colorScheme.onSurface,
        letterSpacing: 1.5,
      ),
      headlineMedium: base.headlineMedium?.copyWith(
        fontWeight: FontWeight.w700,
        color: colorScheme.onSurface,
        letterSpacing: 1.2,
      ),
      headlineSmall: base.headlineSmall?.copyWith(
        fontWeight: FontWeight.w600,
        color: colorScheme.onSurface,
        letterSpacing: 1.0,
      ),
      titleLarge: base.titleLarge?.copyWith(
        fontWeight: FontWeight.w700,
        color: colorScheme.onSurface,
        letterSpacing: 0.8,
      ),
      titleMedium: base.titleMedium?.copyWith(
        fontWeight: FontWeight.w600,
        color: colorScheme.onSurface,
      ),
      titleSmall: base.titleSmall?.copyWith(
        fontWeight: FontWeight.w500,
        color: colorScheme.onSurface,
      ),
      bodyLarge: bodyBase.bodyLarge?.copyWith(
        color: colorScheme.onSurface,
      ),
      bodyMedium: bodyBase.bodyMedium?.copyWith(
        color: colorScheme.onSurface,
      ),
      bodySmall: bodyBase.bodySmall?.copyWith(
        color: const Color(0xFF8A7D6B),
      ),
      labelLarge: bodyBase.labelLarge?.copyWith(
        fontWeight: FontWeight.w600,
        color: colorScheme.onSurface,
        letterSpacing: 0.5,
      ),
      labelMedium: bodyBase.labelMedium?.copyWith(
        color: const Color(0xFF8A7D6B),
      ),
      labelSmall: bodyBase.labelSmall?.copyWith(
        color: const Color(0xFF8A7D6B),
      ),
    );
  }
}
