import 'package:flutter/material.dart';
import '../../../core/constants/app_colors.dart';
import '../../../models/user_profile_model.dart';
import '../../../widgets/cricket_art_widgets.dart';
import '../auth/login_method_screen.dart';
import '../home/widgets/personalized_jerseys_section.dart';
import 'edit_profile_screen.dart';

/// Images 1, 2, 3 (Turn 3): CricHeroes Complete My Profile Screen
class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: UserProfileModel.instance,
      builder: (context, child) {
        final user = UserProfileModel.instance;
        final displayName = user.name.isNotEmpty ? user.name.toUpperCase() : 'HIMANSHU SINGH';

        return Scaffold(
          backgroundColor: Colors.white,
          appBar: AppBar(
            backgroundColor: AppColors.headerRed,
            elevation: 0,
            leading: IconButton(
              icon: const Icon(Icons.arrow_back, color: Colors.white),
              onPressed: () => Navigator.pop(context),
            ),
            actions: [
              // "Your cricket profile >" (Image 1)
              InkWell(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (_) => const EditProfileScreen()),
                  );
                },
                child: Row(
                  children: [
                    const Text(
                      'Your cricket profile',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 14,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    const SizedBox(width: 6),
                    Container(
                      width: 20,
                      height: 20,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        border: Border.all(color: Colors.white, width: 1.2),
                      ),
                      child: const Icon(Icons.chevron_right, color: Colors.white, size: 14),
                    ),
                    const SizedBox(width: 16),
                  ],
                ),
              ),
            ],
          ),
          body: ListView(
            padding: EdgeInsets.zero,
            children: [
              // 1. Top Profile Info Header Card (Image 1)
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 16.0),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Avatar with "Edit" pill overlay
                    Stack(
                      alignment: Alignment.bottomCenter,
                      children: [
                        const CricketerAvatarWidget(size: 78),
                        Positioned(
                          bottom: 0,
                          child: InkWell(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(builder: (_) => const EditProfileScreen()),
                              );
                            },
                            child: Container(
                              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 2),
                              decoration: BoxDecoration(
                                color: const Color(0xFF1F2937),
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child: Row(
                                mainAxisSize: MainAxisSize.min,
                                children: const [
                                  Text(
                                    'Edit',
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 11,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                  SizedBox(width: 3),
                                  Icon(Icons.camera_alt, color: Colors.white, size: 10),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),

                    const SizedBox(width: 14),

                    // User Info: Name, Go PRO, City, Join date
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              Expanded(
                                child: Text(
                                  displayName,
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                  style: const TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.w800,
                                    color: AppColors.textDark,
                                    letterSpacing: 0.3,
                                  ),
                                ),
                              ),
                              const SizedBox(width: 6),
                              // "Go PRO >" Teal Button (Image 1)
                              Container(
                                padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                                decoration: BoxDecoration(
                                  color: const Color(0xFF00897B),
                                  borderRadius: BorderRadius.circular(4),
                                ),
                                child: Row(
                                  mainAxisSize: MainAxisSize.min,
                                  children: const [
                                    Text(
                                      'Go PRO',
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 11,
                                        fontWeight: FontWeight.w700,
                                      ),
                                    ),
                                    SizedBox(width: 3),
                                    Icon(Icons.chevron_right, color: Colors.white, size: 13),
                                  ],
                                ),
                              ),
                            ],
                          ),

                          const SizedBox(height: 6),

                          // City with Teal Pin
                          Row(
                            children: [
                              const Icon(Icons.location_on_outlined, size: 16, color: Color(0xFF00897B)),
                              const SizedBox(width: 4),
                              Text(
                                user.city.isNotEmpty ? user.city : 'Noida',
                                style: const TextStyle(
                                  fontSize: 13,
                                  color: AppColors.textMedium,
                                ),
                              ),
                            ],
                          ),

                          const SizedBox(height: 4),

                          // Join Date with Teal Calendar
                          Row(
                            children: const [
                              Icon(Icons.calendar_month_outlined, size: 16, color: Color(0xFF00897B)),
                              SizedBox(width: 4),
                              Text(
                                'Since 21-Oct-2026',
                                style: TextStyle(
                                  fontSize: 13,
                                  color: AppColors.textMedium,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 10),

              // 2. Stats Row: Your QR code | Followers | Profile views (Image 1)
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: Container(
                  padding: const EdgeInsets.symmetric(vertical: 12),
                  decoration: const BoxDecoration(
                    border: Border(
                      top: BorderSide(color: Color(0xFFE5E7EB)),
                      bottom: BorderSide(color: Color(0xFFE5E7EB)),
                    ),
                  ),
                  child: Row(
                    children: [
                      // QR Code
                      Expanded(
                        child: Column(
                          children: const [
                            Icon(Icons.qr_code_2_rounded, size: 24, color: Color(0xFF00897B)),
                            SizedBox(height: 4),
                            Text(
                              'Your QR code',
                              style: TextStyle(fontSize: 12, color: AppColors.textMedium),
                            ),
                          ],
                        ),
                      ),

                      Container(width: 1, height: 32, color: const Color(0xFFE5E7EB)),

                      // Followers
                      Expanded(
                        child: Column(
                          children: const [
                            Text(
                              '0',
                              style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                                color: Color(0xFF00897B),
                              ),
                            ),
                            SizedBox(height: 2),
                            Text(
                              'Followers',
                              style: TextStyle(fontSize: 12, color: AppColors.textMedium),
                            ),
                          ],
                        ),
                      ),

                      Container(width: 1, height: 32, color: const Color(0xFFE5E7EB)),

                      // Profile views
                      Expanded(
                        child: Column(
                          children: const [
                            Text(
                              '2',
                              style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                                color: Color(0xFF00897B),
                              ),
                            ),
                            SizedBox(height: 2),
                            Text(
                              'Profile views',
                              style: TextStyle(fontSize: 12, color: AppColors.textMedium),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),

              const SizedBox(height: 20),

              // 3. Personalized Jerseys Offer (Image 1)
              const PersonalizedJerseysSection(),

              const SizedBox(height: 20),

              // 4. PRO Membership Teal Box (Image 1 & 2)
              Container(
                margin: const EdgeInsets.symmetric(horizontal: 16.0),
                padding: const EdgeInsets.all(18),
                decoration: BoxDecoration(
                  color: const Color(0xFF00897B),
                  borderRadius: BorderRadius.circular(12),
                  boxShadow: [
                    BoxShadow(
                      color: const Color(0xFF00897B).withValues(alpha: 0.25),
                      blurRadius: 8,
                      offset: const Offset(0, 3),
                    ),
                  ],
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'PRO Membership',
                      style: TextStyle(
                        fontSize: 17,
                        fontWeight: FontWeight.w800,
                        color: Colors.white,
                      ),
                    ),
                    const SizedBox(height: 12),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.baseline,
                      textBaseline: TextBaseline.alphabetic,
                      children: const [
                        Text(
                          '₹399',
                          style: TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.w900,
                            color: Colors.white,
                          ),
                        ),
                        Text(
                          '/year',
                          style: TextStyle(fontSize: 13, color: Colors.white70),
                        ),
                        SizedBox(width: 12),
                        Text(
                          'OR',
                          style: TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.bold,
                            color: Colors.white70,
                          ),
                        ),
                        SizedBox(width: 12),
                        Text(
                          '₹3,999',
                          style: TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.w900,
                            color: Colors.white,
                          ),
                        ),
                        Text(
                          '/lifetime',
                          style: TextStyle(fontSize: 13, color: Colors.white70),
                        ),
                      ],
                    ),
                    const SizedBox(height: 10),
                    const Text(
                      'Access unlimited CricInsights and additional benefits with PRO membership.',
                      style: TextStyle(fontSize: 13, color: Colors.white, height: 1.3),
                    ),
                    const SizedBox(height: 16),
                    ElevatedButton(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.white,
                        foregroundColor: const Color(0xFF006D5B),
                        elevation: 0,
                        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 10),
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4)),
                      ),
                      child: const Text(
                        'Become A PRO',
                        style: TextStyle(fontSize: 13, fontWeight: FontWeight.w800),
                      ),
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 24),

              // 5. My Profile Section (Image 2)
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      'My profile',
                      style: TextStyle(
                        fontSize: 17,
                        fontWeight: FontWeight.w800,
                        color: AppColors.textDark,
                      ),
                    ),
                    InkWell(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (_) => const EditProfileScreen()),
                        );
                      },
                      child: const Text(
                        'Edit',
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w700,
                          color: Color(0xFF00897B),
                        ),
                      ),
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 16),

              // Details Grid (2 columns)
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: Column(
                  children: [
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Expanded(
                          child: _ProfileFieldItem(
                            label: 'Mobile number',
                            value: user.mobileNumber,
                          ),
                        ),
                        Expanded(
                          child: _ProfileFieldItem(
                            label: 'Gender',
                            value: user.gender,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 18),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Expanded(
                          child: _ProfileFieldItem(
                            label: 'Playing role',
                            value: user.playingRole == 'None' ? '-' : user.playingRole,
                          ),
                        ),
                        Expanded(
                          child: _ProfileFieldItem(
                            label: 'Batting style',
                            value: user.battingStyle.isEmpty ? '-' : user.battingStyle,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 18),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Expanded(
                          child: _ProfileFieldItem(
                            label: 'Bowling style',
                            value: user.bowlingStyle == 'None' ? '-' : user.bowlingStyle,
                          ),
                        ),
                        Expanded(
                          child: _ProfileFieldItem(
                            label: 'Date of birth',
                            value: user.dob,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 18),
                    _ProfileFieldItem(
                      label: 'Email',
                      value: user.email.isEmpty ? '-' : user.email,
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 24),

              // Complete Profile Progress Bar (50%)
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: Column(
                  children: [
                    Row(
                      children: [
                        Expanded(
                          flex: 1,
                          child: Container(
                            height: 6,
                            decoration: BoxDecoration(
                              color: AppColors.cyanProgress,
                              borderRadius: BorderRadius.circular(3),
                            ),
                          ),
                        ),
                        Expanded(
                          flex: 1,
                          child: Container(
                            height: 6,
                            decoration: BoxDecoration(
                              color: const Color(0xFFE5E7EB),
                              borderRadius: BorderRadius.circular(3),
                            ),
                          ),
                        ),
                        const SizedBox(width: 8),
                        const Text(
                          '50%',
                          style: TextStyle(fontSize: 12, color: AppColors.textMedium),
                        ),
                      ],
                    ),
                    const SizedBox(height: 10),
                    InkWell(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (_) => const EditProfileScreen()),
                        );
                      },
                      child: const Text(
                        'Complete profile',
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w700,
                          color: Color(0xFF00897B),
                        ),
                      ),
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 28),
              const Divider(color: Color(0xFFE5E7EB), thickness: 1),

              // 6. Connections Section (Image 3)
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 12.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Connections',
                      style: TextStyle(
                        fontSize: 17,
                        fontWeight: FontWeight.w800,
                        color: AppColors.textDark,
                      ),
                    ),
                    const SizedBox(height: 16),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: const [
                        _ConnectionAvatar(initial: 'A', color: Color(0xFF1E3A8A)),
                        _ConnectionAvatar(initial: 'R', color: Color(0xFFDC2626)),
                        _ConnectionAvatar(initial: 'S', color: Color(0xFF047857)),
                        _ConnectionAvatar(initial: 'K', color: Color(0xFF6B21A8)),
                        _ConnectionAvatar(initial: 'M', color: Color(0xFFD97706)),
                      ],
                    ),
                    const SizedBox(height: 14),
                    const Center(
                      child: Text(
                        'Connect with cricketers to challenge, motivate & inspire\neach other.',
                        textAlign: TextAlign.center,
                        style: TextStyle(fontSize: 13, color: AppColors.textMedium, height: 1.4),
                      ),
                    ),
                    const SizedBox(height: 10),
                    Center(
                      child: InkWell(
                        onTap: () {},
                        child: const Text(
                          'Find Cricketers',
                          style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w700,
                            color: Color(0xFF00897B),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),

              const Divider(color: Color(0xFFE5E7EB), thickness: 1),

              // 7. Settings List Tiles (Image 3)
              _SettingsTile(
                title: 'Edit notification preferences',
                onTap: () {},
              ),
              const Divider(height: 1, indent: 16, color: Color(0xFFE5E7EB)),
              _SettingsTile(
                title: 'Change language',
                onTap: () {},
              ),
              const Divider(height: 1, indent: 16, color: Color(0xFFE5E7EB)),
              _SettingsTile(
                title: 'Purchase history',
                onTap: () {},
              ),
              const Divider(height: 1, color: Color(0xFFE5E7EB)),

              const SizedBox(height: 28),

              // 8. Logout & Clear Data Buttons (Image 3)
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  OutlinedButton(
                    onPressed: () {
                      Navigator.pushAndRemoveUntil(
                        context,
                        MaterialPageRoute(builder: (_) => const LoginMethodScreen()),
                        (route) => false,
                      );
                    },
                    style: OutlinedButton.styleFrom(
                      side: const BorderSide(color: Color(0xFF1F2937), width: 1.2),
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4)),
                      padding: const EdgeInsets.symmetric(horizontal: 28, vertical: 10),
                    ),
                    child: const Text(
                      'Logout',
                      style: TextStyle(color: Color(0xFF1F2937), fontWeight: FontWeight.w600),
                    ),
                  ),
                  const SizedBox(width: 14),
                  OutlinedButton(
                    onPressed: () {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(content: Text('App cache cleared successfully')),
                      );
                    },
                    style: OutlinedButton.styleFrom(
                      side: const BorderSide(color: Color(0xFF1F2937), width: 1.2),
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4)),
                      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 10),
                    ),
                    child: const Text(
                      'Clear data',
                      style: TextStyle(color: Color(0xFF1F2937), fontWeight: FontWeight.w600),
                    ),
                  ),
                ],
              ),

              const SizedBox(height: 14),

              Center(
                child: TextButton(
                  onPressed: () {},
                  child: const Text(
                    'Delete Account',
                    style: TextStyle(fontSize: 13, color: Color(0xFF6B7280)),
                  ),
                ),
              ),

              const SizedBox(height: 10),

              // Version string
              const Center(
                child: Text(
                  'Version 26.8.3 (494)',
                  style: TextStyle(fontSize: 12, color: Color(0xFF9CA3AF)),
                ),
              ),

              const SizedBox(height: 20),

              // 9. Persistent Light Cyan Email Safety Banner (Images 1, 2, 3)
              Container(
                width: double.infinity,
                padding: const EdgeInsets.symmetric(vertical: 12),
                color: const Color(0xFFE0F7FA), // Light cyan
                child: Center(
                  child: RichText(
                    text: const TextSpan(
                      text: 'To keep your stats safe, add your ',
                      style: TextStyle(fontSize: 13, color: Color(0xFF1F2937)),
                      children: [
                        TextSpan(
                          text: 'Email',
                          style: TextStyle(fontWeight: FontWeight.bold, color: Color(0xFF111827)),
                        ),
                        TextSpan(text: ' now.'),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}

class _ProfileFieldItem extends StatelessWidget {
  final String label;
  final String value;

  const _ProfileFieldItem({required this.label, required this.value});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: const TextStyle(fontSize: 12, color: Color(0xFF6B7280)),
        ),
        const SizedBox(height: 3),
        Text(
          value,
          style: const TextStyle(
            fontSize: 15,
            fontWeight: FontWeight.w600,
            color: Color(0xFF111827),
          ),
        ),
      ],
    );
  }
}

class _ConnectionAvatar extends StatelessWidget {
  final String initial;
  final Color color;

  const _ConnectionAvatar({required this.initial, required this.color});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 5),
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        border: Border.all(color: Colors.white, width: 2),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.1),
            blurRadius: 4,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: CircleAvatar(
        radius: 26,
        backgroundColor: color,
        child: Stack(
          alignment: Alignment.center,
          children: [
            Icon(Icons.person, size: 28, color: Colors.white.withValues(alpha: 0.85)),
            Positioned(
              bottom: 2,
              child: Text(
                initial,
                style: const TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.w800,
                  fontSize: 10,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _SettingsTile extends StatelessWidget {
  final String title;
  final VoidCallback onTap;

  const _SettingsTile({required this.title, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(
        title,
        style: const TextStyle(
          fontSize: 14,
          fontWeight: FontWeight.w500,
          color: Color(0xFF1F2937),
        ),
      ),
      trailing: Container(
        width: 22,
        height: 22,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          border: Border.all(color: const Color(0xFF9CA3AF), width: 1.0),
        ),
        child: const Icon(Icons.chevron_right, size: 16, color: Color(0xFF6B7280)),
      ),
      contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 0),
      dense: true,
      onTap: onTap,
    );
  }
}
