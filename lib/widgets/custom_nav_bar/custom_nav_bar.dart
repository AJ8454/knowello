import 'package:flutter/material.dart';
import 'package:knowello/screens/favorate_screen.dart';
import 'package:knowello/screens/home_screen.dart';
import 'package:knowello/screens/new_post_screen.dart';
import 'package:knowello/screens/profile_screen.dart';
import 'package:knowello/screens/search_screen.dart';

class CustomBottomNavigationBar extends StatefulWidget {
  const CustomBottomNavigationBar({Key? key}) : super(key: key);

  @override
  State<CustomBottomNavigationBar> createState() =>
      _CustomBottomNavigationBarState();
}

class _CustomBottomNavigationBarState extends State<CustomBottomNavigationBar> {
  int currentIndex = 0;
  final controller = ScrollController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: IndexedStack(
        index: currentIndex,
        children: [
          HomeScreen(controller: controller),
          const SearchScreen(),
          const NewPostScreen(),
          const FavorateScreen(),
          const ProfileScreen(),
        ],
      ),
      bottomNavigationBar: Container(
        padding: const EdgeInsets.only(
          top: 10,
          left: 8,
          right: 8,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            InkWell(
              onTap: () {
                controller.animateTo(
                  0.0,
                  duration: const Duration(seconds: 1),
                  curve: Curves.easeIn,
                );
                setState(() => currentIndex = 0);
              },
              child: SizedBox(
                width: 35,
                height: 35,
                child: Image.asset(
                  currentIndex == 0
                      ? 'assets/icons/home_active.png'
                      : 'assets/icons/home.png',
                  height: 30,
                  color: Colors.white,
                ),
              ),
            ),
            InkWell(
              onTap: () {
                setState(() => currentIndex = 1);
              },
              child: SizedBox(
                width: 35,
                height: 35,
                child: Image.asset(
                  currentIndex == 1
                      ? 'assets/icons/search_active.png'
                      : 'assets/icons/search.png',
                  color: Colors.white,
                  height: 30,
                ),
              ),
            ),
            InkWell(
              onTap: () {
                setState(() => currentIndex = 2);
              },
              child: SizedBox(
                width: 35,
                height: 35,
                child: Image.asset(
                  currentIndex == 2
                      ? 'assets/icons/post_active.png'
                      : 'assets/icons/post.png',
                  color: Colors.white,
                  height: 30,
                ),
              ),
            ),
            InkWell(
              onTap: () {
                setState(() => currentIndex = 3);
              },
              child: SizedBox(
                width: 35,
                height: 35,
                child: Image.asset(
                  currentIndex == 3
                      ? 'assets/icons/heart_active.png'
                      : 'assets/icons/heart.png',
                  color: Colors.white,
                  height: 30,
                ),
              ),
            ),
            InkWell(
              onTap: () {
                setState(() => currentIndex = 4);
              },
              child: SizedBox(
                width: 35,
                height: 35,
                child: Image.asset(
                  currentIndex == 4
                      ? 'assets/icons/profile_active.png'
                      : 'assets/icons/profile.png',
                  color: Colors.white,
                  height: 30,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}


//  BottomNavigationBar(
//         backgroundColor: Colors.black,
//         type: BottomNavigationBarType.fixed,
//         showSelectedLabels: false,
//         showUnselectedLabels: false,
//         currentIndex: currentIndex,
//         onTap: (index) => setState(() => currentIndex = index),
//         items: [
//           BottomNavigationBarItem(
//             icon: InkWell(
//               onTap: () {
//                 controller.jumpTo(0.0);
//               },
              // child: Image.asset(
              //   currentIndex == 0
              //       ? 'assets/icons/home_active.png'
              //       : 'assets/icons/home.png',
              //   height: 30,
              //   color: Colors.white,
              // ),
//             ),
//             label: '',
//           ),
//           BottomNavigationBarItem(
            // icon: Image.asset(
            //   currentIndex == 1
            //       ? 'assets/icons/search_active.png'
            //       : 'assets/icons/search.png',
            //   color: Colors.white,
            //   height: 30,
            // ),
//             label: '',
//           ),
//           BottomNavigationBarItem(
            // icon: Image.asset(
            //   currentIndex == 2
            //       ? 'assets/icons/post_active.png'
            //       : 'assets/icons/post.png',
            //   color: Colors.white,
            //   height: 30,
            // ),
//             label: '',
//           ),
//           BottomNavigationBarItem(
            // icon: Image.asset(
            //   currentIndex == 3
            //       ? 'assets/icons/heart_active.png'
            //       : 'assets/icons/heart.png',
            //   color: Colors.white,
            //   height: 30,
            // ),
//             label: '',
//           ),
//           BottomNavigationBarItem(
            // icon: Image.asset(
            //   currentIndex == 4
            //       ? 'assets/icons/profile_active.png'
            //       : 'assets/icons/profile.png',
            //   color: Colors.white,
            //   height: 30,
            // ),
//             label: '',
//           ),
//         ],
//       ),