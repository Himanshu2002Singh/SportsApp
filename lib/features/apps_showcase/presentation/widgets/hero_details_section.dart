import 'package:flutter/material.dart';
import '../../../../core/constants/app_colors.dart';
import '../../../../core/constants/app_strings.dart';
import '../../../../core/constants/app_typography.dart';
import '../../../../core/utils/responsive_layout.dart';
import '../../../../core/utils/url_helper.dart';
import '../controllers/apps_page_controller.dart';
import 'store_badge_button.dart';
import '../../../../widgets/sports_app_logo.dart';

/// The exact left-side Details Section from cricheroes.com/apps
class HeroDetailsSection extends StatelessWidget {
  final AppsPageController controller;

  const HeroDetailsSection({
    super.key,
    required this.controller,
  });

  @override
  Widget build(BuildContext context) {
    final isDesktop = ResponsiveLayout.isDesktop(context);

    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: isDesktop ? 64.0 : 20.0,
        vertical: isDesktop ? 48.0 : 24.0,
      ),
      child: Column(
        crossAxisAlignment:
            isDesktop ? CrossAxisAlignment.start : CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          // Sports App Logo
          InkWell(
            onTap: () => UrlHelper.launch(AppStrings.websiteUrl, context: context),
            hoverColor: Colors.transparent,
            child: SportsAppLogo(
              height: isDesktop ? 60 : 44,
            ),
          ),

          SizedBox(height: isDesktop ? 48 : 24),

          // Tagline Badge
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 6),
            decoration: BoxDecoration(
              color: AppColors.primaryTransparent,
              borderRadius: BorderRadius.circular(20),
              border: Border.all(color: AppColors.primaryLight.withValues(alpha: 0.3)),
            ),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                const Icon(
                  Icons.sports_cricket,
                  size: 16,
                  color: AppColors.primary,
                ),
                const SizedBox(width: 8),
                Text(
                  AppStrings.heroTagline,
                  style: const TextStyle(
                    fontSize: 13,
                    fontWeight: FontWeight.w600,
                    color: AppColors.primary,
                  ),
                ),
              ],
            ),
          ),

          SizedBox(height: isDesktop ? 24 : 16),

          // H1 Headline: "Keep track of everything cricket!"
          Text(
            AppStrings.heroTitle,
            textAlign: isDesktop ? TextAlign.left : TextAlign.center,
            style: isDesktop
                ? AppTypography.heroHeadingDesktop
                : AppTypography.heroHeadingMobile,
          ),

          SizedBox(height: isDesktop ? 16 : 12),

          // Paragraph Subtitle: "Download our free and easy-to-use cricket scoring app."
          Text(
            AppStrings.heroSubtitle,
            textAlign: isDesktop ? TextAlign.left : TextAlign.center,
            style: isDesktop
                ? AppTypography.heroSubtitleDesktop
                : AppTypography.heroSubtitleMobile,
          ),

          SizedBox(height: isDesktop ? 36 : 24),

          // Stores Section (Google Play & App Store buttons)
          Wrap(
            spacing: isDesktop ? 32.0 : 20.0,
            runSpacing: 20.0,
            alignment: isDesktop ? WrapAlignment.start : WrapAlignment.center,
            children: controller.storeBadges.map((badge) {
              return StoreBadgeButton(
                badge: badge,
                onTap: () => controller.onStoreBadgeTap(context, badge),
              );
            }).toList(),
          ),

          SizedBox(height: isDesktop ? 36 : 24),

          // Quick trust indicators
          Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Icon(Icons.verified, size: 18, color: AppColors.grassGreen),
              const SizedBox(width: 6),
              Flexible(
                child: Text(
                  'Trusted by 4 Crore+ Grassroots Cricketers Globally',
                  style: TextStyle(
                    fontSize: isDesktop ? 14 : 12,
                    fontWeight: FontWeight.w500,
                    color: AppColors.greyscale60,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
