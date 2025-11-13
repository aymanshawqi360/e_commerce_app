import 'package:e_commerce_app/core/util/assets_manager.dart';
import 'package:e_commerce_app/core/util/colors_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../home/presentation/screen/home_screen.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  final List<Widget> _screens = [
    const HomeScreen(),
    Container(color: Colors.green, width: 100, height: 100),
    Container(color: Colors.red, width: 100, height: 100),
    Container(color: Colors.black, width: 100, height: 100),
  ];
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.white,
        selectedItemColor: ColorsManager.purple,
        unselectedItemColor: Color(0xff938F9C),
        type: BottomNavigationBarType.fixed,
        currentIndex: _currentIndex,
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
        items: [
          buildBottomNavigationBarItem(
            label: 'Home',
            path: AssetsManager.home,
            index: 0,
          ),
          buildBottomNavigationBarItem(
            label: 'Save',
            path: AssetsManager.save,
            index: 1,
          ),
          buildBottomNavigationBarItem(
            label: 'Cart',
            path: AssetsManager.cart,
            index: 2,
          ),
          buildBottomNavigationBarItem(
            label: 'Profile',
            path: AssetsManager.profile,
            index: 3,
          ),
        ],
      ),
      body: SafeArea(
        child: IndexedStack(index: _currentIndex, children: _screens),
      ),
    );
  }

  BottomNavigationBarItem buildBottomNavigationBarItem({
    required String label,
    required String path,
    required int index,
  }) => BottomNavigationBarItem(
    icon: SvgPicture.asset(
      path,
      colorFilter: ColorFilter.mode(
        _currentIndex == index ? ColorsManager.purple : Color(0xff938F9C),
        BlendMode.srcIn,
      ),
    ),
    label: label,
  );
}
