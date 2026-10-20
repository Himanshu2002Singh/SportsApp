import 'package:flutter/material.dart';
import '../../../core/constants/app_colors.dart';
import '../../../models/user_profile_model.dart';
import 'profile_photo_screen.dart';
import 'widgets/auth_common_widgets.dart';

/// Page 5: Select your gender
class GenderScreen extends StatefulWidget {
  const GenderScreen({super.key});

  @override
  State<GenderScreen> createState() => _GenderScreenState();
}

class _GenderScreenState extends State<GenderScreen> {
  String _selectedGender = UserProfileModel.instance.gender;

  void _onNext() {
    UserProfileModel.instance.updateProfile(gender: _selectedGender);
    Navigator.push(
      context,
      MaterialPageRoute(builder: (_) => const ProfilePhotoScreen()),
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
                'Select your gender',
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.w700,
                  color: AppColors.textDark,
                ),
              ),

              const SizedBox(height: 10),
              const TitleUnderlineBar(),
              const SizedBox(height: 24),

              // Gender Options
              _GenderOptionCard(
                label: 'Male',
                isSelected: _selectedGender == 'Male',
                onTap: () => setState(() => _selectedGender = 'Male'),
              ),
              const SizedBox(height: 12),
              _GenderOptionCard(
                label: 'Female',
                isSelected: _selectedGender == 'Female',
                onTap: () => setState(() => _selectedGender = 'Female'),
              ),
              const SizedBox(height: 12),
              _GenderOptionCard(
                label: 'Prefer not to say',
                isSelected: _selectedGender == 'Prefer not to say',
                onTap: () => setState(() => _selectedGender = 'Prefer not to say'),
              ),

              const SizedBox(height: 24),

              // Next Button
              CricHeroesButton(
                text: 'Next',
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

class _GenderOptionCard extends StatelessWidget {
  final String label;
  final bool isSelected;
  final VoidCallback onTap;

  const _GenderOptionCard({
    required this.label,
    required this.isSelected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(4),
      child: Container(
        width: double.infinity,
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
        decoration: BoxDecoration(
          color: isSelected ? AppColors.primaryTealLight.withValues(alpha: 0.3) : Colors.white,
          borderRadius: BorderRadius.circular(4),
          border: Border.all(
            color: isSelected ? AppColors.primaryTeal : AppColors.inputBorder,
            width: isSelected ? 1.5 : 1.0,
          ),
        ),
        child: Text(
          label,
          style: TextStyle(
            fontSize: 16,
            fontWeight: isSelected ? FontWeight.w600 : FontWeight.w400,
            color: isSelected ? AppColors.primaryTealDark : AppColors.textMedium,
          ),
        ),
      ),
    );
  }
}
