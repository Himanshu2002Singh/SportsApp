import 'package:flutter/material.dart';
import '../../../core/constants/app_colors.dart';
import '../../../models/user_profile_model.dart';
import '../../../widgets/cricket_art_widgets.dart';
import '../../match/start_match_screen.dart';
import '../../profile/profile_screen.dart';
import '../../store/store_screen.dart';
import '../../tournament/add_tournament_screen.dart';

/// Page 14: CricHeroes Sidebar Navigation Drawer (Exact match to Screenshot 4)
class AppDrawer extends StatelessWidget {
  const AppDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    final user = UserProfileModel.instance;

    return Drawer(
      backgroundColor: Colors.white,
      child: SafeArea(
        top: false,
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            // Dark Charcoal Header matching Screenshot 4
            InkWell(
              onTap: () {
                Navigator.pop(context);
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (_) => const ProfileScreen()),
                );
              },
              child: Container(
                color: AppColors.drawerHeaderDark,
                padding: EdgeInsets.only(
                  top: MediaQuery.of(context).padding.top + 20,
                  left: 20,
                  right: 20,
                  bottom: 20,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        // Cricketer Avatar
                        const CricketerAvatarWidget(size: 56),

                        const SizedBox(width: 14),

                        // Name, Phone & Free User Badge
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                user.name.toUpperCase(),
                                style: const TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w700,
                                  color: Colors.white,
                                  letterSpacing: 0.3,
                                ),
                              ),
                              const SizedBox(height: 3),
                              Text(
                                user.mobileNumber,
                                style: const TextStyle(
                                  fontSize: 13,
                                  color: Colors.white70,
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                              const SizedBox(height: 6),
                              Container(
                                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
                                decoration: BoxDecoration(
                                  color: const Color(0xFF33383F),
                                  borderRadius: BorderRadius.circular(10),
                                  border: Border.all(
                                    color: Colors.white.withValues(alpha: 0.25),
                                    width: 0.8,
                                  ),
                                ),
                                child: const Text(
                                  'Free User',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 11,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),

                        // Circle Chevron Right Arrow
                        Container(
                          width: 28,
                          height: 28,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            border: Border.all(
                              color: Colors.white.withValues(alpha: 0.7),
                              width: 1.2,
                            ),
                          ),
                          child: const Icon(
                            Icons.chevron_right,
                            color: Colors.white,
                            size: 18,
                          ),
                        ),
                      ],
                    ),

                    const SizedBox(height: 18),

                    // 50% Blue/Cyan Progress Bar
                    Row(
                      children: [
                        Expanded(
                          flex: 1,
                          child: Container(
                            height: 3.5,
                            decoration: BoxDecoration(
                              color: AppColors.cyanProgress,
                              borderRadius: BorderRadius.circular(2),
                            ),
                          ),
                        ),
                        Expanded(
                          flex: 1,
                          child: Container(
                            height: 3.5,
                            decoration: BoxDecoration(
                              color: const Color(0xFF4B5563),
                              borderRadius: BorderRadius.circular(2),
                            ),
                          ),
                        ),
                        const SizedBox(width: 8),
                        const Text(
                          '50%',
                          style: TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.w500,
                            color: Colors.white70,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),

            // Drawer Items List (Page 14 / Screenshot 4)
            const SizedBox(height: 8),

            // 1. PRO at ₹199
            _DrawerItem(
              title: 'PRO at ₹199',
              leadingBadge: Container(
                padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 2),
                decoration: BoxDecoration(
                  border: Border.all(color: AppColors.textDark, width: 1.2),
                  borderRadius: BorderRadius.circular(4),
                ),
                child: const Text(
                  'PRO',
                  style: TextStyle(
                    color: AppColors.textDark,
                    fontSize: 10,
                    fontWeight: FontWeight.w800,
                  ),
                ),
              ),
              onTap: () => Navigator.pop(context),
            ),

            // 2. Add a Tournament/Series (Free)
            _DrawerItem(
              icon: Icons.emoji_events_outlined,
              title: 'Add a Tournament/Series',
              trailingBadge: const _FreeBadge(),
              onTap: () {
                Navigator.pop(context);
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (_) => const AddTournamentScreen()),
                );
              },
            ),

