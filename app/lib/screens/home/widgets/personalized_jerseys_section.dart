import 'package:flutter/material.dart';
import '../../../core/constants/app_colors.dart';
import '../../../models/user_profile_model.dart';
import '../../store/store_screen.dart';

/// Image 4 & Page 18: Personalized Jersey Top Sellers Section
class PersonalizedJerseysSection extends StatelessWidget {
  const PersonalizedJerseysSection({super.key});

  @override
  Widget build(BuildContext context) {
    final user = UserProfileModel.instance;
    final displayName = user.name.isNotEmpty ? user.name.toUpperCase() : 'HIMANSHU SINGH';
    // Short jersey back name e.g. "HIMANSHU SIN"
    final jerseyBackName = displayName.length > 12 ? displayName.substring(0, 12) : displayName;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Headline matching Image 4
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Text(
            '$displayName, get top sellers at an extra 20% off.',
            style: const TextStyle(
              fontSize: 15,
              fontWeight: FontWeight.w700,
              color: AppColors.textDark,
              height: 1.3,
            ),
          ),
        ),

        const SizedBox(height: 14),

        // Horizontal Jersey Cards Carousel
        SizedBox(
          height: 250,
          child: ListView(
            scrollDirection: Axis.horizontal,
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            children: [
              // 1. Yellow Jersey Card (Image 4)
              _JerseyItemCard(
                primaryColor: AppColors.jerseyYellow, // Yellow
                collarColor: AppColors.jerseyRoyalBlue, // Blue
                name: jerseyBackName,
                number: '98',
                textColor: AppColors.jerseyDarkBlue,
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (_) => const StoreScreen()),
                  );
                },
              ),

              const SizedBox(width: 14),

              // 2. Navy Blue Jersey Card (Image 4)
              _JerseyItemCard(
                primaryColor: AppColors.jerseyRoyalBlue, // Royal Blue
                collarColor: AppColors.jerseyDarkBlue,
                name: jerseyBackName,
                number: '98',
                textColor: Colors.white,
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (_) => const StoreScreen()),
                  );
                },
              ),

              const SizedBox(width: 14),

              // 3. Maroon / Crimson Jersey Card
              _JerseyItemCard(
                primaryColor: AppColors.brandRedDark, // Crimson Maroon
                collarColor: AppColors.brandRedDark,
                name: jerseyBackName,
                number: '98',
                textColor: Colors.white,
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (_) => const StoreScreen()),
                  );
                },
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class _JerseyItemCard extends StatelessWidget {
  final Color primaryColor;
  final Color collarColor;
  final String name;
  final String number;
  final Color textColor;
  final VoidCallback onTap;

  const _JerseyItemCard({
    required this.primaryColor,
    required this.collarColor,
    required this.name,
    required this.number,
    required this.textColor,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 210,
      decoration: BoxDecoration(
        color: AppColors.grey50,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: AppColors.grey200),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.03),
            blurRadius: 6,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        children: [
          // Jersey Visuals (Front & Back)
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(12.0),
              child: Stack(
                alignment: Alignment.center,
                children: [
                  // Front Jersey (slanted on left)
                  Positioned(
                    left: 4,
                    top: 10,
                    child: Container(
                      width: 90,
                      height: 125,
                      decoration: BoxDecoration(
                        color: primaryColor,
                        borderRadius: BorderRadius.circular(12),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withValues(alpha: 0.1),
                            blurRadius: 4,
                          ),
                        ],
                      ),
                      child: Stack(
                        alignment: Alignment.topCenter,
                        children: [
                          // Collar
                          Container(
                            width: 38,
                            height: 18,
                            decoration: BoxDecoration(
                              color: collarColor,
                              borderRadius: const BorderRadius.only(
                                bottomLeft: Radius.circular(10),
                                bottomRight: Radius.circular(10),
                              ),
                            ),
                          ),
                          // Subtle front stripes/logo
                          Positioned(
                            top: 40,
                            child: Icon(
                              Icons.sports_cricket,
                              size: 16,
                              color: textColor.withValues(alpha: 0.6),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),

                  // Back Jersey (main card on right with Name & #98)
                  Positioned(
                    right: 4,
                    bottom: 6,
                    child: Container(
                      width: 105,
                      height: 140,
                      decoration: BoxDecoration(
                        color: primaryColor,
                        borderRadius: BorderRadius.circular(14),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withValues(alpha: 0.18),
                            blurRadius: 6,
                            offset: const Offset(0, 3),
                          ),
                        ],
                      ),
                      child: Stack(
                        alignment: Alignment.topCenter,
                        children: [
                          // Collar Back
                          Container(
                            width: 44,
                            height: 16,
                            decoration: BoxDecoration(
                              color: collarColor,
                              borderRadius: const BorderRadius.only(
                                bottomLeft: Radius.circular(12),
                                bottomRight: Radius.circular(12),
                              ),
                            ),
                          ),
                          // Name & Number
                          Positioned(
                            top: 36,
                            child: Column(
                              children: [
                                Text(
                                  name,
                                  style: TextStyle(
                                    fontSize: 8,
                                    fontWeight: FontWeight.w900,
                                    color: textColor,
                                    letterSpacing: 0.4,
                                  ),
                                ),
                                const SizedBox(height: 2),
                                Text(
                                  number,
                                  style: TextStyle(
                                    fontSize: 34,
                                    fontWeight: FontWeight.w900,
                                    color: textColor,
                                    height: 1.0,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),

          const Divider(height: 1, color: AppColors.grey200),

          // "Get it now ➔" Button Link (Image 4)
          InkWell(
            onTap: onTap,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 14.0, vertical: 10.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: const [
                  Text(
                    'Get it now',
                    style: TextStyle(
                      fontSize: 13,
                      fontWeight: FontWeight.w700,
                      color: AppColors.primaryTeal,
                    ),
                  ),
                  Icon(
                    Icons.arrow_forward_rounded,
                    size: 16,
                    color: AppColors.primaryTeal,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
