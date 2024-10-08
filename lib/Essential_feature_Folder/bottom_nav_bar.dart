import 'package:flutter/material.dart';
import 'package:flashy_tab_bar2/flashy_tab_bar2.dart';
import 'package:pexscape/Main_screens/Main_wallpaper_screen.dart';
import '../Main_screens/Downloaded_wallpapers_screen.dart';
import '../Main_screens/ai_image_gen_promt_screen.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';




class BottomNavBar extends StatefulWidget {
  const BottomNavBar({super.key});

  @override
  State<BottomNavBar> createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<BottomNavBar> {

  List<Widget> screens = [
    const Wallpapers(),
    const Categories(),
    const Downloaded()
  ];
  int selectedIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: FlashyTabBar(
        animationCurve: Curves.linear,
        showElevation: true,
        selectedIndex: selectedIndex,
        onItemSelected: (index) => setState(() {
          selectedIndex = index;
        }),
        items: [
          FlashyTabBarItem(
            icon: const Icon(Icons.home,color: Colors.black,),
            title: const Text('Home',style: TextStyle(color: Colors.black,fontWeight: FontWeight.w800),),

          ),
          FlashyTabBarItem(
            icon: const Icon(FontAwesomeIcons.wandMagicSparkles,color: Colors.blue,),
            title: const Text('GEN AI',style: TextStyle(color: Colors.black,fontWeight: FontWeight.w800),),
          ),
          FlashyTabBarItem(
            icon: const Icon(Icons.download,color: Colors.black,),
            title: const Text('Download',style: TextStyle(color: Colors.black,fontWeight: FontWeight.w800),),
          ),
        ],
      ),
      body: screens[selectedIndex],
    );
  }
}

