import "package:flutter/cupertino.dart";
import "package:flutter/material.dart";
import "package:flutter_svg/flutter_svg.dart";
import "package:go_router/go_router.dart";

class _ScaffoldWithNavBar extends State<ScaffoldWithNavBar> {
  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,   //new line
      body: widget.navigationShell,
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: Container(
        height: 70,
        width: 70,
        child: FloatingActionButton(
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(100)),
            onPressed: () {},
            child: Icon(Icons.add)),
      ),
      bottomNavigationBar: BottomAppBar(
        padding: EdgeInsets.zero,
        notchMargin: 10,
        height: 65,
        shape: CircularNotchedRectangle(),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,children: [
            Column(
              children: [
                IconButton(onPressed: (){_goBranch(0);}, icon: 0 ==  widget.navigationShell.currentIndex ? SvgPicture.asset("assets/images/active_hospital_icon.svg") : SvgPicture.asset("assets/images/hospital_icon.svg")),
                Text("Главаная", style: Theme.of(context).textTheme.labelSmall?.copyWith(
                    height: -.1,
                    color: 0 ==  widget.navigationShell.currentIndex ? Theme.of(context).primaryColor : Color(0xFF7D8186)
                ))
              ],
            ),
            Column(
              children: [
                IconButton(onPressed: (){_goBranch(0);}, icon: SvgPicture.asset("assets/images/schedule_icon.svg")),
                Text("Календарь",style: Theme.of(context).textTheme.labelSmall?.copyWith(height: -.1,))
              ],
            ),
            SizedBox(width: 70),
            Column(
              children: [
                IconButton(onPressed: (){_goBranch(1);}, icon: 1 ==  widget.navigationShell.currentIndex ? SvgPicture.asset("assets/images/active_hospital_icon.svg") : SvgPicture.asset("assets/images/hospital_icon.svg")),
                Text("Записи", style: Theme.of(context).textTheme.labelSmall?.copyWith(
                    height: -.1,
                    color: 1 ==  widget.navigationShell.currentIndex ? Theme.of(context).primaryColor : Color(0xFF7D8186)
                ))
              ],
            ),
            Column(
              children: [
                IconButton(onPressed: (){_goBranch(0);}, icon: SvgPicture.asset("assets/images/profile_icon.svg")),
                Text("Аккаунт", style: Theme.of(context).textTheme.labelSmall?.copyWith(height: -.1,))
              ],
            ),
          ],),
        ),

      ),
    );
  }

  void _goBranch(int index) {
    widget.navigationShell.goBranch(
      index,
      initialLocation: index == widget.navigationShell.currentIndex,
    );
  }
}

class ScaffoldWithNavBar extends StatefulWidget {
  const ScaffoldWithNavBar({
    required this.navigationShell,
    Key? key,
  }) : super(key: key ?? const ValueKey<String>('ScaffoldWithNavBar'));

  final StatefulNavigationShell navigationShell;

  @override
  State<StatefulWidget> createState() => _ScaffoldWithNavBar();
}
