import "package:flutter/cupertino.dart";
import "package:flutter/material.dart";
import "package:flutter_svg/flutter_svg.dart";
import "package:go_router/go_router.dart";

class ScaffoldWithNavBar extends StatelessWidget {
  const ScaffoldWithNavBar({ required this.navigationShell, super.key });

  final StatefulNavigationShell navigationShell;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,   //new line
      body: navigationShell,
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: SizedBox(
        height: 70,
        width: 70,
        child: FloatingActionButton(
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(100)),
          onPressed: () {},
          child: const Icon(Icons.add)
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        surfaceTintColor: Colors.white,
        padding: EdgeInsets.zero,
        notchMargin: 10,
        height: 65,
        elevation: 40,
        shadowColor: const Color(0x63D6DBE1),
        shape: const CircularNotchedRectangle(),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 14),
          child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,children: [
            Column(
              children: <Widget>[
                IconButton(
                  onPressed: () => _goBranch(0),
                  icon:
                    0 ==  navigationShell.currentIndex ? SvgPicture.asset("assets/images/active_hospital_icon.svg")
                    : SvgPicture.asset("assets/images/hospital_icon.svg")
                ),
                Text(
                  "Главаная",
                  style: Theme.of(context).textTheme.labelSmall?.copyWith(
                    height: -.1,
                    color: 0 ==  navigationShell.currentIndex ? Theme.of(context).primaryColor : Color(0xFF7D8186)
                  )
                )
              ],
            ),
            Column(
              children: <Widget>[
                IconButton(
                  onPressed: (){},
                  icon: SvgPicture.asset("assets/images/schedule_icon.svg")
                ),
                Text(
                  "Календарь",
                  style: Theme.of(context).textTheme.labelSmall?.copyWith(height: -.1)
                )
              ],
            ),
            const SizedBox(width: 70),
            Column(
              children: <Widget>[
                IconButton(
                  onPressed: () => _goBranch(1),
                  icon:
                    1 ==  navigationShell.currentIndex ? SvgPicture.asset("assets/images/active_hospital_icon.svg")
                    : SvgPicture.asset("assets/images/hospital_icon.svg")
                ),
                Text(
                  "Записи",
                  style: Theme.of(context).textTheme.labelSmall?.copyWith(
                    height: -.1,
                    color: 1 ==  navigationShell.currentIndex ? Theme.of(context).primaryColor : const Color(0xFF7D8186)
                  )
                )
              ],
            ),
            Column(
              children: <Widget>[
                IconButton(
                  onPressed: (){},
                  icon: SvgPicture.asset("assets/images/profile_icon.svg")
                ),
                Text(
                  "Аккаунт",
                  style: Theme.of(context).textTheme.labelSmall?.copyWith(height: -.1)
                )
              ],
            ),
          ]),
        ),
      ),
    );
  }

  void _goBranch(int index) {
    navigationShell.goBranch(
      index,
      initialLocation: index == navigationShell.currentIndex,
    );
  }
}
