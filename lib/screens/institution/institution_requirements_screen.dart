import 'package:flutter/material.dart';
import '../../utils/localization.dart';
import 'institution_requirement_details_screen.dart';
import 'institution_work_progress_screen.dart';

class InstitutionRequirementsScreen extends StatefulWidget {
  final bool showBackButton;

  const InstitutionRequirementsScreen({
    super.key,
    this.showBackButton = false,
  });

  @override
  State<InstitutionRequirementsScreen> createState() =>
      _InstitutionRequirementsScreenState();
}

class _InstitutionRequirementsScreenState
    extends State<InstitutionRequirementsScreen> {
  int _selectedTabIndex = 0; // 0: All, 1: Open, 2: Matching, 3: Assigned

  final List<Map<String, dynamic>> _requirements = [
    {
      'id': 'REQ-2026-01',
      'title': 'College Campus Painting',
      'category': 'Painting',
      'emoji': '🎨',
      'workers': '5 Painting Workers',
      'status': 'Assigned',
      'statusBg': Color(0xFFDCFCE7),
      'statusColor': Color(0xFF087443),
      'dates': 'Sep 14–18, 2026',
      'budget': '₹22,890',
      'progress': 'Day 4 of 5',
    },
    {
      'id': 'REQ-2026-02',
      'title': 'Hostel Electrical Upgradation',
      'category': 'Electrical',
      'emoji': '⚡',
      'workers': '3 Electricians',
      'status': 'Matching',
      'statusBg': Color(0xFFFEF3C7),
      'statusColor': Color(0xFFB45309),
      'dates': 'Sep 20–22, 2026',
      'budget': '₹14,500',
      'progress': '2 Co-ops Applied',
    },
    {
      'id': 'REQ-2026-03',
      'title': 'Annual Campus Maintenance',
      'category': 'Maintenance',
      'emoji': '🧹',
      'workers': '8 General Workers',
      'status': 'Open',
      'statusBg': Color(0xFFE0F2FE),
      'statusColor': Color(0xFF0369A1),
      'dates': 'Oct 01–15, 2026',
      'budget': '₹45,000',
      'progress': 'Open for bids',
    },
  ];

  void _showNewRequirementDialog() {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (context) => Container(
        padding: EdgeInsets.only(
          bottom: MediaQuery.of(context).viewInsets.bottom + 20,
          left: 20,
          right: 20,
          top: 20,
        ),
        decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.vertical(top: Radius.circular(24)),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: Container(
                width: 40,
                height: 4,
                decoration: BoxDecoration(
                  color: const Color(0xFFCBD5E1),
                  borderRadius: BorderRadius.circular(2),
                ),
              ),
            ),
            const SizedBox(height: 16),
            const Text(
              'Create Workforce Requirement',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Color(0xFF0F172A)),
            ),
            const SizedBox(height: 4),
            const Text(
              'Specify trade, worker count, and project dates.',
              style: TextStyle(fontSize: 12, color: Color(0xFF64748B)),
            ),
            const SizedBox(height: 16),
            const TextField(
              decoration: InputDecoration(
                labelText: 'Project Title',
                hintText: 'e.g. Science Block Plumbing',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 12),
            const TextField(
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                labelText: 'Number of Workers Needed',
                hintText: 'e.g. 4',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 16),
            SizedBox(
              width: double.infinity,
              height: 46,
              child: ElevatedButton(
                onPressed: () {
                  Navigator.pop(context);
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text('Requirement posted successfully to SAHYOG Network!'),
                      backgroundColor: Color(0xFF087443),
                    ),
                  );
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFF123B5D),
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                ),
                child: const Text('Post Requirement', style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white)),
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final filteredList = _requirements.where((item) {
      if (_selectedTabIndex == 1) return item['status'] == 'Open';
      if (_selectedTabIndex == 2) return item['status'] == 'Matching';
      if (_selectedTabIndex == 3) return item['status'] == 'Assigned';
      return true;
    }).toList();

    return ValueListenableBuilder<String>(
      valueListenable: AppLocalization.currentLang,
      builder: (context, lang, child) {
        return Scaffold(
          backgroundColor: const Color(0xFFF8FAFC),
          body: SafeArea(
            child: Column(
              children: [
                // Top Header
                Container(
                  color: Colors.white,
                  padding: const EdgeInsets.fromLTRB(16, 12, 16, 12),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          if (widget.showBackButton) ...[
                            GestureDetector(
                              onTap: () => Navigator.pop(context),
                              child: const Icon(Icons.arrow_back_ios_new, size: 16, color: Color(0xFF123B5D)),
                            ),
                            const SizedBox(width: 8),
                          ],
                          Text(
                            AppLocalization.get('Workforce Requirements'),
                            style: const TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                              color: Color(0xFF0F172A),
                            ),
                          ),
                        ],
                      ),
                      ElevatedButton.icon(
                        onPressed: _showNewRequirementDialog,
                        icon: const Icon(Icons.add, size: 14, color: Colors.white),
                        label: Text(
                          AppLocalization.get('+ New Requirement'),
                          style: const TextStyle(fontSize: 11, fontWeight: FontWeight.bold, color: Colors.white),
                        ),
                        style: ElevatedButton.styleFrom(
                          backgroundColor: const Color(0xFF087443),
                          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
                          elevation: 0,
                          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
                        ),
                      ),
                    ],
                  ),
                ),

                // Filter Tabs Row
                Container(
                  color: Colors.white,
                  padding: const EdgeInsets.fromLTRB(16, 0, 16, 12),
                  child: Row(
                    children: [
                      _buildFilterTab(0, 'All (${_requirements.length})'),
                      const SizedBox(width: 8),
                      _buildFilterTab(1, 'Open (1)'),
                      const SizedBox(width: 8),
                      _buildFilterTab(2, 'Matching (1)'),
                      const SizedBox(width: 8),
                      _buildFilterTab(3, 'Assigned (1)'),
                    ],
                  ),
                ),

                // List of requirements
                Expanded(
                  child: ListView.separated(
                    padding: const EdgeInsets.all(16),
                    physics: const BouncingScrollPhysics(),
                    itemCount: filteredList.length,
                    separatorBuilder: (context, index) => const SizedBox(height: 12),
                    itemBuilder: (context, index) {
                      final item = filteredList[index];
                      return _buildRequirementCard(context, item);
                    },
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  Widget _buildFilterTab(int index, String label) {
    final isSelected = _selectedTabIndex == index;
    return GestureDetector(
      onTap: () => setState(() => _selectedTabIndex = index),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
        decoration: BoxDecoration(
          color: isSelected ? const Color(0xFF123B5D) : const Color(0xFFF1F5F9),
          borderRadius: BorderRadius.circular(20),
        ),
        child: Text(
          label,
          style: TextStyle(
            fontSize: 11.5,
            fontWeight: isSelected ? FontWeight.bold : FontWeight.w500,
            color: isSelected ? Colors.white : const Color(0xFF64748B),
          ),
        ),
      ),
    );
  }

  Widget _buildRequirementCard(BuildContext context, Map<String, dynamic> item) {
    final isAssigned = item['status'] == 'Assigned';

    return GestureDetector(
      onTap: () {
        if (isAssigned) {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const InstitutionWorkProgressScreen()),
          );
        } else {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const InstitutionRequirementDetailsScreen()),
          );
        }
      },
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(16),
          border: Border.all(color: const Color(0xFFE2E8F0)),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withValues(alpha: 0.02),
              blurRadius: 8,
              offset: const Offset(0, 2),
            ),
          ],
        ),
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Text(item['emoji'], style: const TextStyle(fontSize: 18)),
                    const SizedBox(width: 8),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          item['title'],
                          style: const TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.bold,
                            color: Color(0xFF0F172A),
                          ),
                        ),
                        Text(
                          item['id'],
                          style: const TextStyle(fontSize: 10.5, color: Color(0xFF94A3B8)),
                        ),
                      ],
                    ),
                  ],
                ),
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 9, vertical: 3.5),
                  decoration: BoxDecoration(
                    color: item['statusBg'],
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Text(
                    item['status'],
                    style: TextStyle(fontSize: 11, fontWeight: FontWeight.bold, color: item['statusColor']),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 12),
            Container(
              padding: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                color: const Color(0xFFF8FAFC),
                borderRadius: BorderRadius.circular(10),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      const Icon(Icons.people_alt_outlined, size: 14, color: Color(0xFF64748B)),
                      const SizedBox(width: 4),
                      Text(item['workers'], style: const TextStyle(fontSize: 12, fontWeight: FontWeight.w600, color: Color(0xFF334155))),
                    ],
                  ),
                  Row(
                    children: [
                      const Icon(Icons.calendar_today_outlined, size: 13, color: Color(0xFF64748B)),
                      const SizedBox(width: 4),
                      Text(item['dates'], style: const TextStyle(fontSize: 11.5, color: Color(0xFF64748B))),
                    ],
                  ),
                  Text(
                    item['budget'],
                    style: const TextStyle(fontSize: 13, fontWeight: FontWeight.bold, color: Color(0xFF123B5D)),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  item['progress'],
                  style: const TextStyle(fontSize: 11.5, color: Color(0xFF64748B), fontWeight: FontWeight.w500),
                ),
                Row(
                  children: [
                    Text(
                      isAssigned ? 'View Active Work →' : 'View Details →',
                      style: const TextStyle(fontSize: 11.5, fontWeight: FontWeight.bold, color: Color(0xFF1D4ED8)),
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
