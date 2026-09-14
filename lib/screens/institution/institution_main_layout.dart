import 'package:flutter/material.dart';
import 'institution_dashboard_screen.dart';
import 'institution_requirements_screen.dart';
import 'institution_work_progress_screen.dart';
import 'institution_invoice_screen.dart';
import 'institution_profile_screen.dart';

class InstitutionMainLayout extends StatefulWidget {
  final int initialIndex;

  const InstitutionMainLayout({
    super.key,
    this.initialIndex = 0,
  });

  @override
  State<InstitutionMainLayout> createState() => _InstitutionMainLayoutState();
}

class _InstitutionMainLayoutState extends State<InstitutionMainLayout> {
  late int _currentIndex;

  @override
  void initState() {
    super.initState();
    _currentIndex = widget.initialIndex;
  }

  void _navigateToTab(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    final screens = [
      InstitutionDashboardScreen(
        onNavigateToRequirements: () => _navigateToTab(1),
        onNavigateToProjects: () => _navigateToTab(2),
        onNavigateToInvoices: () => _navigateToTab(3),
      ),
      const InstitutionRequirementsScreen(showBackButton: false),
      const InstitutionWorkProgressScreen(showBackButton: false),
      const InstitutionInvoiceScreen(showBackButton: false),
      const InstitutionProfileScreen(),
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
          selectedItemColor: const Color(0xFF123B5D),
          unselectedItemColor: const Color(0xFF64748B),
          selectedFontSize: 11,
          unselectedFontSize: 11,
          onTap: (index) {
            setState(() {
              _currentIndex = index;
            });
          },
          items: const [
            BottomNavigationBarItem(
              icon: Icon(Icons.dashboard_outlined),
              activeIcon: Icon(Icons.dashboard),
              label: 'Dashboard',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.assignment_outlined),
              activeIcon: Icon(Icons.assignment),
              label: 'Requirements',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.build_outlined),
              activeIcon: Icon(Icons.build),
              label: 'Projects',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.receipt_long_outlined),
              activeIcon: Icon(Icons.receipt_long),
              label: 'Invoices',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.account_balance_outlined),
              activeIcon: Icon(Icons.account_balance),
              label: 'Profile',
            ),
          ],
        ),
      ),
    );
  }
}
