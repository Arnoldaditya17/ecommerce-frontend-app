import 'package:flutter/material.dart';
import '../../../../utils/constants/colors.dart';
import '../products/widgets/product_card_vertical.dart';

class WishlistScreen extends StatelessWidget {
  const WishlistScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Wishlist',
          style: Theme.of(context).textTheme.headlineMedium,
        ),
        backgroundColor: TColors.primary,
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0), // Outer padding for the entire grid
        child: GridView.builder(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            childAspectRatio: 0.59, // Adjust to control height of each card
          ),
          itemCount: 16,
          itemBuilder: (context, index) {
            bool isRightColumn = (index % 2 != 0);
            return Padding(
              padding: EdgeInsets.only(
                top: isRightColumn ? 30.0 : 0.0,
                bottom: isRightColumn ? 0.0 : 30.0,
                left: 8.0,
                right: isRightColumn ? 8.0 : 8.0,
              ),
              child: const ProductCardVertical(),
            );
          },
        ),
      ),
    );
  }
}
