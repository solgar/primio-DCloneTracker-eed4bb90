import 'dart:math' as math;
import 'package:flutter/material.dart';
import '../../theme/theme.dart';

class ProgressOrb extends StatefulWidget {
  final int progress;
  final double size;

  const ProgressOrb({super.key, required this.progress, this.size = 44});

  @override
  State<ProgressOrb> createState() => _ProgressOrbState();
}

class _ProgressOrbState extends State<ProgressOrb> with SingleTickerProviderStateMixin {
  late final AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 3),
    )..repeat();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final d2r = Theme.of(context).extension<D2RColorsExtension>()!;
    final text = Theme.of(context).textTheme;
    final fraction = widget.progress / 6.0;

    Color orbColor;
    if (widget.progress <= 2) {
      orbColor = d2r.poison;
    } else if (widget.progress <= 4) {
      orbColor = d2r.lightning;
    } else {
      orbColor = d2r.fire;
    }

    return AnimatedBuilder(
      animation: _controller,
      builder: (context, child) {
        final pulse = 0.8 + 0.2 * math.sin(_controller.value * math.pi * 2);
        return SizedBox(
          width: widget.size,
          height: widget.size,
          child: Stack(
            alignment: Alignment.center,
            children: [
              // Glow
              Container(
                width: widget.size * pulse,
                height: widget.size * pulse,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  boxShadow: [
                    BoxShadow(
                      color: orbColor.withOpacity(0.3 * fraction),
                      blurRadius: 16,
                      spreadRadius: 2,
                    ),
                  ],
                ),
              ),
              // Ring
              SizedBox(
                width: widget.size,
                height: widget.size,
                child: CircularProgressIndicator(
                  value: fraction,
                  strokeWidth: AppTheme.borderThick,
                  backgroundColor: d2r.panelBorder,
                  valueColor: AlwaysStoppedAnimation(orbColor),
                ),
              ),
              // Number
              Text(
                '${widget.progress}',
                style: text.titleMedium?.copyWith(
                  color: orbColor,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
