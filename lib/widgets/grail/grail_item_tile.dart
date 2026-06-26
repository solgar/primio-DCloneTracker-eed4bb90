import 'package:flutter/material.dart';
import '../../models/grail_item.dart';
import '../../theme/theme.dart';

class GrailItemTile extends StatelessWidget {
  final GrailItem item;
  final bool found;
  final VoidCallback onTap;

  const GrailItemTile({
    super.key,
    required this.item,
    required this.found,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final d2r = Theme.of(context).extension<D2RColorsExtension>()!;
    final text = Theme.of(context).textTheme;

    final Color nameColor = found
        ? (item.isSet ? d2r.poison : d2r.goldLight)
        : d2r.subtleText;
    final Color borderColor = found
        ? (item.isSet ? d2r.poison : d2r.gold)
        : d2r.panelBorder;
    final Color bgColor = found
        ? (item.isSet
            ? d2r.poison.withValues(alpha: 0.08)
            : d2r.gold.withValues(alpha: 0.08))
        : d2r.panelBg;

    return GestureDetector(
      onTap: onTap,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 180),
        margin: const EdgeInsets.symmetric(
          horizontal: AppTheme.spacingMd,
          vertical: AppTheme.spacingXs,
        ),
        padding: const EdgeInsets.symmetric(
          horizontal: AppTheme.spacingMd,
          vertical: AppTheme.spacingSm,
        ),
        decoration: BoxDecoration(
          color: bgColor,
          borderRadius: BorderRadius.circular(AppTheme.radiusMedium),
          border: Border.all(color: borderColor, width: AppTheme.borderDefault),
        ),
        child: Row(
          children: [
            // Found indicator icon
            AnimatedSwitcher(
              duration: const Duration(milliseconds: 200),
              child: Icon(
                found ? Icons.check_circle : Icons.radio_button_unchecked,
                key: ValueKey(found),
                color: found
                    ? (item.isSet ? d2r.poison : d2r.gold)
                    : d2r.subtleText,
                size: AppTheme.iconMd,
              ),
            ),
            const SizedBox(width: AppTheme.spacingSm),
            // Item info
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    item.name,
                    style: text.labelLarge?.copyWith(
                      color: nameColor,
                      decoration: found ? TextDecoration.none : null,
                    ),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                  Text(
                    item.baseType,
                    style: text.bodySmall?.copyWith(color: d2r.subtleText),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                ],
              ),
            ),
            // Set badge
            if (item.isSet)
              Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: AppTheme.spacingXs,
                  vertical: 2,
                ),
                decoration: BoxDecoration(
                  color: d2r.poison.withValues(alpha: 0.15),
                  borderRadius: BorderRadius.circular(AppTheme.radiusSmall),
                  border: Border.all(
                    color: d2r.poison.withValues(alpha: 0.5),
                    width: AppTheme.borderDefault,
                  ),
                ),
                child: Text(
                  'SET',
                  style: text.labelSmall?.copyWith(
                    color: d2r.poison,
                    fontWeight: FontWeight.bold,
                    letterSpacing: 0.5,
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }
}
