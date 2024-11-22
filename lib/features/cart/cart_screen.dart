import 'package:e_commerce_application_ui/common/widgets/appbar/appbar.dart';
import 'package:e_commerce_application_ui/common/widgets/icons/circular_icons.dart';
import 'package:e_commerce_application_ui/common/widgets/texts/product_title.dart';
import 'package:e_commerce_application_ui/features/cart/widgets/cart_items.dart';
import 'package:e_commerce_application_ui/utils/constants/colors.dart';
import 'package:e_commerce_application_ui/utils/constants/sizes.dart';
import 'package:e_commerce_application_ui/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

import '../../common/widgets/product/cart/cart_item.dart';
import '../../common/widgets/product/cart/product_quantity_with_add_remove_widget.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final darkMode = THelperFunctions.isDarkMode(context);

    return Scaffold(
      appBar: TAppbar(
        title: Text(
          "Cart",
          style: Theme.of(context).textTheme.headlineSmall,
        ),
        showBackArrow: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(TSizes.defaultSpace),
        child: CartItems(darkMode: darkMode,showAddRemoveButtons: true,),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(TSizes.defaultSpace),
        child: ElevatedButton(onPressed: () {}, child: const Text('Checkout \$256.0')),
      ),
    );
  }
}




