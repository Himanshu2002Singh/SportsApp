import 'package:flutter/material.dart';
import '../../../../core/constants/app_colors.dart';
import '../../../../core/utils/responsive_layout.dart';
import '../controllers/apps_page_controller.dart';
import '../widgets/app_bar_header.dart';
import '../widgets/feature_demo_player.dart';
import '../widgets/features_grid_section.dart';
import '../widgets/footer_section.dart';
import '../widgets/hero_details_section.dart';
import '../widgets/stats_counter_bar.dart';

/// CricHeroes Apps Showcase Page
/// 100% Faithful replica of https://cricheroes.com/apps
class CricHeroesAppsPage extends StatefulWidget {
  const CricHeroesAppsPage({super.key});

  @override
  State<CricHeroesAppsPage> createState() => _CricHeroesAppsPageState();
}

class _CricHeroesAppsPageState extends State<CricHeroesAppsPage> {
  late final AppsPageController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AppsPageController();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _controller,
      builder: (context, child) {
        return Scaffold(
          backgroundColor: AppColors.background,
          appBar: const AppBarHeader(),
          body: SingleChildScrollView(
            child: Column(
              children: [
                // Hero Split / Stack Section (matching .styles-module-scss-module__3Y2dPq__wrapper)
                ResponsiveLayout(
                  mobile: Column(
                    children: [
                      HeroDetailsSection(controller: _controller),
                      SizedBox(
                        height: 480,
                        width: double.infinity,
                        child: FeatureDemoPlayer(controller: _controller),
                      ),
                    ],
                  ),
                  desktop: SizedBox(
                    height: MediaQuery.of(context).size.height - 72, // Full viewport height minus AppBar
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        // Left Column: Details (Logo, H1, Subtitle, Stores, Ratings)
                        Expanded(
                          flex: 1,
                          child: Center(
                            child: SingleChildScrollView(
                              child: HeroDetailsSection(controller: _controller),
                            ),
                          ),
                        ),

                        // Right Column: Animated Mobile Mockup with red background
                        Expanded(
                          flex: 1,
                          child: FeatureDemoPlayer(controller: _controller),
                        ),
                      ],
                    ),
                  ),
                ),

                // Statistics Counter Bar
                const StatsCounterBar(),

                // CricHeroes Ecosystem Apps & Features
                FeaturesGridSection(controller: _controller),

                // Footer Section
                const FooterSection(),
              ],
            ),
          ),
        );
      },
    );
  }
}
