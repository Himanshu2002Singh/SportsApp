import 'package:flutter/material.dart';
import '../../../core/constants/app_colors.dart';

/// Page 10 & Screenshot 3: Popular Cricketers Follow Carousel Cards
class CricketerCardSection extends StatelessWidget {
  const CricketerCardSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Section Header matching Screenshot 3
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                'Popular cricketers',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w700,
                  color: AppColors.textDark,
                ),
              ),
              InkWell(
                onTap: () {},
                child: const Text(
                  'Follow friends',
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w600,
                    color: AppColors.primaryTeal,
                  ),
                ),
              ),
            ],
          ),
        ),

        const SizedBox(height: 12),

        // Horizontal Carousel
        SizedBox(
          height: 250,
          child: ListView(
            scrollDirection: Axis.horizontal,
            padding: const EdgeInsets.symmetric(horizontal: 16),
            children: const [
              _CricketerFollowCard(
                name: 'PRADEEP CHECHI',
                runs: '31967',
                wickets: '1195',
                isPro: true,
                avatarInitial: 'P',
                primaryColor: AppColors.jerseyRoyalBlue,
                secondaryColor: AppColors.jerseyDarkBlue,
              ),
              SizedBox(width: 14),
              _CricketerFollowCard(
                name: 'MayaShankar Bh...',
                runs: '37051',
                wickets: '2815',
                isPro: true,
                avatarInitial: 'M',
                primaryColor: AppColors.grassGreen,
                secondaryColor: AppColors.grassGreen,
              ),
              SizedBox(width: 14),
              _CricketerFollowCard(
                name: 'Amit Kumar',
                runs: '35028',
                wickets: '942',
                isPro: false,
                avatarInitial: 'A',
                primaryColor: AppColors.brandRed,
                secondaryColor: AppColors.brandRedDark,
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class _CricketerFollowCard extends StatefulWidget {
  final String name;
  final String runs;
  final String wickets;
  final bool isPro;
  final String avatarInitial;
  final Color primaryColor;
  final Color secondaryColor;

  const _CricketerFollowCard({
    required this.name,
    required this.runs,
    required this.wickets,
    required this.isPro,
    required this.avatarInitial,
    required this.primaryColor,
    required this.secondaryColor,
  });

  @override
  State<_CricketerFollowCard> createState() => _CricketerFollowCardState();
}

class _CricketerFollowCardState extends State<_CricketerFollowCard> {
  bool _isFollowing = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 168,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: AppColors.divider),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.04),
            blurRadius: 8,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: Column(
        children: [
          // Player Photo Mockup Banner
          Expanded(
            child: Stack(
              children: [
                Container(
                  width: double.infinity,
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      colors: [widget.primaryColor, widget.secondaryColor],
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                    ),
                    borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(9),
                      topRight: Radius.circular(9),
                    ),
                  ),
                  child: Stack(
                    alignment: Alignment.center,
                    children: [
                      // Decorative stadium lights circle
                      Container(
                        width: 80,
                        height: 80,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: Colors.white.withValues(alpha: 0.15),
                        ),
                      ),
                      // Player Silhouette / Initial
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Icon(Icons.person, size: 52, color: Colors.white),
                          Text(
                            widget.avatarInitial,
                            style: const TextStyle(
                              color: Colors.white,
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),

                // PRO Badge
                if (widget.isPro)
                  Positioned(
                    bottom: 8,
                    right: 8,
                    child: Container(
                      padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
                      decoration: BoxDecoration(
                        color: AppColors.proBadge,
                        borderRadius: BorderRadius.circular(4),
                      ),
                      child: const Text(
                        'PRO',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 10,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ),
                  ),
              ],
            ),
          ),

          // Player Name & Stats
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 8.0),
            child: Column(
              children: [
                Text(
                  widget.name,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(
                    fontSize: 13,
                    fontWeight: FontWeight.w700,
                    color: AppColors.textDark,
                  ),
                ),
                const SizedBox(height: 3),
                Text(
                  'R:${widget.runs}   W:${widget.wickets}',
                  style: const TextStyle(
                    fontSize: 11,
                    fontWeight: FontWeight.w600,
                    color: AppColors.textMedium,
                  ),
                ),
              ],
            ),
          ),

          // Follow Button (Matching Screenshot 3 bright teal style)
          Padding(
            padding: const EdgeInsets.only(left: 8, right: 8, bottom: 8),
            child: SizedBox(
              width: double.infinity,
              height: 32,
              child: ElevatedButton(
                onPressed: () {
                  setState(() => _isFollowing = !_isFollowing);
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: _isFollowing ? AppColors.surfaceLight : AppColors.followCyan,
                  foregroundColor: _isFollowing ? AppColors.textDark : AppColors.grey900,
                  elevation: 0,
                  padding: EdgeInsets.zero,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(4),
                    side: BorderSide(
                      color: _isFollowing ? AppColors.divider : Colors.transparent,
                    ),
                  ),
                ),
                child: Text(
                  _isFollowing ? 'Following' : 'Follow',
                  style: const TextStyle(
                    fontSize: 13,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
