import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../../../../core/constants/app_assets.dart';
import '../../../../core/constants/app_colors.dart';
import '../../../../core/constants/app_strings.dart';
import '../../../../core/utils/responsive_layout.dart';
import '../../../../core/utils/url_helper.dart';

/// Clean, professional footer matching CricHeroes website
class FooterSection extends StatelessWidget {
  const FooterSection({super.key});

  @override
  Widget build(BuildContext context) {
    final isDesktop = ResponsiveLayout.isDesktop(context);

    return Container(
      color: AppColors.greyscale95,
      padding: EdgeInsets.symmetric(
        horizontal: isDesktop ? 64.0 : 20.0,
        vertical: isDesktop ? 60.0 : 40.0,
      ),
      child: Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 1200),
          child: Column(
            children: [
              // Top Row: Logo & Socials
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  // Logo with brightness filter for dark background
                  ColorFiltered(
                    colorFilter: const ColorFilter.mode(
                      Colors.white,
                      BlendMode.srcIn,
                    ),
                    child: Image.asset(
                      AppAssets.logo,
                      height: 32,
                      fit: BoxFit.contain,
                      errorBuilder: (context, error, stackTrace) => Image.network(
                        AppAssets.remoteLogo,
                        height: 32,
                        fit: BoxFit.contain,
                      ),
                    ),
                  ),

                  // Social Media Icons
                  Row(
                    children: [
                      _SocialIcon(
                        icon: FontAwesomeIcons.facebookF,
                        url: 'https://www.facebook.com/CricHeroes/',
                      ),
                      const SizedBox(width: 12),
                      _SocialIcon(
                        icon: FontAwesomeIcons.xTwitter,
                        url: 'https://twitter.com/CricHeroes',
                      ),
                      const SizedBox(width: 12),
                      _SocialIcon(
                        icon: FontAwesomeIcons.instagram,
                        url: 'https://www.instagram.com/cricheroes/',
                      ),
                      const SizedBox(width: 12),
                      _SocialIcon(
                        icon: FontAwesomeIcons.youtube,
                        url: 'https://www.youtube.com/c/cricheroes',
                      ),
                      const SizedBox(width: 12),
                      _SocialIcon(
                        icon: FontAwesomeIcons.linkedinIn,
                        url: 'https://www.linkedin.com/company/cricheroes/',
                      ),
                    ],
                  ),
                ],
              ),

              const SizedBox(height: 32),
              const Divider(color: Color(0xFF2B2B2B)),
              const SizedBox(height: 24),

              // Bottom Row: Legal & Copyright
              Wrap(
                alignment: isDesktop ? WrapAlignment.spaceBetween : WrapAlignment.center,
                crossAxisAlignment: WrapCrossAlignment.center,
                spacing: 24,
                runSpacing: 16,
                children: [
                  Text(
                    AppStrings.copyright,
                    style: const TextStyle(
                      color: AppColors.greyscale45,
                      fontSize: 13,
                    ),
                  ),
                  Wrap(
                    spacing: 24,
                    runSpacing: 8,
                    children: [
                      _FooterLink(
                        title: 'Terms of Service',
                        onTap: () => UrlHelper.launch('https://cricheroes.com/terms', context: context),
                      ),
                      _FooterLink(
                        title: 'Privacy Policy',
                        onTap: () => UrlHelper.launch('https://cricheroes.com/privacy-policy', context: context),
                      ),
                      _FooterLink(
                        title: 'Contact Support',
                        onTap: () => UrlHelper.launch('https://cricheroes.com/contact-us', context: context),
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _SocialIcon extends StatefulWidget {
  final dynamic icon;
  final String url;

  const _SocialIcon({required this.icon, required this.url});

  @override
  State<_SocialIcon> createState() => _SocialIconState();
}

class _SocialIconState extends State<_SocialIcon> {
  bool _isHovered = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      cursor: SystemMouseCursors.click,
      onEnter: (_) => setState(() => _isHovered = true),
      onExit: (_) => setState(() => _isHovered = false),
      child: GestureDetector(
        onTap: () => UrlHelper.launch(widget.url, context: context),
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 200),
          width: 36,
          height: 36,
          decoration: BoxDecoration(
            color: _isHovered ? AppColors.primary : const Color(0xFF222222),
            shape: BoxShape.circle,
          ),
          child: Center(
            child: FaIcon(
              widget.icon,
              size: 15,
              color: Colors.white,
            ),
          ),
        ),
      ),
    );
  }
}

class _FooterLink extends StatelessWidget {
  final String title;
  final VoidCallback onTap;

  const _FooterLink({required this.title, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Text(
        title,
        style: const TextStyle(
          color: AppColors.greyscale35,
          fontSize: 13,
          fontWeight: FontWeight.w500,
        ),
      ),
    );
  }
}
