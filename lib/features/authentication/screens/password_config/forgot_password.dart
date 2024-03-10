import 'package:ezom/features/authentication/screens/password_config/reset_password.dart';
import 'package:ezom/utils/constants/sizes.dart';
import 'package:ezom/utils/constants/text_strings.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

class ForgotPassword extends StatelessWidget {
  const ForgotPassword({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(actions: []),
      body: Padding(
        padding: EdgeInsets.all(TSizes.defaultSpace),
        child: Column(children: [
          // Headings
          Text(TTexts.forgetPasswordTitle,style: Theme.of(context).textTheme.headlineMedium,),
          const SizedBox(height: TSizes.spaceBtwItems,),
          Text(TTexts.forgetPasswordSubTitle,style: Theme.of(context).textTheme.labelMedium,),
          const SizedBox(height: TSizes.spaceBtwItems*2,),

          // TextField
          TextFormField(
            decoration: const InputDecoration(labelText: TTexts.email,prefixIcon: Icon(Iconsax.direct_right1)),
          ),
          const SizedBox(height: TSizes.spaceBtwSections,),
          // Submit Button
          SizedBox(width: double.infinity,child: ElevatedButton(onPressed:() => Get.off(() => const ResetPassword()),child: const Text(TTexts.email),),)
        ]),
      ),
    );
  }
}
