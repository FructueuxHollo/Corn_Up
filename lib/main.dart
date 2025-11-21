import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:corn_up/core/theme/app_theme.dart';
import 'package:corn_up/presentation/home/screens/home_screen.dart';
import 'package:corn_up/presentation/auth/screens/login_screen.dart';
import 'package:corn_up/presentation/analysis/screens/upload_screen.dart';
import 'package:corn_up/presentation/analysis/screens/results_screen.dart';
import 'package:corn_up/presentation/auth/providers/auth_provider.dart';
import 'package:corn_up/presentation/home/providers/home_provider.dart';
import 'package:corn_up/presentation/analysis/providers/analysis_provider.dart';
import 'package:corn_up/data/repositories/analysis_repository_impl.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => AuthProvider()),
        ChangeNotifierProvider(create: (_) => HomeProvider()),
        ChangeNotifierProvider(
          create: (_) => AnalysisProvider(repository: AnalysisRepositoryImpl()),
        ),
      ],
      child: MaterialApp(
        title: 'Corn Up',
        debugShowCheckedModeBanner: false,
        theme: AppTheme.lightTheme,
        initialRoute: '/home',
        routes: {
          '/home': (context) => const HomeScreen(),
          '/login': (context) => const LoginScreen(),
          '/upload': (context) => const UploadScreen(),
          '/results': (context) => const ResultsScreen(),
        },
      ),
    );
  }
}
