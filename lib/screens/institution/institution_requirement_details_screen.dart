import 'package:flutter/material.dart';
import '../../utils/localization.dart';
import 'institution_choose_workforce_screen.dart';

class InstitutionRequirementDetailsScreen extends StatelessWidget {
  const InstitutionRequirementDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
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
                              style: const TextStyle(
                                fontSize: 13,
                                fontWeight: FontWeight.w600,
                                color: Color(0xFF123B5D),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Text(
                        AppLocalization.get('Requirement Details'),
                        style: const TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                          color: Color(0xFF0F172A),
                        ),
                      ),
                      GestureDetector(
                        onTap: () => AppLocalization.toggleLanguage(),
                        child: Container(
                          padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(14),
                            border: Border.all(color: const Color(0xFFE2E8F0)),
                          ),
                          child: Row(
                            children: [
                              Text('EN', style: TextStyle(fontSize: 11, fontWeight: lang == 'EN' ? FontWeight.bold : FontWeight.normal, color: lang == 'EN' ? const Color(0xFF123B5D) : const Color(0xFF94A3B8))),
                              const Padding(
                                padding: EdgeInsets.symmetric(horizontal: 2.0),
                                child: Text('|', style: TextStyle(fontSize: 11, color: Color(0xFF94A3B8))),
                              ),
                              Text('हिन्दी', style: TextStyle(fontSize: 11, fontWeight: lang == 'HI' ? FontWeight.bold : FontWeight.normal, color: lang == 'HI' ? const Color(0xFF123B5D) : const Color(0xFF94A3B8))),
                            ],
                          ),
                        ),
                      ),
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
                        // Header Card
                        Container(
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(16),
                            border: Border.all(color: const Color(0xFFE2E8F0)),
                          ),
                          padding: const EdgeInsets.all(16),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Container(
                                    padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 3.5),
                                    decoration: BoxDecoration(
                                      color: const Color(0xFFFEF3C7),
                                      borderRadius: BorderRadius.circular(12),
                                    ),
                                    child: Row(
                                      children: [
                                        const Icon(Icons.sync, size: 12, color: Color(0xFFB45309)),
                                        const SizedBox(width: 4),
                                        Text(
                                          AppLocalization.get('Matching in Progress'),
                                          style: const TextStyle(fontSize: 11, fontWeight: FontWeight.bold, color: Color(0xFFB45309)),
                                        ),
                                      ],
                                    ),
                                  ),
                                  const Text('REQ-2026-01', style: TextStyle(fontSize: 11, color: Color(0xFF94A3B8))),
                                ],
                              ),
                              const SizedBox(height: 10),
                              Text(
                                AppLocalization.get('College Campus Painting'),
                                style: const TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                  color: Color(0xFF0F172A),
                                ),
                              ),
                              const SizedBox(height: 4),
                              const Text(
                                'Administrative Block & Library Exterior Facade',
                                style: TextStyle(fontSize: 12.5, color: Color(0xFF64748B)),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(height: 14),

                        // Workforce Required Card
                        Container(
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(16),
                            border: Border.all(color: const Color(0xFFE2E8F0)),
                          ),
                          padding: const EdgeInsets.all(16),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Text(
                                'Workforce Required',
                                style: TextStyle(fontSize: 13.5, fontWeight: FontWeight.bold, color: Color(0xFF0F172A)),
                              ),
                              const SizedBox(height: 10),
                              Container(
                                padding: const EdgeInsets.all(12),
                                decoration: BoxDecoration(
                                  color: const Color(0xFFF8FAFC),
                                  borderRadius: BorderRadius.circular(12),
                                ),
                                child: const Row(
                                  children: [
                                    Text('🎨', style: TextStyle(fontSize: 22)),
                                    SizedBox(width: 10),
                                    Expanded(
                                      child: Column(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          Text('5 Skilled Painting Workers', style: TextStyle(fontSize: 13, fontWeight: FontWeight.bold, color: Color(0xFF0F172A))),
                                          SizedBox(height: 2),
                                          Text('Requires Skill Passport with Exterior Emulsion verification', style: TextStyle(fontSize: 11, color: Color(0xFF64748B))),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              const SizedBox(height: 12),
                              const Wrap(
                                spacing: 6,
                                runSpacing: 6,
                                children: [
                                  Chip(label: Text('Surface Prep', style: TextStyle(fontSize: 11)), visualDensity: VisualDensity.compact),
                                  Chip(label: Text('Exterior Emulsion', style: TextStyle(fontSize: 11)), visualDensity: VisualDensity.compact),
                                  Chip(label: Text('Scaffolding Safety', style: TextStyle(fontSize: 11)), visualDensity: VisualDensity.compact),
                                ],
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(height: 14),

                        // Scope & Schedule Card
                        Container(
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(16),
                            border: Border.all(color: const Color(0xFFE2E8F0)),
                          ),
                          padding: const EdgeInsets.all(16),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Text(
                                'Schedule & Budget Details',
                                style: TextStyle(fontSize: 13.5, fontWeight: FontWeight.bold, color: Color(0xFF0F172A)),
                              ),
                              const SizedBox(height: 12),
                              _buildDetailRow('Project Schedule', 'Sep 14 – Sep 18, 2026 (5 Days)'),
                              const Divider(height: 20),
                              _buildDetailRow('Working Hours', '09:00 AM – 05:30 PM daily'),
                              const Divider(height: 20),
                              _buildDetailRow('Estimated Total Budget', '₹22,890 (₹750/worker/day + equipment)'),
                              const Divider(height: 20),
                              _buildDetailRow('Location', 'ABC College, Sector 14 Dwarka, New Delhi'),
                            ],
                          ),
                        ),
                        const SizedBox(height: 14),

                        // Requesting Institution
                        Container(
                          decoration: BoxDecoration(
                            color: const Color(0xFFF0FDF4),
                            borderRadius: BorderRadius.circular(14),
                            border: Border.all(color: const Color(0xFFBBF7D0)),
                          ),
                          padding: const EdgeInsets.all(14),
                          child: const Row(
                            children: [
                              Icon(Icons.account_balance, size: 22, color: Color(0xFF087443)),
                              SizedBox(width: 10),
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text('ABC College (Institutional Account)', style: TextStyle(fontSize: 12.5, fontWeight: FontWeight.bold, color: Color(0xFF065F46))),
                                    SizedBox(height: 2),
                                    Text('Coordinator: Dr. Arvind Sharma • +91 98765 43210', style: TextStyle(fontSize: 11, color: Color(0xFF047857))),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(height: 24),

                        // Action CTA
                        SizedBox(
                          width: double.infinity,
                          height: 48,
                          child: ElevatedButton(
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(builder: (context) => const InstitutionChooseWorkforceScreen()),
                              );
                            },
                            style: ElevatedButton.styleFrom(
                              backgroundColor: const Color(0xFF087443),
                              foregroundColor: Colors.white,
                              elevation: 0,
                              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  AppLocalization.get('Find Matching Workforce →'),
                                  style: const TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
                                ),
                              ],
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

  Widget _buildDetailRow(String label, String value) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(label, style: const TextStyle(fontSize: 12, color: Color(0xFF64748B))),
        Text(value, style: const TextStyle(fontSize: 12, fontWeight: FontWeight.bold, color: Color(0xFF0F172A))),
      ],
    );
  }
}
