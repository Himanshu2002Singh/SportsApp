import 'package:flutter/material.dart';
import '../../../../core/constants/app_assets.dart';
import '../../../../core/constants/app_colors.dart';
import '../../../../core/constants/app_strings.dart';
import '../models/app_item_model.dart';
import '../models/feature_highlight.dart';
import '../models/store_badge_model.dart';

/// Clean repository providing all CricHeroes apps data and feature sets
class AppsRepository {
  const AppsRepository();

  /// Official store badge configurations matching cricheroes.com/apps
  List<StoreBadgeModel> getStoreBadges() {
    return const [
      StoreBadgeModel(
        type: AppStrings.googlePlayTitle,
        logoAsset: AppAssets.playStore,
        remoteLogoUrl: AppAssets.remotePlayStore,
        ratingImgAsset: AppAssets.editorsChoice,
        remoteRatingImgUrl: AppAssets.remoteEditorsChoice,
        rating: AppStrings.playStoreRating,
        downloads: AppStrings.playStoreDownloads,
        url: AppStrings.playStoreUrl,
        isEditorsChoice: true,
      ),
      StoreBadgeModel(
        type: AppStrings.appStoreTitle,
        logoAsset: AppAssets.appStore,
        remoteLogoUrl: AppAssets.remoteAppStore,
        ratingImgAsset: AppAssets.ratingStar,
        remoteRatingImgUrl: AppAssets.remoteRatingStar,
        rating: AppStrings.appStoreRating,
        downloads: AppStrings.appStoreDownloads,
        url: AppStrings.appStoreUrl,
        isEditorsChoice: false,
      ),
    ];
  }

  /// Sports App Product Suite
  List<AppItemModel> getEcosystemApps() {
    return [
      const AppItemModel(
        id: 'cricheroes_flagship',
        name: 'Sports App Cricket App',
        tagline: 'Your Complete Cricket Ecosystem',
        description:
            'Score local cricket matches ball-by-ball, generate international-standard digital scorecards, broadcast live scores, and track your career statistics.',
        category: 'Live Scoring & Analytics',
        rating: '4.8 ★',
        downloads: '4Cr+ Downloads',
        icon: Icons.sports_cricket,
        primaryColor: AppColors.primary,
        bulletFeatures: [
          'Ball-by-ball live digital cricket scoring',
          'TV-grade match broadcast & live streaming graphics',
          'Player profile, career wagon wheel & pitch map',
          'Leaderboards, MVP rankings & match certificates',
        ],
        ctaText: 'Download Sports App',
        androidUrl: AppStrings.playStoreUrl,
        iosUrl: AppStrings.appStoreUrl,
      ),
      const AppItemModel(
        id: 'cricpay',
        name: 'Sports Pay',
        tagline: 'Seamless Match Fees & Tournament Payments',
        description:
            'Effortlessly collect entry fees for tournaments, split ground and match expenses among team members, and get transparent payout reports.',
        category: 'Cricket Finance & Payments',
        rating: '4.7 ★',
        downloads: '10L+ Active Teams',
        icon: Icons.account_balance_wallet_outlined,
        primaryColor: AppColors.secondary,
        bulletFeatures: [
          'Zero-hassle tournament entry fee collections',
          'Automatic per-player match expense splitting',
          'Instant UPI, card, and net-banking payouts',
          'Audited financial statement for team captains',
        ],
        ctaText: 'Explore Sports Pay',
        androidUrl: AppStrings.playStoreUrl,
        iosUrl: AppStrings.appStoreUrl,
      ),
      const AppItemModel(
        id: 'tournament_hub',
        name: 'Sports App Tournament Hub',
        tagline: 'Professional Cricket Tournament Management',
        description:
            'Automate schedule creation, team registrations, points table generation with NRR calculation, and sponsor banner management.',
        category: 'Tournament Operations',
        rating: '4.9 ★',
        downloads: '1.8M+ Tournaments',
        icon: Icons.emoji_events_outlined,
        primaryColor: AppColors.khakhi50,
        bulletFeatures: [
          'Automatic fixture generator (League & Knockout)',
          'Automated points table with Net Run Rate (NRR)',
          'Online registration portal with team approvals',
          'Sponsor promotions and high-res certificate generator',
        ],
        ctaText: 'Manage Tournament',
        androidUrl: AppStrings.playStoreUrl,
        iosUrl: AppStrings.appStoreUrl,
      ),
      const AppItemModel(
        id: 'cricscorer_companion',
        name: 'CricScorer Companion',
        tagline: 'Fast & Lightweight Offline Match Scorer',
        description:
            'A lightweight, battery-saving scoring companion specifically built for official match scorers working in low-connectivity grounds.',
        category: 'Ground Scorer Tool',
        rating: '4.8 ★',
        downloads: '5L+ Match Scorers',
        icon: Icons.edit_note_outlined,
        primaryColor: AppColors.grassGreen,
        bulletFeatures: [
          'Ultra-low battery consumption for full-day matches',
          'Full offline capability with automatic background sync',
          'Rapid single-tap scoring mode with undo & review',
          'Multi-scorer redundancy support',
        ],
        ctaText: 'Start Scoring',
        androidUrl: AppStrings.playStoreUrl,
        iosUrl: AppStrings.appStoreUrl,
      ),
    ];
  }

  /// Core Features Showcase
  List<FeatureHighlight> getFeatureHighlights() {
    return const [
      FeatureHighlight(
        id: 'scoring',
        title: 'Live Ball-by-Ball Scoring',
        description:
            'Record runs, extras, dismissals, commentary, and bowler changes in real-time. Share live match links with fans worldwide.',
        icon: Icons.sports_cricket,
        badgeText: 'Most Loved',
        accentColor: AppColors.primary,
      ),
      FeatureHighlight(
        id: 'streaming',
        title: 'TV-Grade Live Streaming',
        description:
            'Broadcast your matches on YouTube or Facebook with professional TV scorecards, strike rate overlays, and animated lower-thirds.',
        icon: Icons.live_tv_rounded,
        badgeText: 'Pro Feature',
        accentColor: AppColors.secondary,
      ),
      FeatureHighlight(
        id: 'wagon_wheel',
        title: 'Wagon Wheel & Analytics',
        description:
            'Analyze every shot with dynamic wagon wheels, pitch heatmaps, boundary percentages, and detailed match phase breakdowns.',
        icon: Icons.pie_chart_outline_rounded,
        badgeText: 'Smart Stats',
        accentColor: AppColors.grassGreen,
      ),
      FeatureHighlight(
        id: 'tournament',
        title: 'Complete Tournament Manager',
        description:
            'Auto-calculate Net Run Rate, create fixtures, track player of the match awards, and manage player transfer windows.',
        icon: Icons.military_tech_outlined,
        badgeText: 'Automated',
        accentColor: AppColors.khakhi50,
      ),
    ];
  }
}
