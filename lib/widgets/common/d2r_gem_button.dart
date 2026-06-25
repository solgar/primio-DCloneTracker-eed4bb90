import 'dart:math' as math;
import 'package:flutter/material.dart';
import '../../theme/theme.dart';

/// A floating gem button styled after the classic Diablo 2 chat gem.
/// Tapping it cycles through gem colors (blue → red → green → yellow → purple).
class D2RGemButton extends StatefulWidget {
  final VoidCallback? onTap;

  const D2RGemButton({super.key, this.onTap});

  @override
  State<D2RGemButton> createState() => _D2RGemButtonState();
}

class _D2RGemButtonState extends State<D2RGemButton>
    with SingleTickerProviderStateMixin {
  late AnimationController _pulseController;
  late Animation<double> _pulseAnimation;

  int _gemColorIndex = 0;

  // Classic D2 gem colors: Sapphire, Ruby, Emerald, Topaz, Amethyst
  static const List<_GemPalette> _gemPalettes = [
    _GemPalette(
      core: Color(0xFF2563EB),
      highlight: Color(0xFF93C5FD),
      shadow: Color(0xFF1E3A8A),
      glow: Color(0xFF3B82F6),
      name: 'Sapphire',
    ),
    _GemPalette(
      core: Color(0xFFDC2626),
      highlight: Color(0xFFFCA5A5),
      shadow: Color(0xFF7F1D1D),
      glow: Color(0xFFEF4444),
      name: 'Ruby',
    ),
    _GemPalette(
      core: Color(0xFF16A34A),
      highlight: Color(0xFF86EFAC),
      shadow: Color(0xFF14532D),
      glow: Color(0xFF22C55E),
      name: 'Emerald',
    ),
    _GemPalette(
      core: Color(0xFFCA8A04),
      highlight: Color(0xFFFDE68A),
      shadow: Color(0xFF78350F),
      glow: Color(0xFFEAB308),
      name: 'Topaz',
    ),
    _GemPalette(
      core: Color(0xFF7C3AED),
      highlight: Color(0xFFC4B5FD),
      shadow: Color(0xFF3B0764),
      glow: Color(0xFFA855F7),
      name: 'Amethyst',
    ),
  ];

  @override
  void initState() {
    super.initState();
    _pulseController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1800),
    )..repeat(reverse: true);

    _pulseAnimation = Tween<double>(begin: 0.85, end: 1.15).animate(
      CurvedAnimation(parent: _pulseController, curve: Curves.easeInOut),
    );
  }

  @override
  void dispose() {
    _pulseController.dispose();
    super.dispose();
  }

  void _onTap() {
    setState(() {
      _gemColorIndex = (_gemColorIndex + 1) % _gemPalettes.length;
    });
    widget.onTap?.call();
  }

  @override
  Widget build(BuildContext context) {
    final palette = _gemPalettes[_gemColorIndex];

    return GestureDetector(
      onTap: _onTap,
      child: AnimatedBuilder(
        animation: _pulseAnimation,
        builder: (context, child) {
          return Container(
            width: AppTheme.iconXl + AppTheme.spacingMd,
            height: AppTheme.iconXl + AppTheme.spacingMd,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              boxShadow: [
                BoxShadow(
                  color: palette.glow.withValues(
                    alpha: 0.25 + 0.25 * (_pulseAnimation.value - 0.85) / 0.30,
                  ),
                  blurRadius: 16.0 * _pulseAnimation.value,
                  spreadRadius: 2.0 * _pulseAnimation.value,
                ),
              ],
            ),
            child: CustomPaint(
              painter: _GemPainter(
                palette: palette,
                glowIntensity: (_pulseAnimation.value - 0.85) / 0.30,
              ),
            ),
          );
        },
      ),
    );
  }
}

class _GemPainter extends CustomPainter {
  final _GemPalette palette;
  final double glowIntensity; // 0.0 → 1.0

  const _GemPainter({required this.palette, required this.glowIntensity});

  @override
  void paint(Canvas canvas, Size size) {
    final cx = size.width / 2;
    final cy = size.height / 2;
    final r = math.min(cx, cy) - 2;

    // ── Outer dark border ring ─────────────────────────────────────────────
    final borderPaint = Paint()
      ..color = palette.shadow.withValues(alpha: 0.9)
      ..style = PaintingStyle.fill;
    canvas.drawCircle(Offset(cx, cy), r, borderPaint);

    // ── Gem body gradient ──────────────────────────────────────────────────
    final bodyPaint = Paint()
      ..shader = RadialGradient(
        center: const Alignment(-0.3, -0.4),
        radius: 0.9,
        colors: [palette.highlight, palette.core, palette.shadow],
        stops: const [0.0, 0.45, 1.0],
      ).createShader(Rect.fromCircle(center: Offset(cx, cy), radius: r - 2));
    canvas.drawCircle(Offset(cx, cy), r - 2, bodyPaint);

    // ── Facet lines (classic D2 gem cut) ──────────────────────────────────
    final facetPaint = Paint()
      ..color = palette.highlight.withValues(alpha: 0.30)
      ..style = PaintingStyle.stroke
      ..strokeWidth = 1.0;

    // Vertical centre line
    canvas.drawLine(
      Offset(cx, cy - r + 4),
      Offset(cx, cy + r - 4),
      facetPaint,
    );
    // Horizontal centre line
    canvas.drawLine(
      Offset(cx - r + 4, cy),
      Offset(cx + r - 4, cy),
      facetPaint,
    );
    // Diagonal cuts
    final d = (r - 4) * 0.65;
    canvas.drawLine(Offset(cx - d, cy - d), Offset(cx + d, cy + d), facetPaint);
    canvas.drawLine(Offset(cx + d, cy - d), Offset(cx - d, cy + d), facetPaint);

    // ── Top-left specular highlight ────────────────────────────────────────
    final highlightPaint = Paint()
      ..shader = RadialGradient(
        center: const Alignment(-0.55, -0.55),
        radius: 0.55,
        colors: [
          palette.highlight.withValues(alpha: 0.80),
          palette.highlight.withValues(alpha: 0.0),
        ],
      ).createShader(Rect.fromCircle(center: Offset(cx, cy), radius: r - 2));
    canvas.drawCircle(Offset(cx, cy), r - 2, highlightPaint);

    // ── Pulsing inner glow ─────────────────────────────────────────────────
    if (glowIntensity > 0) {
      final glowPaint = Paint()
        ..shader = RadialGradient(
          center: Alignment.center,
          radius: 0.6,
          colors: [
            palette.glow.withValues(alpha: 0.45 * glowIntensity),
            palette.glow.withValues(alpha: 0.0),
          ],
        ).createShader(Rect.fromCircle(center: Offset(cx, cy), radius: r - 2));
      canvas.drawCircle(Offset(cx, cy), r - 2, glowPaint);
    }

    // ── Tiny bright specular dot (top-left) ───────────────────────────────
    final dotPaint = Paint()
      ..color = Colors.white.withValues(alpha: 0.75)
      ..style = PaintingStyle.fill;
    canvas.drawCircle(Offset(cx - r * 0.32, cy - r * 0.34), 3.5, dotPaint);
  }

  @override
  bool shouldRepaint(_GemPainter oldDelegate) =>
      oldDelegate.glowIntensity != glowIntensity ||
      oldDelegate.palette != palette;
}

class _GemPalette {
  final Color core;
  final Color highlight;
  final Color shadow;
  final Color glow;
  final String name;

  const _GemPalette({
    required this.core,
    required this.highlight,
    required this.shadow,
    required this.glow,
    required this.name,
  });
}
