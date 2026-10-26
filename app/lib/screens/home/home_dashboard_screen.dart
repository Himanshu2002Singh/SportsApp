import 'package:flutter/material.dart';
import '../../../core/constants/app_colors.dart';
import '../../../widgets/cricket_art_widgets.dart';
import '../profile/profile_screen.dart';
import '../store/store_screen.dart';
import 'widgets/achievement_card.dart';
import 'widgets/app_drawer.dart';
import 'widgets/cricketer_card.dart';
import 'widgets/crystal_view_banner.dart';
import 'widgets/kitchen_sorted_ad_banner.dart';
import 'widgets/matches_near_you.dart';
import 'widgets/personalized_jerseys_section.dart';
import 'widgets/pro_club_view.dart';

/// Page 8 & Screenshot 3: CricHeroes Main Home Screen with Red Header & Tab Bar
class HomeDashboardScreen extends StatefulWidget {
  const HomeDashboardScreen({super.key});

  @override
  State<HomeDashboardScreen> createState() => _HomeDashboardScreenState();
}

class _HomeDashboardScreenState extends State<HomeDashboardScreen> {
  int _selectedTabIndex = 0; // 0: For you, 1: PRO Club
  int _selectedBottomNavIndex = 0;

  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      backgroundColor: Colors.white,
      drawer: const AppDrawer(), // Sidebar Navigation Drawer (Screenshot 4)
      appBar: AppBar(
        backgroundColor: AppColors.headerRed,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.menu, color: Colors.white, size: 26),
          onPressed: () => _scaffoldKey.currentState?.openDrawer(),
        ),
        titleSpacing: 0,
        title: Row(
          children: [
            // Sports App Logo + Brand Name
            Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Container(
                  width: 26,
                  height: 26,
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    shape: BoxShape.circle,
                  ),
                  child: const Center(
                    child: Icon(
                      Icons.sports_cricket,
                      color: AppColors.headerRed,
                      size: 16,
                    ),
                  ),
                ),
                const SizedBox(width: 6),
                const Text(
                  'Sports App',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                    fontWeight: FontWeight.w800,
                    letterSpacing: -0.3,
                  ),
                ),
              ],
            ),

            const Spacer(),

            // "PRO @ ₹199" White outline pill badge (Screenshot 3)
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 3),
              decoration: BoxDecoration(
                border: Border.all(color: Colors.white, width: 1.2),
                borderRadius: BorderRadius.circular(12),
              ),
              child: const Text(
                'PRO @ ₹199',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 11,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ),
          ],
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.search, color: Colors.white, size: 23),
            onPressed: () {},
          ),
          IconButton(
            icon: const Icon(Icons.chat_bubble_outline_rounded, color: Colors.white, size: 21),
            onPressed: () {},
          ),
          IconButton(
            icon: const Icon(Icons.notifications_none_rounded, color: Colors.white, size: 24),
            onPressed: () {},
          ),
          const SizedBox(width: 4),
        ],
      ),
      body: Column(
        children: [
          // White Tab Bar directly under Red Header (Screenshot 3)
          Container(
            height: 48,
            decoration: const BoxDecoration(
              color: Colors.white,
              border: Border(
                bottom: BorderSide(color: AppColors.divider, width: 1),
              ),
            ),
            child: Row(
              children: [
                // "For you" Tab
                Expanded(
                  child: InkWell(
                    onTap: () => setState(() => _selectedTabIndex = 0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Spacer(),
                        Text(
                          'For you',
                          style: TextStyle(
                            fontSize: 15,
                            fontWeight: _selectedTabIndex == 0 ? FontWeight.w700 : FontWeight.w500,
                            color: AppColors.textDark,
                          ),
                        ),
                        const Spacer(),
                        Container(
                          height: 3,
                          width: double.infinity,
                          decoration: BoxDecoration(
                            color: _selectedTabIndex == 0 ? AppColors.brandRed : Colors.transparent,
                            borderRadius: BorderRadius.circular(2),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),

                // "PRO Club" Tab
                Expanded(
                  child: InkWell(
                    onTap: () => setState(() => _selectedTabIndex = 1),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Spacer(),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Container(
                              padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 1.5),
                              decoration: BoxDecoration(
                                color: AppColors.proBadge,
                                borderRadius: BorderRadius.circular(4),
                              ),
                              child: const Text(
                                'PRO',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 10,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                            const SizedBox(width: 6),
                            Text(
                              'Club',
                              style: TextStyle(
                                fontSize: 15,
                                fontWeight: _selectedTabIndex == 1 ? FontWeight.w700 : FontWeight.w500,
                                color: AppColors.textDark,
                              ),
                            ),
                          ],
                        ),
                        const Spacer(),
                        Container(
                          height: 3,
                          width: double.infinity,
                          decoration: BoxDecoration(
                            color: _selectedTabIndex == 1 ? AppColors.brandRed : Colors.transparent,
                            borderRadius: BorderRadius.circular(2),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),

          // Body Content
          Expanded(
            child: _selectedTabIndex == 0 ? _buildForYouTab() : const ProClubView(),
          ),
        ],
      ),
      bottomNavigationBar: _buildBottomNavigationBar(),
    );
  }

  Widget _buildForYouTab() {
    return RefreshIndicator(
      onRefresh: () async {},
      color: AppColors.primaryTeal,
      child: ListView(
        padding: const EdgeInsets.symmetric(vertical: 14),
        children: [
          // 1. Stories / Updates Bar with Cricketer Face Avatar (Screenshot 3)
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Row(
              children: [
                // "You" Avatar with teal '+'
                Column(
                  children: [
                    Stack(
                      children: [
                        const CricketerAvatarWidget(size: 52),
                        Positioned(
                          bottom: 0,
                          right: 0,
                          child: Container(
                            padding: const EdgeInsets.all(2),
                            decoration: const BoxDecoration(
                              color: AppColors.primaryTeal,
                              shape: BoxShape.circle,
                            ),
                            child: const Icon(Icons.add, size: 14, color: Colors.white),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 4),
                    const Text(
                      'You',
                      style: TextStyle(fontSize: 12, fontWeight: FontWeight.w600),
                    ),
                  ],
                ),

                const SizedBox(width: 14),

                // Speech Bubble Card (Screenshot 3)
                Expanded(
                  child: Container(
                    padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(16),
                      border: Border.all(color: AppColors.divider),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withValues(alpha: 0.03),
                          blurRadius: 6,
                          offset: const Offset(0, 2),
                        ),
                      ],
                    ),
                    child: const Text(
                      'Follow your favourite cricketers to see their updates here.',
                      style: TextStyle(
                        fontSize: 13,
                        color: AppColors.textMedium,
                        height: 1.35,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),

          const SizedBox(height: 20),

          // 2. Matches Near You (Screenshot 3 live match card)
          const MatchesNearYou(),

          const SizedBox(height: 12),

          // 3. Crystal View Ticker Red Promotional Banner (Screenshot 3)
          const CrystalViewBanner(),

          const SizedBox(height: 14),

          // 4. Popular Cricketers Section (Screenshot 3 & Image 4)
          const CricketerCardSection(),

          const SizedBox(height: 20),

          // 5. Personalized Jerseys Section: HIMANSHU SINGH, get top sellers at an extra 20% off (Image 4)
          const PersonalizedJerseysSection(),

          // 6. Pronto Kitchen Sorted Sponsored Banner (Image 4)
          const KitchenSortedAdBanner(),

          const SizedBox(height: 14),

          // 7. Achievement Card (Page 11: Avni Shrotey Hat-trick)
          const AchievementCard(),

          const SizedBox(height: 16),

          // 6. MVP 2.0 Dark Banner (Page 13)
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 16.0),
            padding: const EdgeInsets.all(20),
            decoration: BoxDecoration(
              color: Colors.black,
              borderRadius: BorderRadius.circular(16),
              border: Border.all(color: AppColors.charcoalDark),
            ),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const [
                    Icon(Icons.sports_cricket, color: Colors.white, size: 24),
                    SizedBox(width: 8),
                    Text(
                      'Sports App™',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 14),
                const Icon(Icons.emoji_events, color: AppColors.brandRed, size: 48),
                const SizedBox(height: 8),
                const Text(
                  'MVP 2.0',
                  style: TextStyle(
                    fontSize: 28,
                    fontWeight: FontWeight.w900,
                    color: AppColors.brandRed,
                    letterSpacing: 1.5,
                  ),
                ),
                const SizedBox(height: 4),
                const Text(
                  'Track Most Valuable Players of Every Tournament',
                  style: TextStyle(fontSize: 12, color: Colors.white70),
                ),
              ],
            ),
          ),

          const SizedBox(height: 24),
        ],
      ),
    );
  }

  Widget _buildBottomNavigationBar() {
    return Container(
      decoration: const BoxDecoration(
        color: Colors.white,
        border: Border(top: BorderSide(color: AppColors.divider)),
      ),
      child: BottomNavigationBar(
        currentIndex: _selectedBottomNavIndex,
        onTap: (index) {
          setState(() => _selectedBottomNavIndex = index);
          if (index == 2) {
            // My Cricket -> ProfileScreen
            Navigator.push(
              context,
              MaterialPageRoute(builder: (_) => const ProfileScreen()),
            );
          } else if (index == 4) {
            // Store -> StoreScreen
            Navigator.push(
              context,
              MaterialPageRoute(builder: (_) => const StoreScreen()),
            );
          }
        },
        type: BottomNavigationBarType.fixed,
        backgroundColor: Colors.white,
        selectedItemColor: AppColors.brandRed,
        unselectedItemColor: AppColors.textMedium,
        selectedLabelStyle: const TextStyle(fontSize: 11, fontWeight: FontWeight.w700),
        unselectedLabelStyle: const TextStyle(fontSize: 11, fontWeight: FontWeight.w500),
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home_outlined),
            activeIcon: Icon(Icons.home_rounded, color: AppColors.brandRed),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.visibility_outlined),
            activeIcon: Icon(Icons.visibility_rounded, color: AppColors.brandRed),
            label: 'Looking',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.sports_cricket_outlined),
            activeIcon: Icon(Icons.sports_cricket, color: AppColors.brandRed),
            label: 'My Cricket',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.groups_outlined),
            activeIcon: Icon(Icons.groups_rounded, color: AppColors.brandRed),
            label: 'Community',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.shopping_bag_outlined),
            activeIcon: Icon(Icons.shopping_bag_rounded, color: AppColors.brandRed),
            label: 'Store',
          ),
        ],
      ),
    );
  }
}
