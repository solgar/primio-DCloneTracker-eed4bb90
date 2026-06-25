import 'package:flutter/material.dart';
import '../../providers/tracker_provider.dart';
import '../../theme/theme.dart';

/// Full filter + sort panel for the DClone screen.
/// Renders three chip rows (Region / Mode / Ladder) and a sort selector.
class DCloneFilterBar extends StatelessWidget {
  final String selectedRegion;
  final String selectedHc;
  final String selectedLadder;
  final DCloneSortOrder sortOrder;
  final ValueChanged<String> onRegionChanged;
  final ValueChanged<String> onHcChanged;
  final ValueChanged<String> onLadderChanged;
  final ValueChanged<DCloneSortOrder> onSortChanged;

  const DCloneFilterBar({
    super.key,
    required this.selectedRegion,
    required this.selectedHc,
    required this.selectedLadder,
    required this.sortOrder,
    required this.onRegionChanged,
    required this.onHcChanged,
    required this.onLadderChanged,
    required this.onSortChanged,
  });

  static const _regions = ['All', 'Americas', 'Europe', 'Asia'];
  static const _hcOptions = ['All', 'HC', 'SC'];
  static const _ladderOptions = ['All', 'Ladder', 'Non-Ladder'];

  @override
  Widget build(BuildContext context) {
    final d2r = Theme.of(context).extension<D2RColorsExtension>()!;
    final text = Theme.of(context).textTheme;

    return Container(
      padding: const EdgeInsets.all(AppTheme.spacingMd),
      decoration: BoxDecoration(
        color: d2r.panelBg,
        borderRadius: BorderRadius.circular(AppTheme.radiusMedium),
        border: Border.all(color: d2r.panelBorder),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // ── Title row ───────────────────────────────────────────────────────
          Row(
            children: [
              Icon(Icons.tune_rounded, color: d2r.gold, size: AppTheme.iconSm),
              const SizedBox(width: AppTheme.spacingXs),
              Text(
                'FILTER & SORT',
                style: text.labelMedium?.copyWith(
                  color: d2r.gold,
                  letterSpacing: 1.4,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ],
          ),

          const SizedBox(height: AppTheme.spacingMd),

          // ── Region row ──────────────────────────────────────────────────────
          _FilterRow(
            label: 'REGION',
            options: _regions,
            selected: selectedRegion,
            activeColor: d2r.gold,
            onChanged: onRegionChanged,
          ),

          const SizedBox(height: AppTheme.spacingSm),

          // ── Mode (HC / SC) row ──────────────────────────────────────────────
          _FilterRow(
            label: 'MODE',
            options: _hcOptions,
            selected: selectedHc,
            activeColor: d2r.demonRed,
            onChanged: onHcChanged,
          ),

          const SizedBox(height: AppTheme.spacingSm),

          // ── Ladder row ──────────────────────────────────────────────────────
          _FilterRow(
            label: 'LADDER',
            options: _ladderOptions,
            selected: selectedLadder,
            activeColor: d2r.lightning,
            onChanged: onLadderChanged,
          ),

          const SizedBox(height: AppTheme.spacingMd),

          // ── Divider ─────────────────────────────────────────────────────────
          Divider(color: d2r.panelBorder, height: 1),

          const SizedBox(height: AppTheme.spacingMd),

          // ── Sort row ────────────────────────────────────────────────────────
          Row(
            children: [
              Icon(Icons.sort_rounded,
                  color: d2r.terrorPurple, size: AppTheme.iconSm),
              const SizedBox(width: AppTheme.spacingXs),
              Text(
                'SORT',
                style: text.labelMedium?.copyWith(
                  color: d2r.terrorPurple,
                  letterSpacing: 1.4,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ],
          ),
          const SizedBox(height: AppTheme.spacingSm),
          Wrap(
            spacing: AppTheme.spacingSm,
            runSpacing: AppTheme.spacingSm,
            children: DCloneSortOrder.values.map((o) {
              final isSelected = sortOrder == o;
              return _SortChip(
                label: _sortLabel(o),
                icon: _sortIcon(o),
                isSelected: isSelected,
                activeColor: d2r.terrorPurple,
                onTap: () => onSortChanged(o),
              );
            }).toList(),
          ),
        ],
      ),
    );
  }

  String _sortLabel(DCloneSortOrder o) {
    switch (o) {
      case DCloneSortOrder.progressDesc:
        return 'Terror ↓';
      case DCloneSortOrder.progressAsc:
        return 'Terror ↑';
      case DCloneSortOrder.region:
        return 'Region';
      case DCloneSortOrder.updated:
        return 'Updated';
    }
  }

  IconData _sortIcon(DCloneSortOrder o) {
    switch (o) {
      case DCloneSortOrder.progressDesc:
        return Icons.local_fire_department_rounded;
      case DCloneSortOrder.progressAsc:
        return Icons.arrow_upward_rounded;
      case DCloneSortOrder.region:
        return Icons.public_rounded;
      case DCloneSortOrder.updated:
        return Icons.access_time_rounded;
    }
  }
}

// ── A labelled row of filter chips ──────────────────────────────────────────

class _FilterRow extends StatelessWidget {
  final String label;
  final List<String> options;
  final String selected;
  final Color activeColor;
  final ValueChanged<String> onChanged;

  const _FilterRow({
    required this.label,
    required this.options,
    required this.selected,
    required this.activeColor,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    final d2r = Theme.of(context).extension<D2RColorsExtension>()!;
    final text = Theme.of(context).textTheme;

    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        SizedBox(
          width: 56,
          child: Text(
            label,
            style: text.labelSmall?.copyWith(
              color: d2r.subtleText,
              letterSpacing: 1.0,
            ),
          ),
        ),
        const SizedBox(width: AppTheme.spacingSm),
        Expanded(
          child: SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: options.map((opt) {
                final isSelected = opt == selected;
                return Padding(
                  padding:
                      const EdgeInsets.only(right: AppTheme.spacingXs),
                  child: _FilterChip(
                    label: opt,
                    isSelected: isSelected,
                    activeColor: activeColor,
                    onTap: () => onChanged(opt),
                  ),
                );
              }).toList(),
            ),
          ),
        ),
      ],
    );
  }
}

