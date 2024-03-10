import 'package:carousel_slider/carousel_slider.dart';
import 'package:ezom/utils/common/widgets/product_card.dart';
import 'package:ezom/features/shop/controller/home_controller.dart';
import 'package:ezom/features/shop/home/appbar_home.dart';
import 'package:ezom/features/shop/home/circular_container.dart';
import 'package:ezom/features/shop/home/curved_egdes.dart';
import 'package:ezom/features/shop/home/searchbar_home.dart';
import 'package:ezom/utils/constants/colors.dart';
import 'package:ezom/utils/constants/image_strings.dart';
import 'package:ezom/utils/constants/sizes.dart';
import 'package:ezom/utils/constants/text_strings.dart';
import 'package:ezom/utils/device/device_utility.dart';
import 'package:ezom/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      // appBar: ,
      body: SingleChildScrollView(
        child: Column(children: [
          HomeHeaderWidget(
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              // Appbar
              HeaderAppBar(),
              SizedBox(
                height: TSizes.spaceBtwSections / 2,
              ),
              // SearchBar
              SearchContainer(text: 'Search in Store'),
              SizedBox(
                height: TSizes.spaceBtwSections / 2,
              ),

              // Categories
              ProductCategories()
            ]),
          ),

          // Body
          Padding(
              padding: EdgeInsets.all(TSizes.defaultSpace),
              child: PromoSlider(
                banners: [
                  TImages.promoBanner1,
                  TImages.promoBanner2,
                  TImages.promoBanner3
                ],
              )),
          SizedBox(
            height: TSizes.spaceBtwItems,
          ),
          // ProductCardVertical(height : 180,padding: const EdgeInsets.all(TSizes.sm)),
        ]),
      ),
    );
  }
}

class PromoSlider extends StatelessWidget {
  const PromoSlider({super.key, required this.banners});

  final List<String> banners;

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(HomeController());

    return Column(
      children: [
        CarouselSlider(
          options: CarouselOptions(
              viewportFraction: 1,
              onPageChanged: (index, _) =>
                  controller.updatePageIndicator(index)),
          items: banners.map((url) => RoundedImage(imageUrl: url)).toList(),
        ),
        const SizedBox(
          height: TSizes.spaceBtwSections,
        ),
        Obx(() => Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                for (int i = 0; i < banners.length; i++)
                  Padding(
                    padding: const EdgeInsets.only(right: 3.0),
                    child: CircularWidget(
                      width: 20,
                      height: 4,
                      margin: const EdgeInsets.only(right: 10),
                      
                      backgroundColor:
                          (controller.carousalCurrentIndex.value == i)
                              ? TColors.primary
                              : Colors.grey,
                    ),
                  )
              ],
            ))
      ],
    );
  }
}

class RoundedImage extends StatelessWidget {
  const RoundedImage({
    super.key,
    this.width,
    this.height,
    required this.imageUrl,
    this.applyImageRadius = false,
    this.border,
    this.backgroundColor = TColors.light,
    this.fit = BoxFit.contain,
    this.padding,
    this.isNetworkImage = false,
    this.onPressed,
    this.borderRadius = TSizes.md,
  });

  final double? width, height;
  final String imageUrl;
  final bool applyImageRadius;
  final BoxBorder? border;
  final Color backgroundColor;
  final BoxFit? fit;
  final EdgeInsetsGeometry? padding;
  final bool isNetworkImage;
  final VoidCallback? onPressed;
  final double borderRadius;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        height: height,
        width: width,
        padding: padding,
        decoration: BoxDecoration(
            border: border,
            color: backgroundColor,
            borderRadius: BorderRadius.circular(borderRadius)),
        child: ClipRRect(
          borderRadius: applyImageRadius
              ? BorderRadius.circular(borderRadius)
              : BorderRadius.zero,
          child: Image(
              image: isNetworkImage
                  ? NetworkImage(imageUrl)
                  : AssetImage(imageUrl) as ImageProvider),
        ),
      ),
    );
  }
}

class ProductCategories extends StatelessWidget {
  const ProductCategories({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: TSizes.defaultSpace / 2),
      child: Column(
        children: [
          // Heading
          const SectionHeader(
            title: 'Popular Categories',
            showActionButton: false,
            textColor: Colors.white,
          ),
          // const SizedBox(
          //   height: TSizes.spaceBtwItems/2,
          // ),

          // Categories
          SizedBox(
            height: 150,
            child: ListView.builder(
                shrinkWrap: true,
                itemCount: 8,
                scrollDirection: Axis.horizontal,
                itemBuilder: (_, index) {
                  return VerticalImageWidget(
                    image: TImages.shoeIcon,
                    title: 'Shoes',
                    onTap: () {},
                  );
                }),
          )
        ],
      ),
    );
  }
}

