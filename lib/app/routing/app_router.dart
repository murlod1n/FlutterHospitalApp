import "package:flutter/cupertino.dart";
import "package:go_router/go_router.dart";

import "../feature/home/presentation/ui/screen/home_screen.dart";
import "../feature/home/presentation/ui/screen/service_screen.dart";
import "../feature/record/presentation/ui/screen/record_detail_screen.dart";
import "../feature/record/presentation/ui/screen/record_screen.dart";
import "../feature/shared/presentation/components/scaffold_with_nav_bar.dart";

final GlobalKey<NavigatorState> _rootNavigatorKey = GlobalKey<NavigatorState>();
final GlobalKey<NavigatorState> _shellNavigatorKey =
    GlobalKey<NavigatorState>();

final GoRouter router = GoRouter(
  initialLocation: "/home",
  navigatorKey: _rootNavigatorKey,
  routes: <RouteBase>[
    StatefulShellRoute.indexedStack(
      builder: (BuildContext context, GoRouterState state, StatefulNavigationShell navigationShell) {
        return ScaffoldWithNavBar(navigationShell: navigationShell);
      },
      branches: <StatefulShellBranch>[
        StatefulShellBranch(
          navigatorKey: _shellNavigatorKey,
          routes: <RouteBase>[
            GoRoute(
              path: "/home",
              pageBuilder: (BuildContext context, GoRouterState state) =>
                const NoTransitionPage<dynamic>(child: HomeScreen()),
              routes: <RouteBase>[
                GoRoute(
                  path: "services",
                  builder: (BuildContext context, GoRouterState state) => const ServiceScreen()
                )
              ]
            )
          ]
        ),
        StatefulShellBranch(routes: <RouteBase>[
          GoRoute(
            path: "/records",
            pageBuilder: (BuildContext context, GoRouterState state) =>
              const NoTransitionPage<dynamic>(child: RecordScreen()),
              routes: <RouteBase>[
                GoRoute(
                  path: "detail/:id",
                  name: "detail",
                  builder: (BuildContext context, GoRouterState state) =>
                    RecordDetailScreen(recordId: int.parse(state.pathParameters["id"]!))
                )
              ]
          )
        ])
      ]
    ),
  ]
);
