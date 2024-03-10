import 'package:ezom/utils/common/styles/common_styles.dart';
import 'package:ezom/features/authentication/screens/login/login_social_button.dart';
import 'package:ezom/features/authentication/screens/signup/signup.dart';
import 'package:ezom/utils/constants/colors.dart';
import 'package:ezom/utils/constants/image_strings.dart';
import 'package:ezom/utils/constants/sizes.dart';
import 'package:ezom/utils/constants/text_strings.dart';
import 'package:ezom/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = THelperFunctions.isDarkMode(context);

    return Scaffold(
        body: SingleChildScrollView(
            child: Padding(
                padding: TSpacingstyle.paddingWithAppBarHeight,
                child: Column(children: [
                  // Logo, Title and Subtitle
                  const LoginHeaderWidget(),

                  // Form
                  const LoginFormWidget(),

                  // Divider
                  Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                    Flexible(
                        child: Divider(
                            color: dark ? TColors.darkGrey : Colors.grey,
                            thickness: 0.5,
                            indent: 60,
                            endIndent: 5)),
                    Text(TTexts.orSignInwith.capitalize!,
                        style: Theme.of(context).textTheme.labelMedium),
                    Flexible(
                        child: Divider(
                            color: dark ? TColors.darkGrey : Colors.grey,
                            thickness: 0.5,
                            indent: 5,
                            endIndent: 60)),
                  ]),

                  const SizedBox(
                    height: TSizes.spaceBtwSections,
                  ),
                  // Footer
                  const SocailButtonWidget()

// decoration: BoxDecoration(border: Border.all(color: TColors.grey), borderRadius: BorderRadius. circular (100)),
                ]))));
  }
}


class LoginFormWidget extends StatelessWidget {
  const LoginFormWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Form(
        child: Padding(
      padding: const EdgeInsets.symmetric(
          vertical: TSizes.spaceBtwSections),
      child: Column(children: [
        TextFormField(
          decoration: const InputDecoration(
              prefixIcon: Icon(Iconsax.direct_right),
              labelText: TTexts.email),
        ),
        const SizedBox(height: TSizes.spaceBtwInputFields),
        TextFormField(
            decoration: const InputDecoration(
          prefixIcon: Icon(Iconsax.password_check),
          labelText: TTexts.password,
          suffixIcon: Icon(Iconsax.eye_slash),
        )),
        const SizedBox(height: TSizes.spaceBtwInputFields / 2),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            /// Remember Me
            Row(children: [
              Checkbox(value: true, onChanged: (value) {}),
              // const Text (TTexts.rememberMe),
            ]),
            TextButton(
              onPressed: () {},
              child: const Text(TTexts.forgetPassword),
            )
          ],
        ),
        const SizedBox(
          height: TSizes.spaceBtwSections,
        ),
        SizedBox(
          width: double.infinity,
          child: ElevatedButton(
            onPressed: () {},
            child: const Text(TTexts.signIn),
          ),
        ),
        const SizedBox(
          height: TSizes.spaceBtwItems,
        ),
        SizedBox(
          width: double.infinity,
          child: OutlinedButton(
            onPressed: () => Get.to(() => const SignupScreen()),
            child: const Text(TTexts.createAccount),
          ),
        ),
        const SizedBox(
          height: TSizes.spaceBtwSections,
        ),
      ]),
    ));
  }
}

class LoginHeaderWidget extends StatelessWidget {
  const LoginHeaderWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Image(
          image: AssetImage(TImages.darkAppLogo),
          height: 150,
        ),
        Text(
          TTexts.LoginTitle,
          style: Theme.of(context).textTheme.headlineMedium,
        ),
        const SizedBox(
          height: TSizes.sm,
        ),
        Text(
          TTexts.LoginSubTitle,
          style: Theme.of(context).textTheme.bodyMedium,
        )
      ],
    );
  }
}