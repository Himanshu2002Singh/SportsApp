import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'core/constants/app_colors.dart';
import 'screens/auth/login_method_screen.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setSystemUIOverlayStyle(
    const SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
      statusBarIconBrightness: Brightness.dark,
    ),
  );
  runApp(const SportsApp());
}

/// Sports App Flutter Application Root
class SportsApp extends StatelessWidget {
  const SportsApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Sports App',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: true,
        brightness: Brightness.light,
        scaffoldBackgroundColor: AppColors.scaffoldBackground,
        primaryColor: AppColors.primaryTeal,
        colorScheme: const ColorScheme.light(
          primary: AppColors.primaryTeal,
          secondary: AppColors.brandRed,
          surface: Colors.white,
          onSurface: AppColors.textDark,
        ),
        textTheme: GoogleFonts.interTextTheme(),
        appBarTheme: const AppBarTheme(
          backgroundColor: Colors.white,
          elevation: 0,
          scrolledUnderElevation: 1,
          iconTheme: IconThemeData(color: AppColors.textDark),
        ),
      ),
      home: const LoginMethodScreen(), // Starts from Page 1 of PDF
    );
  }
}

/// Backwards compatibility alias
typedef CricHeroesApp = SportsApp;
