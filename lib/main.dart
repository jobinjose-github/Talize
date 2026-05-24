import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:talize/screens/splash_screen.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
}

/// App-wide colors and theming constants.
class AppColors {
  // Seed color: #10B981
  static const Color seed = Color(0xFF10B981);
}

/// Production-ready application entrypoint.
///
/// - Provides light and dark ColorSchemes derived from a single seed color.
/// - Supports runtime theme mode switching (system/light/dark).
class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  ThemeMode _themeMode = ThemeMode.system;

  void _cycleThemeMode() {
    setState(() {
      _themeMode = _themeMode == ThemeMode.system
          ? ThemeMode.light
          : _themeMode == ThemeMode.light
          ? ThemeMode.dark
          : ThemeMode.system;
    });
  }

  @override
  Widget build(BuildContext context) {
    final csLight = ColorScheme.fromSeed(
      seedColor: AppColors.seed,
      brightness: Brightness.light,
    );
    final csDark = ColorScheme.fromSeed(
      seedColor: AppColors.seed,
      brightness: Brightness.dark,
    );

    return MaterialApp(
      title: 'Talize',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: true,
        colorScheme: csLight,
        textTheme: GoogleFonts.poppinsTextTheme(),
        scaffoldBackgroundColor: Colors.white,
        appBarTheme: AppBarTheme(
          backgroundColor: AppColors.seed,
          foregroundColor:
              ThemeData.estimateBrightnessForColor(AppColors.seed) ==
                  Brightness.dark
              ? Colors.white
              : Colors.black,
        ),
        floatingActionButtonTheme: FloatingActionButtonThemeData(
          backgroundColor: AppColors.seed,
        ),
      ),
      darkTheme: ThemeData(
        useMaterial3: true,
        colorScheme: csDark,
        textTheme: GoogleFonts.poppinsTextTheme(ThemeData.dark().textTheme),
        scaffoldBackgroundColor: const Color.fromARGB(255, 0, 0, 0),
        appBarTheme: AppBarTheme(
          backgroundColor: AppColors.seed,
          foregroundColor:
              ThemeData.estimateBrightnessForColor(AppColors.seed) ==
                  Brightness.dark
              ? Colors.white
              : Colors.black,
        ),
        floatingActionButtonTheme: FloatingActionButtonThemeData(
          backgroundColor: AppColors.seed,
        ),
      ),
      themeMode: _themeMode,
      home: HomePage(
        title: 'Talize',
        onToggleTheme: _cycleThemeMode,
        themeMode: _themeMode,
      ),
    );
  }
}

/// The app's home page. Keeps a simple counter to illustrate state.
class HomePage extends StatefulWidget {
  const HomePage({
    super.key,
    required this.title,
    required this.onToggleTheme,
    required this.themeMode,
  });

  final String title;
  final VoidCallback onToggleTheme;
  final ThemeMode themeMode;

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _counter = 0;

  void _incrementCounter() => setState(() => _counter++);

  IconData _iconForMode(ThemeMode mode) {
    switch (mode) {
      case ThemeMode.light:
        return Icons.wb_sunny;
      case ThemeMode.dark:
        return Icons.nights_stay;
      case ThemeMode.system:
      default:
        return Icons.brightness_auto;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Welcome();
  }
}
