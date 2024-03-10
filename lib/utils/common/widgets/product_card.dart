import 'package:ezom/utils/common/styles/shadows.dart';
import 'package:ezom/utils/common/widgets/rounded_container.dart';
import 'package:ezom/utils/common/widgets/rounded_image.dart';
import 'package:ezom/utils/constants/colors.dart';
import 'package:ezom/utils/constants/image_strings.dart';
import 'package:ezom/utils/constants/sizes.dart';
import 'package:ezom/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

class ProductCardVertical extends StatelessWidget {
  const ProductCardVertical({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = THelperFunctions.isDarkMode(context);

    return Container(
      width: 180,
      padding: const EdgeInsets.all(1),
      decoration: BoxDecoration(
          boxShadow: [ShadowStyle.verticalProductShadow],
          borderRadius: BorderRadius.circular(TSizes.productImageRadius),
          color: THelperFunctions.isDarkMode(context)
              ? TColors.darkerGrey
              : TColors.white),
      child: Column(children: [
        TRoundedContainer(
          height: 180,
          padding: const EdgeInsets.all(TSizes.sm),
          backgroundColor: dark ? TColors.dark : TColors.light,
          child: Stack(children: [
            //  Thumbnail Image
            TRoundedImage(
              imageUrl: TImages.productImage1,
              applyImageRadius: true,
            ),

            // Sale Tag
            Positioned(
              top: 12,
              child: TRoundedContainer(
                radius: TSizes.sm,
                backgroundColor: TColors.secondary.withOpacity(0.8),
                padding: const EdgeInsets.symmetric(
                    horizontal: TSizes.sm, vertical: TSizes.xs),
                child: Text(
                  '25%',
                  style: Theme.of(context)
                      .textTheme
                      .labelLarge!
                      .apply(color: TColors.black),
                ),
              ),
            ),

            // Favorite Icon Button
            Positioned(
                top: 0,
                right: 0,
                child: TCircularIcon(
                  icon: Iconsax.heart5,
                  color: Colors.red,
                )),

            const Padding(padding: EdgeInsets.only(left: TSizes.sm),child: 
            Column(),)
          ]),
        )
      ]),
    );
  }
}

class TCircularIcon extends StatelessWidget {
  TCircularIcon({
    super.key,
    required this.icon,
    this.width,
    this.height,
    this.size = TSizes.lg,
    this.onPressed,
    this.color,
    this.backgroundColor,
  });

  final double? width, height, size;
  final IconData icon;
  final Color? color;
  final Color? backgroundColor;
  final VoidCallback? onPressed;

  @override
  Widget build(BuildContext context) {
    return Container(
        width: width,
        height: height,
        decoration: BoxDecoration(
            color: backgroundColor != null
                ? backgroundColor!
                : THelperFunctions.isDarkMode(context)
                    ? TColors.black.withOpacity(0.9)
                    : TColors.white.withOpacity(0.9),
            borderRadius: BorderRadius.circular(100)));
  }
}
