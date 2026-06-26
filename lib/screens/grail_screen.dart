import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../models/grail_item.dart';
import '../providers/grail_provider.dart';
import '../theme/theme.dart';
import '../widgets/common/d2r_section_header.dart';
import '../widgets/grail/grail_item_tile.dart';

class GrailScreen extends StatefulWidget {
  const GrailScreen({super.key});

  @override
  State<GrailScreen> createState() => _GrailScreenState();
}

class _GrailScreenState extends State<GrailScreen> {
  String _query = '';
  String? _selectedCategory;
  bool _showOnlyMissing = false;
  final _searchController = TextEditingController();

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  List<GrailCategory> _filtered(GrailProvider grail) {
    final q = _query.toLowerCase().trim();
    return kGrailCategories
        .where((cat) => _selectedCategory == null || cat.name == _selectedCategory)
        .map((cat) {
          final items = cat.items.where((item) {
            if (_showOnlyMissing && grail.isFound(item.id)) return false;
            if (q.isEmpty) return true;
            return item.name.toLowerCase().contains(q) ||
                item.baseType.toLowerCase().contains(q);
          }).toList();
          return GrailCategory(name: cat.name, items: items);
        })
        .where((cat) => cat.items.isNotEmpty)
        .toList();
  }

  void _showResetDialog(BuildContext context, GrailProvider grail) {
    showDialog<void>(
      context: context,
      builder: (ctx) {
        final d2r = Theme.of(ctx).extension<D2RColorsExtension>()!;
        final text = Theme.of(ctx).textTheme;
        return AlertDialog(
          backgroundColor: d2r.panelBg,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(AppTheme.radiusMedium),
            side: BorderSide(color: d2r.panelBorder),
          ),
          title: Text(
            'Reset Grail',
            style: text.titleMedium?.copyWith(color: d2r.demonRed),
          ),
          content: Text(
            'This will mark all items as not found. This cannot be undone.',
            style: text.bodyMedium,
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.of(ctx).pop(),
              child: Text('Cancel', style: TextStyle(color: d2r.subtleText)),
            ),
            TextButton(
              onPressed: () {
                grail.reset();
                Navigator.of(ctx).pop();
              },
              child: Text('Reset', style: TextStyle(color: d2r.demonRed)),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final grail = context.watch<GrailProvider>();
    final d2r = Theme.of(context).extension<D2RColorsExtension>()!;
    final text = Theme.of(context).textTheme;
    final colors = Theme.of(context).colorScheme;
    final filtered = _filtered(grail);

    return Column(
      children: [
        // ── Progress summary ───────────────────────────────────────────────
        Container(
          color: d2r.panelBg,
          padding: const EdgeInsets.fromLTRB(
            AppTheme.spacingMd,
            AppTheme.spacingMd,
            AppTheme.spacingMd,
            AppTheme.spacingSm,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Icon(Icons.emoji_events, color: d2r.gold, size: AppTheme.iconMd),
                  const SizedBox(width: AppTheme.spacingXs),
                  Expanded(
                    child: Text(
                      'Holy Grail Progress',
                      style: text.titleSmall?.copyWith(color: d2r.goldLight),
                    ),
                  ),
                  Text(
                    '${grail.foundCount} / ${grail.totalCount}',
                    style: text.labelLarge?.copyWith(color: d2r.gold),
                  ),
                  const SizedBox(width: AppTheme.spacingXs),
                  Text(
                    '(${(grail.progress * 100).toStringAsFixed(1)}%)',
                    style: text.bodySmall?.copyWith(color: d2r.subtleText),
                  ),
                  const SizedBox(width: AppTheme.spacingSm),
                  GestureDetector(
                    onTap: () => _showResetDialog(context, grail),
                    child: Icon(Icons.refresh, color: d2r.subtleText, size: AppTheme.iconSm),
                  ),
                ],
              ),
              const SizedBox(height: AppTheme.spacingXs),
              // Progress bar
              ClipRRect(
                borderRadius: BorderRadius.circular(AppTheme.radiusSmall),
                child: LinearProgressIndicator(
                  value: grail.progress,
                  minHeight: 6,
                  backgroundColor: d2r.panelBorder,
                  valueColor: AlwaysStoppedAnimation<Color>(d2r.gold),
                ),
              ),
            ],
          ),
        ),
        // ── Search + filters ───────────────────────────────────────────────
        Container(
          color: colors.surface,
          padding: const EdgeInsets.fromLTRB(
            AppTheme.spacingMd,
            AppTheme.spacingSm,
            AppTheme.spacingMd,
            AppTheme.spacingSm,
          ),
          child: Column(
            children: [
              // Search field
              TextField(
                controller: _searchController,
                onChanged: (v) => setState(() => _query = v),
                style: text.bodyMedium?.copyWith(color: d2r.goldLight),
                decoration: InputDecoration(
                  hintText: 'Search items or base types...',
                  hintStyle: text.bodyMedium?.copyWith(color: d2r.subtleText),
                  prefixIcon: Icon(Icons.search, color: d2r.subtleText, size: AppTheme.iconMd),
                  suffixIcon: _query.isNotEmpty
                      ? IconButton(
                          icon: Icon(Icons.clear, color: d2r.subtleText, size: AppTheme.iconSm),
                          onPressed: () {
                            _searchController.clear();
                            setState(() => _query = '');
                          },
                        )
                      : null,
                  filled: true,
                  fillColor: d2r.panelBg,
                  contentPadding: const EdgeInsets.symmetric(
                    horizontal: AppTheme.spacingMd,
                    vertical: AppTheme.spacingSm,
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(AppTheme.radiusMedium),
                    borderSide: BorderSide(color: d2r.panelBorder),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(AppTheme.radiusMedium),
                    borderSide: BorderSide(color: d2r.gold, width: AppTheme.borderSelected),
                  ),
                ),
              ),
              const SizedBox(height: AppTheme.spacingXs),
              // Category chips + "missing only" toggle
              Row(
                children: [
                  Expanded(
                    child: SizedBox(
                      height: 34,
                      child: ListView(
                        scrollDirection: Axis.horizontal,
                        children: [
                          _GrailChip(
                            label: 'All',
                            selected: _selectedCategory == null,
                            onTap: () => setState(() => _selectedCategory = null),
                          ),
                          ...kGrailCategories.map(
                            (cat) => _GrailChip(
                              label: cat.name,
                              selected: _selectedCategory == cat.name,
                              count: grail.foundInCategory(cat.name),
                              total: cat.items.length,
                              onTap: () => setState(
                                () => _selectedCategory =
                                    _selectedCategory == cat.name ? null : cat.name,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(width: AppTheme.spacingXs),
                  // Missing only toggle
                  GestureDetector(
                    onTap: () => setState(() => _showOnlyMissing = !_showOnlyMissing),
                    child: AnimatedContainer(
                      duration: const Duration(milliseconds: 150),
                      padding: const EdgeInsets.symmetric(
                        horizontal: AppTheme.spacingSm,
                        vertical: AppTheme.spacingXs,
                      ),
                      decoration: BoxDecoration(
                        color: _showOnlyMissing
                            ? d2r.demonRed.withValues(alpha: 0.15)
                            : d2r.panelBg,
                        borderRadius: BorderRadius.circular(AppTheme.radiusSmall),
                        border: Border.all(
                          color: _showOnlyMissing ? d2r.demonRed : d2r.panelBorder,
                          width: _showOnlyMissing
                              ? AppTheme.borderSelected
                              : AppTheme.borderDefault,
                        ),
                      ),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Icon(
                            Icons.close,
                            size: AppTheme.iconSm,
                            color: _showOnlyMissing ? d2r.demonRed : d2r.subtleText,
                          ),
                          const SizedBox(width: 4),
                          Text(
                            'Missing',
                            style: text.labelMedium?.copyWith(
                              color: _showOnlyMissing ? d2r.demonRed : d2r.subtleText,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
        Divider(height: 1, color: d2r.panelBorder),
        // ── Item list ──────────────────────────────────────────────────────
        Expanded(
          child: filtered.isEmpty
              ? Center(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Icon(Icons.emoji_events, color: d2r.subtleText, size: AppTheme.iconXl),
                      const SizedBox(height: AppTheme.spacingSm),
                      Text(
                        'No items found',
                        style: text.titleSmall?.copyWith(color: d2r.subtleText),
                      ),
                    ],
                  ),
                )
              : ListView.builder(
                  padding: const EdgeInsets.symmetric(vertical: AppTheme.spacingSm),
                  itemCount: filtered.fold<int>(
                    0,
                    (sum, cat) => sum + 1 + cat.items.length,
                  ),
                  itemBuilder: (context, index) {
                    int cursor = 0;
                    for (final cat in filtered) {
                      if (index == cursor) {
                        final found = grail.foundInCategory(cat.name);
                        final total = kGrailCategories
                            .firstWhere((c) => c.name == cat.name)
                            .items
                            .length;
                        return Padding(
                          padding: const EdgeInsets.only(
                            top: AppTheme.spacingXs,
                            bottom: AppTheme.spacingXs,
                          ),
                          child: D2RSectionHeader(
                            title: '${cat.name}  $found/$total',
                            icon: _categoryIcon(cat.name),
                          ),
                        );
                      }
                      cursor++;
                      final itemIndex = index - cursor;
                      if (itemIndex < cat.items.length) {
                        final item = cat.items[itemIndex];
                        return GrailItemTile(
                          item: item,
                          found: grail.isFound(item.id),
                          onTap: () => grail.toggle(item.id),
                        );
                      }
                      cursor += cat.items.length;
                    }
                    return const SizedBox.shrink();
                  },
                ),
        ),
      ],
    );
  }

  IconData _categoryIcon(String category) {
    switch (category) {
      case 'Helms':           return Icons.hardware;
      case 'Body Armor':      return Icons.shield_outlined;
      case 'Shields':         return Icons.security;
      case 'Gloves':          return Icons.back_hand_outlined;
      case 'Boots':           return Icons.directions_walk;
      case 'Belts':           return Icons.circle_outlined;
      case 'Weapons':         return Icons.flash_on_outlined;
      case 'Rings':           return Icons.radio_button_unchecked;
      case 'Amulets':         return Icons.diamond_outlined;
      case 'Charms':          return Icons.auto_fix_high;
      case 'Jewels':          return Icons.star_outline;
      case 'Set Items':       return Icons.grid_view;
      default:                return Icons.inventory_2_outlined;
    }
  }
}

// ─── Category chip ────────────────────────────────────────────────────────────

class _GrailChip extends StatelessWidget {
  final String label;
  final bool selected;
  final int? count;
  final int? total;
  final VoidCallback onTap;

  const _GrailChip({
    required this.label,
    required this.selected,
    required this.onTap,
    this.count,
    this.total,
  });

  @override
  Widget build(BuildContext context) {
    final d2r = Theme.of(context).extension<D2RColorsExtension>()!;
    final text = Theme.of(context).textTheme;
    final isComplete = count != null && total != null && count == total;

    return Padding(
      padding: const EdgeInsets.only(right: AppTheme.spacingXs),
      child: GestureDetector(
        onTap: onTap,
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 150),
          padding: const EdgeInsets.symmetric(
            horizontal: AppTheme.spacingSm,
            vertical: AppTheme.spacingXs,
          ),
          decoration: BoxDecoration(
            color: isComplete
                ? d2r.poison.withValues(alpha: 0.12)
                : selected
                    ? d2r.gold.withValues(alpha: 0.15)
                    : d2r.panelBg,
            borderRadius: BorderRadius.circular(AppTheme.radiusSmall),
            border: Border.all(
              color: isComplete
                  ? d2r.poison
                  : selected
                      ? d2r.gold
                      : d2r.panelBorder,
              width: selected || isComplete
                  ? AppTheme.borderSelected
                  : AppTheme.borderDefault,
            ),
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                label,
                style: text.labelMedium?.copyWith(
                  color: isComplete
                      ? d2r.poison
                      : selected
                          ? d2r.goldLight
                          : d2r.subtleText,
                ),
              ),
              if (count != null && total != null) ...[
                const SizedBox(width: 4),
                Text(
                  '$count/$total',
                  style: text.labelSmall?.copyWith(
                    color: isComplete ? d2r.poison : d2r.subtleText,
                  ),
                ),
              ],
            ],
          ),
        ),
      ),
    );
  }
}
