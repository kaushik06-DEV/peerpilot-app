import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'providers/question_provider.dart';
import 'screens/main_scaffold.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (_) => QuestionProvider(),
      child: const PeerPilotApp(),
    ),
  );
}

class PeerPilotApp extends StatelessWidget {
  const PeerPilotApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'PeerPilot',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: true,
        fontFamily: 'Poppins',
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.indigo),
        scaffoldBackgroundColor: Colors.grey.shade100,
        appBarTheme: const AppBarTheme(
          backgroundColor: Colors.indigo,
          foregroundColor: Colors.white,
          centerTitle: true,
        ),
      ),
      home: const MainScaffold(),
    );
  }
}
