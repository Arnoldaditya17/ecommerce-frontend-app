import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import '../../../../../utils/helpers/helper_functions.dart';

class TLoginHeader extends StatelessWidget {
  const TLoginHeader({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final dark = THelperFunctions.isDarkMode(context);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Lottie.asset(
          'assets/lottie/Animation_1728302075927.json',
          width: 200,
          repeat: true,
          animate: true,
          reverse: true,
        ),
        // Text(
        //   TTexts.loginTitle,
        //   style: Theme.of(context).textTheme.headlineMedium,
        // ),
        // const SizedBox(
        //   height: TSizes.sm,
        // ),
        // Text(
        //   TTexts.loginSubTitle,
        //   style: Theme.of(context).textTheme.bodyMedium,
        // ),
      ],
    );
  }
}
