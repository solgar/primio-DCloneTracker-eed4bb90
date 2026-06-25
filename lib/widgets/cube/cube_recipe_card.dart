import 'package:flutter/material.dart';
import '../../models/cube_recipe.dart';
import '../../theme/theme.dart';

class CubeRecipeCard extends StatelessWidget {
  final CubeRecipe recipe;

  const CubeRecipeCard({super.key, required this.recipe});

  @override
  Widget build(BuildContext context) {
    final d2r = Theme.of(context).extension<D2RColorsExtension>()!;
    final text = Theme.of(context).textTheme;

    return Container(
      margin: const EdgeInsets.only(bottom: AppTheme.spacingSm),
      decoration: BoxDecoration(
        color: d2r.panelBg,
        borderRadius: BorderRadius.circular(AppTheme.radiusMedium),
        border: Border.all(color: d2r.panelBorder, width: AppTheme.borderDefault),
      ),
      child: Theme(
        data: Theme.of(context).copyWith(dividerColor: Colors.transparent),
        child: ExpansionTile(
          tilePadding: const EdgeInsets.symmetric(
            horizontal: AppTheme.spacingMd,
            vertical: AppTheme.spacingXs,
          ),
          childrenPadding: const EdgeInsets.fromLTRB(
            AppTheme.spacingMd,
            0,
            AppTheme.spacingMd,
            AppTheme.spacingMd,
          ),
          leading: Icon(Icons.casino_outlined, color: d2r.gold, size: AppTheme.iconMd),
          title: Text(
            recipe.name,
            style: text.titleSmall?.copyWith(color: d2r.goldLight),
          ),
          subtitle: Text(
            '→ ${recipe.output}',
            style: text.bodySmall?.copyWith(color: d2r.subtleText),
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
          iconColor: d2r.goldDark,
          collapsedIconColor: d2r.goldDark,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Divider(color: d2r.panelBorder, height: AppTheme.spacingMd),
                Text(
                  'INGREDIENTS',
                  style: text.labelSmall?.copyWith(
                    color: d2r.subtleText,
                    letterSpacing: 1.5,
                  ),
                ),
                const SizedBox(height: AppTheme.spacingXs),
                ...recipe.inputs.map(
                  (input) => Padding(
                    padding: const EdgeInsets.only(bottom: AppTheme.spacingXs),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(top: 4),
                          child: Icon(Icons.circle, size: 5, color: d2r.gold),
                        ),
                        const SizedBox(width: AppTheme.spacingSm),
                        Expanded(
                          child: Text(
                            input,
                            style: text.bodyMedium?.copyWith(color: d2r.goldLight),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(height: AppTheme.spacingSm),
                Divider(color: d2r.panelBorder, height: AppTheme.spacingMd),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'OUTPUT  ',
                      style: text.labelSmall?.copyWith(
                        color: d2r.subtleText,
                        letterSpacing: 1.5,
                      ),
                    ),
                    Expanded(
                      child: Text(
                        recipe.output,
                        style: text.bodyMedium?.copyWith(color: d2r.fire),
                      ),
                    ),
                  ],
                ),
                if (recipe.note != null) ...[
                  const SizedBox(height: AppTheme.spacingSm),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Icon(Icons.info_outline, size: AppTheme.iconSm, color: d2r.subtleText),
                      const SizedBox(width: AppTheme.spacingXs),
                      Expanded(
                        child: Text(
                          recipe.note!,
                          style: text.bodySmall?.copyWith(
                            color: d2r.subtleText,
                            fontStyle: FontStyle.italic,
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ],
            ),
          ],
        ),
      ),
    );
  }
}
