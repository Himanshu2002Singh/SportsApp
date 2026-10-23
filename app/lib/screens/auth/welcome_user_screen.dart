import 'package:flutter/material.dart';
import '../../../core/constants/app_colors.dart';
import '../../../models/user_profile_model.dart';
import '../../../widgets/cricket_art_widgets.dart';
import '../home/home_dashboard_screen.dart';
import 'widgets/auth_common_widgets.dart';

/// Page 7: Welcome Screen - "In our world, your cricket matters" (Exact match to Screenshot 2)
class WelcomeUserScreen extends StatelessWidget {
  const WelcomeUserScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final user = UserProfileModel.instance;

    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Stack(
          children: [
            // Subtle curved background shapes matching PDF / Screenshot 2
            Positioned(
              top: -60,
              left: -40,
              child: Container(
                width: 240,
                height: 240,
                decoration: BoxDecoration(
                  color: const Color(0xFFF3F4F6).withValues(alpha: 0.6),
                  borderRadius: BorderRadius.circular(120),
                ),
              ),
            ),
            Positioned(
              top: 40,
              right: -80,
              child: Container(
                width: 300,
                height: 300,
                decoration: BoxDecoration(
                  color: const Color(0xFFF3F4F6).withValues(alpha: 0.5),
                  borderRadius: BorderRadius.circular(150),
                ),
              ),
            ),
            Positioned(
              bottom: -40,
              left: -50,
              child: Container(
                width: 200,
                height: 200,
                decoration: BoxDecoration(
                  color: const Color(0xFFF3F4F6).withValues(alpha: 0.5),
                  borderRadius: BorderRadius.circular(100),
                ),
              ),
            ),

            // Main Content
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 24.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Spacer(flex: 2),

                  // Illustrated Cricketer Face Avatar (Screenshot 2)
                  const Center(
                    child: CricketerAvatarWidget(size: 168),
                  ),

                  const SizedBox(height: 32),

                  // "Welcome"
                  const Text(
                    'Welcome',
                    style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.w400,
                      color: AppColors.textMedium,
                    ),
                  ),

                  const SizedBox(height: 8),

                  // Player Name: "HIMANSHU SINGH"
                  Text(
                    user.name.toUpperCase(),
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.w800,
                      color: AppColors.textDark,
                      letterSpacing: 0.5,
                    ),
                  ),

                  const SizedBox(height: 14),

                  // Horizontal divider line
                  Container(
                    width: 36,
                    height: 2.5,
                    decoration: BoxDecoration(
                      color: AppColors.textDark,
                      borderRadius: BorderRadius.circular(2),
                    ),
                  ),

                  const SizedBox(height: 24),

                  // "In our world, your cricket matters"
                  const Text(
                    'In our world, your cricket matters',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w700,
                      color: AppColors.textDark,
                    ),
                  ),

                  const SizedBox(height: 10),

                  // Subtext
                  const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 16.0),
                    child: Text(
                      "It's time to celebrate the spirit of cricket\nand make your mark.",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 14,
                        color: AppColors.textMedium,
                        height: 1.4,
                      ),
                    ),
                  ),

                  const Spacer(flex: 3),

                  // "Let the games begin" Button
                  CricHeroesButton(
                    text: 'Let the games begin',
                    onPressed: () {
                      Navigator.pushAndRemoveUntil(
                        context,
                        MaterialPageRoute(builder: (_) => const HomeDashboardScreen()),
                        (route) => false,
                      );
                    },
                  ),

                  const SizedBox(height: 24),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
