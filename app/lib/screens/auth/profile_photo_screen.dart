import 'package:flutter/material.dart';
import '../../../core/constants/app_colors.dart';
import '../../../widgets/cricket_art_widgets.dart';
import 'welcome_user_screen.dart';
import 'widgets/auth_common_widgets.dart';

/// Page 6: Add your profile photo (Exact match to Screenshot 1)
class ProfilePhotoScreen extends StatelessWidget {
  const ProfilePhotoScreen({super.key});

  void _onProceed(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (_) => const WelcomeUserScreen()),
    );
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: AppColors.textDark),
          onPressed: () => Navigator.maybePop(context),
        ),
        actions: [
          TextButton(
            onPressed: () => _onProceed(context),
            child: const Text(
              'Skip',
              style: TextStyle(
                fontSize: 15,
                fontWeight: FontWeight.w600,
                color: AppColors.textDark,
              ),
            ),
          ),
          const SizedBox(width: 8),
        ],
      ),
      body: SafeArea(
        child: Stack(
          children: [
            // Subtle curved background wave
            Positioned(
              top: -80,
              right: -60,
              child: Container(
                width: 260,
                height: 260,
                decoration: BoxDecoration(
                  color: const Color(0xFFF3F4F6).withValues(alpha: 0.6),
                  borderRadius: BorderRadius.circular(130),
                ),
              ),
            ),
            Positioned(
              bottom: -60,
              left: -40,
              child: Container(
                width: 220,
                height: 220,
                decoration: BoxDecoration(
                  color: const Color(0xFFF3F4F6).withValues(alpha: 0.6),
                  borderRadius: BorderRadius.circular(110),
                ),
              ),
            ),

            // Content
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 12.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Title
                  const Text(
                    'Add your profile photo',
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.w700,
                      color: AppColors.textDark,
                      letterSpacing: -0.3,
                    ),
                  ),
                  const SizedBox(height: 8),
                  const Text(
                    "Let's make your cricket profile complete with your best photo.",
                    style: TextStyle(
                      fontSize: 14,
                      color: AppColors.textMedium,
                      height: 1.35,
                    ),
                  ),

                  const Spacer(flex: 2),

                  // Batsman with Red Helmet Artwork Card (Screenshot 1)
                  Center(
                    child: CricketHelmetCard(
                      size: (screenWidth * 0.72).clamp(240.0, 300.0),
                    ),
                  ),

                  const Spacer(flex: 3),

                  // Upload from gallery Button
                  CricHeroesButton(
                    text: 'Upload from gallery',
                    onPressed: () => _onProceed(context),
                  ),

                  const SizedBox(height: 12),

                  // Take a selfie Link
                  Center(
                    child: TextButton(
                      onPressed: () => _onProceed(context),
                      child: const Text(
                        'Take a selfie',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                          color: AppColors.primaryTeal,
                        ),
                      ),
                    ),
                  ),

                  const SizedBox(height: 16),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