            // 3. Start A Match (Free)
            _DrawerItem(
              icon: Icons.radio_button_checked_rounded,
              title: 'Start A Match',
              trailingBadge: const _FreeBadge(),
              onTap: () {
                Navigator.pop(context);
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (_) => const StartMatchScreen()),
                );
              },
            ),

            // 4. Go Live
            _DrawerItem(
              icon: Icons.videocam_outlined,
              title: 'Go Live',
              onTap: () => Navigator.pop(context),
            ),

            // 5. My Cricket
            _DrawerItem(
              icon: Icons.sports_cricket_outlined,
              title: 'My Cricket',
              onTap: () {
                Navigator.pop(context);
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (_) => const ProfileScreen()),
                );
              },
            ),

            // 6. My Performance
            _DrawerItem(
              icon: Icons.bar_chart_rounded,
              title: 'My Performance',
              onTap: () => Navigator.pop(context),
            ),

            // 7. CricHeroes Store (with yellow jersey #7 icon)
            _DrawerItem(
              icon: Icons.shopping_bag_outlined,
              title: 'CricHeroes Store',
              trailingBadge: const Text(
                '👕 7',
                style: TextStyle(
                  fontSize: 13,
                  fontWeight: FontWeight.bold,
                ),
              ),
              onTap: () {
                Navigator.pop(context);
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (_) => const StoreScreen()),
                );
              },
            ),

            // 8. Leaderboards
            _DrawerItem(
              icon: Icons.leaderboard_outlined,
              title: 'Leaderboards',
              onTap: () => Navigator.pop(context),
            ),

            // 9. CricHeroes Awards
            _DrawerItem(
              icon: Icons.military_tech_outlined,
              title: 'CricHeroes Awards',
              onTap: () => Navigator.pop(context),
            ),

            // 10. Associations
            _DrawerItem(
              icon: Icons.hub_outlined,
              title: 'Associations',
              onTap: () => Navigator.pop(context),
            ),

            // 11. Clubs
            _DrawerItem(
              icon: Icons.account_balance_outlined,
              title: 'Clubs',
              onTap: () => Navigator.pop(context),
            ),

            // 12. Contact
            _DrawerItem(
              icon: Icons.call_outlined,
              title: 'Contact',
              onTap: () => Navigator.pop(context),
            ),

            // 13. Share the app
            _DrawerItem(
              icon: Icons.share_outlined,
              title: 'Share the app',
              onTap: () => Navigator.pop(context),
            ),

            // 14. Rate us
            _DrawerItem(
              icon: Icons.star_outline_rounded,
              title: 'Rate us',
              onTap: () => Navigator.pop(context),
            ),

            // 15. App code
            _DrawerItem(
              icon: Icons.dialpad_rounded,
              title: 'App code',
              onTap: () => Navigator.pop(context),
            ),

            const SizedBox(height: 24),
          ],
        ),
      ),
    );
  }
}

class _DrawerItem extends StatelessWidget {
  final IconData? icon;
  final String title;
  final Widget? leadingBadge;
  final Widget? trailingBadge;
  final VoidCallback onTap;

  const _DrawerItem({
    this.icon,
    required this.title,
    this.leadingBadge,
    this.trailingBadge,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: leadingBadge ??
          (icon != null ? Icon(icon, color: AppColors.textDark, size: 23) : null),
      title: Text(
        title,
        style: const TextStyle(
          fontSize: 15,
          fontWeight: FontWeight.w500,
          color: AppColors.textDark,
        ),
      ),
      trailing: trailingBadge,
      dense: true,
      visualDensity: const VisualDensity(horizontal: 0, vertical: -1),
      contentPadding: const EdgeInsets.symmetric(horizontal: 20, vertical: 2),
      onTap: onTap,
    );
  }
}

class _FreeBadge extends StatelessWidget {
  const _FreeBadge();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 9, vertical: 3),
      decoration: BoxDecoration(
        color: const Color(0xFF374151),
        borderRadius: BorderRadius.circular(12),
      ),
      child: const Text(
        'Free',
        style: TextStyle(
          color: Colors.white,
          fontSize: 11,
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }
}
