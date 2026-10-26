import 'package:flutter/material.dart';
import '../core/constants/app_colors.dart';

/// Clean, scalable vector branding logo for Sports App
class SportsAppLogo extends StatelessWidget {
  final double height;
  final bool isDarkBackground;
  final bool isVertical;

  const SportsAppLogo({
    super.key,
    this.height = 36,
    this.isDarkBackground = false,
    this.isVertical = false,
  });

  @override
  Widget build(BuildContext context) {
    final textColor = isDarkBackground ? Colors.white : AppColors.grey800;
    final accentColor = isDarkBackground ? AppColors.brandRed : AppColors.brandRed;

    if (isVertical) {
      final ballSize = height * 0.48;
      final fontSize = height * 0.22;
      return Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          // Cricket ball icon with seam
          _buildBallIcon(ballSize),
          SizedBox(height: height * 0.08),
          _buildBrandText(fontSize, textColor, accentColor),
        ],
      );
    }

    final ballSize = height * 0.82;
    final fontSize = height * 0.52;

    return Row(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        _buildBallIcon(ballSize),
        SizedBox(width: height * 0.24),
        _buildBrandText(fontSize, textColor, accentColor),
      ],
    );
  }

  Widget _buildBallIcon(double size) {
    return Container(
      width: size,
      height: size,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        gradient: const RadialGradient(
          center: Alignment(-0.3, -0.3),
          radius: 0.85,
          colors: [
            AppColors.brandRed,
            AppColors.brandRedDark,
          ],
        ),
        boxShadow: [
          BoxShadow(
            color: AppColors.brandRed.withValues(alpha: 0.25),
            blurRadius: size * 0.2,
            offset: Offset(0, size * 0.08),
          ),
        ],
      ),
      child: Center(
        child: Icon(
          Icons.sports_cricket,
          color: Colors.white,
          size: size * 0.58,
        ),
      ),
    );
  }

  Widget _buildBrandText(double fontSize, Color textColor, Color accentColor) {
    return RichText(
      text: TextSpan(
        children: [
          TextSpan(
            text: 'sports',
            style: TextStyle(
              color: textColor,
              fontSize: fontSize,
              fontWeight: FontWeight.w800,
              letterSpacing: -0.5,
              fontFamily: 'Inter',
            ),
          ),
          TextSpan(
            text: 'app',
            style: TextStyle(
              color: accentColor,
              fontSize: fontSize,
              fontWeight: FontWeight.w800,
              letterSpacing: -0.5,
              fontFamily: 'Inter',
            ),
          ),
          TextSpan(
            text: '™',
            style: TextStyle(
              color: isDarkBackground ? Colors.white60 : Colors.black45,
              fontSize: fontSize * 0.5,
              fontWeight: FontWeight.bold,
              fontFamily: 'Inter',
            ),
          ),
        ],
      ),
    );
  }
}
