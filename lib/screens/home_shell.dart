import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../theme/theme.dart';
import '../widgets/common/d2r_app_bar.dart';
import '../widgets/common/d2r_gem_button.dart';

class HomeShell extends StatelessWidget {
  final StatefulNavigationShell navigationShell;

  const HomeShell({super.key, required this.navigationShell});

  @override
  Widget build(BuildContext context) {
    final d2r = Theme.of(context).extension<D2RColorsExtension>()!;
    final colors = Theme.of(context).colorScheme;

    return Scaffold(
      appBar: D2RAppBar(
        title: 'D2R Tracker',
        actions: [
          IconButton(
            icon: Icon(Icons.refresh, color: d2r.goldDark),
            onPressed: () {},
          ),
        ],
      ),
      body: navigationShell,
      floatingActionButton: const D2RGemButton(),
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          border: Border(
            top: BorderSide(color: d2r.panelBorder, width: AppTheme.borderDefault),
          ),
        ),
        child: NavigationBar(
          backgroundColor: colors.surface,
          selectedIndex: navigationShell.currentIndex,
          onDestinationSelected: (i) => navigationShell.goBranch(i, initialLocation: i == navigationShell.currentIndex),
          height: 64,
          destinations: [
            NavigationDestination(
              icon: Icon(Icons.whatshot_outlined, color: d2r.subtleText),
              selectedIcon: Icon(Icons.whatshot, color: d2r.demonRed),
              label: 'DClone',
            ),
            NavigationDestination(
              icon: Icon(Icons.bolt_outlined, color: d2r.subtleText),
              selectedIcon: Icon(Icons.bolt, color: d2r.terrorPurple),
              label: 'Terror Zones',
            ),
            NavigationDestination(
              icon: Icon(Icons.casino_outlined, color: d2r.subtleText),
              selectedIcon: Icon(Icons.casino, color: d2r.gold),
              label: 'Cube',
            ),
            NavigationDestination(
              icon: Icon(Icons.emoji_events_outlined, color: d2r.subtleText),
              selectedIcon: Icon(Icons.emoji_events, color: d2r.goldLight),
              label: 'Grail',
            ),
          ],
        ),
      ),
    );
  }
}
