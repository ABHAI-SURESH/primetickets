import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'core/theme/app_colors.dart';
import 'features/navigation/presentation/pages/main_navigation_page.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);

  runApp(const PrimeTicketsApp());
}

class PrimeTicketsApp extends StatelessWidget {
  const PrimeTicketsApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,

      title: 'PrimeTickets',

      theme: ThemeData(
        scaffoldBackgroundColor: AppColors.background,

        fontFamily: 'SFProDisplay',

        useMaterial3: true,
      ),

      home: const MainNavigationPage(),
    );
  }
}
