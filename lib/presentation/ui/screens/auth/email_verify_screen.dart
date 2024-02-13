import 'package:craftybay/presentation/state_holders/send_email_otp_controller.dart';
import 'package:craftybay/presentation/ui/screens/auth/otp_verify_screen.dart';
import 'package:craftybay/presentation/ui/widgets/app_logo.dart';
import 'package:craftybay/presentation/ui/widgets/center_circular_progress_indicator.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class EmailVerifyScreen extends StatefulWidget {
  const EmailVerifyScreen({super.key});

  @override
  State<EmailVerifyScreen> createState() => _EmailVerifyScreenState();
}

class _EmailVerifyScreenState extends State<EmailVerifyScreen> {
  final GlobalKey<FormState> _emailValidationFormKey = GlobalKey<FormState>();
  final TextEditingController _emailTEController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Form(
            key: _emailValidationFormKey,
            child: Column(
              children: [
                const SizedBox(
                  height: 200,
                ),
                const AppLogo(),
                const SizedBox(
                  height: 16,
                ),
                Text(
                  "Welcome Back",
                  style: Theme.of(context).textTheme.titleLarge,
                ),
                Text(
                  "Please enter your email address",
                  style: Theme.of(context).textTheme.bodyMedium,
                ),
                const SizedBox(
                  height: 24,
                ),
                TextFormField(
                  controller: _emailTEController,
                  decoration: const InputDecoration(
                    hintText: "Email Address",
                  ),
                  validator: (value) {
                    if (value?.trim().isEmpty ?? true) {
                      return "Enter Your Email";
                    } else if (!validateEmail(value!)) {
                      return "Invalid Email";
                    }
                    return null;
                  },
                ),
                const SizedBox(
                  height: 16,
                ),
                GetBuilder<SendEmailOtpController>(builder: (controller) {
                  return SizedBox(
                    width: double.infinity,
                    child: Visibility(
                      visible: controller.inProgress == false,
                      replacement: const CenterCircularProgressIndicator(),
                      child: ElevatedButton(
                        onPressed: () async {
                          if (_emailValidationFormKey.currentState!
                              .validate()) {
                            final bool result = await controller
                                .sendOtpToEmail(_emailTEController.text.trim());
                            if (result) {
                              Get.to(() => OTPVerifyScreen(
                                    email: _emailTEController.text.trim(),
                                  ));
                            } else {
                              Get.showSnackbar(GetSnackBar(
                                title: "Send OTP faild",
                                message: controller.errorMessage,
                              ));
                            }
                          }
                        },
                        child: const Text("Next"),
                      ),
                    ),
                  );
                })
              ],
            ),
          ),
        ),
      ),
    );
  }

  bool validateEmail(String email) {
    // Define a regular expression for email validation
    final RegExp emailRegExp =
        RegExp(r'^[a-zA-Z0-9._-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$');

    // Use the RegExp `hasMatch` method to check if the email matches the pattern
    return emailRegExp.hasMatch(email);
  }
}
