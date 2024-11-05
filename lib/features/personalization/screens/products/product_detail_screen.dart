import 'package:e_commerce_application_ui/common/widgets/icons/circular_icons.dart';
import 'package:e_commerce_application_ui/common/widgets/texts/section_heading.dart';
import 'package:e_commerce_application_ui/features/personalization/screens/products/widgets/bottom_add_to_cart_widget.dart';
import 'package:e_commerce_application_ui/features/personalization/screens/products/widgets/product_attribute_widget.dart';
import 'package:e_commerce_application_ui/features/personalization/screens/products/widgets/product_image_slider.dart';
import 'package:e_commerce_application_ui/features/personalization/screens/products/widgets/product_meta_data.dart';
import 'package:e_commerce_application_ui/features/personalization/screens/products/widgets/rating_and_share_widget.dart';
import 'package:e_commerce_application_ui/utils/constants/colors.dart';
import 'package:e_commerce_application_ui/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:readmore/readmore.dart';

import '../../../../utils/constants/sizes.dart';

class ProductDetailScreen extends StatelessWidget {
  const ProductDetailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final darkMode = THelperFunctions.isDarkMode(context);
    return Scaffold(
     bottomNavigationBar: const BottomAddToCart(),
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
            Padding(
              padding: const EdgeInsets.only(
                  right: TSizes.defaultSpace,
                  left: TSizes.defaultSpace,
                  bottom: TSizes.defaultSpace),
              child: Column(
                children: [
                  const RatingAndShareIcon(),
                  const ProductMetaData(),
                  const ProductAttributeWidget(),
                  const SizedBox(
                    height: TSizes.spaceBtwSections,
                  ),
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: () {},
                      child: const Text("Checkout"),
                    ),
                  ),
                  const SizedBox(
                    height: TSizes.spaceBtwSections,
                  ),
                  const SectionHeading(
                    title: 'Description',
                    showActionButton: false,
                  ),
                  const SizedBox(
                    height: TSizes.spaceBtwItems,
                  ),
                  const ReadMoreText(
                    "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.",
                    trimLines: 2,
                    trimMode: TrimMode.Line,
                    trimCollapsedText: 'Show more',
                    trimExpandedText: ' Less',
                    moreStyle:
                        TextStyle(fontSize: 14, fontWeight: FontWeight.w600),
                    lessStyle:
                        TextStyle(fontSize: 14, fontWeight: FontWeight.w800),
                  ),
                  const Divider(),
                  const SizedBox(height: TSizes.spaceBtwItems,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const SectionHeading(title: 'Review(199)',showActionButton: false,),
                      IconButton(onPressed: (){}, icon: const Icon(Iconsax.arrow_right3,size: 18,))
                    ],
                  ),
                  const SizedBox(height: TSizes.spaceBtwItems,),

                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
