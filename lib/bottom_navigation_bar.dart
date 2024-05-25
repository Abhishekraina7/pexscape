// import 'package:animated_notch_bottom_bar/animated_notch_bottom_bar/animated_notch_bottom_bar.dart';
// import 'package:flutter/material.dart';
// import 'package:pexscape/wallpaper.dart';
//
// import 'Downloaded_wallpapers.dart';
// import 'categories.dart';
//
//
//
// class BottomNav extends StatefulWidget {
//   const BottomNav({super.key});
//
//   @override
//   State<BottomNav> createState() => _BottomNavState();
// }
//
// class _BottomNavState extends State<BottomNav> {
//   final NotchBottomBarController _pageController = NotchBottomBarController();
//   List<Widget> screens = [
//     const Wallpapers(),
//     const Categories(),
//     const Downloaded(),
//   ];
//   int _selectedIndex_for_bottomNav = 0;
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//
//       bottomNavigationBar: AnimatedNotchBottomBar(
//         color: Colors.white,
//         notchBottomBarController: _pageController,
//         bottomBarItems: const [
//           BottomBarItem(
//             inActiveItem: Icon(
//               Icons.home_filled,
//               color: Colors.blueGrey,
//             ),
//             activeItem: Icon(
//               Icons.home_filled,
//               color: Colors.black,
//             ),
//             itemLabel: 'Page1',
//           ),
//           BottomBarItem(
//             inActiveItem: Icon(
//               Icons.list_alt_rounded,
//               color: Colors.black,
//             ),
//             activeItem: Icon(
//               Icons.list_alt_rounded,
//               color: Colors.black,
//             ),
//             itemLabel: 'Page2',
//           ),
//           BottomBarItem(
//             inActiveItem: Icon(
//               Icons.download,
//               color: Colors.blueGrey,
//             ),
//             activeItem: Icon(
//               Icons.download,
//               color: Colors.black,
//             ),
//             itemLabel: 'Page3',
//           ),
//         ],
//         onTap: (index){
//           setState(() {
//             _selectedIndex_for_bottomNav = index;
//           });
//         },
//         kIconSize: 4,
//         kBottomRadius: 4,
//       ),
//       body: screens[_selectedIndex_for_bottomNav],
//     );
//   }
// }
