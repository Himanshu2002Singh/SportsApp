import 'package:flutter/material.dart';
import '../../../core/constants/app_colors.dart';
import '../../../models/user_profile_model.dart';
import 'gender_screen.dart';
import 'widgets/auth_common_widgets.dart';

/// Page 4: Where do you live?
class CityScreen extends StatefulWidget {
  const CityScreen({super.key});

  @override
  State<CityScreen> createState() => _CityScreenState();
}

class _CityScreenState extends State<CityScreen> {
  late final TextEditingController _cityController;

  @override
  void initState() {
    super.initState();
    _cityController = TextEditingController(text: UserProfileModel.instance.city);
  }

  @override
  void dispose() {
    _cityController.dispose();
    super.dispose();
  }

  void _onNext() {
    final city = _cityController.text.trim();
    if (city.isNotEmpty) {
      UserProfileModel.instance.updateProfile(city: city);
    }
    Navigator.push(
      context,
      MaterialPageRoute(builder: (_) => const GenderScreen()),
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
                'Where do you live?',
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.w700,
                  color: AppColors.textDark,
                ),
              ),

              const SizedBox(height: 10),
              const TitleUnderlineBar(),
              const SizedBox(height: 24),

              // City Input Box
              Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(4),
                  border: Border.all(color: AppColors.inputBorder),
                ),
                child: TextField(
                  controller: _cityController,
                  textCapitalization: TextCapitalization.words,
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                    color: AppColors.textDark,
                  ),
                  decoration: const InputDecoration(
                    hintText: 'Enter your city',
                    hintStyle: TextStyle(color: AppColors.textLight),
                    border: InputBorder.none,
                    contentPadding: EdgeInsets.symmetric(horizontal: 16, vertical: 14),
                  ),
                ),
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
