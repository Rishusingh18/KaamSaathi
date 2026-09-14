import 'package:flutter/material.dart';
import '../../utils/localization.dart';
import 'institution_completion_payment_screen.dart';

class InstitutionWorkProgressScreen extends StatelessWidget {
  final bool showBackButton;

  const InstitutionWorkProgressScreen({
    super.key,
    this.showBackButton = true,
  });

  void _onConfirmCompletion(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text(AppLocalization.get('Confirm Project Completion')),
        content: const Text(
          'Are all painting milestones verified and completed to satisfaction?\nProceeding will open the final inspection and payment settlement.',
          style: TextStyle(fontSize: 13, height: 1.4),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('Cancel', style: TextStyle(color: Color(0xFF64748B))),
          ),
          ElevatedButton(
            onPressed: () {
              Navigator.pop(context);
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const InstitutionCompletionPaymentScreen()),
              );
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: const Color(0xFF087443),
            ),
            child: const Text('Proceed to Payment →', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
          ),
        ],
      ),
    );
  }

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
                      if (showBackButton)
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
                        )
                      else
                        const SizedBox(width: 40),
                      Text(
                        AppLocalization.get('Project Status'),
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
                        // Project Header Card
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
                                      color: const Color(0xFFDCFCE7),
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                    child: const Text(
                                      'Active • Day 4 of 5',
                                      style: TextStyle(fontSize: 11, fontWeight: FontWeight.bold, color: Color(0xFF087443)),
                                    ),
                                  ),
                                  const Text('REQ-2026-01', style: TextStyle(fontSize: 11, color: Color(0xFF94A3B8))),
                                ],
                              ),
                              const SizedBox(height: 10),
                              Text(
                                AppLocalization.get('College Campus Painting'),
                                style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Color(0xFF0F172A)),
                              ),
                              const SizedBox(height: 4),
                              const Text('ABC College Administrative & Library Block', style: TextStyle(fontSize: 12, color: Color(0xFF64748B))),
                              const SizedBox(height: 14),

                              // Progress Bar
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: const [
                                  Text('Overall Progress', style: TextStyle(fontSize: 12, fontWeight: FontWeight.w600, color: Color(0xFF334155))),
                                  Text('80% Completed', style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold, color: Color(0xFF087443))),
                                ],
                              ),
                              const SizedBox(height: 6),
                              ClipRRect(
                                borderRadius: BorderRadius.circular(4),
                                child: LinearProgressIndicator(
                                  value: 0.80,
                                  minHeight: 8,
                                  backgroundColor: const Color(0xFFE2E8F0),
                                  valueColor: const AlwaysStoppedAnimation<Color>(Color(0xFF087443)),
                                ),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(height: 14),

                        // Assigned Workforce & Attendance
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
                                  Text(
                                    AppLocalization.get('Assigned Workforce'),
                                    style: const TextStyle(fontSize: 14, fontWeight: FontWeight.bold, color: Color(0xFF0F172A)),
                                  ),
                                  Container(
                                    padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 3),
                                    decoration: BoxDecoration(
                                      color: const Color(0xFFF0FDF4),
                                      borderRadius: BorderRadius.circular(10),
                                      border: Border.all(color: const Color(0xFFBBF7D0)),
                                    ),
                                    child: Row(
                                      children: [
                                        const Icon(Icons.check_circle, size: 12, color: Color(0xFF087443)),
                                        const SizedBox(width: 4),
                                        Text(
                                          AppLocalization.get('Attendance Verified'),
                                          style: const TextStyle(fontSize: 10.5, fontWeight: FontWeight.bold, color: Color(0xFF087443)),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                              const SizedBox(height: 8),
                              const Text('Nirman Shramik Cooperative (Dwarka Unit)', style: TextStyle(fontSize: 12.5, fontWeight: FontWeight.bold, color: Color(0xFF123B5D))),
                              const SizedBox(height: 10),

                              // Attendance badges (5 workers present)
                              Container(
                                padding: const EdgeInsets.all(10),
                                decoration: BoxDecoration(
                                  color: const Color(0xFFF8FAFC),
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: const [
                                    Text('Daily Attendance Status', style: TextStyle(fontSize: 11.5, color: Color(0xFF64748B))),
                                    Text('5 / 5 Workers On Site ✓', style: TextStyle(fontSize: 11.5, fontWeight: FontWeight.bold, color: Color(0xFF087443))),
                                  ],
                                ),
                              ),
                              const SizedBox(height: 10),

                              // Team Lead Contact
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  const Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text('Team Lead: Ramlal Kumar', style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold, color: Color(0xFF0F172A))),
                                      Text('+91 98765 11223 • Verified Coordinator', style: TextStyle(fontSize: 11, color: Color(0xFF64748B))),
                                    ],
                                  ),
                                  OutlinedButton.icon(
                                    onPressed: () {},
                                    icon: const Icon(Icons.phone, size: 14, color: Color(0xFF123B5D)),
                                    label: const Text('Call', style: TextStyle(fontSize: 11, fontWeight: FontWeight.bold, color: Color(0xFF123B5D))),
                                    style: OutlinedButton.styleFrom(
                                      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                                      side: const BorderSide(color: Color(0xFF123B5D)),
                                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(height: 14),

                        // Latest Project Update
                        Container(
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(16),
                            border: Border.all(color: const Color(0xFFE2E8F0)),
                          ),
                          padding: const EdgeInsets.all(16),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: const [
                              Text('Latest Project Update', style: TextStyle(fontSize: 13.5, fontWeight: FontWeight.bold, color: Color(0xFF0F172A))),
                              SizedBox(height: 8),
                              Text(
                                'Library building second coat completed today. Admin block east wing trim underway. Surface curing verified by supervisor.',
                                style: TextStyle(fontSize: 12, color: Color(0xFF475569), height: 1.35),
                              ),
                              SizedBox(height: 8),
                              Text('Logged today at 04:15 PM by Ramlal Kumar', style: TextStyle(fontSize: 10.5, color: Color(0xFF94A3B8))),
                            ],
                          ),
                        ),
                        const SizedBox(height: 14),

                        // Escrow Payment Status
                        Container(
                          padding: const EdgeInsets.all(14),
                          decoration: BoxDecoration(
                            color: const Color(0xFFEFF6FF),
                            borderRadius: BorderRadius.circular(14),
                            border: Border.all(color: const Color(0xFFDBEAFE)),
                          ),
                          child: Row(
                            children: const [
                              Icon(Icons.shield, size: 20, color: Color(0xFF1D4ED8)),
                              SizedBox(width: 10),
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text('Institutional Escrow Protected: ₹22,890', style: TextStyle(fontSize: 12.5, fontWeight: FontWeight.bold, color: Color(0xFF1E3A8A))),
                                    SizedBox(height: 2),
                                    Text('Funds are safely held and released upon your final inspection approval.', style: TextStyle(fontSize: 11, color: Color(0xFF2563EB))),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(height: 24),

                        // Primary Action Button
                        SizedBox(
                          width: double.infinity,
                          height: 48,
                          child: ElevatedButton(
                            onPressed: () => _onConfirmCompletion(context),
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
                                  AppLocalization.get('Confirm Project Completion'),
                                  style: const TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
                                ),
                                const SizedBox(width: 6),
                                const Icon(Icons.arrow_forward, size: 16),
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
}
