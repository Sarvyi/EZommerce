import 'package:ezom/utils/constants/image_strings.dart';
import 'package:ezom/utils/constants/sizes.dart';
import 'package:flutter/material.dart';

class SocialButtonWidget extends StatelessWidget {
  const SocialButtonWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(mainAxisAlignment: MainAxisAlignment.center, children: [
      Container(
        child: IconButton(
          onPressed: () {},
          icon: const Image(
            width: TSizes.iconMd,
            height: TSizes.iconMd,
            image: AssetImage(TImages.google),
          ),
        ),
      ),
      const SizedBox(width: TSizes.spaceBtwItems),
      Container(
        child: IconButton(
          onPressed: () {},
          icon: const Image(
            width: TSizes.iconMd,
            height: TSizes.iconMd,
            image: AssetImage(TImages.facebook),
          ),
        ),
      ),
    ]);
  }
}