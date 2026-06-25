import 'package:flutter/material.dart';
import '../../theme/theme.dart';

class D2RPanel extends StatelessWidget {
  final Widget child;
  final EdgeInsets? padding;
  final bool showCornerDecor;

  const D2RPanel({
    super.key,
    required this.child,
    this.padding,
    this.showCornerDecor = true,
  });

  @override
  Widget build(BuildContext context) {
    final d2r = Theme.of(context).extension<D2RColorsExtension>()!;
    return Container(
      padding: padding ?? const EdgeInsets.all(AppTheme.spacingMd),
      decoration: BoxDecoration(
        color: d2r.panelBg,
        borderRadius: BorderRadius.circular(AppTheme.radiusSmall),
        border: Border.all(color: d2r.panelBorder, width: AppTheme.borderSelected),
        boxShadow: [
          BoxShadow(
            color: d2r.gold.withOpacity(0.05),
            blurRadius: 12,
            spreadRadius: -2,
          ),
        ],
      ),
      child: child,
    );
  }
}
