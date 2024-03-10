import 'package:ezom/features/authentication/screens/login/login_social_button.dart';
import 'package:ezom/features/authentication/screens/verify_email/verify_email.dart';
import 'package:ezom/utils/constants/colors.dart';
import 'package:ezom/utils/constants/sizes.dart';
import 'package:ezom/utils/constants/text_strings.dart';
import 'package:ezom/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

class SignupScreen extends StatelessWidget {
  const SignupScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = THelperFunctions.isDarkMode(context);
    return Scaffold(
        appBar: AppBar(),
        body: SingleChildScrollView(
            child: Padding(
                padding: const EdgeInsets.all(TSizes.defaultSpace),
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      /// Title
                      Text(TTexts.signupTitle,
                          style: Theme.of(context).textTheme.headlineMedium),
                      const SizedBox(height: TSizes.spaceBtwSections),

                      /// Form
                      Form(
                          child: Column(children: [
                        Row(children: [
                          // firstName
                          Expanded(
                            child: TextFormField(
                              expands: false,
                              decoration: const InputDecoration(
                                  labelText: TTexts.firstName,
                                  prefixIcon: Icon(Iconsax.user)),
                            ),
                          ),
                          const SizedBox(width: TSizes.spaceBtwInputFields),
                          // LastName
                          Expanded(
                            child: TextFormField(
                              expands: false,
                              decoration: const InputDecoration(
                                  labelText: TTexts.LastName,
                                  prefixIcon: Icon(Iconsax.user)),
                            ),
                          ),
                        ]),
                        const SizedBox(
                          height: TSizes.spaceBtwInputFields,
                        ),
                        // Username
                        TextFormField(
                          expands: false,
                          decoration: const InputDecoration(
                              labelText: TTexts.username,
                              prefixIcon: Icon(Iconsax.user_edit)),
                        ),
                        const SizedBox(
                          height: TSizes.spaceBtwInputFields,
                        ),
                        // Email
                        TextFormField(
                          decoration: const InputDecoration(
                              labelText: TTexts.email,
                              prefixIcon: Icon(Iconsax.direct)),
                        ),
                        const SizedBox(
                          height: TSizes.spaceBtwInputFields,
                        ),
                        // PhoneNo
                        TextFormField(
                          expands: false,
                          decoration: const InputDecoration(
                              labelText: TTexts.phoneNo,
                              prefixIcon: Icon(Iconsax.call)),
                        ),
                        const SizedBox(
                          height: TSizes.spaceBtwInputFields,
                        ),

                        // Password
                        TextFormField(
                          obscureText: true,
                          decoration: const InputDecoration(
                              labelText: TTexts.password,
                              prefixIcon: Icon(Iconsax.password_check),
                              suffixIcon: Icon(Iconsax.eye_slash)),
                        ),
                        

                        const SizedBox(
                          height: TSizes.spaceBtwSections,
                        ),

                        // Terms & Conditions
                        Row(children: [
                          SizedBox(
                            width: 24,
                            height: 24,
                            child: Checkbox(value: true, onChanged: (value) {}),
                          ),
                          const SizedBox(
                            width: TSizes.spaceBtwItems,
                          ),
                          Text.rich(TextSpan(children: [
                            TextSpan(children: [
                              TextSpan(
                                  text: TTexts.iAgreeTo,
                                  style: Theme.of(context).textTheme.bodySmall),
                              TextSpan(
                                  text: TTexts.privacyPolicy,
                                  style: Theme.of(context)
                                      .textTheme
                                      .bodyMedium!
                                      .apply(
                                        color: dark
                                            ? TColors.white
                                            : TColors.primary,
                                            decoration: TextDecoration.underline,
                                      )),
                              TextSpan(
                                  text: TTexts.and,
                                  style: Theme.of(context).textTheme.bodySmall),
                              TextSpan(children: [
                                TextSpan(
                                    text: " ",
                                    style:
                                        Theme.of(context).textTheme.bodySmall),
                                TextSpan(
                                    text: '${TTexts.termsOfUse}',
                                    style: Theme.of(context)
                                        .textTheme
                                        .bodyMedium!
                                        .apply(
                                            color: dark
                                                ? TColors.white
                                                : TColors.primary,
                                            decoration:
                                                TextDecoration.underline,
                                            decorationColor: dark
                                                ? TColors.white
                                                : TColors.primary)),
                              ])
                            ])
                          ]))
                        ]),
                        const SizedBox(
                          height: TSizes.spaceBtwSections,
                        ),
                        // Sign Up Button
                        SizedBox(
                          width: double.infinity,
                          child: ElevatedButton(
                            onPressed: () => Get.to(() => const VerifyEmailScreen()),
                            child: const Text(TTexts.createAccount),
                          ),
                        ),
                        const SizedBox(
                          height: TSizes.spaceBtwSections,
                        ),
                        //  Social Button
                        const SocailButtonWidget()
                      ]))
                    ]))));
  }
}