class SectionHeader extends StatelessWidget {
  const SectionHeader({
    super.key,
    this.textColor,
    this.showActionButton = true,
    this.buttonTitle = 'View all',
    this.onPressed,
    required this.title,
  });

  final Color? textColor;
  final bool showActionButton;
  final String title, buttonTitle;
  final void Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          title,
          style: Theme.of(context)
              .textTheme
              .headlineSmall!
              .apply(color: textColor),
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
        ),
        if (showActionButton)
          TextButton(onPressed: onPressed, child: Text(buttonTitle)),
      ],
    );
  }
}

class SearchContainer extends StatelessWidget {
  const SearchContainer({
    super.key,
    required this.text,
    this.icon,
    this.showBackground = true,
    this.showBorder = true,
    this.onTap, this.padding = const EdgeInsets.symmetric(horizontal: TSizes.defaultSpace),
  });

  final String text;
  final IconData? icon;
  final bool showBackground, showBorder;
  final VoidCallback? onTap;
  final EdgeInsets padding;

  @override
  Widget build(BuildContext context) {
    final dark = THelperFunctions.isDarkMode(context);

    return GestureDetector(
      onTap: onTap,
      child: Padding(
        padding: padding,
        child: Container(
          width: TDeviceUtils.getScreenWidth(context),
          padding: const EdgeInsets.all(TSizes.md),
          decoration: BoxDecoration(
              color: showBackground
                  ? dark
                      ? TColors.dark
                      : TColors.light
                  : Colors.transparent,
              borderRadius: showBorder
                  ? BorderRadius.circular(TSizes.cardRadiusLg)
                  : null,
              border: Border.all(color: TColors.grey)),
          child: Row(children: [
            const Icon(
              Iconsax.search_normal,
              color: TColors.darkerGrey,
            ),
            const SizedBox(
              width: TSizes.spaceBtwItems,
            ),
            Text(
              'Search in Store',
              style: Theme.of(context).textTheme.bodySmall,
            )
          ]),
        ),
      ),
    );
  }
}

class HeaderAppBar extends StatelessWidget {
  const HeaderAppBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return CustomAppBar(
      title: Column(
        children: [
          Text(TTexts.homeAppbarTitle,
              style: Theme.of(context)
                  .textTheme
                  .labelMedium!
                  .apply(color: TColors.grey)),
          Text(TTexts.homeAppbarTitle,
              style: Theme.of(context)
                  .textTheme
                  .headlineSmall!
                  .apply(color: TColors.white)),
        ],
      ),
      actions: [
        CartCounterIcon(
          onPressed: () {},
        )
      ],
    );
  }
}

class CartCounterIcon extends StatelessWidget {
  const CartCounterIcon({super.key, required this.onPressed, this.iconColor});
  final VoidCallback onPressed;
  final Color? iconColor;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        IconButton(
            onPressed: () {},
            icon: Icon(
              Iconsax.shopping_bag,
              color: iconColor,
            )),
        Positioned(
          right: 0,
          child: Container(
            width: 18,
            height: 18,
            decoration: BoxDecoration(
                color: TColors.black, borderRadius: BorderRadius.circular(100)),
            child: Center(
                child: Text(
              '2',
              style: Theme.of(context)
                  .textTheme
                  .labelLarge!
                  .apply(color: TColors.white, fontSizeFactor: 0.8),
            )),
          ),
        )
      ],
    );
  }
}

class HomeHeaderWidget extends StatelessWidget {
  const HomeHeaderWidget({
    super.key,
    required this.child,
  });

  final Widget child;
  @override
  Widget build(BuildContext context) {
    return CustomCurvedEdgesWidget(
      child: Container(
        color: TColors.primary,
        padding: const EdgeInsets.all(0),
        child: SizedBox(
          height: 400,
          child: Stack(children: [
            Positioned(
                top: -150,
                right: -250,
                child: CircularWidget(
                  backgroundColor: TColors.textWhite.withOpacity(0.1),
                )),
            Positioned(
                top: 100,
                right: -300,
                child: CircularWidget(
                  backgroundColor: TColors.textWhite.withOpacity(0.1),
                )),
            child,
          ]),
        ),
      ),
    );
  }
}

class CustomCurvedEdgesWidget extends StatelessWidget {
  const CustomCurvedEdgesWidget({super.key, this.child});

  final Widget? child;
  @override
  Widget build(BuildContext context) {
    return ClipPath(clipper: CustomCurvedEdges(), child: child);
  }
}
