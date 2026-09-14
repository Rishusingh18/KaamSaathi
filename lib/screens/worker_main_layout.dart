import 'package:flutter/material.dart';
import '../theme/colors.dart';
import '../utils/localization.dart';
import 'worker_dashboard_screen.dart';
import 'worker_jobs_screen.dart';
import 'worker_earnings_screen.dart';
import 'worker_skill_passport_tab.dart';
import 'worker_profile_screen.dart';

// Placeholder screens for other tabs
class PlaceholderScreen extends StatelessWidget {
  final String title;
  const PlaceholderScreen({super.key, required this.title});
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.surfaceCanvas,
      appBar: AppBar(
        title: Text(title),
        automaticallyImplyLeading: false,
      ),
      body: Center(child: Text('${AppLocalization.get("Coming soon:")} $title', style: const TextStyle(fontSize: 16))),
    );
  }
}

class WorkerMainLayout extends StatefulWidget {
  const WorkerMainLayout({super.key});

  @override
  State<WorkerMainLayout> createState() => _WorkerMainLayoutState();
}

class _WorkerMainLayoutState extends State<WorkerMainLayout> {
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<String>(
      valueListenable: AppLocalization.currentLang,
      builder: (context, lang, child) {
        final List<Widget> screens = [
          const WorkerDashboardScreen(),
          const WorkerJobsScreen(),
          WorkerSkillPassportTab(onBack: () {
            setState(() {
              _currentIndex = 0;
            });
          }),
          WorkerEarningsScreen(onBack: () {
            setState(() {
              _currentIndex = 0;
            });
          }),
          WorkerProfileScreen(onBack: () {
            setState(() {
              _currentIndex = 0;
            });
          }),
        ];

        return Scaffold(
          body: IndexedStack(
            index: _currentIndex,
            children: screens,
          ),
          bottomNavigationBar: Container(
            decoration: BoxDecoration(
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withValues(alpha: 0.05),
                  blurRadius: 10,
                  offset: const Offset(0, -5),
                ),
              ],
            ),
            child: BottomNavigationBar(
              currentIndex: _currentIndex,
              type: BottomNavigationBarType.fixed,
              selectedItemColor: AppColors.primaryContainer,
              unselectedItemColor: AppColors.textSecondary,
              selectedFontSize: 10,
              unselectedFontSize: 10,
              selectedLabelStyle: const TextStyle(fontWeight: FontWeight.bold),
              onTap: (index) {
                setState(() {
                  _currentIndex = index;
                });
              },
              items: [
                BottomNavigationBarItem(
                  icon: const Padding(
                    padding: EdgeInsets.only(bottom: 4.0),
                    child: Icon(Icons.home_outlined),
                  ),
                  activeIcon: const Padding(
                    padding: EdgeInsets.only(bottom: 4.0),
                    child: Icon(Icons.home),
                  ),
                  label: AppLocalization.get('Home'),
                ),
                BottomNavigationBarItem(
                  icon: const Padding(
                    padding: EdgeInsets.only(bottom: 4.0),
                    child: Icon(Icons.work_outline),
                  ),
                  activeIcon: const Padding(
                    padding: EdgeInsets.only(bottom: 4.0),
                    child: Icon(Icons.work),
                  ),
                  label: AppLocalization.get('Jobs'),
                ),
                BottomNavigationBarItem(
                  icon: const Padding(
                    padding: EdgeInsets.only(bottom: 4.0),
                    child: Icon(Icons.verified_outlined),
                  ),
                  activeIcon: const Padding(
                    padding: EdgeInsets.only(bottom: 4.0),
                    child: Icon(Icons.verified),
                  ),
                  label: AppLocalization.get('Passport'),
                ),
                BottomNavigationBarItem(
                  icon: const Padding(
                    padding: EdgeInsets.only(bottom: 4.0),
                    child: Icon(Icons.monetization_on_outlined),
                  ),
                  activeIcon: const Padding(
                    padding: EdgeInsets.only(bottom: 4.0),
                    child: Icon(Icons.monetization_on),
                  ),
                  label: AppLocalization.get('Earnings'),
                ),
                BottomNavigationBarItem(
                  icon: const Padding(
                    padding: EdgeInsets.only(bottom: 4.0),
                    child: Icon(Icons.person_outline),
                  ),
                  activeIcon: const Padding(
                    padding: EdgeInsets.only(bottom: 4.0),
                    child: Icon(Icons.person),
                  ),
                  label: AppLocalization.get('Profile'),
                ),
              ],
            ),
          ),
        );
      }
    );
  }
}
