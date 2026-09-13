import 'package:flutter/material.dart';
import '../theme/colors.dart';
import '../utils/localization.dart';
import 'worker_job_details_screen.dart';
import 'package:dotted_border/dotted_border.dart';

class WorkerJobsScreen extends StatelessWidget {
  const WorkerJobsScreen({super.key});

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
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        AppLocalization.get('My Jobs'),
                        style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: AppColors.textPrimary),
                      ),
                      const SizedBox(height: 2),
                      Text(
                        AppLocalization.get('Work allocated from Cooperative Guild'),
                        style: const TextStyle(fontSize: 12, color: AppColors.textSecondary),
                      ),
                    ],
                  ),
                ),
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
                  decoration: BoxDecoration(
                    color: const Color(0xFFF0FDF4),
                    borderRadius: BorderRadius.circular(16),
                    border: Border.all(color: const Color(0xFFBBF7D0)),
                  ),
                  child: Row(
                    children: [
                      const Icon(Icons.circle, size: 6, color: AppColors.cooperativeGreen),
                      const SizedBox(width: 4),
                      Text(
                        AppLocalization.get('Active Guild'),
                        style: const TextStyle(fontSize: 12, fontWeight: FontWeight.bold, color: AppColors.cooperativeGreen),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          body: ListView(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            children: [
              // Upcoming Work Header
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      const Icon(Icons.circle, size: 8, color: Colors.orange),
                      const SizedBox(width: 8),
                      Text(AppLocalization.get('Upcoming Work'), style: const TextStyle(fontSize: 14, fontWeight: FontWeight.bold, color: AppColors.textPrimary)),
                    ],
                  ),
                  Text(AppLocalization.get('1 work allocated'), style: const TextStyle(fontSize: 12, fontWeight: FontWeight.bold, color: Colors.grey)),
                ],
              ),
              const SizedBox(height: 12),
              
              // Big Job Card
              Container(
                padding: const EdgeInsets.all(16),
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
                            Container(
                              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                              decoration: BoxDecoration(
                                color: Colors.blue.shade50,
                                borderRadius: BorderRadius.circular(12),
                              ),
                              child: Text(AppLocalization.get('Institutional Project'), style: const TextStyle(fontSize: 10, fontWeight: FontWeight.bold, color: AppColors.primaryContainer)),
                            ),
                            const SizedBox(width: 8),
                            const Text('#PRJ-5402', style: TextStyle(fontSize: 12, color: Colors.grey)),
                          ],
                        ),
                        Container(
                          padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                          decoration: BoxDecoration(
                            color: const Color(0xFFE6F4EA),
                            borderRadius: BorderRadius.circular(12),
                            border: Border.all(color: const Color(0xFFBBF7D0)),
                          ),
                          child: Row(
                            children: [
                              Text(AppLocalization.get('Accepted'), style: const TextStyle(fontSize: 11, fontWeight: FontWeight.bold, color: AppColors.cooperativeGreen)),
                              const SizedBox(width: 4),
                              const Icon(Icons.check, size: 12, color: AppColors.cooperativeGreen),
                            ],
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 16),
                    Text(
                      AppLocalization.get('Community Hall Repair'),
                      style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: AppColors.textPrimary),
                    ),
                    const SizedBox(height: 8),
                    Row(
                      children: [
                        const Icon(Icons.domain, size: 14, color: AppColors.cooperativeGreen),
                        const SizedBox(width: 4),
                        Text(AppLocalization.get('Nirman Shramik Cooperative Society'), style: const TextStyle(fontSize: 12, fontWeight: FontWeight.bold, color: AppColors.cooperativeGreen)),
                        const SizedBox(width: 4),
                        const Icon(Icons.check_circle, size: 14, color: AppColors.cooperativeGreen),
                      ],
                    ),
                    const SizedBox(height: 16),
                    
                    // Grid
                    Container(
                      padding: const EdgeInsets.all(12),
                      decoration: BoxDecoration(
                        color: Colors.grey.shade50,
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Column(
                        children: [
                          Row(
                            children: [
                              Expanded(
                                child: Row(
                                  children: [
                                    const Icon(Icons.location_on, size: 14, color: Colors.red),
                                    const SizedBox(width: 4),
                                    Text(AppLocalization.get('Dwarka, Delhi'), style: const TextStyle(fontSize: 12, color: AppColors.textSecondary)),
                                  ],
                                ),
                              ),
                              Expanded(
                                child: Row(
                                  children: [
                                    const Icon(Icons.calendar_month, size: 14, color: Colors.brown),
                                    const SizedBox(width: 4),
                                    Text(AppLocalization.get('18-22 September'), style: const TextStyle(fontSize: 12, color: AppColors.textSecondary)),
                                  ],
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 12),
                          Row(
                            children: [
                              Expanded(
                                child: Row(
                                  children: [
                                    const Icon(Icons.access_time_filled, size: 14, color: Colors.grey),
                                    const SizedBox(width: 4),
                                    Text(AppLocalization.get('Morning 9:00 - 5:00'), style: const TextStyle(fontSize: 12, color: AppColors.textSecondary)),
                                  ],
                                ),
                              ),
                              Expanded(
                                child: Row(
                                  children: [
                                    const Text('👷', style: TextStyle(fontSize: 12)),
                                    const SizedBox(width: 4),
                                    Text(AppLocalization.get('5 Worker Guild'), style: const TextStyle(fontSize: 12, color: AppColors.textSecondary)),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    
                    const SizedBox(height: 12),
                    
                    // Your Role
                    Container(
                      padding: const EdgeInsets.all(12),
                      decoration: BoxDecoration(
                        color: Colors.blue.shade50.withValues(alpha: 0.5),
                        borderRadius: BorderRadius.circular(12),
                        border: Border.all(color: Colors.blue.shade100),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(AppLocalization.get('Your Role'), style: const TextStyle(fontSize: 10, color: Colors.grey)),
                              const SizedBox(height: 4),
                              Text(AppLocalization.get('Mason and Painting Worker'), style: const TextStyle(fontSize: 13, fontWeight: FontWeight.bold, color: AppColors.primaryContainer)),
                            ],
                          ),
                          Container(
                            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(8),
                              border: Border.all(color: AppColors.borderSubtle),
                            ),
                            child: Text(AppLocalization.get('5 Days'), style: const TextStyle(fontSize: 12, fontWeight: FontWeight.bold, color: AppColors.textPrimary)),
                          ),
                        ],
                      ),
                    ),
                    
                    const SizedBox(height: 16),
                    
                    // Bottom Row
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(AppLocalization.get('Estimated Earnings'), style: const TextStyle(fontSize: 11, color: Colors.grey)),
                            const SizedBox(height: 4),
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.baseline,
                              textBaseline: TextBaseline.alphabetic,
                              children: [
                                const Text('₹6,000', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: AppColors.textPrimary)),
                                const SizedBox(width: 4),
                                Text(AppLocalization.get('Cooperative rate'), style: const TextStyle(fontSize: 11, color: AppColors.cooperativeGreen, fontWeight: FontWeight.bold)),
                              ],
                            ),
                          ],
                        ),
                        GestureDetector(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => const WorkerJobDetailsScreen()),
                            );
                          },
                          child: DottedBorder(
                            options: RoundedRectDottedBorderOptions(
                              radius: const Radius.circular(20),
                              color: Colors.blue.shade300,
                              dashPattern: const [4, 4],
                              strokeWidth: 1.5,
                              padding: EdgeInsets.zero,
                            ),
                            child: Container(
                              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                              decoration: BoxDecoration(
                                color: const Color(0xFF166534),
                                borderRadius: BorderRadius.circular(20),
                              ),
                              child: Row(
                                children: [
                                  Text(AppLocalization.get('View Work'), style: const TextStyle(fontSize: 13, fontWeight: FontWeight.bold, color: Colors.white)),
                                  const SizedBox(width: 4),
                                  const Icon(Icons.arrow_forward, size: 14, color: Colors.white),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              
              const SizedBox(height: 24),
              
              // Completed Works Header
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      const Icon(Icons.circle, size: 8, color: AppColors.cooperativeGreen),
                      const SizedBox(width: 8),
                      Text(AppLocalization.get('Completed Works'), style: const TextStyle(fontSize: 14, fontWeight: FontWeight.bold, color: AppColors.textPrimary)),
                    ],
                  ),
                  Text(AppLocalization.get('2 payments received'), style: const TextStyle(fontSize: 12, fontWeight: FontWeight.bold, color: Colors.grey)),
                ],
              ),
              const SizedBox(height: 12),
              
              // Completed Card 1
              _buildCompletedCard(
                iconText: '🎨',
                iconBg: Colors.yellow.shade50,
                title: 'House Painting',
                subtitle: '10 September • Nirman Shramik Cooperative',
                amount: '₹1,800',
              ),
              
              const SizedBox(height: 12),
              
              // Completed Card 2
              _buildCompletedCard(
                icon: Icons.bolt,
                iconColor: Colors.orange,
                iconBg: Colors.blue.shade50,
                title: 'Electricity Repair',
                subtitle: '5 September • Nirman Shramik Cooperative',
                amount: '₹1,200',
              ),
              
              const SizedBox(height: 24),
              
              // Bottom Banner
              Container(
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                  color: const Color(0xFFF0FDF4),
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(color: const Color(0xFFBBF7D0)),
                ),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Icon(Icons.shield_outlined, size: 16, color: AppColors.cooperativeGreen),
                    const SizedBox(width: 12),
                    Expanded(
                      child: RichText(
                        text: TextSpan(
                          style: const TextStyle(fontSize: 11, color: AppColors.textPrimary, height: 1.4, fontFamily: 'Inter'),
                          children: [
                            TextSpan(text: AppLocalization.get('Cooperative Protection: '), style: const TextStyle(fontWeight: FontWeight.bold, color: AppColors.cooperativeGreen)),
                            TextSpan(text: AppLocalization.get('All jobs are recorded on SAHYOG Skill Passport and ensured under cooperative minimum wage protection.')),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              
              const SizedBox(height: 32),
            ],
          ),
        );
      }
    );
  }

  Widget _buildCompletedCard({
    String? iconText,
    IconData? icon,
    Color? iconColor,
    required Color iconBg,
    required String title,
    required String subtitle,
    required String amount,
  }) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: AppColors.borderSubtle),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: iconBg,
              borderRadius: BorderRadius.circular(12),
            ),
            child: iconText != null 
                ? Text(iconText, style: const TextStyle(fontSize: 20))
                : Icon(icon, size: 24, color: iconColor),
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(child: Text(AppLocalization.get(title), style: const TextStyle(fontSize: 15, fontWeight: FontWeight.bold, color: AppColors.textPrimary))),
                    Text(amount, style: const TextStyle(fontSize: 15, fontWeight: FontWeight.bold, color: AppColors.textPrimary)),
                  ],
                ),
                const SizedBox(height: 4),
                Text(AppLocalization.get(subtitle), style: const TextStyle(fontSize: 12, color: AppColors.textSecondary)),
                const SizedBox(height: 12),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
                      decoration: BoxDecoration(
                        color: const Color(0xFFF0FDF4),
                        borderRadius: BorderRadius.circular(8),
                        border: Border.all(color: const Color(0xFFBBF7D0)),
                      ),
                      child: Row(
                        children: [
                          Text(AppLocalization.get('Completed'), style: const TextStyle(fontSize: 11, fontWeight: FontWeight.bold, color: AppColors.cooperativeGreen)),
                          const SizedBox(width: 4),
                          const Icon(Icons.check, size: 12, color: AppColors.cooperativeGreen),
                        ],
                      ),
                    ),
                    Text(AppLocalization.get('received in account'), style: const TextStyle(fontSize: 11, fontWeight: FontWeight.bold, color: AppColors.cooperativeGreen)),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
