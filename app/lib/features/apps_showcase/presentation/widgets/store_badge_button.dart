import 'package:flutter/material.dart';
import '../../../../core/constants/app_colors.dart';
import '../../../../core/constants/app_typography.dart';
import '../../../../core/utils/responsive_layout.dart';
import '../../data/models/store_badge_model.dart';

/// Store badge button matching cricheroes.com/apps StoreLink and StoreLogo
class StoreBadgeButton extends StatefulWidget {
  final StoreBadgeModel badge;
  final VoidCallback onTap;

  const StoreBadgeButton({
    super.key,
    required this.badge,
    required this.onTap,
  });

  @override
  State<StoreBadgeButton> createState() => _StoreBadgeButtonState();
}

class _StoreBadgeButtonState extends State<StoreBadgeButton> {
  bool _isHovered = false;

  @override
  Widget build(BuildContext context) {
    final isDesktop = ResponsiveLayout.isDesktop(context);

    // Desktop store logo height is 95px, mobile is 50px (matching CSS: .storeImage { height: 95px / 50px })
    final storeLogoHeight = isDesktop ? 68.0 : 46.0;
    final ratingIconSize = isDesktop ? 40.0 : 28.0;

    return MouseRegion(
      cursor: SystemMouseCursors.click,
      onEnter: (_) => setState(() => _isHovered = true),
      onExit: (_) => setState(() => _isHovered = false),
      child: GestureDetector(
        onTap: widget.onTap,
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 200),
          transform: Matrix4.diagonal3Values(
            _isHovered ? 1.04 : 1.0,
            _isHovered ? 1.04 : 1.0,
            1.0,
          ),
          curve: Curves.easeOutCubic,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              // Store Logo (Google Play / App Store)
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  boxShadow: _isHovered
                      ? [
                          BoxShadow(
                            color: Colors.black.withValues(alpha: 0.12),
                            blurRadius: 16,
                            offset: const Offset(0, 6),
                          )
                        ]
                      : null,
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(8),
                  child: Image.asset(
                    widget.badge.logoAsset,
                    height: storeLogoHeight,
                    fit: BoxFit.contain,
                    errorBuilder: (context, error, stackTrace) => Image.network(
                      widget.badge.remoteLogoUrl,
                      height: storeLogoHeight,
                      fit: BoxFit.contain,
                    ),
                  ),
                ),
              ),

              const SizedBox(height: 12),

              // Rating Section (Icon + Rating Span)
              Row(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  // Rating Icon (Editor's choice or Star)
                  Image.asset(
                    widget.badge.ratingImgAsset,
                    height: ratingIconSize,
                    width: ratingIconSize,
                    fit: BoxFit.contain,
                    errorBuilder: (context, error, stackTrace) => Image.network(
                      widget.badge.remoteRatingImgUrl,
                      height: ratingIconSize,
                      width: ratingIconSize,
                      fit: BoxFit.contain,
                    ),
                  ),
                  const SizedBox(width: 8),

                  // Rating Text: "4.8 Ratings" (italic)
                  Text(
                    '${widget.badge.rating} Ratings',
                    style: isDesktop
                        ? AppTypography.ratingDesktop
                        : AppTypography.ratingMobile,
                  ),
                ],
              ),

              // Downloads subtitle
              const SizedBox(height: 4),
              Padding(
                padding: const EdgeInsets.only(left: 4.0),
                child: Text(
                  widget.badge.downloads,
                  style: TextStyle(
                    fontSize: isDesktop ? 14 : 12,
                    fontWeight: FontWeight.w500,
                    color: AppColors.greyscale60,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
