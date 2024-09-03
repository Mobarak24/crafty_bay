import 'package:crafty_bay/presentation/ui/screens/otp_verification_screen.dart';
import 'package:crafty_bay/presentation/ui/widgets/app_logo_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class EmailVerificationScreen extends StatefulWidget {
  const EmailVerificationScreen({super.key});

  @override
  State<EmailVerificationScreen> createState() =>
      _EmailVerificationScreenState();
}

class _EmailVerificationScreenState extends State<EmailVerificationScreen> {
  final TextEditingController _emailTEController = TextEditingController();

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
                'Welcome Back',
                style: Theme.of(context).textTheme.headlineLarge,
              ),
              const SizedBox(height: 8),
              Text(
                'Enter your Email address',
                style: Theme.of(context)
                    .textTheme
                    .bodyLarge
                    ?.copyWith(color: Colors.black54),
              ),
              TextFormField(
                controller: _emailTEController,
                decoration: const InputDecoration(
                  hintText: 'Email',
                ),
              ),
              const SizedBox(height: 8),
              ElevatedButton(
                onPressed: _onTapNextButton,
                child: const Text('Next'),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _onTapNextButton() {
    Get.to(() => const OtpVerificationScreen());
  }

  @override
  void dispose() {
    _emailTEController.dispose();
    super.dispose();
  }
}
