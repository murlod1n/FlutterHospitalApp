import "package:auto_route/annotations.dart";
import "package:auto_route/auto_route.dart";
import "package:flutter/cupertino.dart";
import "package:flutter/material.dart";

import "../../routing/app_router.dart";

@RoutePage()
class RootScreen extends StatelessWidget {
  const RootScreen({super.key});


  @override
  Widget build(BuildContext context) {
    return AutoTabsScaffold(
        routes: const [

        ],
        bottomNavigationBuilder: (_, tabsRouter) {
          return BottomNavigationBar(
            currentIndex: tabsRouter.activeIndex,
            onTap: tabsRouter.setActiveIndex,
            items: const [
              BottomNavigationBarItem(
                label: 'Главная',
                icon: Icon(Icons.home),
              ),
              BottomNavigationBarItem(
                label: 'Записи',
                icon: Icon(Icons.dehaze),
              ),
            ],
          );
        },
      );
  }
}
