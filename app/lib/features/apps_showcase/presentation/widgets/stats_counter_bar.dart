import 'package:flutter/material.dart';
import '../../../../core/constants/app_colors.dart';
import '../../../../core/constants/app_strings.dart';
import '../../../../core/constants/app_typography.dart';
import '../../../../core/utils/responsive_layout.dart';

/// Global cricket statistics counter bar
class StatsCounterBar extends StatelessWidget {
  const StatsCounterBar({super.key});

  @override
  Widget build(BuildContext context) {
    final isDesktop = ResponsiveLayout.isDesktop(context);

    return Container(
      width: double.infinity,
      color: AppColors.greyscale95,
      padding: EdgeInsets.symmetric(
        horizontal: isDesktop ? 64.0 : 20.0,
        vertical: isDesktop ? 48.0 : 32.0,
      ),
      child: Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 1200),
          child: Wrap(
            alignment: WrapAlignment.spaceAround,
            runSpacing: 24.0,
            spacing: 32.0,
            children: const [
              _StatItem(
                value: AppStrings.statCricketers,
                label: AppStrings.statCricketersLabel,
                icon: Icons.groups_rounded,
                accentColor: AppColors.primary,
              ),
              _StatItem(
                value: AppStrings.statMatches,
                label: AppStrings.statMatchesLabel,
                icon: Icons.sports_cricket_rounded,
                accentColor: AppColors.secondary,
              ),
              _StatItem(
                value: AppStrings.statTournaments,
                label: AppStrings.statTournamentsLabel,
                icon: Icons.emoji_events_rounded,
                accentColor: AppColors.khakhi50,
              ),
              _StatItem(
                value: AppStrings.statRating,
                label: AppStrings.statRatingLabel,
                icon: Icons.star_rounded,
                accentColor: AppColors.goldRating,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _StatItem extends StatelessWidget {
  final String value;
  final String label;
  final IconData icon;
  final Color accentColor;

  const _StatItem({
    required this.value,
    required this.label,
    required this.icon,
    required this.accentColor,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: const BoxConstraints(minWidth: 200),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: accentColor.withValues(alpha: 0.15),
              borderRadius: BorderRadius.circular(12),
            ),
            child: Icon(icon, color: accentColor, size: 28),
          ),
          const SizedBox(width: 16),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                value,
                style: AppTypography.heroHeadingMobile.copyWith(
                  color: Colors.white,
                  fontWeight: FontWeight.w800,
                  fontSize: 28,
                ),
              ),
              const SizedBox(height: 4),
              Text(
                label,
                style: const TextStyle(
                  color: AppColors.greyscale30,
                  fontSize: 13,
                  fontWeight: FontWeight.w400,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
