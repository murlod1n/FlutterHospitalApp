import "package:flutter/cupertino.dart";
import "package:go_router/go_router.dart";

import "../feature/home/presentation/ui/page/home_page.dart";
import "../feature/home/presentation/ui/page/service_page.dart";
import "../feature/record/presentation/ui/page/record_page.dart";
import "../feature/shared/presentation/components/scaffold_with_nav_bar.dart";

final GlobalKey<NavigatorState> _rootNavigatorKey = GlobalKey<NavigatorState>();
final GlobalKey<NavigatorState> _shellNavigatorKey =
    GlobalKey<NavigatorState>();

final GoRouter router = GoRouter(
    initialLocation: "/home",
    navigatorKey: _rootNavigatorKey,
    routes: <RouteBase>[
      StatefulShellRoute.indexedStack(
          builder: (BuildContext context, GoRouterState state,
              StatefulNavigationShell navigationShell) {
            return ScaffoldWithNavBar(navigationShell: navigationShell);
          },
          branches: <StatefulShellBranch>[
            StatefulShellBranch(navigatorKey: _shellNavigatorKey, routes: <RouteBase>[
              GoRoute(
                  path: "/home",
                  pageBuilder: (BuildContext context, GoRouterState state) =>
                      const NoTransitionPage(child: HomePage()),
                  routes: <RouteBase>[
                    GoRoute(
                        path: "services",
                        builder: (BuildContext context, GoRouterState state) =>
                            ServicePage())
                  ])
            ]),
            StatefulShellBranch(
                routes: <RouteBase>[
              GoRoute(
                  path: "/records",
                  builder: (BuildContext context, GoRouterState state) => const RecordPage(),
              )
            ])
          ]),
    ]);
