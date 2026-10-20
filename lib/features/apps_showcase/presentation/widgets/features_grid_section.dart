import 'package:flutter/material.dart';
import '../../../../core/constants/app_colors.dart';
import '../../../../core/constants/app_strings.dart';
import '../../../../core/constants/app_typography.dart';
import '../../../../core/utils/responsive_layout.dart';
import '../controllers/apps_page_controller.dart';
import 'app_card_item.dart';

/// Section showcasing the CricHeroes ecosystem apps and features
class FeaturesGridSection extends StatelessWidget {
  final AppsPageController controller;

  const FeaturesGridSection({
    super.key,
    required this.controller,
  });

  @override
  Widget build(BuildContext context) {
    final isDesktop = ResponsiveLayout.isDesktop(context);

    return Container(
      color: AppColors.surfaceLight,
      padding: EdgeInsets.symmetric(
        horizontal: isDesktop ? 64.0 : 20.0,
        vertical: isDesktop ? 80.0 : 48.0,
      ),
      child: Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 1200),
          child: Column(
            children: [
              // Section Header
              Text(
                'The CricHeroes Cricket Suite',
                textAlign: TextAlign.center,
                style: isDesktop
                    ? AppTypography.sectionTitle
                    : AppTypography.sectionTitle.copyWith(fontSize: 24),
              ),
              const SizedBox(height: 12),
              ConstrainedBox(
                constraints: const BoxConstraints(maxWidth: 700),
                child: Text(
                  AppStrings.featuresSubheading,
                  textAlign: TextAlign.center,
                  style: isDesktop
                      ? AppTypography.sectionSubtitle
                      : AppTypography.sectionSubtitle.copyWith(fontSize: 14),
                ),
              ),

              const SizedBox(height: 48),

              // Apps Grid with natural sizing
              LayoutBuilder(
                builder: (context, constraints) {
                  final isWide = constraints.maxWidth > 850;
                  final cardWidth = isWide
                      ? (constraints.maxWidth - 24) / 2
                      : constraints.maxWidth;

                  return Wrap(
                    spacing: 24,
                    runSpacing: 24,
                    children: controller.ecosystemApps.map((app) {
                      return SizedBox(
                        width: cardWidth,
                        child: AppCardItem(
                          app: app,
                          isSelected: controller.selectedAppId == app.id,
                          onSelect: () => controller.selectApp(app.id),
                        ),
                      );
                    }).toList(),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
