import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:realize_mobile_app/app/core/constants/colors.dart';
import 'package:realize_mobile_app/app/widgets/navs/nav_title.dart';
import 'package:realize_mobile_app/app/features/dashboard/screens/send.dart';
import 'package:realize_mobile_app/app/features/dashboard/screens/home.dart';
import 'package:realize_mobile_app/app/features/dashboard/screens/analytics.dart';

class NavigationMenu extends StatefulWidget {
  const NavigationMenu({Key? key}) : super(key: key);

  @override
  _NavigationMenuState createState() => _NavigationMenuState();
}

class _NavigationMenuState extends State<NavigationMenu> {
  final controller = Get.put(NavigatorController());

  final List<String> pageNames = [
    'Home',
    'Send',
    'Analytics'
  ]; // Define page names here

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(kToolbarHeight),
        child: AppBar(
          automaticallyImplyLeading: false,
          elevation: 0,
          backgroundColor: AppColors.primaryDividerGray,
          title: Align(
            alignment: Alignment.centerLeft,
            child: Obx(() => NavTitle(
                text: pageNames[controller.selectedIndex
                    .value])), // Use Obx widget to update the title
          ),
        ),
      ),
      bottomNavigationBar: Obx(
        () => BottomNavigationBar(
          currentIndex: controller.selectedIndex.value,
          onTap: (index) => controller.selectedIndex.value = index,
          items: [
            BottomNavigationBarItem(
              icon: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SvgPicture.asset(
                    'assets/icons/home.svg',
                    color: controller.selectedIndex.value == 0
                        ? AppColors.primaryPurpleColor1
                        : Colors.grey,
                    width: 24,
                    height: 24,
                  ),
                  const SizedBox(height: 4), // Adjust the height as needed
                ],
              ),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SvgPicture.asset(
                    'assets/icons/send.svg',
                    color: controller.selectedIndex.value == 1
                        ? AppColors.primaryPurpleColor1
                        : Colors.grey,
                    width: 24,
                    height: 24,
                  ),
                  const SizedBox(height: 4), // Adjust the height as needed
                ],
              ),
              label: 'Send',
            ),
            BottomNavigationBarItem(
              icon: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SvgPicture.asset(
                    'assets/icons/analytics.svg',
                    color: controller.selectedIndex.value == 2
                        ? AppColors.primaryPurpleColor1
                        : Colors.grey,
                    width: 24,
                    height: 24,
                  ),
                  const SizedBox(height: 4), // Adjust the height as needed
                ],
              ),
              label: 'Analytics',
            ),
          ],
          selectedItemColor: AppColors.primaryPurpleColor1,
          unselectedItemColor: Colors.grey,
          selectedLabelStyle:
              const TextStyle(color: AppColors.primaryPurpleColor1),
          unselectedLabelStyle: const TextStyle(color: Colors.grey),
        ),
      ),
      body: Obx(() => controller.screens[controller.selectedIndex.value]),
    );
  }
}

class NavigatorController extends GetxController {
  final Rx<int> selectedIndex = 0.obs;
  final screens = [
    const HomePage(),
    const Send(),
    const Analytics(),
  ];
}
