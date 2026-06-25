import 'package:flutter/material.dart';
import '../../models/terror_zone.dart';
import '../../theme/theme.dart';

class TerrorZoneCard extends StatelessWidget {
  final TerrorZone zone;
  final bool isCompact;

  const TerrorZoneCard({
    super.key,
    required this.zone,
    this.isCompact = false,
  });

  @override
  Widget build(BuildContext context) {
    final d2r = Theme.of(context).extension<D2RColorsExtension>()!;
    final text = Theme.of(context).textTheme;

    if (isCompact) {
      return _buildCompact(context, d2r, text);
    }
    return _buildFull(context, d2r, text);
  }

  Widget _buildFull(BuildContext context, D2RColorsExtension d2r, TextTheme text) {
    return Container(
      padding: const EdgeInsets.all(AppTheme.spacingMd),
      decoration: BoxDecoration(
        color: d2r.panelBg,
        borderRadius: BorderRadius.circular(AppTheme.radiusMedium),
        border: Border.all(
          color: zone.isCurrent ? d2r.terrorPurple.withValues(alpha: 0.6) : d2r.panelBorder,
          width: zone.isCurrent ? AppTheme.borderSelected : AppTheme.borderDefault,
        ),
        boxShadow: zone.isCurrent
            ? [
                BoxShadow(
                  color: d2r.terrorPurple.withValues(alpha: 0.15),
                  blurRadius: 20,
                  spreadRadius: -4,
                ),
              ]
            : null,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: AppTheme.spacingSm,
                  vertical: AppTheme.spacingXs,
                ),
                decoration: BoxDecoration(
                  color: zone.isCurrent
                      ? d2r.terrorPurple.withValues(alpha: 0.15)
                      : d2r.panelBorder.withValues(alpha: 0.3),
                  borderRadius: BorderRadius.circular(AppTheme.radiusSmall),
                ),
                child: Text(
                  zone.isCurrent ? '⚡ CURRENT' : '⏭ NEXT',
                  style: text.labelSmall?.copyWith(
                    color: zone.isCurrent ? d2r.terrorPurple : d2r.subtleText,
                    fontWeight: FontWeight.bold,
                    letterSpacing: 1.0,
                  ),
                ),
              ),
              const Spacer(),
              Text(
                zone.act,
                style: text.labelMedium?.copyWith(color: d2r.goldDark),
              ),
            ],
          ),
          const SizedBox(height: AppTheme.spacingSm),
          Text(
            zone.name,
            style: text.titleMedium?.copyWith(
              color: zone.isCurrent ? d2r.terrorPurple : d2r.goldLight,
            ),
          ),
          const SizedBox(height: AppTheme.spacingSm),
          Row(
            children: [
              _InfoChip(label: 'Area Lvl ${zone.areaLevel}', color: d2r.gold, d2r: d2r, text: text),
              const SizedBox(width: AppTheme.spacingSm),
              if (zone.endTime != null)
                _TimeChip(zone: zone, d2r: d2r, text: text),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildCompact(BuildContext context, D2RColorsExtension d2r, TextTheme text) {
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: AppTheme.spacingMd,
        vertical: AppTheme.spacingSm + 2,
      ),
      decoration: BoxDecoration(
        color: d2r.panelBg,
        border: Border(
          bottom: BorderSide(color: d2r.panelBorder.withValues(alpha: 0.4)),
        ),
      ),
      child: Row(
        children: [
          SizedBox(
            width: 52,
            child: Text(zone.act, style: text.labelSmall),
          ),
          Expanded(
            child: Text(
              zone.name,
              style: text.bodyMedium?.copyWith(color: d2r.goldLight),
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
          ),
          if (zone.startTime != null)
            Text(
              _formatTime(zone.startTime!),
              style: text.labelSmall,
            ),
        ],
      ),
    );
  }

  String _formatTime(DateTime dt) {
    final h = dt.hour.toString().padLeft(2, '0');
    final m = dt.minute.toString().padLeft(2, '0');
    return '$h:$m';
  }
}

class _InfoChip extends StatelessWidget {
  final String label;
  final Color color;
  final D2RColorsExtension d2r;
  final TextTheme text;

  const _InfoChip({
    required this.label,
    required this.color,
    required this.d2r,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: AppTheme.spacingSm,
        vertical: AppTheme.spacingXs,
      ),
      decoration: BoxDecoration(
        color: color.withValues(alpha: 0.1),
        borderRadius: BorderRadius.circular(AppTheme.radiusSmall),
        border: Border.all(color: color.withValues(alpha: 0.3)),
      ),
      child: Text(
        label,
        style: text.labelSmall?.copyWith(color: color),
      ),
    );
  }
}

class _TimeChip extends StatelessWidget {
  final TerrorZone zone;
  final D2RColorsExtension d2r;
  final TextTheme text;

  const _TimeChip({
    required this.zone,
    required this.d2r,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    final remaining = zone.endTime!.difference(DateTime.now());
    final mins = remaining.inMinutes.clamp(0, 999);
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: AppTheme.spacingSm,
        vertical: AppTheme.spacingXs,
      ),
      decoration: BoxDecoration(
        color: d2r.fire.withValues(alpha: 0.1),
        borderRadius: BorderRadius.circular(AppTheme.radiusSmall),
        border: Border.all(color: d2r.fire.withValues(alpha: 0.3)),
      ),
      child: Text(
        '${mins}m remaining',
        style: text.labelSmall?.copyWith(color: d2r.fireGlow),
      ),
    );
  }
}
