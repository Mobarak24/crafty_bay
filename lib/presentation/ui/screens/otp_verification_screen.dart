import 'dart:async';

import 'package:crafty_bay/data/models/otp_verification_controller.dart';
import 'package:crafty_bay/presentation/ui/screens/complete_profile_screen.dart';
import 'package:crafty_bay/presentation/ui/utilis/show_snackbar_message.dart';
import 'package:crafty_bay/presentation/ui/widgets/app_logo_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import '../utilis/app_colors.dart';

class OtpVerificationScreen extends StatefulWidget {
  const OtpVerificationScreen({super.key, required this.email});

  final String email;

  @override
  State<OtpVerificationScreen> createState() => _OtpVerificationScreenState();
}

class _OtpVerificationScreenState extends State<OtpVerificationScreen> {
  final TextEditingController _otpTEController = TextEditingController();
  int resendTime = 12;
  late Timer countDownTimer;
  final OtpVerificationController _otpVerificationController =
      Get.find<OtpVerificationController>();

  void _startTimer() {
    countDownTimer = Timer.periodic(const Duration(seconds: 2),(timer){
      setState(() {
        resendTime --;
      });
      if(resendTime == 0){
        countDownTimer.cancel();
      }
    });
  }
  @override
  void initState() {
    super.initState();
    _startTimer();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            children: [
              const SizedBox(height: 82),
              const AppLogoWidget(),
              Text(
                'Enter OTP Code',
                style: Theme.of(context).textTheme.headlineLarge,
              ),
              const SizedBox(height: 8),
              Text(
                'A 4 digit OTP has been sent to email',
                style: Theme.of(context)
                    .textTheme
                    .bodyLarge
                    ?.copyWith(color: Colors.black54),
              ),
              const SizedBox(height: 8),
              PinCodeTextField(
                length: 6,
                animationType: AnimationType.fade,
                keyboardType: TextInputType.number,
                pinTheme: PinTheme(
                  shape: PinCodeFieldShape.box,
                  borderRadius: BorderRadius.circular(5),
                  fieldHeight: 50,
                  fieldWidth: 40,
                  activeFillColor: Colors.white,
                  selectedFillColor: Colors.white,
                  selectedColor: Colors.green,
                  inactiveFillColor: Colors.white,
                  inactiveColor: AppColors.themeColor,
                ),
                animationDuration: const Duration(milliseconds: 300),
                backgroundColor: Colors.transparent,
                enableActiveFill: true,
                controller: _otpTEController,
                appContext: context,
              ),
              const SizedBox(height: 8),
             GetBuilder<OtpVerificationController>(
                builder: (otpVerificationController) {
                  return Visibility(
                    visible: !otpVerificationController.inProgress,
                    replacement: const Center(
                      child: CircularProgressIndicator(),
                    ),
                    child: ElevatedButton(
                      onPressed: _onTapNextButton,
                      child: const Text('Next'),
                    ),
                  );
                }
              ),
              const SizedBox(height: 16),
              RichText(
                text: TextSpan(
                  text: 'This code will expire in',
                  style: Theme.of(context)
                      .textTheme
                      .bodyLarge
                      ?.copyWith(color: Colors.grey),
                  children:  [
                    TextSpan(
                      text: resendTime.toString(),
                      style: const TextStyle(color: AppColors.themeColor),
                    ),
                  ],
                ),
              ),
              TextButton(onPressed: (){}, child: const Text('Resend code')),
            ],
          ),
        ),
      ),
    );
  }

  void _onTapNextButton() async{
    bool result = await Get.find<OtpVerificationController>()
        .getVerifyOtp(widget.email,_otpTEController.text);

    if(result){
      Get.to(() => const CompleteProfileScreen());
    }else{
      if(mounted){
        showSnackBarMessage(
            context, _otpVerificationController.errorMessage!, true);
      }
    }


  }
}
