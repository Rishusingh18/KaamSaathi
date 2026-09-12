import 'package:flutter/material.dart';
import '../theme/colors.dart';
import 'worker_assignment_screen.dart'; // To be implemented later

class RequestDetailsScreen extends StatefulWidget {
  const RequestDetailsScreen({Key? key}) : super(key: key);

  @override
  State<RequestDetailsScreen> createState() => _RequestDetailsScreenState();
}

class _RequestDetailsScreenState extends State<RequestDetailsScreen> {
  bool _isAccepted = false;

  void _handleAccept() {
    setState(() {
      _isAccepted = true;
    });
  }

  void _handleDecline() {
    // Show dialog or go back
    Navigator.pop(context);
  }

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
        title: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Container(
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
          ],
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: const [
                    Text(
                      'Request Details',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: AppColors.primaryContainer,
                      ),
                    ),
                    Text(
                      'Review requirements and cooperative capacity',
                      style: TextStyle(fontSize: 12, color: AppColors.textSecondary),
                    ),
                  ],
                ),
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                  decoration: BoxDecoration(
                    color: _isAccepted ? Colors.green.shade50 : Colors.amber.shade50,
                    border: Border.all(color: _isAccepted ? Colors.green.shade200 : Colors.amber.shade200),
                    borderRadius: BorderRadius.circular(16),
                  ),
                  child: Row(
                    children: [
                      Container(
                        width: 6,
                        height: 6,
                        decoration: BoxDecoration(
                          color: _isAccepted ? AppColors.cooperativeGreen : Colors.amber.shade700,
                          shape: BoxShape.circle,
                        ),
                      ),
                      const SizedBox(width: 4),
                      Text(
                        _isAccepted ? 'Accepted ✓' : 'New Request',
                        style: TextStyle(
                          fontSize: 11,
                          fontWeight: FontWeight.bold,
                          color: _isAccepted ? AppColors.cooperativeGreen : Colors.amber.shade700,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            
            const SizedBox(height: 16),
            
            if (_isAccepted)
              Container(
                margin: const EdgeInsets.only(bottom: 16),
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                  color: Colors.green.shade50,
                  border: Border.all(color: Colors.green.shade200),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Row(
                  children: [
                    Container(
                      padding: const EdgeInsets.all(4),
                      decoration: const BoxDecoration(
                        color: AppColors.cooperativeGreen,
                        shape: BoxShape.circle,
                      ),
                      child: const Icon(Icons.check, size: 12, color: Colors.white),
                    ),
                    const SizedBox(width: 12),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: const [
                          Text('Request accepted successfully!', style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold, color: Colors.green)),
                          Text('Assign workers to begin this project.', style: TextStyle(fontSize: 11, color: Colors.green)),
                        ],
                      ),
                    ),
                  ],
                ),
              ),

            // Request Summary
            _buildSectionContainer(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                    decoration: BoxDecoration(
                      color: Colors.purple.shade50,
                      borderRadius: BorderRadius.circular(12),
                      border: Border.all(color: Colors.purple.shade200),
                    ),
                    child: Text(
                      '🏢 Institution',
                      style: TextStyle(fontSize: 10, fontWeight: FontWeight.w600, color: Colors.purple.shade700),
                    ),
                  ),
                  const SizedBox(height: 8),
                  const Text('Community Hall Repair', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
                  const Text('Najafgarh Community Centre', style: TextStyle(fontSize: 12, color: AppColors.textSecondary)),
                  const SizedBox(height: 12),
                  const Divider(color: AppColors.borderSubtle),
                  const SizedBox(height: 12),
                  _buildIconRow('📍', 'Najafgarh, New Delhi'),
                  const SizedBox(height: 8),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      _buildIconRow('🗓️', 'Sep 18–22, 2026'),
                      _buildIconRow('⏰', '9:00 AM – 5:00 PM'),
                    ],
                  ),
                  const SizedBox(height: 8),
                  _buildIconRow('👥', '5 workers required', isBold: true),
                ],
              ),
            ),
            
            const SizedBox(height: 12),
            
            // Work Requirements
            _buildSectionContainer(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text('REQUIRED SKILLS', style: TextStyle(fontSize: 11, fontWeight: FontWeight.bold, color: AppColors.textPrimary)),
                  const SizedBox(height: 8),
                  Wrap(
                    spacing: 8,
                    children: ['Masonry', 'Painting', 'General Labour'].map((skill) {
                      return Container(
                        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                        decoration: BoxDecoration(
                          color: Colors.grey.shade100,
                          borderRadius: BorderRadius.circular(6),
                          border: Border.all(color: AppColors.borderSubtle),
                        ),
                        child: Text(skill, style: const TextStyle(fontSize: 11, color: AppColors.textSecondary)),
                      );
                    }).toList(),
                  ),
                  const SizedBox(height: 12),
                  const Divider(color: AppColors.borderSubtle),
                  const SizedBox(height: 12),
                  const Text('WORK DESCRIPTION', style: TextStyle(fontSize: 11, fontWeight: FontWeight.bold, color: AppColors.textPrimary)),
                  const SizedBox(height: 8),
                  const Text(
                    'Repair and repaint the community hall, including wall repairs, surface preparation and interior painting.',
                    style: TextStyle(fontSize: 12, color: AppColors.textSecondary, height: 1.5),
                  ),
                  const SizedBox(height: 12),
                  const Divider(color: AppColors.borderSubtle),
                  const SizedBox(height: 12),
                  const Text('ESTIMATED WORK', style: TextStyle(fontSize: 11, fontWeight: FontWeight.bold, color: AppColors.textPrimary)),
                  const SizedBox(height: 12),
                  Row(
                    children: [
                      Expanded(child: _buildMetricBox('5 days', 'Duration')),
                      const SizedBox(width: 8),
                      Expanded(child: _buildMetricBox('5 workers', 'Team Size')),
                      const SizedBox(width: 8),
                      Expanded(child: _buildMetricBox('~200 hrs', 'Total Hours')),
                    ],
                  ),
                ],
              ),
            ),

            const SizedBox(height: 12),

            // Estimated Payment
            _buildSectionContainer(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text('ESTIMATED PAYMENT', style: TextStyle(fontSize: 11, fontWeight: FontWeight.bold, color: AppColors.textPrimary)),
                  const SizedBox(height: 12),
                  _buildPaymentRow('Labour', '₹6,000'),
                  const SizedBox(height: 8),
                  _buildPaymentRow('Materials', '₹2,500'),
                  const SizedBox(height: 12),
                  const Divider(color: AppColors.borderSubtle),
                  const SizedBox(height: 12),
                  _buildPaymentRow('Total Request Value', '₹8,500', isTotal: true),
                  const SizedBox(height: 12),
                  Container(
                    padding: const EdgeInsets.only(top: 8),
                    decoration: const BoxDecoration(
                      border: Border(top: BorderSide(color: AppColors.borderSubtle)),
                    ),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: const [
                        Text('ℹ️', style: TextStyle(fontSize: 12)),
                        SizedBox(width: 8),
                        Expanded(
                          child: Text(
                            'Final worker payments will be recorded through the cooperative.',
                            style: TextStyle(fontSize: 10, color: AppColors.textSecondary),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 12),

            // Workforce Match
            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.green.shade50,
                borderRadius: BorderRadius.circular(16),
                border: Border.all(color: Colors.green.shade200),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          Container(
                            width: 8,
                            height: 8,
                            decoration: const BoxDecoration(color: AppColors.cooperativeGreen, shape: BoxShape.circle),
                          ),
                          const SizedBox(width: 8),
                          const Text('Workforce Match', style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold, color: AppColors.cooperativeGreen)),
                        ],
                      ),
                      Container(
                        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(12),
                          border: Border.all(color: Colors.green.shade200),
                        ),
                        child: const Text('5 workers needed', style: TextStyle(fontSize: 10, fontWeight: FontWeight.bold, color: AppColors.cooperativeGreen)),
                      ),
                    ],
                  ),
                  const SizedBox(height: 8),
                  const Text('12 workers in your cooperative match the required skills.', style: TextStyle(fontSize: 12, color: AppColors.textPrimary)),
                ],
              ),
            ),
            
            const SizedBox(height: 24),
            
            if (_isAccepted)
              SizedBox(
                width: double.infinity,
                child: ElevatedButton.icon(
                  onPressed: () {
                    // Navigate to Worker Assignment
                    Navigator.push(context, MaterialPageRoute(builder: (context) => const WorkerAssignmentScreen()));
                  },
                  icon: const Icon(Icons.arrow_forward),
                  label: const Text('Assign Workers'),
                  style: ElevatedButton.styleFrom(
                    padding: const EdgeInsets.symmetric(vertical: 16),
                    backgroundColor: AppColors.cooperativeGreen,
                  ),
                ),
              )
            else
              Column(
                children: [
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: _handleAccept,
                      style: ElevatedButton.styleFrom(
                        padding: const EdgeInsets.symmetric(vertical: 16),
                        backgroundColor: AppColors.cooperativeGreen,
                      ),
                      child: const Text('Accept Request', style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold)),
                    ),
                  ),
                  const SizedBox(height: 12),
                  SizedBox(
                    width: double.infinity,
                    child: OutlinedButton(
                      onPressed: _handleDecline,
                      style: OutlinedButton.styleFrom(
                        padding: const EdgeInsets.symmetric(vertical: 16),
                        side: const BorderSide(color: AppColors.borderSubtle),
                      ),
                      child: const Text('Decline', style: TextStyle(fontSize: 14, color: AppColors.textPrimary)),
                    ),
                  ),
                ],
              ),
              
            const SizedBox(height: 32),
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

  Widget _buildIconRow(String icon, String text, {bool isBold = false}) {
    return Row(
      children: [
        Text(icon, style: const TextStyle(fontSize: 14)),
        const SizedBox(width: 8),
        Text(
          text,
          style: TextStyle(
            fontSize: 12,
            color: AppColors.textPrimary,
            fontWeight: isBold ? FontWeight.bold : FontWeight.w500,
          ),
        ),
      ],
    );
  }

  Widget _buildMetricBox(String topValue, String bottomLabel) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 12),
      decoration: BoxDecoration(
        color: Colors.grey.shade50,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: AppColors.borderSubtle),
      ),
      child: Column(
        children: [
          Text(topValue, style: const TextStyle(fontSize: 12, fontWeight: FontWeight.bold, color: AppColors.textPrimary)),
          const SizedBox(height: 4),
          Text(bottomLabel, style: const TextStyle(fontSize: 10, color: AppColors.textSecondary)),
        ],
      ),
    );
  }

  Widget _buildPaymentRow(String label, String amount, {bool isTotal = false}) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          label,
          style: TextStyle(
            fontSize: isTotal ? 14 : 12,
            fontWeight: isTotal ? FontWeight.bold : FontWeight.normal,
            color: isTotal ? AppColors.primaryContainer : AppColors.textSecondary,
          ),
        ),
        Text(
          amount,
          style: TextStyle(
            fontSize: isTotal ? 16 : 12,
            fontWeight: isTotal ? FontWeight.bold : FontWeight.w500,
            color: isTotal ? AppColors.primaryContainer : AppColors.textPrimary,
          ),
        ),
      ],
    );
  }
}
