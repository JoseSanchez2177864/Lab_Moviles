import 'package:flutter/material.dart';
import 'Core/Router/app_router.dart';

void main() {
  runApp(const MyApp());
}

class AppColors {
  static const primaryBlue = Color(0xFF2F5DAA);
  static const darkBlue = Color(0xFF243E8F);

  static const primaryGreen = Color(0xFF23B26D);
  static const lightGreen = Color(0xFFE6F7EF);

  static const background = Color(0xFFF4F6F9);
  static const card = Colors.white;

  static const primaryText = Color(0xFF1E1E1E);
  static const secondaryText = Color(0xFF7A7A7A);

  static const amenityYellow = Color(0xFFF4B740);
  static const amenityYellowLight = Color(0xFFFFF4DB);

  static const completedGray = Color(0xFF9E9E9E);
  static const completedLightGray = Color(0xFFF1F3F5);
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  static BoxDecoration cardDecoration() {
    return BoxDecoration(
      color: AppColors.card,
      borderRadius: BorderRadius.circular(20),
      boxShadow: [
        BoxShadow(
          color: Colors.black.withOpacity(0.05),
          blurRadius: 15,
          offset: const Offset(0, 5),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(routerConfig: appRouter);
  }
}
