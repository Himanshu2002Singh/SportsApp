import 'package:flutter/material.dart';
import '../core/constants/app_colors.dart';

/// Custom-drawn authentic vector illustrations for CricHeroes screens
/// 1. Helmet Batsman Illustration (Page 6 / Image 1)
/// 2. Cricketer Face Avatar Illustration (Page 7 / Image 2 & Drawer / Home / Profile)

/// 1. Batsman in Helmet Illustration (Matches Image 1 precisely)
class CricketHelmetCard extends StatelessWidget {
  final double size;

  const CricketHelmetCard({super.key, this.size = 280});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        width: size,
        height: size,
        decoration: BoxDecoration(
          color: AppColors.navyMedium,
          borderRadius: BorderRadius.circular(16),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withValues(alpha: 0.15),
              blurRadius: 16,
              offset: const Offset(0, 6),
            ),
          ],
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(16),
          child: CustomPaint(
            size: Size(size, size),
            painter: _HelmetBatsmanPainter(),
          ),
        ),
      ),
    );
  }
}

class _HelmetBatsmanPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final w = size.width;
    final h = size.height;
    final center = Offset(w / 2, h / 2);

    // 1. Dark circular shadow backdrop
    final circlePaint = Paint()
      ..color = AppColors.navyDark
      ..style = PaintingStyle.fill;
    canvas.drawCircle(center, w * 0.44, circlePaint);

    // 2. Grey Shoulders / Jersey
    final shoulderPaint = Paint()
      ..color = AppColors.grey400
      ..style = PaintingStyle.fill;
    final shoulderPath = Path();
    shoulderPath.moveTo(w * 0.08, h);
    shoulderPath.quadraticBezierTo(w * 0.15, h * 0.58, w * 0.35, h * 0.52);
    shoulderPath.lineTo(w * 0.65, h * 0.52);
    shoulderPath.quadraticBezierTo(w * 0.85, h * 0.58, w * 0.92, h);
    shoulderPath.close();
    canvas.drawPath(shoulderPath, shoulderPaint);

    // 3. White Cricket Sweater Collar / Bib
    final whiteCollarPaint = Paint()
      ..color = Colors.white
      ..style = PaintingStyle.fill;
    final whiteCollarPath = Path();
    whiteCollarPath.moveTo(w * 0.13, h * 0.65);
    whiteCollarPath.quadraticBezierTo(w * 0.32, h * 0.62, w * 0.40, h * 0.56);
    whiteCollarPath.lineTo(w * 0.50, h * 0.68);
    whiteCollarPath.lineTo(w * 0.60, h * 0.56);
    whiteCollarPath.quadraticBezierTo(w * 0.68, h * 0.62, w * 0.87, h * 0.65);
    whiteCollarPath.quadraticBezierTo(w * 0.70, h * 0.76, w * 0.50, h * 0.76);
    whiteCollarPath.quadraticBezierTo(w * 0.30, h * 0.76, w * 0.13, h * 0.65);
    whiteCollarPath.close();
    canvas.drawPath(whiteCollarPath, whiteCollarPaint);

    // 4. Red Shirt Collar Tabs (underside collar)
    final redCollarPaint = Paint()
      ..color = AppColors.brandRedDark
      ..style = PaintingStyle.fill;

    // Left red collar
    final leftCollar = Path();
    leftCollar.moveTo(w * 0.33, h * 0.47);
    leftCollar.lineTo(w * 0.41, h * 0.56);
    leftCollar.lineTo(w * 0.28, h * 0.56);
    leftCollar.close();
    canvas.drawPath(leftCollar, redCollarPaint);

    // Right red collar
    final rightCollar = Path();
    rightCollar.moveTo(w * 0.67, h * 0.47);
    rightCollar.lineTo(w * 0.59, h * 0.56);
    rightCollar.lineTo(w * 0.72, h * 0.56);
    rightCollar.close();
    canvas.drawPath(rightCollar, redCollarPaint);

    // 5. Faceless Cream/Beige Skin
    final facePaint = Paint()
      ..color = AppColors.khakhi50
      ..style = PaintingStyle.fill;
    final facePath = Path();
    facePath.addRRect(RRect.fromRectAndRadius(
      Rect.fromCenter(center: Offset(w * 0.5, h * 0.44), width: w * 0.36, height: h * 0.38),
      Radius.circular(w * 0.18),
    ));
    canvas.drawPath(facePath, facePaint);

    // 6. Chinstrap
    final strapPaint = Paint()
      ..color = AppColors.navyDark
      ..style = PaintingStyle.stroke
      ..strokeWidth = w * 0.02
      ..strokeCap = StrokeCap.round;
    final strapPath = Path();
    strapPath.moveTo(w * 0.42, h * 0.49);
    strapPath.quadraticBezierTo(w * 0.50, h * 0.51, w * 0.58, h * 0.49);
    canvas.drawPath(strapPath, strapPaint);

    // Chin cup
    final chinCupPaint = Paint()
      ..color = AppColors.navyDark
      ..style = PaintingStyle.fill;
    canvas.drawOval(
      Rect.fromCenter(center: Offset(w * 0.50, h * 0.495), width: w * 0.08, height: h * 0.03),
      chinCupPaint,
    );

    // 7. Red Helmet Dome
    final helmetPaint = Paint()
      ..color = AppColors.brandRed
      ..style = PaintingStyle.fill;
    final helmetPath = Path();
    helmetPath.moveTo(w * 0.28, h * 0.34);
    helmetPath.cubicTo(w * 0.28, h * 0.16, w * 0.72, h * 0.16, w * 0.72, h * 0.34);
    helmetPath.lineTo(w * 0.73, h * 0.36);
    helmetPath.quadraticBezierTo(w * 0.50, h * 0.34, w * 0.27, h * 0.36);
    helmetPath.close();
    canvas.drawPath(helmetPath, helmetPaint);

    // Helmet Peak / Visor rim
    final peakPaint = Paint()
      ..color = AppColors.brandRedDark
      ..style = PaintingStyle.fill;
    final peakPath = Path();
    peakPath.moveTo(w * 0.26, h * 0.35);
    peakPath.quadraticBezierTo(w * 0.50, h * 0.38, w * 0.74, h * 0.35);
    peakPath.quadraticBezierTo(w * 0.50, h * 0.33, w * 0.26, h * 0.35);
    peakPath.close();
    canvas.drawPath(peakPath, peakPaint);

    // 8. Slate Grey Ear Guards
    final earGuardPaint = Paint()
      ..color = AppColors.grey500
      ..style = PaintingStyle.fill;

    // Left ear guard
    final leftEar = Path();
    leftEar.moveTo(w * 0.30, h * 0.33);
    leftEar.lineTo(w * 0.24, h * 0.35);
    leftEar.lineTo(w * 0.26, h * 0.42);
    leftEar.lineTo(w * 0.31, h * 0.40);
    leftEar.close();
    canvas.drawPath(leftEar, earGuardPaint);

    // Right ear guard
    final rightEar = Path();
    rightEar.moveTo(w * 0.70, h * 0.33);
    rightEar.lineTo(w * 0.76, h * 0.35);
    rightEar.lineTo(w * 0.74, h * 0.42);
    rightEar.lineTo(w * 0.69, h * 0.40);
    rightEar.close();
    canvas.drawPath(rightEar, earGuardPaint);

    // 9. Metal Face Grill Wireframe (Visor Grill)
    final grillPaint = Paint()
      ..color = AppColors.charcoalDark
      ..style = PaintingStyle.stroke
      ..strokeWidth = w * 0.015
      ..strokeCap = StrokeCap.round;

    // Outer contour of grill
    final outerGrill = Path();
    outerGrill.moveTo(w * 0.27, h * 0.36);
    outerGrill.cubicTo(w * 0.25, h * 0.48, w * 0.75, h * 0.48, w * 0.73, h * 0.36);
    canvas.drawPath(outerGrill, grillPaint);

    // Bar 1 (Upper grill)
    final bar1 = Path();
    bar1.moveTo(w * 0.28, h * 0.40);
    bar1.quadraticBezierTo(w * 0.50, h * 0.41, w * 0.72, h * 0.40);
    canvas.drawPath(bar1, grillPaint);

    // Bar 2 (Middle grill)
    final bar2 = Path();
    bar2.moveTo(w * 0.30, h * 0.44);
    bar2.quadraticBezierTo(w * 0.50, h * 0.45, w * 0.70, h * 0.44);
    canvas.drawPath(bar2, grillPaint);

    // Bar 3 (Lower grill)
    final bar3 = Path();
    bar3.moveTo(w * 0.33, h * 0.48);
    bar3.quadraticBezierTo(w * 0.50, h * 0.49, w * 0.67, h * 0.48);
    canvas.drawPath(bar3, grillPaint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}

