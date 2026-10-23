import 'package:flutter/material.dart';
import '../../../../core/constants/app_assets.dart';
import '../../../../core/constants/app_colors.dart';
import '../../../../core/utils/responsive_layout.dart';
import '../controllers/apps_page_controller.dart';

/// The exact right-side red container (.styles-module-scss-module__3Y2dPq__gif)
/// with background-color: var(--color-primary-40) (#E21C28) and feature demonstration
class FeatureDemoPlayer extends StatefulWidget {
  final AppsPageController controller;

  const FeatureDemoPlayer({
    super.key,
    required this.controller,
  });

  @override
  State<FeatureDemoPlayer> createState() => _FeatureDemoPlayerState();
}

class _FeatureDemoPlayerState extends State<FeatureDemoPlayer>
    with SingleTickerProviderStateMixin {
  late AnimationController _pulseController;
  late Animation<double> _pulseAnimation;

  @override
  void initState() {
    super.initState();
    _pulseController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1500),
    )..repeat(reverse: true);

    _pulseAnimation = Tween<double>(begin: 0.98, end: 1.02).animate(
      CurvedAnimation(parent: _pulseController, curve: Curves.easeInOut),
    );
  }

  @override
  void dispose() {
    _pulseController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final isDesktop = ResponsiveLayout.isDesktop(context);

    return Container(
      // CSS: background-color: var(--color-primary-40);
      decoration: const BoxDecoration(
        color: AppColors.primary,
        gradient: LinearGradient(
          colors: [
            AppColors.primary,
            Color(0xFFCC1420),
            Color(0xFFA50E18),
          ],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
      ),
      padding: EdgeInsets.symmetric(
        horizontal: isDesktop ? 48.0 : 20.0,
        vertical: isDesktop ? 48.0 : 36.0,
      ),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
            // Live Match Badge
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 6),
              margin: const EdgeInsets.only(bottom: 20),
              decoration: BoxDecoration(
                color: Colors.white.withValues(alpha: 0.15),
                borderRadius: BorderRadius.circular(20),
                border: Border.all(color: Colors.white.withValues(alpha: 0.3)),
              ),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  FadeTransition(
                    opacity: _pulseAnimation,
                    child: Container(
                      width: 10,
                      height: 10,
                      decoration: const BoxDecoration(
                        color: Colors.white,
                        shape: BoxShape.circle,
                      ),
                    ),
                  ),
                  const SizedBox(width: 8),
                  const Text(
                    'LIVE MATCH SCORING PREVIEW',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 12,
                      fontWeight: FontWeight.w700,
                      letterSpacing: 0.5,
                    ),
                  ),
                ],
              ),
            ),

            // Authentic CricHeroes Feature Mockup GIF
            Flexible(
              child: ScaleTransition(
                scale: _pulseAnimation,
                child: Container(
                  constraints: BoxConstraints(
                    maxHeight: isDesktop ? 620 : 420,
                    maxWidth: isDesktop ? 460 : 320,
                  ),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(24),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withValues(alpha: 0.35),
                        blurRadius: 32,
                        offset: const Offset(0, 16),
                      ),
                    ],
                  ),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(24),
                    child: Image.asset(
                      AppAssets.appsFeature,
                      fit: BoxFit.contain,
                      errorBuilder: (context, error, stackTrace) => Image.network(
                        AppAssets.remoteFeatureGif,
                        fit: BoxFit.contain,
                      ),
                    ),
                  ),
                ),
              ),
            ),

            const SizedBox(height: 24),

            // Interactive Live Ticker Bar
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
              decoration: BoxDecoration(
                color: Colors.black.withValues(alpha: 0.25),
                borderRadius: BorderRadius.circular(12),
                border: Border.all(color: Colors.white.withValues(alpha: 0.15)),
              ),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: const [
                  Icon(Icons.flash_on_rounded, color: AppColors.goldRating, size: 20),
                  SizedBox(width: 8),
                  Flexible(
                    child: Text(
                      'Real-Time Ball-by-Ball Updates & Instant Leaderboards',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 13,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
