import 'package:flutter/material.dart';
import '../../../core/constants/app_colors.dart';

/// Page 8 & Screenshot 3: Matches Near You Live Match Carousel
class MatchesNearYou extends StatelessWidget {
  const MatchesNearYou({super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final cardWidth = screenWidth * 0.88;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Section Header
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                'Matches near you',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w700,
                  color: AppColors.textDark,
                ),
              ),
              InkWell(
                onTap: () {},
                child: const Text(
                  'View all',
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

        // Horizontal Carousel of Matches (Matches Screenshot 3)
        SizedBox(
          height: 220,
          child: ListView(
            scrollDirection: Axis.horizontal,
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            children: [
              // Card 1: Rising Star vs Bulls Warrior (Exact match to Screenshot 3)
              _MatchCard(
                width: cardWidth,
                matchType: 'Individual Match',
                matchMeta: 'Yesterday  |  10 Ov.  |  Noida, Noida Cricket Ground',
                team1Name: 'Rising Star',
                team1Score: '62/7 (9.0 Ov)',
                team2Name: 'Bulls warrior',
                team2Score: '',
                tossInfo: 'Rising Star won the toss and elected to bat',
                distance: '6.52 KM',
              ),

              const SizedBox(width: 14),

              // Card 2: Peeking card on right (Screenshot 3)
              _MatchCard(
                width: cardWidth,
                matchType: 'Individual Match',
                matchMeta: 'Yesterday  |  12 Ov.  |  Greater Noida Stadium',
                team1Name: 'Royal Strikers',
                team1Score: '84/4 (10.2 Ov)',
                team2Name: 'Delhi Titans',
                team2Score: '',
                tossInfo: 'Delhi Titans won toss & elected to bowl',
                distance: '8.10 KM',
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class _MatchCard extends StatelessWidget {
  final double width;
  final String matchType;
  final String matchMeta;
  final String team1Name;
  final String team1Score;
  final String team2Name;
  final String team2Score;
  final String tossInfo;
  final String distance;

  const _MatchCard({
    required this.width,
    required this.matchType,
    required this.matchMeta,
    required this.team1Name,
    required this.team1Score,
    required this.team2Name,
    required this.team2Score,
    required this.tossInfo,
    required this.distance,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
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
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Top Row: Match Type + LIVE Capsule Badge
          Padding(
            padding: const EdgeInsets.only(left: 14, right: 14, top: 12, bottom: 2),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  matchType,
                  style: const TextStyle(
                    fontSize: 13,
                    fontWeight: FontWeight.w500,
                    color: AppColors.textMedium,
                  ),
                ),
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 2.5),
                  decoration: BoxDecoration(
                    color: AppColors.headerRed,
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: const Text(
                    'Live',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 11,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ),
              ],
            ),
          ),

          // Subtitle: Date, Overs, Ground
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 14.0),
            child: Text(
              matchMeta,
              style: const TextStyle(
                fontSize: 11,
                color: AppColors.textMedium,
              ),
            ),
          ),

          const SizedBox(height: 10),

          // Teams & Score
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 14.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      team1Name,
                      style: const TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.w700,
                        color: AppColors.textDark,
                      ),
                    ),
                    Text(
                      team1Score,
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w800,
                        color: AppColors.textDark,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 4),
                Text(
                  team2Name,
                  style: const TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                    color: AppColors.textMedium,
                  ),
                ),
              ],
            ),
          ),

          const Spacer(),
          const Divider(color: AppColors.divider, height: 1),

          // Toss & Distance Bar (Screenshot 3)
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 14.0, vertical: 8.0),
            child: Row(
              children: [
                Expanded(
                  child: Text(
                    tossInfo,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: const TextStyle(
                      fontSize: 12,
                      color: AppColors.textDark,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
                Row(
                  children: [
                    const Icon(Icons.location_on_outlined, size: 15, color: AppColors.textMedium),
                    const SizedBox(width: 3),
                    Text(
                      distance,
                      style: const TextStyle(
                        fontSize: 11,
                        fontWeight: FontWeight.w700,
                        color: AppColors.textDark,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),

          const Divider(color: AppColors.divider, height: 1),

          // Action Links (Screenshot 3)
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              TextButton(
                onPressed: () {},
                style: TextButton.styleFrom(
                  visualDensity: VisualDensity.compact,
                  padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
                ),
                child: const Text(
                  'Insights',
                  style: TextStyle(
                    fontSize: 13,
                    fontWeight: FontWeight.w600,
                    color: AppColors.primaryTeal,
                  ),
                ),
              ),
              TextButton(
                onPressed: () {},
                style: TextButton.styleFrom(
                  visualDensity: VisualDensity.compact,
                  padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
                ),
                child: const Text(
                  'Squads',
                  style: TextStyle(
                    fontSize: 13,
                    fontWeight: FontWeight.w600,
                    color: AppColors.primaryTeal,
                  ),
                ),
              ),
              const SizedBox(width: 8),
            ],
          ),
        ],
      ),
    );
  }
}