/// 2. Cricketer Illustrated Face Avatar (Matches Image 2, Image 3 & Image 4 precisely)
class CricketerAvatarWidget extends StatelessWidget {
  final double size;

  const CricketerAvatarWidget({super.key, this.size = 160});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: size,
      height: size,
      decoration: const BoxDecoration(
        color: AppColors.navyDark,
        shape: BoxShape.circle,
      ),
      child: ClipOval(
        child: CustomPaint(
          size: Size(size, size),
          painter: _CricketerFacePainter(),
        ),
      ),
    );
  }
}

class _CricketerFacePainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final w = size.width;
    final h = size.height;

    // 1. Shoulders / White Cricket Shirt
    final shirtPaint = Paint()
      ..color = Colors.white
      ..style = PaintingStyle.fill;
    final shirtPath = Path();
    shirtPath.moveTo(w * 0.12, h);
    shirtPath.quadraticBezierTo(w * 0.25, h * 0.68, w * 0.42, h * 0.65);
    shirtPath.lineTo(w * 0.50, h * 0.74);
    shirtPath.lineTo(w * 0.58, h * 0.65);
    shirtPath.quadraticBezierTo(w * 0.75, h * 0.68, w * 0.88, h);
    shirtPath.close();
    canvas.drawPath(shirtPath, shirtPaint);

    // 2. Tricolor stripe on Left collar
    final saffronPaint = Paint()..color = AppColors.amberBanner;
    final whiteStripePaint = Paint()..color = Colors.white;
    final greenPaint = Paint()..color = AppColors.grassGreen;

    final stripeX = w * 0.54;
    final stripeY = h * 0.67;
    final stripeW = w * 0.05;
    final stripeH = h * 0.025;

    canvas.drawRect(Rect.fromLTWH(stripeX, stripeY, stripeW, stripeH), saffronPaint);
    canvas.drawRect(Rect.fromLTWH(stripeX, stripeY + stripeH, stripeW, stripeH), whiteStripePaint);
    canvas.drawRect(Rect.fromLTWH(stripeX, stripeY + stripeH * 2, stripeW, stripeH), greenPaint);

    // 3. Red Cricket Ball Logo Badge on chest
    final redBallPaint = Paint()..color = AppColors.brandRed;
    final seamPaint = Paint()
      ..color = Colors.white
      ..style = PaintingStyle.stroke
      ..strokeWidth = w * 0.01;
    final ballCenter = Offset(w * 0.62, h * 0.78);
    final ballRadius = w * 0.045;
    canvas.drawCircle(ballCenter, ballRadius, redBallPaint);
    canvas.drawArc(
      Rect.fromCircle(center: ballCenter, radius: ballRadius * 0.8),
      -1.5,
      3.0,
      false,
      seamPaint,
    );

    // 4. Neck
    final skinPaint = Paint()
      ..color = AppColors.khakhi50
      ..style = PaintingStyle.fill;
    final neckPath = Path();
    neckPath.moveTo(w * 0.42, h * 0.55);
    neckPath.lineTo(w * 0.42, h * 0.68);
    neckPath.lineTo(w * 0.58, h * 0.68);
    neckPath.lineTo(w * 0.58, h * 0.55);
    neckPath.close();
    canvas.drawPath(neckPath, skinPaint);

    // 5. Ears
    canvas.drawOval(
      Rect.fromCenter(center: Offset(w * 0.36, h * 0.49), width: w * 0.08, height: h * 0.12),
      skinPaint,
    );
    canvas.drawOval(
      Rect.fromCenter(center: Offset(w * 0.64, h * 0.49), width: w * 0.08, height: h * 0.12),
      skinPaint,
    );

    // 6. Face Jawline / Head
    final headPath = Path();
    headPath.moveTo(w * 0.38, h * 0.38);
    headPath.quadraticBezierTo(w * 0.38, h * 0.52, w * 0.42, h * 0.58);
    headPath.quadraticBezierTo(w * 0.50, h * 0.63, w * 0.58, h * 0.58);
    headPath.quadraticBezierTo(w * 0.62, h * 0.52, w * 0.62, h * 0.38);
    headPath.quadraticBezierTo(w * 0.50, h * 0.34, w * 0.38, h * 0.38);
    headPath.close();
    canvas.drawPath(headPath, skinPaint);

    // 7. Facial Features (Eyebrows, Eyes, Nose, Mouth)
    final featurePaint = Paint()
      ..color = AppColors.grey900
      ..style = PaintingStyle.fill;

    // Eyebrows
    final leftEyebrow = Path();
    leftEyebrow.moveTo(w * 0.41, h * 0.43);
    leftEyebrow.quadraticBezierTo(w * 0.45, h * 0.415, w * 0.48, h * 0.43);
    leftEyebrow.lineTo(w * 0.48, h * 0.44);
    leftEyebrow.quadraticBezierTo(w * 0.45, h * 0.425, w * 0.41, h * 0.44);
    leftEyebrow.close();
    canvas.drawPath(leftEyebrow, featurePaint);

    final rightEyebrow = Path();
    rightEyebrow.moveTo(w * 0.52, h * 0.43);
    rightEyebrow.quadraticBezierTo(w * 0.55, h * 0.415, w * 0.59, h * 0.43);
    rightEyebrow.lineTo(w * 0.59, h * 0.44);
    rightEyebrow.quadraticBezierTo(w * 0.55, h * 0.425, w * 0.52, h * 0.44);
    rightEyebrow.close();
    canvas.drawPath(rightEyebrow, featurePaint);

    // Eyes
    final eyeWhite = Paint()..color = Colors.white;
    canvas.drawOval(
      Rect.fromCenter(center: Offset(w * 0.45, h * 0.46), width: w * 0.05, height: h * 0.025),
      eyeWhite,
    );
    canvas.drawOval(
      Rect.fromCenter(center: Offset(w * 0.55, h * 0.46), width: w * 0.05, height: h * 0.025),
      eyeWhite,
    );

    // Iris & Pupil
    canvas.drawCircle(Offset(w * 0.45, h * 0.46), w * 0.015, featurePaint);
    canvas.drawCircle(Offset(w * 0.55, h * 0.46), w * 0.015, featurePaint);

    // Nose
    final nosePaint = Paint()
      ..color = AppColors.khakhi50
      ..style = PaintingStyle.stroke
      ..strokeWidth = w * 0.01
      ..strokeCap = StrokeCap.round;
    final nosePath = Path();
    nosePath.moveTo(w * 0.50, h * 0.44);
    nosePath.lineTo(w * 0.50, h * 0.51);
    nosePath.quadraticBezierTo(w * 0.48, h * 0.52, w * 0.50, h * 0.525);
    canvas.drawPath(nosePath, nosePaint);

    // Lips
    final lipPaint = Paint()
      ..color = AppColors.khakhi50
      ..style = PaintingStyle.fill;
    final lipPath = Path();
    lipPath.moveTo(w * 0.46, h * 0.56);
    lipPath.quadraticBezierTo(w * 0.50, h * 0.555, w * 0.54, h * 0.56);
    lipPath.quadraticBezierTo(w * 0.50, h * 0.575, w * 0.46, h * 0.56);
    lipPath.close();
    canvas.drawPath(lipPath, lipPaint);

    // 8. Modern Spiked Haircut (Black with texture)
    final hairPaint = Paint()
      ..color = AppColors.grey900
      ..style = PaintingStyle.fill;
    final hairPath = Path();
    hairPath.moveTo(w * 0.36, h * 0.43);
    hairPath.quadraticBezierTo(w * 0.36, h * 0.34, w * 0.40, h * 0.28);
    hairPath.lineTo(w * 0.44, h * 0.24);
    hairPath.lineTo(w * 0.48, h * 0.26);
    hairPath.lineTo(w * 0.52, h * 0.23);
    hairPath.lineTo(w * 0.56, h * 0.26);
    hairPath.lineTo(w * 0.60, h * 0.25);
    hairPath.quadraticBezierTo(w * 0.64, h * 0.34, w * 0.64, h * 0.43);
    // Hairline
    hairPath.quadraticBezierTo(w * 0.57, h * 0.36, w * 0.50, h * 0.37);
    hairPath.quadraticBezierTo(w * 0.43, h * 0.36, w * 0.36, h * 0.43);
    hairPath.close();
    canvas.drawPath(hairPath, hairPaint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
