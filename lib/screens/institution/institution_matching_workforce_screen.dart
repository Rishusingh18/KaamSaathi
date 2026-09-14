import 'package:flutter/material.dart';
import '../../utils/localization.dart';
import 'institution_work_progress_screen.dart';

class InstitutionMatchingWorkforceScreen extends StatelessWidget {
  final String coopName;

  const InstitutionMatchingWorkforceScreen({
    super.key,
    this.coopName = 'Nirman Shramik Cooperative',
  });

  void _onRequestWorkforce(BuildContext context) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (context) => Container(
        padding: const EdgeInsets.all(24),
        decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.vertical(top: Radius.circular(24)),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              width: 56,
              height: 56,
              decoration: const BoxDecoration(
                color: Color(0xFFDCFCE7),
                shape: BoxShape.circle,
              ),
              child: const Center(
                child: Icon(Icons.check_circle, color: Color(0xFF087443), size: 36),
              ),
            ),
            const SizedBox(height: 16),
            Text(
              AppLocalization.get('Workforce Requested ✓'),
              style: const TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Color(0xFF0F172A),
              ),
            ),
            const SizedBox(height: 8),
            Text(
              'Your workforce request for College Campus Painting has been confirmed with $coopName.',
              textAlign: TextAlign.center,
              style: const TextStyle(fontSize: 13, color: Color(0xFF64748B), height: 1.4),
            ),
            const SizedBox(height: 8),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
              decoration: BoxDecoration(
                color: const Color(0xFFF1F5F9),
                borderRadius: BorderRadius.circular(10),
              ),
              child: const Text('Deployment Scheduled: Sep 14, 09:00 AM', style: TextStyle(fontSize: 11, fontWeight: FontWeight.bold, color: Color(0xFF1E293B))),
            ),
            const SizedBox(height: 24),
            SizedBox(
              width: double.infinity,
              height: 46,
              child: ElevatedButton(
                onPressed: () {
                  Navigator.pop(context); // close modal
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(builder: (context) => const InstitutionWorkProgressScreen()),
                  );
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFF087443),
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                ),
                child: Text(
                  AppLocalization.get('View Service Status →'),
                  style: const TextStyle(fontSize: 14, fontWeight: FontWeight.bold, color: Colors.white),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final workers = [
      {'name': 'Ramlal Kumar', 'role': 'Team Lead & Master Painter', 'exp': '8 yrs exp', 'rating': '4.9 ★', 'skills': 'Exterior & Prep'},
      {'name': 'Suresh Verma', 'role': 'Senior Painter', 'exp': '6 yrs exp', 'rating': '4.8 ★', 'skills': 'Emulsion Coating'},
      {'name': 'Amit Paswan', 'role': 'Exterior Specialist', 'exp': '5 yrs exp', 'rating': '4.8 ★', 'skills': 'Scaffolding'},
      {'name': 'Rajesh Das', 'role': 'Prep & Finishing', 'exp': '4 yrs exp', 'rating': '4.7 ★', 'skills': 'Sanding & Priming'},
      {'name': 'Vikram Singh', 'role': 'Safety & Support Worker', 'exp': '3 yrs exp', 'rating': '4.7 ★', 'skills': 'Clean-up & Equipment'},
    ];

    return ValueListenableBuilder<String>(
      valueListenable: AppLocalization.currentLang,
      builder: (context, lang, child) {
        return Scaffold(
          backgroundColor: const Color(0xFFF8FAFC),
          body: SafeArea(
            child: Column(
              children: [
                // Top Bar
                Container(
                  color: Colors.white,
                  padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      GestureDetector(
                        onTap: () => Navigator.pop(context),
                        child: Row(
                          children: [
                            const Icon(Icons.arrow_back_ios_new, size: 14, color: Color(0xFF123B5D)),
                            const SizedBox(width: 4),
                            Text(
                              AppLocalization.get('Back'),
                              style: const TextStyle(fontSize: 13, fontWeight: FontWeight.w600, color: Color(0xFF123B5D)),
                            ),
                          ],
                        ),
                      ),
                      Text(
                        AppLocalization.get('Matching Workforce'),
                        style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Color(0xFF0F172A)),
                      ),
                      const SizedBox(width: 40),
                    ],
                  ),
                ),

                // Main Content
                Expanded(
                  child: SingleChildScrollView(
                    physics: const BouncingScrollPhysics(),
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // Matched Team Card
                        Container(
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(16),
                            border: Border.all(color: const Color(0xFF087443)),
                          ),
                          padding: const EdgeInsets.all(16),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    AppLocalization.get('Recommended Workforce'),
                                    style: const TextStyle(fontSize: 11.5, fontWeight: FontWeight.bold, color: Color(0xFF087443), letterSpacing: 0.3),
                                  ),
                                  Container(
                                    padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 3),
                                    decoration: BoxDecoration(
                                      color: const Color(0xFFDCFCE7),
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                    child: const Text('Co-op Verified ✓', style: TextStyle(fontSize: 10, fontWeight: FontWeight.bold, color: Color(0xFF087443))),
                                  ),
                                ],
                              ),
                              const SizedBox(height: 8),
                              Text(
                                coopName,
                                style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Color(0xFF0F172A)),
                              ),
                              const SizedBox(height: 4),
                              const Text('5 Skilled Workers Allocated • Sector 12 Dwarka Unit', style: TextStyle(fontSize: 11.5, color: Color(0xFF64748B))),
                            ],
                          ),
                        ),
                        const SizedBox(height: 16),

                        // Allocated Workers Roster
                        const Text(
                          'Worker Roster (5 Members)',
                          style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold, color: Color(0xFF0F172A)),
                        ),
                        const SizedBox(height: 10),

                        ...workers.map((w) => Container(
                              margin: const EdgeInsets.only(bottom: 8),
                              padding: const EdgeInsets.all(12),
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(12),
                                border: Border.all(color: const Color(0xFFE2E8F0)),
                              ),
                              child: Row(
                                children: [
                                  CircleAvatar(
                                    backgroundColor: const Color(0xFFE0F2FE),
                                    child: Text(w['name']![0], style: const TextStyle(fontWeight: FontWeight.bold, color: Color(0xFF0369A1))),
                                  ),
                                  const SizedBox(width: 10),
                                  Expanded(
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Row(
                                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                          children: [
                                            Text(w['name']!, style: const TextStyle(fontSize: 13, fontWeight: FontWeight.bold, color: Color(0xFF0F172A))),
                                            Container(
                                              padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
                                              decoration: BoxDecoration(
                                                color: const Color(0xFFECFDF5),
                                                borderRadius: BorderRadius.circular(6),
                                              ),
                                              child: const Text('Skill Passport ✓', style: TextStyle(fontSize: 9.5, fontWeight: FontWeight.bold, color: Color(0xFF087443))),
                                            ),
                                          ],
                                        ),
                                        const SizedBox(height: 2),
                                        Text('${w['role']} • ${w['exp']}', style: const TextStyle(fontSize: 11, color: Color(0xFF64748B))),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            )),

                        const SizedBox(height: 16),

                        // Cost Breakdown
                        Container(
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(14),
                            border: Border.all(color: const Color(0xFFE2E8F0)),
                          ),
                          padding: const EdgeInsets.all(14),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Text('Cost Estimate', style: TextStyle(fontSize: 13, fontWeight: FontWeight.bold, color: Color(0xFF0F172A))),
                              const SizedBox(height: 10),
                              _buildCostRow('Base Labor (5 workers × 5 days)', '₹18,750'),
                              const SizedBox(height: 6),
                              _buildCostRow('Cooperative Supervision & Safety Tools', '₹2,000'),
                              const SizedBox(height: 6),
                              _buildCostRow('GST / Cooperative DPI Fee (5%)', '₹1,038'),
                              const Divider(height: 16),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: const [
                                  Text('Estimated Total', style: TextStyle(fontSize: 13, fontWeight: FontWeight.bold, color: Color(0xFF0F172A))),
                                  Text('₹21,788', style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold, color: Color(0xFF123B5D))),
                                ],
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(height: 20),

                        // Action Button
                        SizedBox(
                          width: double.infinity,
                          height: 48,
                          child: ElevatedButton(
                            onPressed: () => _onRequestWorkforce(context),
                            style: ElevatedButton.styleFrom(
                              backgroundColor: const Color(0xFF087443),
                              foregroundColor: Colors.white,
                              elevation: 0,
                              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                            ),
                            child: const Text(
                              'Request Selected Workforce →',
                              style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
                            ),
                          ),
                        ),
                        const SizedBox(height: 16),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  Widget _buildCostRow(String label, String value) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(label, style: const TextStyle(fontSize: 11.5, color: Color(0xFF64748B))),
        Text(value, style: const TextStyle(fontSize: 11.5, fontWeight: FontWeight.w600, color: Color(0xFF334155))),
      ],
    );
  }
}
