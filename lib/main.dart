import 'package:delta/screens/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:delta/utils/colors.dart';
import 'package:flutter_gemini/flutter_gemini.dart';
import 'package:shared_preferences/shared_preferences.dart';

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final prefs = await SharedPreferences.getInstance();
  final key =  prefs.getString("API") ?? "";
 
  Gemini.init(apiKey: key);
  // run app
  runApp(const ProviderScope(
    child: MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Delta',
      theme: ThemeData(
        useMaterial3: true,
        fontFamily: 'ubuntu',
        primaryColor: Colours.primaryColor,
        secondaryHeaderColor: Colours.secondaryColor,
      ),
      themeMode: ThemeMode.dark,
      darkTheme: ThemeData.dark(),
      home: const HomeScreen(),
    );
  }
}
