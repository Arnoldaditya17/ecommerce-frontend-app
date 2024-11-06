import 'package:e_commerce_application_ui/common/widgets/appbar/appbar.dart';
import 'package:flutter/material.dart';

class AddNewAddressScreen extends StatelessWidget {
  const AddNewAddressScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: TAppbar(title: Text('Add Address'),showBackArrow: true,),
      body: Column(
        children: [

        ],
      ),
    );
  }
}
