import 'package:flutter/material.dart';
import '../../../core/constants/app_colors.dart';
import '../../../models/user_profile_model.dart';

/// Page 18: CricHeroes Store Screen
class StoreScreen extends StatelessWidget {
  const StoreScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final user = UserProfileModel.instance;

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: AppColors.headerRed,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () => Navigator.pop(context),
        ),
        title: const Text(
          'CricHeroes Store',
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.w700,
            color: Colors.white,
          ),
        ),
      ),
      body: ListView(
        padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 16.0),
        children: [
          // Personalized Offer Headline
          Text(
            '${user.name}, get top sellers at an extra 20% off.',
            style: const TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w700,
              color: AppColors.textDark,
              height: 1.3,
            ),
          ),

          const SizedBox(height: 24),

          // Custom Jersey Row
          Row(
            children: [
              // Yellow Custom Jersey Card
              Expanded(
                child: _JerseyCard(
                  jerseyColor: const Color(0xFFFACC15),
                  collarColor: const Color(0xFF1D4ED8),
                  playerName: 'HIMANSHU SIN',
                  playerNumber: '98',
                  onGetNow: () {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text('Custom Yellow Jersey added to cart!')),
                    );
                  },
                ),
              ),
              const SizedBox(width: 16),
              // Blue Custom Jersey Card
              Expanded(
                child: _JerseyCard(
                  jerseyColor: const Color(0xFF1E40AF),
                  collarColor: const Color(0xFF1E3A8A),
                  playerName: 'HIMANSHU SIN',
                  playerNumber: '98',
                  onGetNow: () {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text('Custom Blue Jersey added to cart!')),
                    );
                  },
                ),
              ),
            ],
          ),

          const SizedBox(height: 36),

          // Categories Grid
          const Text(
            'Cricket Gear & Merchandise',
            style: TextStyle(
              fontSize: 17,
              fontWeight: FontWeight.w700,
              color: AppColors.textDark,
            ),
          ),
          const SizedBox(height: 16),

          GridView.count(
            crossAxisCount: 2,
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            crossAxisSpacing: 14,
            mainAxisSpacing: 14,
            childAspectRatio: 1.4,
            children: const [
              _StoreCategoryCard(title: 'Custom Uniforms', icon: Icons.sports_tennis),
              _StoreCategoryCard(title: 'Cricket Bats', icon: Icons.sports_cricket),
              _StoreCategoryCard(title: 'Trophy & Medals', icon: Icons.emoji_events),
              _StoreCategoryCard(title: 'Balls & Kits', icon: Icons.sports),
            ],
          ),
        ],
      ),
    );
  }
}

class _JerseyCard extends StatelessWidget {
  final Color jerseyColor;
  final Color collarColor;
  final String playerName;
  final String playerNumber;
  final VoidCallback onGetNow;

  const _JerseyCard({
    required this.jerseyColor,
    required this.collarColor,
    required this.playerName,
    required this.playerNumber,
    required this.onGetNow,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Jersey Visual Container
        Container(
          height: 200,
          decoration: BoxDecoration(
            color: const Color(0xFFF9FAFB),
            borderRadius: BorderRadius.circular(12),
            border: Border.all(color: AppColors.divider),
          ),
          child: Center(
            child: Container(
              width: 120,
              height: 150,
              decoration: BoxDecoration(
                color: jerseyColor,
                borderRadius: BorderRadius.circular(16),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withValues(alpha: 0.1),
                    blurRadius: 8,
                    offset: const Offset(0, 4),
                  ),
                ],
              ),
              child: Stack(
                alignment: Alignment.center,
                children: [
                  // Blue Collar
                  Positioned(
                    top: 0,
                    child: Container(
                      width: 50,
                      height: 20,
                      decoration: BoxDecoration(
                        color: collarColor,
                        borderRadius: const BorderRadius.only(
                          bottomLeft: Radius.circular(16),
                          bottomRight: Radius.circular(16),
                        ),
                      ),
                    ),
                  ),
                  // Player Name & Jersey Number
                  Positioned(
                    top: 40,
                    child: Column(
                      children: [
                        Text(
                          playerName,
                          style: TextStyle(
                            fontSize: 9,
                            fontWeight: FontWeight.w800,
                            color: jerseyColor == const Color(0xFFFACC15)
                                ? const Color(0xFF1E3A8A)
                                : Colors.white,
                          ),
                        ),
                        const SizedBox(height: 4),
                        Text(
                          playerNumber,
                          style: TextStyle(
                            fontSize: 36,
                            fontWeight: FontWeight.w900,
                            color: jerseyColor == const Color(0xFFFACC15)
                                ? const Color(0xFF1E3A8A)
                                : Colors.white,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),

        const SizedBox(height: 10),

        // "Get it now ->" Link
        InkWell(
          onTap: onGetNow,
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: const [
              Text(
                'Get it now',
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w700,
                  color: AppColors.primaryTeal,
                ),
              ),
              SizedBox(width: 4),
              Icon(Icons.arrow_forward_rounded, size: 16, color: AppColors.primaryTeal),
            ],
          ),
        ),
      ],
    );
  }
}

class _StoreCategoryCard extends StatelessWidget {
  final String title;
  final IconData icon;

  const _StoreCategoryCard({required this.title, required this.icon});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: AppColors.surfaceLight,
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: AppColors.divider),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(icon, size: 28, color: AppColors.primaryTeal),
          const SizedBox(height: 8),
          Text(
            title,
            style: const TextStyle(
              fontSize: 13,
              fontWeight: FontWeight.w600,
              color: AppColors.textDark,
            ),
          ),
        ],
      ),
    );
  }
}
