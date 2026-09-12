import 'package:flutter/material.dart';
import '../theme/colors.dart';
import 'worker_assignment_screen.dart';

class WorkerDetailsScreen extends StatelessWidget {
  const WorkerDetailsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.surfaceCanvas,
      appBar: AppBar(
        backgroundColor: AppColors.surfaceCanvas,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: AppColors.textPrimary),
          onPressed: () => Navigator.pop(context),
        ),
        title: const Text(
          'Worker Details',
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
            color: AppColors.primaryContainer,
          ),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 16.0),
            child: Center(
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                decoration: BoxDecoration(
                  color: Colors.grey.shade100,
                  border: Border.all(color: AppColors.borderSubtle),
                  borderRadius: BorderRadius.circular(16),
                ),
                child: Row(
                  children: const [
                    Text('EN', style: TextStyle(fontSize: 11, fontWeight: FontWeight.bold, color: AppColors.primaryContainer)),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 4.0),
                      child: Text('|', style: TextStyle(fontSize: 11, color: Colors.grey)),
                    ),
                    Text('हिन्दी', style: TextStyle(fontSize: 11, color: Colors.grey)),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            // Profile Card
            _buildSectionContainer(
              child: Column(
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        width: 56,
                        height: 56,
                        decoration: BoxDecoration(
                          color: AppColors.primaryContainer.withOpacity(0.1),
                          shape: BoxShape.circle,
                          border: Border.all(color: AppColors.primaryContainer.withOpacity(0.2), width: 2),
                        ),
                        alignment: Alignment.center,
                        child: const Text('RK', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: AppColors.primaryContainer)),
                      ),
                      const SizedBox(width: 12),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text('Ramlal Kumar', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: AppColors.textPrimary)),
                            const SizedBox(height: 2),
                            const Text('Construction Worker', style: TextStyle(fontSize: 12, color: AppColors.textSecondary)),
                            const SizedBox(height: 4),
                            Container(
                              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
                              decoration: BoxDecoration(
                                color: Colors.green.shade50,
                                borderRadius: BorderRadius.circular(12),
                                border: Border.all(color: Colors.green.shade200),
                              ),
                              child: Row(
                                mainAxisSize: MainAxisSize.min,
                                children: const [
                                  Text('✓', style: TextStyle(fontSize: 10, fontWeight: FontWeight.bold, color: AppColors.cooperativeGreen)),
                                  SizedBox(width: 4),
                                  Text('Available', style: TextStyle(fontSize: 11, fontWeight: FontWeight.bold, color: AppColors.cooperativeGreen)),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 12),
                  const Divider(color: AppColors.borderSubtle, height: 1),
                  const SizedBox(height: 12),
                  Wrap(
                    spacing: 6,
                    runSpacing: 6,
                    children: [
                      _buildVerificationBadge('✓', 'Skill Passport Active', Colors.blue.shade50, Colors.blue.shade200, AppColors.primaryContainer),
                      _buildVerificationBadge('✓', 'e-Shram Verified', Colors.green.shade50, Colors.green.shade200, AppColors.cooperativeGreen),
                    ],
                  ),
                  const SizedBox(height: 12),
                  Row(
                    children: [
                      Expanded(child: _buildMetricBox('Completed', '24 Jobs', AppColors.primaryContainer)),
                      const SizedBox(width: 8),
                      Expanded(child: _buildMetricBox('Rating', '4.7 ★ Worker Rating', Colors.amber.shade700)),
                    ],
                  ),
                ],
              ),
            ),
            
            const SizedBox(height: 12),
            
            // Skills & Experience
            _buildSectionContainer(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text('SKILLS & EXPERIENCE', style: TextStyle(fontSize: 11, fontWeight: FontWeight.bold, color: AppColors.textPrimary)),
                  const SizedBox(height: 8),
                  Wrap(
                    spacing: 6,
                    runSpacing: 6,
                    children: ['Painting', 'Masonry', 'General Labour'].map((skill) {
                      return Container(
                        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                        decoration: BoxDecoration(
                          color: Colors.grey.shade100,
                          borderRadius: BorderRadius.circular(6),
                          border: Border.all(color: AppColors.borderSubtle),
                        ),
                        child: Text(skill, style: const TextStyle(fontSize: 11, color: AppColors.textSecondary)),
                      );
                    }).toList(),
                  ),
                  const SizedBox(height: 8),
                  const Text('5 years experience', style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold, color: AppColors.textPrimary)),
                  const Text('Construction and residential work', style: TextStyle(fontSize: 12, color: AppColors.textSecondary)),
                ],
              ),
            ),

            const SizedBox(height: 12),
            
            // Availability
            _buildSectionContainer(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text('AVAILABILITY', style: TextStyle(fontSize: 11, fontWeight: FontWeight.bold, color: AppColors.textPrimary)),
                  const SizedBox(height: 12),
                  _buildInfoRow('Status', 'Available', valueColor: Colors.green.shade700, showDot: true),
                  const SizedBox(height: 8),
                  _buildInfoRow('Preferred Areas', 'Delhi NCR'),
                  const SizedBox(height: 8),
                  _buildInfoRow('Work Type', 'Full-time / Project work'),
                ],
              ),
            ),

            const SizedBox(height: 12),
            
            // Recent Work
            _buildSectionContainer(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: const [
                      Text('RECENT WORK', style: TextStyle(fontSize: 11, fontWeight: FontWeight.bold, color: AppColors.textPrimary)),
                      Text('Latest records', style: TextStyle(fontSize: 11, fontWeight: FontWeight.bold, color: AppColors.primaryContainer)),
                    ],
                  ),
                  const SizedBox(height: 12),
                  _buildWorkHistoryCard('Residential Painting', 'Sep 10, 2026', 'Completed'),
                  const SizedBox(height: 8),
                  _buildWorkHistoryCard('Community Hall Repair', 'Sep 5, 2026', 'Completed'),
                ],
              ),
            ),

            const SizedBox(height: 12),
            
            // Cooperative Association
            _buildSectionContainer(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text('COOPERATIVE ASSOCIATION', style: TextStyle(fontSize: 11, fontWeight: FontWeight.bold, color: AppColors.textPrimary)),
                  const SizedBox(height: 12),
                  _buildInfoRow('Cooperative', 'Nirman Shramik Cooperative', isValueBold: true, valueColor: AppColors.primaryContainer),
                  const SizedBox(height: 8),
                  _buildInfoRow('Role', 'Member'),
                  const SizedBox(height: 12),
                  Container(
                    padding: const EdgeInsets.all(8),
                    decoration: BoxDecoration(
                      color: Colors.blue.shade50,
                      borderRadius: BorderRadius.circular(6),
                      border: Border.all(color: Colors.blue.shade100),
                    ),
                    child: const Text(
                      'Worker profiles and Skill Passports can exist independently of cooperative membership.',
                      style: TextStyle(fontSize: 10, color: AppColors.primaryContainer),
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 16),
            
            // Actions
            SizedBox(
              width: double.infinity,
              child: ElevatedButton.icon(
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) => const WorkerAssignmentScreen()));
                },
                icon: const Icon(Icons.arrow_forward),
                label: const Text('Assign to Project', style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold)),
                style: ElevatedButton.styleFrom(
                  padding: const EdgeInsets.symmetric(vertical: 14),
                  backgroundColor: AppColors.cooperativeGreen,
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                ),
              ),
            ),
            const SizedBox(height: 8),
            SizedBox(
              width: double.infinity,
              child: OutlinedButton(
                onPressed: () {},
                style: OutlinedButton.styleFrom(
                  padding: const EdgeInsets.symmetric(vertical: 14),
                  side: const BorderSide(color: AppColors.primaryContainer),
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                ),
                child: const Text('View Work History', style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold, color: AppColors.primaryContainer)),
              ),
            ),
            
            const SizedBox(height: 24),
          ],
        ),
      ),
    );
  }

  Widget _buildSectionContainer({required Widget child}) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: AppColors.borderSubtle),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.02),
            blurRadius: 8,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: child,
    );
  }

  Widget _buildVerificationBadge(String icon, String text, Color bgColor, Color borderColor, Color textColor) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      decoration: BoxDecoration(
        color: bgColor,
        borderRadius: BorderRadius.circular(6),
        border: Border.all(color: borderColor),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(icon, style: TextStyle(fontSize: 11, fontWeight: FontWeight.bold, color: textColor)),
          const SizedBox(width: 4),
          Text(text, style: TextStyle(fontSize: 11, fontWeight: FontWeight.bold, color: textColor)),
        ],
      ),
    );
  }

  Widget _buildMetricBox(String topLabel, String bottomValue, Color bottomColor) {
    return Container(
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: Colors.grey.shade50,
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: AppColors.borderSubtle),
      ),
      child: Column(
        children: [
          Text(topLabel, style: const TextStyle(fontSize: 12, color: AppColors.textSecondary, fontWeight: FontWeight.w500)),
          const SizedBox(height: 2),
          Text(bottomValue, style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold, color: bottomColor)),
        ],
      ),
    );
  }

  Widget _buildInfoRow(String label, String value, {Color? valueColor, bool showDot = false, bool isValueBold = false}) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(label, style: const TextStyle(fontSize: 12, color: AppColors.textSecondary)),
        Row(
          children: [
            if (showDot) ...[
              Container(
                width: 8,
                height: 8,
                decoration: BoxDecoration(color: valueColor, shape: BoxShape.circle),
              ),
              const SizedBox(width: 4),
            ],
            Text(
              value,
              style: TextStyle(
                fontSize: 12,
                color: valueColor ?? AppColors.textPrimary,
                fontWeight: isValueBold || showDot ? FontWeight.bold : FontWeight.w500,
              ),
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildWorkHistoryCard(String title, String date, String status) {
    return Container(
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: Colors.grey.shade50,
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: AppColors.borderSubtle),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(title, style: const TextStyle(fontSize: 12, fontWeight: FontWeight.bold, color: AppColors.textPrimary)),
              const SizedBox(height: 2),
              Text(date, style: const TextStyle(fontSize: 11, color: AppColors.textSecondary)),
            ],
          ),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
            decoration: BoxDecoration(
              color: Colors.green.shade50,
              borderRadius: BorderRadius.circular(6),
              border: Border.all(color: Colors.green.shade200),
            ),
            child: Text('✓ $status', style: const TextStyle(fontSize: 10, fontWeight: FontWeight.bold, color: AppColors.cooperativeGreen)),
          ),
        ],
      ),
    );
  }
}
