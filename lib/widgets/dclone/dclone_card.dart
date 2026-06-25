import 'package:flutter/material.dart';
import '../../models/dclone_status.dart';
import '../../theme/theme.dart';
import '../common/progress_orb.dart';

class DCloneCard extends StatelessWidget {
  final DCloneStatus status;

  const DCloneCard({super.key, required this.status});

  @override
  Widget build(BuildContext context) {
    final d2r = Theme.of(context).extension<D2RColorsExtension>()!;
    final text = Theme.of(context).textTheme;
    final age = DateTime.now().difference(status.lastUpdate);
    final ageLabel = _ageLabel(age);

    return Container(
      padding: const EdgeInsets.all(AppTheme.spacingMd),
      decoration: BoxDecoration(
        color: d2r.panelBg,
        borderRadius: BorderRadius.circular(AppTheme.radiusSmall),
        border: Border.all(
          color: status.progress >= 5
              ? d2r.fire.withValues(alpha: AppTheme.opacityHint)
              : d2r.panelBorder,
          width: status.progress >= 5
              ? AppTheme.borderSelected
              : AppTheme.borderDefault,
        ),
      ),
      child: Row(
        children: [
          ProgressOrb(progress: status.progress, size: 44),
          const SizedBox(width: AppTheme.spacingMd),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Ladder label row with HC/SC chip
                Row(
                  children: [
                    Flexible(
                      child: Text(
                        status.ladder,
                        style: text.titleSmall?.copyWith(color: d2r.gold),
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                    const SizedBox(width: AppTheme.spacingXs),
                    _ModeChip(isHardcore: status.isHardcore),
                  ],
                ),
                const SizedBox(height: AppTheme.spacingXs),
                Text(
                  status.progressLabel,
                  style: text.bodySmall?.copyWith(
                    color: _statusColor(d2r),
                    fontWeight: FontWeight.w600,
                  ),
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
              ],
            ),
          ),
          const SizedBox(width: AppTheme.spacingSm),
          Text(
            ageLabel,
            style: text.labelSmall,
          ),
        ],
      ),
    );
  }

  String _ageLabel(Duration age) {
    if (age.inMinutes < 1) return 'just now';
    if (age.inHours < 1) return '${age.inMinutes}m ago';
    if (age.inDays < 1) return '${age.inHours}h ago';
    return '${age.inDays}d ago';
  }

  Color _statusColor(D2RColorsExtension d2r) {
    if (status.progress <= 2) return d2r.poison;
    if (status.progress <= 4) return d2r.lightning;
    return d2r.fire;
  }
}

class _ModeChip extends StatelessWidget {
  const _ModeChip({required this.isHardcore});

  final bool isHardcore;

  @override
  Widget build(BuildContext context) {
    final d2r = Theme.of(context).extension<D2RColorsExtension>()!;
    final text = Theme.of(context).textTheme;
    final color = isHardcore ? d2r.demonRed : d2r.lightning;

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 1),
      decoration: BoxDecoration(
        color: color.withValues(alpha: 0.15),
        borderRadius: BorderRadius.circular(AppTheme.radiusSmall),
        border: Border.all(color: color.withValues(alpha: AppTheme.opacityHint)),
      ),
      child: Text(
        isHardcore ? 'HC' : 'SC',
        style: text.labelSmall?.copyWith(
          color: color,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}
