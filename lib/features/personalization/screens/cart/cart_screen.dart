import 'package:e_commerce_application_ui/utils/constants/colors.dart';
import 'package:flutter/material.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // Get the width and height of the device screen
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
        appBar: AppBar(
          backgroundColor: TColors.primary,
          title: Text("Cart",style: Theme.of(context).textTheme.headlineMedium,),
        ),
        body:  Column(
          children: [],
        )



    );
  }
}
