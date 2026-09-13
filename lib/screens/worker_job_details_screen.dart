import 'package:flutter/material.dart';
import '../theme/colors.dart';
import '../utils/localization.dart';
import 'package:dotted_border/dotted_border.dart';
import 'worker_job_in_progress_screen.dart';

class WorkerJobDetailsScreen extends StatelessWidget {
  const WorkerJobDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<String>(
      valueListenable: AppLocalization.currentLang,
      builder: (context, lang, child) {
        return Scaffold(
          backgroundColor: Colors.white,
          appBar: AppBar(
            backgroundColor: Colors.white,
            elevation: 0,
            toolbarHeight: 80,
            automaticallyImplyLeading: false,
            title: Row(
              children: [
                GestureDetector(
                  onTap: () => Navigator.pop(context),
                  child: DottedBorder(
                    options: CircularDottedBorderOptions(
                      color: Colors.blue.shade300,
                      dashPattern: const [4, 4],
                      strokeWidth: 1.5,
                      padding: EdgeInsets.zero,
                    ),
                    child: Container(
                      width: 40,
                      height: 40,
                      decoration: const BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors.transparent,
                      ),
                      child: const Icon(Icons.arrow_back_ios_new, color: AppColors.primaryContainer, size: 18),
                    ),
                  ),
                ),
                const SizedBox(width: 16),
                Expanded(
                  child: Text(
                    AppLocalization.get('Job Details'),
                    style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: AppColors.textPrimary),
                  ),
                ),
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
                  decoration: BoxDecoration(
                    color: const Color(0xFFF0FDF4),
                    borderRadius: BorderRadius.circular(16),
                    border: Border.all(color: const Color(0xFFBBF7D0)),
                  ),
                  child: Text(
                    AppLocalization.get('Confirmed'),
                    style: const TextStyle(fontSize: 12, fontWeight: FontWeight.bold, color: AppColors.cooperativeGreen),
                  ),
                ),
              ],
            ),
          ),
          body: Column(
            children: [
              Expanded(
                child: ListView(
                  padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                  children: [
                    // Main Info Card
                    Container(
                      padding: const EdgeInsets.all(20),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(16),
                        border: Border.all(color: AppColors.borderSubtle),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                            decoration: BoxDecoration(
                              color: Colors.blue.shade50,
                              borderRadius: BorderRadius.circular(16),
                            ),
                            child: Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                const Text('🎨', style: TextStyle(fontSize: 12)),
                                const SizedBox(width: 6),
                                Text(AppLocalization.get('Domestic Service'), style: const TextStyle(fontSize: 12, fontWeight: FontWeight.bold, color: Colors.blue)),
                              ],
                            ),
                          ),
                          const SizedBox(height: 16),
                          Text(
                            AppLocalization.get('Painting Job'),
                            style: const TextStyle(fontSize: 22, fontWeight: FontWeight.bold, color: AppColors.textPrimary),
                          ),
                          const SizedBox(height: 16),
                          Row(
                            children: [
                              const Icon(Icons.access_time, size: 18, color: Colors.orange),
                              const SizedBox(width: 8),
                              Text(AppLocalization.get('Today • 10:00 AM'), style: const TextStyle(fontSize: 14, fontWeight: FontWeight.bold, color: AppColors.textPrimary)),
                            ],
                          ),
                          const SizedBox(height: 12),
                          Row(
                            children: [
                              const Icon(Icons.location_on_outlined, size: 18, color: AppColors.primaryContainer),
                              const SizedBox(width: 8),
                              Text(AppLocalization.get('Dwarka, Delhi'), style: const TextStyle(fontSize: 14, color: AppColors.textSecondary)),
                            ],
                          ),
                          const SizedBox(height: 20),
                          const Divider(color: AppColors.borderSubtle),
                          const SizedBox(height: 16),
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Icon(Icons.verified_outlined, size: 18, color: AppColors.cooperativeGreen),
                              const SizedBox(width: 8),
                              Expanded(
                                child: RichText(
                                  text: TextSpan(
                                    style: const TextStyle(fontSize: 13, color: AppColors.textSecondary, fontFamily: 'Inter', height: 1.4),
                                    children: [
                                      TextSpan(text: AppLocalization.get('Appointed through: ')),
                                      TextSpan(text: AppLocalization.get('Nirman Shramik Cooperative Society'), style: const TextStyle(fontWeight: FontWeight.bold, color: AppColors.textPrimary)),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    
                    const SizedBox(height: 16),
                    
                    // Job Information
                    Container(
                      padding: const EdgeInsets.all(20),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(16),
                        border: Border.all(color: AppColors.borderSubtle),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              const Icon(Icons.assignment_outlined, size: 18, color: AppColors.textPrimary),
                              const SizedBox(width: 8),
                              Text(AppLocalization.get('Job Information'), style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: AppColors.textPrimary)),
                            ],
                          ),
                          const SizedBox(height: 20),
                          _buildInfoRow('Service', 'Indoor and outdoor painting'),
                          const SizedBox(height: 16),
                          _buildInfoRow('Estimated Time', '6-8 hours'),
                          const SizedBox(height: 16),
                          _buildInfoRow('Required Workers', '2 workers'),
                          const SizedBox(height: 16),
                          _buildInfoRow('Cooperative Society', 'Nirman Shramik Cooperative Society', valueColor: AppColors.cooperativeGreen),
                        ],
                      ),
                    ),
                    
                    const SizedBox(height: 16),
                    
                    // Customer
                    Container(
                      padding: const EdgeInsets.all(20),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(16),
                        border: Border.all(color: AppColors.borderSubtle),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              const Icon(Icons.person_outline, size: 18, color: AppColors.textPrimary),
                              const SizedBox(width: 8),
                              Text(AppLocalization.get('Customer'), style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: AppColors.textPrimary)),
                            ],
                          ),
                          const SizedBox(height: 16),
                          Text(AppLocalization.get('Domestic Service Request'), style: const TextStyle(fontSize: 14, fontWeight: FontWeight.bold, color: AppColors.textPrimary)),
                          const SizedBox(height: 8),
                          Row(
                            children: [
                              const Icon(Icons.location_on_outlined, size: 16, color: AppColors.textSecondary),
                              const SizedBox(width: 8),
                              Text(AppLocalization.get('Dwarka, Delhi'), style: const TextStyle(fontSize: 13, color: AppColors.textSecondary)),
                            ],
                          ),
                        ],
                      ),
                    ),
                    
                    const SizedBox(height: 16),
                    
                    // Payment
                    Container(
                      padding: const EdgeInsets.all(20),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(16),
                        border: Border.all(color: AppColors.borderSubtle),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              Container(
                                padding: const EdgeInsets.all(4),
                                decoration: const BoxDecoration(
                                  color: Color(0xFFE6F4EA),
                                  shape: BoxShape.circle,
                                ),
                                child: const Icon(Icons.attach_money, size: 14, color: AppColors.cooperativeGreen),
                              ),
                              const SizedBox(width: 8),
                              Text(AppLocalization.get('Payment'), style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: AppColors.textPrimary)),
                            ],
                          ),
                          const SizedBox(height: 16),
                          Text(AppLocalization.get('Estimated earnings'), style: const TextStyle(fontSize: 13, color: AppColors.textSecondary)),
                          const SizedBox(height: 4),
                          Text('₹1,200', style: const TextStyle(fontSize: 28, fontWeight: FontWeight.bold, color: AppColors.cooperativeGreen)),
                        ],
                      ),
                    ),
                    
                    const SizedBox(height: 32),
                  ],
                ),
              ),
              
              // Bottom Fixed Button
              Container(
                padding: const EdgeInsets.fromLTRB(16, 16, 16, 32),
                decoration: const BoxDecoration(
                  color: Colors.white,
                  border: Border(top: BorderSide(color: AppColors.borderSubtle)),
                ),
                child: Column(
                  children: [
                    GestureDetector(
                      onTap: () {
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(builder: (context) => const WorkerJobInProgressScreen()),
                        );
                      },
                      child: DottedBorder(
                        options: RoundedRectDottedBorderOptions(
                          radius: const Radius.circular(12),
                          color: Colors.blue.shade300,
                          dashPattern: const [6, 4],
                          strokeWidth: 1.5,
                          padding: const EdgeInsets.all(4),
                        ),
                        child: Container(
                          width: double.infinity,
                          padding: const EdgeInsets.symmetric(vertical: 16),
                          decoration: BoxDecoration(
                            color: const Color(0xFF166534), // Dark Green
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              const Icon(Icons.play_arrow_outlined, color: Colors.white, size: 24),
                              const SizedBox(width: 8),
                              Text(
                                AppLocalization.get('Start Work'),
                                style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.white),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 16),
                    Text(
                      AppLocalization.get('Need help?'),
                      style: const TextStyle(fontSize: 14, fontWeight: FontWeight.bold, color: AppColors.primaryContainer),
                    ),
                  ],
                ),
              ),
            ],
          ),
        );
      }
    );
  }

  Widget _buildInfoRow(String label, String value, {Color valueColor = AppColors.textPrimary}) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(AppLocalization.get(label), style: const TextStyle(fontSize: 13, color: AppColors.textSecondary)),
        const SizedBox(width: 16),
        Expanded(
          child: Text(
            AppLocalization.get(value),
            textAlign: TextAlign.right,
            style: TextStyle(fontSize: 13, fontWeight: FontWeight.bold, color: valueColor),
          ),
        ),
      ],
    );
  }
}