// ── Single filter chip ───────────────────────────────────────────────────────

class _FilterChip extends StatelessWidget {
  final String label;
  final bool isSelected;
  final Color activeColor;
  final VoidCallback onTap;

  const _FilterChip({
    required this.label,
    required this.isSelected,
    required this.activeColor,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final d2r = Theme.of(context).extension<D2RColorsExtension>()!;
    final text = Theme.of(context).textTheme;

    return GestureDetector(
      onTap: onTap,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 180),
        padding: const EdgeInsets.symmetric(
          horizontal: AppTheme.spacingMd,
          vertical: AppTheme.spacingSm,
        ),
        decoration: BoxDecoration(
          color: isSelected
              ? activeColor.withValues(alpha: 0.15)
              : d2r.panelBg,
          borderRadius: BorderRadius.circular(AppTheme.radiusSmall),
          border: Border.all(
            color: isSelected ? activeColor : d2r.panelBorder,
            width: isSelected ? AppTheme.borderSelected : AppTheme.borderDefault,
          ),
        ),
        child: Text(
          label,
          style: text.labelMedium?.copyWith(
            color: isSelected ? activeColor : d2r.subtleText,
            fontWeight: isSelected ? FontWeight.w700 : FontWeight.normal,
          ),
        ),
      ),
    );
  }
}

// ── Sort chip (with icon) ────────────────────────────────────────────────────

class _SortChip extends StatelessWidget {
  final String label;
  final IconData icon;
  final bool isSelected;
  final Color activeColor;
  final VoidCallback onTap;

  const _SortChip({
    required this.label,
    required this.icon,
    required this.isSelected,
    required this.activeColor,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final d2r = Theme.of(context).extension<D2RColorsExtension>()!;
    final text = Theme.of(context).textTheme;

    return GestureDetector(
      onTap: onTap,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 180),
        padding: const EdgeInsets.symmetric(
          horizontal: AppTheme.spacingMd,
          vertical: AppTheme.spacingSm,
        ),
        decoration: BoxDecoration(
          color: isSelected
              ? activeColor.withValues(alpha: 0.15)
              : d2r.panelBg,
          borderRadius: BorderRadius.circular(AppTheme.radiusSmall),
          border: Border.all(
            color: isSelected ? activeColor : d2r.panelBorder,
            width: isSelected ? AppTheme.borderSelected : AppTheme.borderDefault,
          ),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(
              icon,
              size: AppTheme.iconSm,
              color: isSelected ? activeColor : d2r.subtleText,
            ),
            const SizedBox(width: AppTheme.spacingXs),
            Text(
              label,
              style: text.labelMedium?.copyWith(
                color: isSelected ? activeColor : d2r.subtleText,
                fontWeight: isSelected ? FontWeight.w700 : FontWeight.normal,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
