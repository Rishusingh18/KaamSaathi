import 'package:flutter/material.dart';
import '../theme/colors.dart';
import '../utils/localization.dart';
import 'package:dotted_border/dotted_border.dart';
import 'worker_earnings_screen.dart';

class WorkerJobInProgressScreen extends StatelessWidget {
  const WorkerJobInProgressScreen({super.key});

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
                    color: Colors.orange.shade50,
                    borderRadius: BorderRadius.circular(16),
                    border: Border.all(color: Colors.orange.shade200),
                  ),
                  child: Row(
                    children: [
                      const Icon(Icons.circle, size: 6, color: Colors.orange),
                      const SizedBox(width: 4),
                      Text(
                        AppLocalization.get('Work in progress'),
                        style: const TextStyle(fontSize: 12, fontWeight: FontWeight.bold, color: Colors.orange),
                      ),
                    ],
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
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                              const Text('#JOB-8842', style: TextStyle(fontSize: 13, fontWeight: FontWeight.bold, color: Colors.grey)),
                            ],
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
                              Text(AppLocalization.get('Today, 10 AM'), style: const TextStyle(fontSize: 14, fontWeight: FontWeight.bold, color: AppColors.textPrimary)),
                            ],
                          ),
                          const SizedBox(height: 12),
                          Row(
                            children: [
                              const Icon(Icons.location_on_outlined, size: 18, color: AppColors.primaryContainer),
                              const SizedBox(width: 8),
                              Text(AppLocalization.get('Dwarka'), style: const TextStyle(fontSize: 14, color: AppColors.textPrimary)),
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
                                child: Text(
                                  AppLocalization.get('Assigned through Cooperative Society'),
                                  style: const TextStyle(fontSize: 13, fontWeight: FontWeight.bold, color: AppColors.cooperativeGreen, fontFamily: 'Inter', height: 1.4),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    
                    const SizedBox(height: 16),
                    
                    // Job Progress
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
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                children: [
                                  const Icon(Icons.bolt, size: 18, color: AppColors.primaryContainer),
                                  const SizedBox(width: 8),
                                  Text(AppLocalization.get('Job Progress'), style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: AppColors.textPrimary)),
                                ],
                              ),
                              Container(
                                padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                                decoration: BoxDecoration(
                                  color: Colors.orange.shade50,
                                  borderRadius: BorderRadius.circular(12),
                                ),
                                child: Text(AppLocalization.get('Step 3/4'), style: const TextStyle(fontSize: 12, fontWeight: FontWeight.bold, color: Colors.orange)),
                              ),
                            ],
                          ),
                          const SizedBox(height: 24),
                          
                          // Stepper
                          _buildStep(
                            isCompleted: true,
                            isLast: false,
                            title: 'Confirmation',
                            subtitle: 'Customer request accepted by guild',
                            badgeText: 'Accepted',
                            badgeColor: AppColors.cooperativeGreen,
                          ),
                          _buildStep(
                            isCompleted: true,
                            isLast: false,
                            title: 'Worker assigned',
                            subtitle: 'Worker appointed by cooperative society',
                            badgeText: 'Allocated',
                            badgeColor: AppColors.cooperativeGreen,
                          ),
                          _buildStep(
                            isActive: true,
                            isLast: false,
                            title: 'Work in progress',
                            subtitle: 'Started 10:00 AM • Timer running',
                            badgeText: 'Active',
                            badgeColor: Colors.orange,
                          ),
                          _buildStep(
                            isCompleted: false,
                            isLast: true,
                            title: 'Work complete',
                            subtitle: 'Verification and payment settlement',
                            badgeText: 'Pending',
                            badgeColor: Colors.grey,
                          ),
                        ],
                      ),
                    ),
                    
                    const SizedBox(height: 16),
                    
                    // Job Details (inner)
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
                              Text(AppLocalization.get('Job Details'), style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: AppColors.textPrimary)),
                            ],
                          ),
                          const SizedBox(height: 20),
                          _buildInfoRow('Service Type', 'Interior / Exterior Painting'),
                          const SizedBox(height: 16),
                          _buildInfoRow('Estimated Time', 'Time: 6-8 hours'),
                          const SizedBox(height: 16),
                          _buildInfoRow('Requirement', 'Need: 2 workers'),
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
                        // Action for complete work
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(builder: (context) => const WorkerEarningsScreen()),
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
                              const Icon(Icons.check, color: Colors.white, size: 24),
                              const SizedBox(width: 8),
                              Text(
                                AppLocalization.get('Complete Work'),
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

  Widget _buildStep({
    bool isCompleted = false,
    bool isActive = false,
    required bool isLast,
    required String title,
    required String subtitle,
    required String badgeText,
    required Color badgeColor,
  }) {
    return IntrinsicHeight(
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          SizedBox(
            width: 32,
            child: Column(
              children: [
                Container(
                  width: 24,
                  height: 24,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: isCompleted 
                        ? const Color(0xFF166534) 
                        : (isActive ? Colors.orange.shade100 : Colors.transparent),
                    border: Border.all(
                      color: isCompleted 
                          ? const Color(0xFF166534)
                          : (isActive ? Colors.orange.shade100 : Colors.grey.shade300),
                      width: 2,
                    ),
                  ),
                  alignment: Alignment.center,
                  child: isCompleted
                      ? const Icon(Icons.check, size: 14, color: Colors.white)
                      : (isActive
                          ? const Icon(Icons.circle, size: 10, color: Colors.orange)
                          : Container(width: 8, height: 8, decoration: BoxDecoration(shape: BoxShape.circle, color: Colors.grey.shade300))),
                ),
                if (!isLast)
                  Expanded(
                    child: Container(
                      width: 1.5,
                      color: Colors.grey.shade200,
                      margin: const EdgeInsets.symmetric(vertical: 4),
                    ),
                  ),
              ],
            ),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      AppLocalization.get(title),
                      style: TextStyle(
                        fontSize: 15, 
                        fontWeight: FontWeight.bold, 
                        color: (isCompleted || isActive) ? AppColors.textPrimary : Colors.grey.shade500
                      ),
                    ),
                    if (isActive)
                      Container(
                        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
                        decoration: BoxDecoration(
                          color: Colors.orange.shade50,
                          borderRadius: BorderRadius.circular(4),
                        ),
                        child: Text(AppLocalization.get(badgeText), style: TextStyle(fontSize: 11, fontWeight: FontWeight.bold, color: badgeColor)),
                      )
                    else
                      Text(AppLocalization.get(badgeText), style: TextStyle(fontSize: 11, fontWeight: FontWeight.bold, color: badgeColor)),
                  ],
                ),
                const SizedBox(height: 4),
                Text(
                  AppLocalization.get(subtitle),
                  style: TextStyle(fontSize: 12, color: (isCompleted || isActive) ? AppColors.textSecondary : Colors.grey.shade400),
                ),
                const SizedBox(height: 24), // spacing below each item
              ],
            ),
          ),
        ],
      ),
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
