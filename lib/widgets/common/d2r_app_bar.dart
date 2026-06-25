import 'package:flutter/material.dart';
import '../../theme/theme.dart';

class D2RAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final List<Widget>? actions;

  const D2RAppBar({super.key, required this.title, this.actions});

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    final d2r = Theme.of(context).extension<D2RColorsExtension>()!;
    final text = Theme.of(context).textTheme;
    return AppBar(
      title: Text(
        title,
        style: text.titleLarge?.copyWith(
          color: d2r.gold,
          letterSpacing: 1.5,
        ),
      ),
      actions: actions,
      bottom: PreferredSize(
        preferredSize: const Size.fromHeight(AppTheme.borderDefault),
        child: Container(
          height: AppTheme.borderDefault,
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Colors.transparent,
                d2r.goldDark.withOpacity(0.6),
                d2r.gold.withOpacity(0.8),
                d2r.goldDark.withOpacity(0.6),
                Colors.transparent,
              ],
              stops: const [0.0, 0.2, 0.5, 0.8, 1.0],
            ),
          ),
        ),
      ),
    );
  }
}
