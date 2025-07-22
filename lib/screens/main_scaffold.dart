import 'package:flutter/material.dart';
import 'ask_question_screen.dart';
import 'dashboard_screen.dart';
import 'course_screen.dart';
import 'profile_screen.dart';

class MainScaffold extends StatefulWidget {
  const MainScaffold({super.key});

  @override
  State<MainScaffold> createState() => _MainScaffoldState();
}

class _MainScaffoldState extends State<MainScaffold> {
  int _currentIndex = 0;

  final List<Widget> _screens = const [
    DashboardScreen(),      // ✅ Dashboard added at index 0
    AskQuestionScreen(),
    CourseScreen(),
    ProfileScreen(),
  ];

  final List<String> _titles = [
    'Dashboard',
    'Ask AI',
    'Courses',
    'Profile',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_titles[_currentIndex]),
        centerTitle: true,
        backgroundColor: Theme.of(context).colorScheme.primary,
        foregroundColor: Colors.white,
        elevation: 0,
      ),
      body: SafeArea(
        child: AnimatedSwitcher(
          duration: const Duration(milliseconds: 300),
          child: _screens[_currentIndex],
        ),
      ),
      bottomNavigationBar: NavigationBar(
        selectedIndex: _currentIndex,
        onDestinationSelected: (index) {
          setState(() => _currentIndex = index);
        },
        destinations: const [
          NavigationDestination(
            icon: Icon(Icons.dashboard),
            label: 'Dashboard',
          ),
          NavigationDestination(
            icon: Icon(Icons.question_answer),
            label: 'Ask',
          ),
          NavigationDestination(
            icon: Icon(Icons.menu_book),
            label: 'Courses',
          ),
          NavigationDestination(
            icon: Icon(Icons.person),
            label: 'Profile',
          ),
        ],
      ),
    );
  }
}
