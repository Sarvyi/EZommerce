import 'package:ezom/features/authentication/controllers/signup_controller.dart';
import 'package:ezom/features/authentication/screens/login/login_social_button.dart';
import 'package:ezom/utils/constants/colors.dart';
import 'package:ezom/utils/constants/sizes.dart';
import 'package:ezom/utils/constants/text_strings.dart';
import 'package:ezom/utils/helpers/helper_functions.dart';
import 'package:ezom/utils/validators/validation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

class SignupScreen extends StatelessWidget {
  const SignupScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = THelperFunctions.isDarkMode(context);
    final controller = Get.put(SignupController());

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
                          key: controller.signupFormKey,
                          child: Column(children: [
                            Row(children: [
                              // firstName
                              Expanded(
                                child: TextFormField(
                                  controller: controller.firstName,
                                  validator: (value) =>
                                      TValidator.validateEmptyText(
                                          'First Name', value),
                                  autovalidateMode: AutovalidateMode.onUserInteraction,
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
                                  controller: controller.lastName,
                                  validator: (value) =>
                                      TValidator.validateEmptyText(
                                          'Last Name', value),
                                  expands: false,
                                  autovalidateMode: AutovalidateMode.onUserInteraction,
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
                              controller: controller.username,
                              validator: (value) =>
                                      TValidator.validateEmptyText(
                                          'Last Name', value),
                              expands: false,
                              autovalidateMode: AutovalidateMode.onUserInteraction,
                              decoration: const InputDecoration(
                                  labelText: TTexts.username,
                                  prefixIcon: Icon(Iconsax.user_edit)),
                            ),
                            const SizedBox(
                              height: TSizes.spaceBtwInputFields,
                            ),


                            // Email
                            TextFormField(
                              controller: controller.email,
                              validator: (value) =>
                                  TValidator.validateEmail(value),
                              autovalidateMode: AutovalidateMode.onUserInteraction,
                              decoration: const InputDecoration(
                                  labelText: TTexts.email,
                                  prefixIcon: Icon(Iconsax.direct)),
                            ),
                            const SizedBox(
                              height: TSizes.spaceBtwInputFields,
                            ),

                            // PhoneNo
                            TextFormField(
                              controller: controller.phoneNumber,
                              validator: (value) =>
                                  TValidator.validatePhoneNumber(value),
                              autovalidateMode: AutovalidateMode.onUserInteraction,
                              expands: false,
                              decoration: const InputDecoration(
                                  labelText: TTexts.phoneNo,
                                  prefixIcon: Icon(Iconsax.call)),
                            ),
                            const SizedBox(
                              height: TSizes.spaceBtwInputFields,
                            ),

                            // Password
                            Obx(
                              () => TextFormField(
                                controller: controller.password,
                                validator: (value) =>
                                    TValidator.validatePassword(value),
                                autovalidateMode: AutovalidateMode.onUserInteraction,
                                obscureText: controller.hidePassword.value,
                                decoration: InputDecoration(
                                    labelText: TTexts.password,
                                    prefixIcon:
                                        const Icon(Iconsax.password_check),
                                    // suffixIcon: Icon(Iconsax.eye_slash)),
                                    suffixIcon: IconButton(
                                        onPressed: () =>
                                            controller.hidePassword.value =
                                                !controller.hidePassword.value,
                                        icon: Icon(controller.hidePassword.value
                                            ? Iconsax.eye_slash
                                            : Iconsax.eye))),
                              ),
                            ),

                            const SizedBox(
                              height: TSizes.spaceBtwSections,
                            ),

                            // Terms & Conditions
                            TermsAndConditions(dark: dark),
                            const SizedBox(
                              height: TSizes.spaceBtwSections,
                            ),

                            // Sign Up Button
                            SizedBox(
                              width: double.infinity,
                              child: ElevatedButton(
                                child: const Text(TTexts.createAccount),
                                onPressed: () => controller.signup(),
                                // onPressed: () => { controller.signupFormKey.currentState!.validate() },
                              ),
                            ),
                            const SizedBox(
                              height: TSizes.spaceBtwSections,
                            ),
                            //  Social Button
                            const SocialButtonWidget(),
                          ]))
                    ]))));
  }
}

class TermsAndConditions extends StatelessWidget {
  const TermsAndConditions({
    super.key,
    required this.dark,
  });

  final bool dark;
  @override
  Widget build(BuildContext context) {
    final controller = SignupController.instance;
    return Row(children: [
      SizedBox(
        width: 24,
        height: 24,
        child: Obx(() => Checkbox(
            value: controller.privacyPolicy.value,
            onChanged: (value) => {
                  controller.privacyPolicy.value =
                      !controller.privacyPolicy.value
                })),
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
              style: Theme.of(context).textTheme.bodyMedium!.apply(
                    color: dark ? TColors.white : TColors.primary,
                    decoration: TextDecoration.underline,
                  )),
          TextSpan(
              text: TTexts.and, style: Theme.of(context).textTheme.bodySmall),
          TextSpan(children: [
            TextSpan(text: " ", style: Theme.of(context).textTheme.bodySmall),
            TextSpan(
                text: '${TTexts.termsOfUse}',
                style: Theme.of(context).textTheme.bodyMedium!.apply(
                    color: dark ? TColors.white : TColors.primary,
                    decoration: TextDecoration.underline,
                    decorationColor: dark ? TColors.white : TColors.primary)),
          ])
        ])
      ]))
    ]);
  }
}
