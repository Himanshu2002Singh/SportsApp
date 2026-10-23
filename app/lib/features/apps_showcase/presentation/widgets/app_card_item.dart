import 'package:flutter/material.dart';
import '../../../../core/constants/app_colors.dart';
import '../../../../core/constants/app_typography.dart';
import '../../../../core/utils/url_helper.dart';
import '../../data/models/app_item_model.dart';

/// Card component displaying each app in the CricHeroes product suite
class AppCardItem extends StatefulWidget {
  final AppItemModel app;
  final bool isSelected;
  final VoidCallback onSelect;

  const AppCardItem({
    super.key,
    required this.app,
    this.isSelected = false,
    required this.onSelect,
  });

  @override
  State<AppCardItem> createState() => _AppCardItemState();
}

class _AppCardItemState extends State<AppCardItem> {
  bool _isHovered = false;

  @override
  Widget build(BuildContext context) {
    final app = widget.app;

    return MouseRegion(
      cursor: SystemMouseCursors.click,
      onEnter: (_) => setState(() => _isHovered = true),
      onExit: (_) => setState(() => _isHovered = false),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 250),
        curve: Curves.easeOutCubic,
        transform: Matrix4.translationValues(0.0, _isHovered ? -6.0 : 0.0, 0.0),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(16),
          border: Border.all(
            color: widget.isSelected
                ? app.primaryColor
                : (_isHovered ? app.primaryColor.withValues(alpha: 0.5) : AppColors.cardBorder),
            width: widget.isSelected ? 2.0 : 1.0,
          ),
          boxShadow: [
            BoxShadow(
              color: _isHovered
                  ? app.primaryColor.withValues(alpha: 0.12)
                  : Colors.black.withValues(alpha: 0.04),
              blurRadius: _isHovered ? 24 : 8,
              offset: Offset(0, _isHovered ? 12 : 4),
            ),
          ],
        ),
        padding: const EdgeInsets.all(24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Header Row: Icon + Category Badge
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  padding: const EdgeInsets.all(12),
                  decoration: BoxDecoration(
                    color: app.primaryColor.withValues(alpha: 0.12),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Icon(app.icon, color: app.primaryColor, size: 28),
                ),
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                  decoration: BoxDecoration(
                    color: AppColors.surfaceLight,
                    borderRadius: BorderRadius.circular(20),
                    border: Border.all(color: AppColors.cardBorder),
                  ),
                  child: Text(
                    app.category,
                    style: const TextStyle(
                      fontSize: 11,
                      fontWeight: FontWeight.w600,
                      color: AppColors.greyscale60,
                    ),
                  ),
                ),
              ],
            ),

            const SizedBox(height: 20),

            // App Name
            Text(
              app.name,
              style: AppTypography.sectionTitle.copyWith(fontSize: 20),
            ),

            const SizedBox(height: 6),

            // Tagline
            Text(
              app.tagline,
              style: TextStyle(
                fontSize: 13,
                fontWeight: FontWeight.w600,
                color: app.primaryColor,
              ),
            ),

            const SizedBox(height: 12),

            // Description
            Text(
              app.description,
              style: const TextStyle(
                fontSize: 14,
                color: AppColors.greyscale60,
                height: 1.5,
              ),
            ),

            const SizedBox(height: 16),

            // Bullet features
            ...app.bulletFeatures.map(
              (f) => Padding(
                padding: const EdgeInsets.only(bottom: 8.0),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Icon(
                      Icons.check_circle_rounded,
                      size: 16,
                      color: app.primaryColor,
                    ),
                    const SizedBox(width: 8),
                    Expanded(
                      child: Text(
                        f,
                        style: const TextStyle(
                          fontSize: 13,
                          color: AppColors.greyscale90,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),

            const SizedBox(height: 16),
            const Divider(color: AppColors.divider),
            const SizedBox(height: 12),

            // Rating & Download CTA
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    const Icon(Icons.star_rounded, color: AppColors.goldRating, size: 18),
                    const SizedBox(width: 4),
                    Text(
                      app.rating,
                      style: const TextStyle(fontWeight: FontWeight.w700, fontSize: 13),
                    ),
                  ],
                ),
                ElevatedButton(
                  onPressed: () => UrlHelper.launch(app.androidUrl, context: context),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: app.primaryColor,
                    foregroundColor: Colors.white,
                    elevation: 0,
                    padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(6),
                    ),
                  ),
                  child: Text(
                    app.ctaText,
                    style: const TextStyle(fontSize: 12, fontWeight: FontWeight.bold),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
