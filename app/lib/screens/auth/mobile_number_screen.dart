import 'package:flutter/material.dart';
import '../../../core/constants/app_colors.dart';
import '../../../models/user_profile_model.dart';
import 'full_name_screen.dart';
import 'widgets/auth_common_widgets.dart';

/// Page 2: Enter your mobile number
class MobileNumberScreen extends StatefulWidget {
  const MobileNumberScreen({super.key});

  @override
  State<MobileNumberScreen> createState() => _MobileNumberScreenState();
}

class _MobileNumberScreenState extends State<MobileNumberScreen> {
  final TextEditingController _phoneController =
      TextEditingController(text: '9837100731');

  @override
  void dispose() {
    _phoneController.dispose();
    super.dispose();
  }

  void _onNext() {
    final phone = _phoneController.text.trim();
    if (phone.isNotEmpty) {
      UserProfileModel.instance.updateProfile(mobileNumber: phone);
    }
    Navigator.push(
      context,
      MaterialPageRoute(builder: (_) => const FullNameScreen()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: const OnboardingAppBar(),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Spacer(),

              // Title
              const Text(
                'Enter your mobile number',
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.w700,
                  color: AppColors.textDark,
                ),
              ),

              const SizedBox(height: 10),
              const TitleUnderlineBar(),
              const SizedBox(height: 24),

              // Phone Number Input Container
              Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(4),
                  border: Border.all(color: AppColors.inputBorder),
                ),
                child: Row(
                  children: [
                    // Country Flag & Prefix
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 14),
                      decoration: const BoxDecoration(
                        border: Border(
                          right: BorderSide(color: AppColors.inputBorder),
                        ),
                      ),
                      child: Row(
                        children: const [
                          Text('🇮🇳', style: TextStyle(fontSize: 20)),
                          SizedBox(width: 8),
                          Text(
                            '+91',
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w600,
                              color: AppColors.textDark,
                            ),
                          ),
                        ],
                      ),
                    ),

                    // Phone text input
                    Expanded(
                      child: TextField(
                        controller: _phoneController,
                        keyboardType: TextInputType.phone,
                        style: const TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                          color: AppColors.textDark,
                          letterSpacing: 1.0,
                        ),
                        decoration: const InputDecoration(
                          hintText: '0000000000',
                          hintStyle: TextStyle(color: AppColors.textLight),
                          border: InputBorder.none,
                          contentPadding: EdgeInsets.symmetric(horizontal: 14),
                        ),
                      ),
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 24),

              // Let's Play Button
              CricHeroesButton(
                text: "Let's play",
                onPressed: _onNext,
              ),

              const SizedBox(height: 24),
            ],
          ),
        ),
      ),
    );
  }
}
