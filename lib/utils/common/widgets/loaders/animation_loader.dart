import 'package:ezom/utils/constants/colors.dart';
import 'package:ezom/utils/constants/sizes.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class TAnimationLoaderWidget extends StatelessWidget {
// Default constructor for the AnimationLoaderWidget.
/* Parameters:
 text: The text to be displayed below the animation.
- animation: The path to the Lottie animation file.
- showAction: Whether to show an action button below the text.
- actionText: The text to be displayed on the action button.
- onActionPressed: Callback function to be executed when the action button is pressed.
*/
  const TAnimationLoaderWidget({
    super.key,
    required this.text,
    required this.animation,
    this.showAction = false,
    this.actionText,
    this.onActionPressed,
  });

  final String text;
  final String animation;
  final bool showAction;
  final String? actionText;
  final VoidCallback? onActionPressed;

  @override
  Widget build(BuildContext context) {
    if (kDebugMode) {
      print("animation loader run hona chahiye");
    }
    return Center(
      child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
        Lottie.asset(animation,
            width: MediaQuery.of(context).size.width *
                0.8), // Display Lottie animation
        const SizedBox(height: TSizes.defaultSpace),
        Text(
          text,
          style: Theme.of(context).textTheme.bodyMedium,
          textAlign: TextAlign.center,
        ), // Text
        const SizedBox(height: TSizes.defaultSpace),
        showAction
            ? SizedBox(
                width: 250,
                child: OutlinedButton(
                  onPressed: onActionPressed,
                  style:
                      OutlinedButton.styleFrom(backgroundColor: TColors.dark),
                  child: Text(
                    actionText!,
                    style: Theme.of(context)
                        .textTheme
                        .bodyMedium!
                        .apply(color: TColors.light),
                  ),
                ),
              )
            : const SizedBox(),
      ]),
    );
  }
}
