import 'package:e_commerce_application_ui/common/widgets/icons/circular_icons.dart';
import 'package:e_commerce_application_ui/features/personalization/screens/products/widgets/product_image_slider.dart';
import 'package:e_commerce_application_ui/utils/constants/colors.dart';
import 'package:e_commerce_application_ui/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

import '../../../../utils/constants/sizes.dart';

class ProductDetailScreen extends StatelessWidget {
  const ProductDetailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final darkMode = THelperFunctions.isDarkMode(context);
    return Scaffold(
      appBar: AppBar(
        iconTheme:
            IconThemeData(color: darkMode ? TColors.white : TColors.dark),
        actions: const [
          CircularIcon(
            icon: Iconsax.heart5,
            color: Colors.red,
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            ProductImageSlider(darkMode: darkMode),
            const Padding(
                padding: EdgeInsets.only(
                    right: TSizes.defaultSpace,
                    left: TSizes.defaultSpace,
                    bottom: TSizes.defaultSpace))
          ],
        ),
      ),
    );
  }
}
