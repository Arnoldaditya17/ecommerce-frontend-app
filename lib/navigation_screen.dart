import 'package:e_commerce_application_ui/features/home/screens/home_screen.dart';
import 'package:e_commerce_application_ui/features/personalization/screens/address/user_address_screen.dart';
import 'package:e_commerce_application_ui/features/personalization/screens/profile/profile_screen.dart';
import 'package:e_commerce_application_ui/utils/constants/colors.dart';
import 'package:e_commerce_application_ui/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

import 'features/personalization/screens/wishlist/wishlist_screen.dart';

class NavigationScreen extends StatelessWidget {
  const NavigationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(NavigationController());
    final darkMode = THelperFunctions.isDarkMode(context);
    return Scaffold(
      bottomNavigationBar: Obx(
        () => NavigationBar(
          height: 80,
          elevation: 0,
          selectedIndex: controller.selectedIndex.value,
          onDestinationSelected: (index) =>
              controller.selectedIndex.value = index,
          backgroundColor: darkMode ? TColors.black : TColors.white,
          indicatorColor: darkMode
              ? TColors.white.withOpacity(0.1)
              : TColors.black.withOpacity(0.1),
          destinations: const [
            NavigationDestination(
              icon: Icon(Iconsax.home),
              label: 'Home',
              selectedIcon: Icon(
                Iconsax.home,
                color: TColors.primary,
              ),
            ),
            NavigationDestination(
              icon: Icon(Iconsax.shop),
              label: 'Store',
              selectedIcon: Icon(
                Iconsax.shop,
                color: TColors.primary,
              ),
            ),
            NavigationDestination(
              icon: Icon(Iconsax.heart),
              label: 'Wishlist',
              selectedIcon: Icon(
                Iconsax.heart,
                color: TColors.primary,
              ),
            ),
            NavigationDestination(
              icon: Icon(Iconsax.user),
              label: 'Profile',
              selectedIcon: Icon(
                Iconsax.user,
                color: TColors.primary,
              ),
            ),
          ],
        ),
      ),
      body: Obx(() => controller.screens[controller.selectedIndex.value]),
    );
  }
}

class NavigationController extends GetxController {
  final Rx<int> selectedIndex = 0.obs;
  final screens = [
    const HomeScreen(),
    const UserAddressScreen(),
    const WishlistScreen(),
    const ProfileScreen(),
  ];
}
