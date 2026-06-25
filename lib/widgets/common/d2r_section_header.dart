import 'package:flutter/material.dart';
import '../../theme/theme.dart';

class D2RSectionHeader extends StatelessWidget {
  final String title;
  final IconData? icon;
  final Widget? trailing;

  const D2RSectionHeader({
    super.key,
    required this.title,
    this.icon,
    this.trailing,
  });

  @override
  Widget build(BuildContext context) {
    final d2r = Theme.of(context).extension<D2RColorsExtension>()!;
    final text = Theme.of(context).textTheme;
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: AppTheme.spacingSm),
      child: Row(
        children: [
          Expanded(
            child: Container(height: AppTheme.borderDefault, color: d2r.goldDark.withOpacity(0.4)),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: AppTheme.spacingMd),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                if (icon != null) ...[
                  Icon(icon, color: d2r.gold, size: 18),
                  const SizedBox(width: AppTheme.spacingSm),
                ],
                Text(
                  title.toUpperCase(),
                  style: text.titleSmall?.copyWith(
                    color: d2r.gold,
                    letterSpacing: 2.0,
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: Container(height: AppTheme.borderDefault, color: d2r.goldDark.withOpacity(0.4)),
          ),
          if (trailing != null) ...[
            const SizedBox(width: AppTheme.spacingSm),
            trailing!,
          ],
        ],
      ),
    );
  }
}
