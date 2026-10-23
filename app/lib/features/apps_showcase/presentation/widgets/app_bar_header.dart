import 'package:flutter/material.dart';
import '../../../../core/constants/app_colors.dart';
import '../../../../core/constants/app_strings.dart';
import '../../../../core/constants/app_typography.dart';
import '../../../../core/utils/url_helper.dart';
import '../../../../widgets/sports_app_logo.dart';

/// Top Navigation Bar matching CricHeroes Header
class AppBarHeader extends StatelessWidget implements PreferredSizeWidget {
  const AppBarHeader({super.key});

  @override
  Size get preferredSize => const Size.fromHeight(72);

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.sizeOf(context).width;
    final showFullNav = screenWidth >= 1024;

    return Container(
      decoration: const BoxDecoration(
        color: Colors.white,
        border: Border(
          bottom: BorderSide(color: AppColors.divider, width: 1),
        ),
      ),
      padding: EdgeInsets.symmetric(
        horizontal: showFullNav ? 48.0 : 16.0,
        vertical: 12.0,
      ),
      child: SafeArea(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            // Logo
            InkWell(
              onTap: () => UrlHelper.launch(AppStrings.websiteUrl, context: context),
              hoverColor: Colors.transparent,
              child: const SportsAppLogo(height: 34),
            ),

            // Desktop Navigation links
            if (showFullNav) ...[
              Row(
                children: [
                  _HeaderNavLink(
                    title: 'Live Scores',
                    onTap: () => UrlHelper.launch(AppStrings.liveScoresUrl, context: context),
                  ),
                  const SizedBox(width: 24),
                  _HeaderNavLink(
                    title: 'Tournaments',
                    onTap: () => UrlHelper.launch(AppStrings.tournamentsUrl, context: context),
                  ),
                  const SizedBox(width: 24),
                  _HeaderNavLink(
                    title: 'Features',
                    onTap: () {},
                  ),
                  const SizedBox(width: 24),
                  _HeaderNavLink(
                    title: 'Apps',
                    isActive: true,
                    onTap: () {},
                  ),
                  const SizedBox(width: 24),
                  _HeaderNavLink(
                    title: 'Blog',
                    onTap: () => UrlHelper.launch(AppStrings.blogUrl, context: context),
                  ),
                ],
              ),

              // CTA Button
              Row(
                children: [
                  OutlinedButton(
                    onPressed: () => UrlHelper.launch(AppStrings.websiteUrl, context: context),
                    style: OutlinedButton.styleFrom(
                      foregroundColor: AppColors.greyscale90,
                      side: const BorderSide(color: AppColors.cardBorder),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(6),
                      ),
                      padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 12),
                    ),
                    child: Text('Sign In', style: AppTypography.navLink),
                  ),
                  const SizedBox(width: 12),
                  ElevatedButton.icon(
                    onPressed: () => UrlHelper.launch(AppStrings.playStoreUrl, context: context),
                    icon: const Icon(Icons.download_rounded, size: 18, color: Colors.white),
                    label: const Text('Get App', style: TextStyle(fontWeight: FontWeight.w600, color: Colors.white)),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: AppColors.grassGreen,
                      elevation: 0,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(6),
                      ),
                      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
                    ),
                  ),
                ],
              ),
            ] else ...[
              // Mobile Quick Download button
              ElevatedButton(
                onPressed: () => UrlHelper.launch(AppStrings.playStoreUrl, context: context),
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppColors.grassGreen,
                  foregroundColor: Colors.white,
                  elevation: 0,
                  padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 8),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(6),
                  ),
                ),
                child: const Text('Get App', style: TextStyle(fontSize: 13, fontWeight: FontWeight.bold)),
              ),
            ],
          ],
        ),
      ),
    );
  }
}

class _HeaderNavLink extends StatefulWidget {
  final String title;
  final bool isActive;
  final VoidCallback onTap;

  const _HeaderNavLink({
    required this.title,
    this.isActive = false,
    required this.onTap,
  });

  @override
  State<_HeaderNavLink> createState() => _HeaderNavLinkState();
}

class _HeaderNavLinkState extends State<_HeaderNavLink> {
  bool _isHovered = false;

  @override
  Widget build(BuildContext context) {
    final color = widget.isActive
        ? AppColors.primary
        : (_isHovered ? AppColors.primary : AppColors.greyscale90);

    return MouseRegion(
      cursor: SystemMouseCursors.click,
      onEnter: (_) => setState(() => _isHovered = true),
      onExit: (_) => setState(() => _isHovered = false),
      child: GestureDetector(
        onTap: widget.onTap,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              widget.title,
              style: AppTypography.navLink.copyWith(
                color: color,
                fontWeight: widget.isActive ? FontWeight.w700 : FontWeight.w500,
              ),
            ),
            const SizedBox(height: 4),
            AnimatedContainer(
              duration: const Duration(milliseconds: 200),
              height: 2,
              width: widget.isActive ? 20 : (_isHovered ? 16 : 0),
              decoration: BoxDecoration(
                color: widget.isActive ? AppColors.primary : AppColors.primaryLight,
                borderRadius: BorderRadius.circular(2),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
