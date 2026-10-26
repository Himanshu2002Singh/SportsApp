import 'package:flutter/material.dart';
import '../../../core/constants/app_colors.dart';

/// Page 11 & Image 4: Avni Shrotey Hat-trick Social Post Card
class AchievementCard extends StatefulWidget {
  const AchievementCard({super.key});

  @override
  State<AchievementCard> createState() => _AchievementCardState();
}

class _AchievementCardState extends State<AchievementCard> {
  bool _isLiked = false;
  int _reactionCount = 41;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 12.0),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: AppColors.grey200),
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
          // Sports App Watermark at top right
          Padding(
            padding: const EdgeInsets.only(top: 10, right: 14),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Container(
                  width: 18,
                  height: 18,
                  decoration: const BoxDecoration(
                    color: AppColors.headerRed,
                    shape: BoxShape.circle,
                  ),
                  child: const Center(
                    child: Icon(
                      Icons.sports_cricket,
                      color: Colors.white,
                      size: 11,
                    ),
                  ),
                ),
                const SizedBox(width: 4),
                const Text(
                  'Sports App™',
                  style: TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.bold,
                    color: AppColors.grey800,
                  ),
                ),
              ],
            ),
          ),

          const SizedBox(height: 8),

          // Main Visual Card: Photo on Left & Red Card on Right (Image 4)
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12.0),
            child: Row(
              children: [
                // Left: Avni Shrotey Photo with Gold Medal
                Expanded(
                  flex: 5,
                  child: Container(
                    height: 250,
                    decoration: BoxDecoration(
                      color: AppColors.grey100,
                      borderRadius: BorderRadius.circular(16),
                      border: Border.all(color: AppColors.grey200),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withValues(alpha: 0.08),
                          blurRadius: 6,
                          offset: const Offset(0, 3),
                        ),
                      ],
                    ),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(16),
                      child: Stack(
                        alignment: Alignment.center,
                        children: [
                          // Vector Girl Cricketer with Gold Medal
                          CustomPaint(
                            size: const Size(180, 250),
                            painter: _GirlCricketerWithMedalPainter(),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),

                const SizedBox(width: 10),

                // Right: Crimson Red Achievement Card (Image 4)
                Expanded(
                  flex: 5,
                  child: Container(
                    height: 250,
                    padding: const EdgeInsets.all(16.0),
                    decoration: BoxDecoration(
                      color: AppColors.headerRed,
                      borderRadius: BorderRadius.circular(16),
                      boxShadow: [
                        BoxShadow(
                          color: AppColors.headerRed.withValues(alpha: 0.25),
                          blurRadius: 8,
                          offset: const Offset(0, 3),
                        ),
                      ],
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: const [
                        Text(
                          'Avni',
                          style: TextStyle(
                            fontSize: 16,
                            color: Colors.white,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                        Text(
                          'Shrotey',
                          style: TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.w800,
                            color: Colors.white,
                            height: 1.1,
                          ),
                        ),
                        Spacer(),
                        Text(
                          '4 - 0 - 21 - 7',
                          style: TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.w900,
                            color: Colors.white,
                            letterSpacing: 0.5,
                          ),
                        ),
                        SizedBox(height: 2),
                        Text(
                          'Including a hat-trick.',
                          style: TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.w500,
                            color: Colors.white,
                          ),
                        ),
                        Spacer(),
                        Text(
                          'Leather, 43 ovs.',
                          style: TextStyle(fontSize: 11, color: Colors.white70),
                        ),
                        SizedBox(height: 2),
                        Text(
                          'Pune',
                          style: TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.w600,
                            color: Colors.white,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),

          const SizedBox(height: 14),

          // "Check her performance" Teal Button Bar (Image 4)
          Container(
            width: double.infinity,
            padding: const EdgeInsets.symmetric(vertical: 12),
            decoration: const BoxDecoration(
              color: AppColors.primaryTealAccent, // CricHeroes Teal
            ),
            child: const Center(
              child: Text(
                'Check her performance',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 14,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ),
          ),

          // Meta Row: Date & Comments Count (Image 4)
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 14.0, vertical: 8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: const [
                Text(
                  '20-10-2026 06:00 PM',
                  style: TextStyle(fontSize: 12, color: AppColors.grey500),
                ),
                Text(
                  '20 comments',
                  style: TextStyle(fontSize: 12, color: AppColors.grey500),
                ),
              ],
            ),
          ),

          // Reactions Row (❤️ 👍 41 reactions)
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 14.0),
            child: Row(
              children: [
                Container(
                  padding: const EdgeInsets.all(2),
                  decoration: const BoxDecoration(
                    color: AppColors.brandRed,
                    shape: BoxShape.circle,
                  ),
                  child: const Icon(Icons.favorite, size: 10, color: Colors.white),
                ),
                Transform.translate(
                  offset: const Offset(-2, 0),
                  child: Container(
                    padding: const EdgeInsets.all(2),
                    decoration: const BoxDecoration(
                      color: AppColors.jerseyRoyalBlue,
                      shape: BoxShape.circle,
                    ),
                    child: const Icon(Icons.thumb_up, size: 10, color: Colors.white),
                  ),
                ),
                const SizedBox(width: 6),
                Text(
                  '$_reactionCount reactions',
                  style: const TextStyle(fontSize: 12, color: AppColors.grey600),
                ),
              ],
            ),
          ),

          const SizedBox(height: 6),
          const Divider(height: 1, color: AppColors.grey200),

          // Social Actions Row: React, Comment, Share (Image 4)
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              TextButton.icon(
                onPressed: () {
                  setState(() {
                    _isLiked = !_isLiked;
                    _reactionCount += _isLiked ? 1 : -1;
                  });
                },
                icon: Icon(
                  _isLiked ? Icons.thumb_up : Icons.thumb_up_alt_outlined,
                  size: 18,
                  color: _isLiked ? AppColors.jerseyRoyalBlue : AppColors.textDark,
                ),
                label: Text(
                  'React',
                  style: TextStyle(
                    fontSize: 13,
                    color: _isLiked ? AppColors.jerseyRoyalBlue : AppColors.textDark,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
              TextButton.icon(
                onPressed: () {},
                icon: const Icon(Icons.mode_comment_outlined, size: 18, color: AppColors.textDark),
                label: const Text(
                  'Comment',
                  style: TextStyle(
                    fontSize: 13,
                    color: AppColors.textDark,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
              TextButton.icon(
                onPressed: () {},
                icon: const Icon(Icons.share_outlined, size: 18, color: AppColors.textDark),
                label: const Text(
                  'Share',
                  style: TextStyle(
                    fontSize: 13,
                    color: AppColors.textDark,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ],
          ),

          const Divider(height: 1, color: AppColors.grey200),

          // Quick Comment Chips (Image 4)
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 14.0, vertical: 10.0),
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: const [
                  _QuickChip(label: 'Well bowled, Avni'),
                  SizedBox(width: 8),
                  _QuickChip(label: 'What a spell'),
                  SizedBox(width: 8),
                  _QuickChip(label: 'Bowling masterclass'),
                ],
              ),
            ),
          ),

          // Top Comment Box: Ashirbad Mahapatra (Image 4)
          Padding(
            padding: const EdgeInsets.only(left: 14.0, right: 14.0, bottom: 14.0),
            child: Container(
              padding: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                color: AppColors.grey50,
                borderRadius: BorderRadius.circular(8),
                border: Border.all(color: AppColors.grey200),
              ),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // User Avatar
                  Container(
                    width: 32,
                    height: 32,
                    decoration: const BoxDecoration(
                      color: AppColors.jerseyDarkBlue,
                      shape: BoxShape.circle,
                    ),
                    child: const Center(
                      child: Text(
                        'AM',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 11,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(width: 10),
                  // Comment text
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: const [
                        Text(
                          'Ashirbad Mahapatra',
                          style: TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.w700,
                            color: AppColors.grey900,
                          ),
                        ),
                        SizedBox(height: 2),
                        Text(
                          'Well bowled, Avni What a spell Bowling masterclass',
                          style: TextStyle(
                            fontSize: 12,
                            color: AppColors.grey600,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _QuickChip extends StatelessWidget {
  final String label;

  const _QuickChip({required this.label});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
      decoration: BoxDecoration(
        color: AppColors.grey100,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: AppColors.grey200),
      ),
      child: Text(
        label,
        style: const TextStyle(
          fontSize: 11,
          fontWeight: FontWeight.w500,
          color: AppColors.grey700,
        ),
      ),
    );
  }
}

class _GirlCricketerWithMedalPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final w = size.width;
    final h = size.height;

    // Background gradient
    final bgPaint = Paint()
      ..shader = const LinearGradient(
        colors: [AppColors.grey200, AppColors.grey300],
        begin: Alignment.topCenter,
        end: Alignment.bottomCenter,
      ).createShader(Rect.fromLTWH(0, 0, w, h));
    canvas.drawRect(Rect.fromLTWH(0, 0, w, h), bgPaint);

    // Shoulders (White Cricket Polo)
    final shirtPaint = Paint()..color = Colors.white;
    final shirtPath = Path();
    shirtPath.moveTo(w * 0.1, h);
    shirtPath.quadraticBezierTo(w * 0.3, h * 0.58, w * 0.5, h * 0.58);
    shirtPath.quadraticBezierTo(w * 0.7, h * 0.58, w * 0.9, h);
    shirtPath.close();
    canvas.drawPath(shirtPath, shirtPaint);

    // Collar
    final collarPaint = Paint()..color = AppColors.slateBg;
    final collarPath = Path();
    collarPath.moveTo(w * 0.38, h * 0.56);
    collarPath.lineTo(w * 0.5, h * 0.65);
    collarPath.lineTo(w * 0.62, h * 0.56);
    collarPath.lineTo(w * 0.5, h * 0.53);
    collarPath.close();
    canvas.drawPath(collarPath, collarPaint);

    // Blue Ribbon for Medal
    final ribbonPaint = Paint()
      ..color = AppColors.jerseyRoyalBlue
      ..style = PaintingStyle.stroke
      ..strokeWidth = w * 0.04;
    final ribbonPath = Path();
    ribbonPath.moveTo(w * 0.45, h * 0.55);
    ribbonPath.quadraticBezierTo(w * 0.32, h * 0.62, w * 0.28, h * 0.7);
    canvas.drawPath(ribbonPath, ribbonPaint);

    // Golden Medal
    final goldPaint = Paint()..color = AppColors.proGold;
    final medalCenter = Offset(w * 0.26, h * 0.72);
    canvas.drawCircle(medalCenter, w * 0.14, goldPaint);

    // Medal rim detail
    final goldRim = Paint()
      ..color = AppColors.amberBannerDark
      ..style = PaintingStyle.stroke
      ..strokeWidth = 2.0;
    canvas.drawCircle(medalCenter, w * 0.12, goldRim);

    // Hand holding medal
    final handPaint = Paint()..color = AppColors.amberBannerDark.withValues(alpha: 0.7);
    canvas.drawCircle(Offset(w * 0.22, h * 0.78), w * 0.08, handPaint);

    // Girl Head & Face
    final skinPaint = Paint()..color = AppColors.khakhi50;
    canvas.drawOval(
      Rect.fromCenter(center: Offset(w * 0.5, h * 0.36), width: w * 0.44, height: h * 0.34),
      skinPaint,
    );

    // Black Hair & Headband
    final hairPaint = Paint()..color = AppColors.grey900;
    final hairPath = Path();
    hairPath.moveTo(w * 0.26, h * 0.45);
    hairPath.quadraticBezierTo(w * 0.25, h * 0.18, w * 0.5, h * 0.18);
    hairPath.quadraticBezierTo(w * 0.75, h * 0.18, w * 0.74, h * 0.45);
    hairPath.quadraticBezierTo(w * 0.65, h * 0.28, w * 0.5, h * 0.28);
    hairPath.quadraticBezierTo(w * 0.35, h * 0.28, w * 0.26, h * 0.45);
    hairPath.close();
    canvas.drawPath(hairPath, hairPaint);

    // Smile & Eyes
    final featurePaint = Paint()..color = AppColors.grey900;
    canvas.drawCircle(Offset(w * 0.42, h * 0.34), 3, featurePaint);
    canvas.drawCircle(Offset(w * 0.58, h * 0.34), 3, featurePaint);

    // Bright smile
    final smilePaint = Paint()..color = Colors.white;
    canvas.drawArc(
      Rect.fromCenter(center: Offset(w * 0.5, h * 0.42), width: w * 0.16, height: h * 0.08),
      0,
      3.14,
      true,
      smilePaint,
    );
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
