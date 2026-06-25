import 'package:go_router/go_router.dart';
import '../screens/cube_screen.dart';
import '../screens/dclone_screen.dart';
import '../screens/home_shell.dart';
import '../screens/terror_zone_screen.dart';

class AppRouter {
  static final router = GoRouter(
    initialLocation: '/dclone',
    routes: [
      StatefulShellRoute.indexedStack(
        builder: (context, state, navigationShell) {
          return HomeShell(navigationShell: navigationShell);
        },
        branches: [
          StatefulShellBranch(
            routes: [
              GoRoute(
                path: '/dclone',
                builder: (context, state) => const DCloneScreen(),
              ),
            ],
          ),
          StatefulShellBranch(
            routes: [
              GoRoute(
                path: '/terror-zones',
                builder: (context, state) => const TerrorZoneScreen(),
              ),
            ],
          ),
          StatefulShellBranch(
            routes: [
              GoRoute(
                path: '/cube',
                builder: (context, state) => const CubeScreen(),
              ),
            ],
          ),
        ],
      ),
    ],
  );
}
