import 'dart:async';

import 'package:craftybay/presentation/state_holders/otp_verification_controller.dart';
import 'package:craftybay/presentation/ui/screens/main_bottom_nav_screen.dart';
import 'package:craftybay/presentation/ui/utility/colors.dart';
import 'package:craftybay/presentation/ui/widgets/app_logo.dart';
import 'package:craftybay/presentation/ui/widgets/center_circular_progress_indicator.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

import 'completed_profile_screen.dart';

class OTPVerifyScreen extends StatefulWidget {
  const OTPVerifyScreen({super.key, required this.email});

  final String email;

  @override
  State<OTPVerifyScreen> createState() => _OTPVerifyScreenState();
}

class _OTPVerifyScreenState extends State<OTPVerifyScreen> {
  int _leftTime = 10;
  @override
  void initState() {
    super.initState();
    _startCountDown();
  }

  void _startCountDown() {
    // ignore: unused_local_variable
    dynamic timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (_leftTime > 0) {
        setState(() {
          _leftTime--;
        });
      } else {
        timer.cancel();
      }
    });
  }

  final TextEditingController _otpTEController = TextEditingController();
  final GlobalKey<FormState> _otpValidationFormKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Form(
            key: _otpValidationFormKey,
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
                  "Enter OTP Code",
                  style: Theme.of(context).textTheme.titleLarge,
                ),
                Text(
                  "A 6 Digit OTP Code has been Sent",
                  style: Theme.of(context).textTheme.bodyMedium,
                ),
                const SizedBox(
                  height: 24,
                ),
                PinCodeTextField(
                  controller: _otpTEController,
                  appContext: context,
                  length: 6,
                  enableActiveFill: true,
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  pinTheme: PinTheme(
                    fieldHeight: 50,
                    fieldWidth: 50,
                    shape: PinCodeFieldShape.box,
                    borderRadius: BorderRadius.circular(5),
                    activeColor: CraftyBayAppColors.primaryColor,
                    activeFillColor: CraftyBayAppColors.primaryColor,
                    inactiveColor: CraftyBayAppColors.primaryColor,
                    selectedColor: CraftyBayAppColors.primaryColor,
                    selectedFillColor: CraftyBayAppColors.primaryColor,
                    inactiveFillColor: Colors.white,
                  ),
                ),
                const SizedBox(
                  height: 16,
                ),
                SizedBox(
                  width: double.infinity,
                  child: GetBuilder<OtpVerifyController>(
                      builder: (otpVerifyController) {
                    return Visibility(
                      visible: otpVerifyController.inProgress == false,
                      replacement: const CenterCircularProgressIndicator(),
                      child: ElevatedButton(
                        onPressed: () async {
                          if (_otpValidationFormKey.currentState!.validate()) {
                            final bool response = await otpVerifyController
                                .otpVerify(widget.email, _otpTEController.text);
                            if(response){
                              if(otpVerifyController.navigateCompleteProfile){
                                Get.to(() => const CompletedProfileScreen());
                              } else{
                                Get.to(()=> const MainBottomNavScreen());
                              }
                            } else {
                              Get.showSnackbar(GetSnackBar(
                                isDismissible: true,
                                title: "OTP verification failed",
                                message: otpVerifyController.errorMessage,
                                duration: const Duration(seconds: 3),
                              ));
                            }
                          }
                        },
                        child: const Text("Next"),
                      ),
                    );
                  }),
                ),
                const SizedBox(
                  height: 24,
                ),
                RichText(
                    text: TextSpan(
                        text: "This code will expire in ",
                        style: Theme.of(context).textTheme.bodySmall,
                        children: [
                      TextSpan(
                        text: "${_leftTime}s",
                        style: const TextStyle(
                            color: CraftyBayAppColors.primaryColor,
                            fontSize: 14),
                      )
                    ])),
                TextButton(
                  onPressed: () {
                    if (_leftTime > 0) {
                      return;
                    } else {
                      _leftTime = 15;
                      _startCountDown();
                    }
                  },
                  child: Text(
                    "Resend Code",
                    style: _leftTime == 0
                        ? Theme.of(context).textTheme.bodySmall?.copyWith(
                              color: CraftyBayAppColors.primaryColor,
                            )
                        : Theme.of(context).textTheme.bodySmall,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
