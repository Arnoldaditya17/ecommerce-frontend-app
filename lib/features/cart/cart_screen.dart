import 'package:e_commerce_application_ui/common/widgets/appbar/appbar.dart';
import 'package:e_commerce_application_ui/common/widgets/images/rounded_image.dart';
import 'package:e_commerce_application_ui/utils/constants/colors.dart';
import 'package:e_commerce_application_ui/utils/constants/image_strings.dart';
import 'package:e_commerce_application_ui/utils/constants/sizes.dart';
import 'package:e_commerce_application_ui/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final darkMode = THelperFunctions.isDarkMode(context);
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      appBar: TAppbar(
        title: Text(
          "Cart",
          style: Theme.of(context).textTheme.headlineMedium,
        ),
        showBackArrow: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(TSizes.defaultSpace),
          child: ListView.separated(
              itemBuilder: (_, index) => Column(
                    children: [
                      Row(
                        children: [
                          RoundedImage(
                            imageUrl: TImages.productImage3,
                            width: 60,
                            height: 60,
                            padding: const EdgeInsets.all(TSizes.sm),
                            backgroundColor: darkMode ? TColors.darkerGrey:TColors.light,
                          ),
                        ],
                      )
                    ],
                  ),
              separatorBuilder: (_, __) => const SizedBox(
                    height: TSizes.spaceBtwSections,
                  ),
              itemCount: 4),
        ),
      ),
    );
  }
}
