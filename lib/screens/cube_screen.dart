import 'package:flutter/material.dart';
import '../models/cube_recipe.dart';
import '../theme/theme.dart';
import '../widgets/common/d2r_section_header.dart';
import '../widgets/cube/cube_recipe_card.dart';

class CubeScreen extends StatefulWidget {
  const CubeScreen({super.key});

  @override
  State<CubeScreen> createState() => _CubeScreenState();
}

class _CubeScreenState extends State<CubeScreen> {
  String _query = '';
  String? _selectedCategory;
  final _searchController = TextEditingController();

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  List<CubeRecipeCategory> get _filteredCategories {
    final q = _query.toLowerCase().trim();

    return kCubeCategories
        .where((cat) => _selectedCategory == null || cat.name == _selectedCategory)
        .map((cat) {
          final recipes = q.isEmpty
              ? cat.recipes
              : cat.recipes.where((r) {
                  return r.name.toLowerCase().contains(q) ||
                      r.output.toLowerCase().contains(q) ||
                      r.inputs.any((i) => i.toLowerCase().contains(q));
                }).toList();
          return CubeRecipeCategory(name: cat.name, recipes: recipes);
        })
        .where((cat) => cat.recipes.isNotEmpty)
        .toList();
  }

  @override
  Widget build(BuildContext context) {
    final d2r = Theme.of(context).extension<D2RColorsExtension>()!;
    final text = Theme.of(context).textTheme;
    final colors = Theme.of(context).colorScheme;
    final filtered = _filteredCategories;

    return Column(
      children: [
        // Search + Category filter header
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
                  hintText: 'Search recipes, ingredients, output...',
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
              const SizedBox(height: AppTheme.spacingSm),
              // Category chips
              SizedBox(
                height: 34,
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: [
                    _CategoryChip(
                      label: 'All',
                      selected: _selectedCategory == null,
                      onTap: () => setState(() => _selectedCategory = null),
                    ),
                    ...kCubeCategories.map(
                      (cat) => _CategoryChip(
                        label: cat.name,
                        selected: _selectedCategory == cat.name,
                        onTap: () => setState(
                          () => _selectedCategory =
                              _selectedCategory == cat.name ? null : cat.name,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        Divider(height: 1, color: d2r.panelBorder),
        // Recipe list
        Expanded(
          child: filtered.isEmpty
              ? Center(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Icon(Icons.search_off, color: d2r.subtleText, size: AppTheme.iconXl),
                      const SizedBox(height: AppTheme.spacingSm),
                      Text(
                        'No recipes found',
                        style: text.titleSmall?.copyWith(color: d2r.subtleText),
                      ),
                    ],
                  ),
                )
              : ListView.builder(
                  padding: const EdgeInsets.all(AppTheme.spacingMd),
                  itemCount: filtered.fold<int>(
                    0,
                    (sum, cat) => sum + 1 + cat.recipes.length,
                  ),
                  itemBuilder: (context, index) {
                    int cursor = 0;
                    for (final cat in filtered) {
                      if (index == cursor) {
                        return Padding(
                          padding: const EdgeInsets.only(bottom: AppTheme.spacingXs),
                          child: D2RSectionHeader(
                            title: cat.name,
                            icon: _categoryIcon(cat.name),
                          ),
                        );
                      }
                      cursor++;
                      final recipeIndex = index - cursor;
                      if (recipeIndex < cat.recipes.length) {
                        return CubeRecipeCard(recipe: cat.recipes[recipeIndex]);
                      }
                      cursor += cat.recipes.length;
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
      case 'Gems':
        return Icons.diamond_outlined;
      case 'Runes':
        return Icons.auto_fix_high;
      case 'Scrolls & Tomes':
        return Icons.menu_book_outlined;
      case 'Potions':
        return Icons.science_outlined;
      case 'Socketing':
        return Icons.settings_outlined;
      case 'Rerolling':
        return Icons.refresh;
      case 'Upgrading':
        return Icons.upgrade;
      case 'Rejuvenation':
        return Icons.favorite_outline;
      default:
        return Icons.casino_outlined;
    }
  }
}

class _CategoryChip extends StatelessWidget {
  final String label;
  final bool selected;
  final VoidCallback onTap;

  const _CategoryChip({
    required this.label,
    required this.selected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final d2r = Theme.of(context).extension<D2RColorsExtension>()!;
    final text = Theme.of(context).textTheme;

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
            color: selected
                ? d2r.gold.withValues(alpha: 0.15)
                : d2r.panelBg,
            borderRadius: BorderRadius.circular(AppTheme.radiusSmall),
            border: Border.all(
              color: selected ? d2r.gold : d2r.panelBorder,
              width: selected ? AppTheme.borderSelected : AppTheme.borderDefault,
            ),
          ),
          child: Text(
            label,
            style: text.labelMedium?.copyWith(
              color: selected ? d2r.goldLight : d2r.subtleText,
            ),
          ),
        ),
      ),
    );
  }
}
