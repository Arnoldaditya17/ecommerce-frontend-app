import 'package:e_commerce_application_ui/features/personalization/screens/products/widgets/product_card_vertical.dart';
import 'package:e_commerce_application_ui/utils/constants/colors.dart';
import 'package:e_commerce_application_ui/utils/constants/image_strings.dart';
import 'package:flutter/material.dart';

import '../../../../common/widgets/layouts/grid_layout.dart';

class AllProductScreen extends StatelessWidget {
  const AllProductScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Products"),
        backgroundColor: TColors.primary,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Hero(
              tag: 'productDetails',
                child: Image.asset(TImages.banner8)),
          ],
        ),
      ),
    );
  }
}
