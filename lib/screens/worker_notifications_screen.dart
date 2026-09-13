import 'package:flutter/material.dart';
import 'package:dotted_border/dotted_border.dart';
import '../theme/colors.dart';
import '../utils/localization.dart';

class WorkerNotificationsScreen extends StatelessWidget {
  const WorkerNotificationsScreen({super.key});

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
                      Row(
                        children: [
                          Text(
                            AppLocalization.get('Notifications'),
                            style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: AppColors.textPrimary),
                          ),
                          const SizedBox(width: 8),
                          Container(
                            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
                            decoration: BoxDecoration(
                              color: const Color(0xFFE6F4EA),
                              borderRadius: BorderRadius.circular(12),
                            ),
                            child: Text(
                              AppLocalization.get('2 new'),
                              style: const TextStyle(fontSize: 12, fontWeight: FontWeight.bold, color: AppColors.cooperativeGreen),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 2),
                      Text(
                        AppLocalization.get('Cooperative dispatch and wage updates'),
                        style: const TextStyle(fontSize: 12, color: AppColors.textSecondary),
                      ),
                    ],
                  ),
                ),
                GestureDetector(
                  onTap: () {},
                  child: SizedBox(
                    width: 70,
                    child: Text(
                      AppLocalization.get('Mark all as read'),
                      textAlign: TextAlign.right,
                      style: const TextStyle(fontSize: 12, fontWeight: FontWeight.bold, color: AppColors.cooperativeGreen, height: 1.2),
                    ),
                  ),
                ),
              ],
            ),
          ),
          body: ListView(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            children: [
              // Today Section Header
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      const Icon(Icons.circle, size: 8, color: AppColors.cooperativeGreen),
                      const SizedBox(width: 8),
                      Text(AppLocalization.get('Today'), style: const TextStyle(fontSize: 14, fontWeight: FontWeight.bold, color: AppColors.textPrimary)),
                    ],
                  ),
                  Text(AppLocalization.get('2 unread'), style: const TextStyle(fontSize: 12, fontWeight: FontWeight.bold, color: AppColors.cooperativeGreen)),
                ],
              ),
              const SizedBox(height: 12),
              
              // Notification 1 (Unread)
              _buildDashedNotificationCard(
                icon: Icons.business,
                iconColor: AppColors.cooperativeGreen,
                iconBg: const Color(0xFFE6F4EA),
                title: 'New Job Opportunity',
                titleColor: AppColors.textPrimary,
                time: 'Just now',
                content: RichText(
                  text: TextSpan(
                    style: const TextStyle(fontSize: 13, color: AppColors.textSecondary, height: 1.4, fontFamily: 'Inter'),
                    children: [
                      TextSpan(text: AppLocalization.get('Nirman Shramik Cooperative'), style: const TextStyle(fontWeight: FontWeight.bold, color: AppColors.textPrimary)),
                      TextSpan(text: AppLocalization.get(' has invited you for ')),
                      TextSpan(text: AppLocalization.get('Community Hall Renovation'), style: const TextStyle(fontWeight: FontWeight.bold, color: AppColors.textPrimary)),
                    ],
                  ),
                ),
                bottomRow: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                      decoration: BoxDecoration(color: const Color(0xFFE6F4EA), borderRadius: BorderRadius.circular(8), border: Border.all(color: const Color(0xFFBBF7D0))),
                      child: Text(AppLocalization.get('₹6,000 estimated earnings'), style: const TextStyle(fontSize: 11, fontWeight: FontWeight.bold, color: AppColors.cooperativeGreen)),
                    ),
                    Text(AppLocalization.get('Dwarka, Delhi'), style: const TextStyle(fontSize: 12, color: AppColors.textSecondary)),
                  ],
                ),
              ),
              
              const SizedBox(height: 16),
              
              // Notification 2 (Unread)
              _buildDashedNotificationCard(
                icon: Icons.palette_outlined,
                iconColor: Colors.orange.shade700,
                iconBg: Colors.orange.shade50,
                title: 'New Job Assigned',
                titleColor: AppColors.textPrimary,
                time: '1 hour ago',
                content: RichText(
                  text: TextSpan(
                    style: const TextStyle(fontSize: 13, color: AppColors.textSecondary, height: 1.4, fontFamily: 'Inter'),
                    children: [
                      TextSpan(text: AppLocalization.get('Painting Job — Dwarka'), style: const TextStyle(fontWeight: FontWeight.bold, color: AppColors.textPrimary)),
                      TextSpan(text: AppLocalization.get(' (under 5 Worker Guild)')),
                    ],
                  ),
                ),
                bottomRow: Row(
                  children: [
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                      decoration: BoxDecoration(color: Colors.grey.shade100, borderRadius: BorderRadius.circular(8)),
                      child: Text(AppLocalization.get('Today • 10 AM'), style: const TextStyle(fontSize: 11, fontWeight: FontWeight.bold, color: AppColors.textPrimary)),
                    ),
                    const SizedBox(width: 8),
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                      decoration: BoxDecoration(color: Colors.transparent, borderRadius: BorderRadius.circular(8), border: Border.all(color: const Color(0xFFBBF7D0))),
                      child: Text(AppLocalization.get('Guild Lead Approved'), style: const TextStyle(fontSize: 11, fontWeight: FontWeight.bold, color: AppColors.cooperativeGreen)),
                    ),
                  ],
                ),
              ),
              
              const SizedBox(height: 24),
              
              // Earlier Section Header
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      const Icon(Icons.circle, size: 8, color: Colors.grey),
                      const SizedBox(width: 8),
                      Text(AppLocalization.get('Earlier'), style: const TextStyle(fontSize: 14, fontWeight: FontWeight.bold, color: Colors.grey)),
                    ],
                  ),
                  Text(AppLocalization.get('Old alerts'), style: const TextStyle(fontSize: 12, color: Colors.grey)),
                ],
              ),
              const SizedBox(height: 12),
              
              // Notification 3 (Read)
              _buildSolidNotificationCard(
                icon: Icons.currency_rupee,
                iconColor: AppColors.cooperativeGreen,
                iconBg: const Color(0xFFE6F4EA),
                title: 'Payment Update',
                time: '10 September',
                content: RichText(
                  text: TextSpan(
                    style: const TextStyle(fontSize: 13, color: AppColors.textSecondary, height: 1.4, fontFamily: 'Inter'),
                    children: [
                      TextSpan(text: AppLocalization.get('₹1,800 payment for ')),
                      TextSpan(text: AppLocalization.get('Residential Painting'), style: const TextStyle(fontWeight: FontWeight.bold, color: AppColors.textPrimary)),
                      TextSpan(text: AppLocalization.get(' has been made')),
                    ],
                  ),
                ),
                bottomRow: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(AppLocalization.get('Ref: #TXN-90412'), style: const TextStyle(fontSize: 11, color: AppColors.textSecondary)),
                    Row(
                      children: [
                        Text(AppLocalization.get('Cooperative Settlement'), style: const TextStyle(fontSize: 11, fontWeight: FontWeight.bold, color: AppColors.cooperativeGreen)),
                        const SizedBox(width: 4),
                        const Icon(Icons.check, size: 12, color: AppColors.cooperativeGreen),
                      ],
                    ),
                  ],
                ),
              ),
              
              const SizedBox(height: 12),
              
              // Notification 4 (Read)
              _buildSolidNotificationCard(
                icon: Icons.calendar_month,
                iconColor: Colors.brown,
                iconBg: Colors.orange.shade50,
                title: 'Work time changed',
                time: '18 September',
                content: RichText(
                  text: TextSpan(
                    style: const TextStyle(fontSize: 13, color: AppColors.textSecondary, height: 1.4, fontFamily: 'Inter'),
                    children: [
                      TextSpan(text: AppLocalization.get('Community Hall Repair'), style: const TextStyle(fontWeight: FontWeight.bold, color: AppColors.textPrimary)),
                      TextSpan(text: AppLocalization.get(' is now on ')),
                      TextSpan(text: AppLocalization.get('18 September'), style: const TextStyle(fontWeight: FontWeight.bold, color: AppColors.textPrimary)),
                    ],
                  ),
                ),
                bottomRow: Row(
                  children: [
                    const Icon(Icons.check, size: 12, color: AppColors.cooperativeGreen),
                    const SizedBox(width: 4),
                    Text(AppLocalization.get('Updated by Nirman Shramik Cooperative'), style: const TextStyle(fontSize: 11, color: AppColors.textSecondary)),
                  ],
                ),
              ),
              
              const SizedBox(height: 24),
              
              // Bottom Info Banner
              Container(
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(color: AppColors.borderSubtle),
                ),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      padding: const EdgeInsets.all(4),
                      decoration: BoxDecoration(color: Colors.blue.shade100, borderRadius: BorderRadius.circular(4)),
                      child: const Icon(Icons.info_outline, size: 14, color: AppColors.primaryContainer),
                    ),
                    const SizedBox(width: 12),
                    Expanded(
                      child: Text(
                        AppLocalization.get('Notifications keep you informed of verified cooperative allocations, bank payment dispatches, and guild leader announcements.'),
                        style: const TextStyle(fontSize: 11, color: AppColors.textSecondary, height: 1.4),
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

  Widget _buildDashedNotificationCard({
    required IconData icon,
    required Color iconColor,
    required Color iconBg,
    required String title,
    required Color titleColor,
    required String time,
    required Widget content,
    required Widget bottomRow,
  }) {
    return DottedBorder(
      options: RoundedRectDottedBorderOptions(
        radius: const Radius.circular(16),
        color: Colors.blue.shade200,
        dashPattern: const [6, 4],
        strokeWidth: 1.5,
        padding: EdgeInsets.zero,
      ),
      child: Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: Colors.blue.withOpacity(0.02),
          borderRadius: BorderRadius.circular(16),
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
              child: Icon(icon, color: iconColor, size: 24),
            ),
            const SizedBox(width: 16),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Text(AppLocalization.get(title), style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold, color: titleColor)),
                          const SizedBox(width: 6),
                          const Icon(Icons.circle, size: 8, color: AppColors.cooperativeGreen),
                        ],
                      ),
                      Text(AppLocalization.get(time), style: const TextStyle(fontSize: 12, color: AppColors.textSecondary)),
                    ],
                  ),
                  const SizedBox(height: 8),
                  content,
                  const SizedBox(height: 12),
                  bottomRow,
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSolidNotificationCard({
    required IconData icon,
    required Color iconColor,
    required Color iconBg,
    required String title,
    required String time,
    required Widget content,
    required Widget bottomRow,
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
              border: Border.all(color: AppColors.borderSubtle, width: 0.5),
            ),
            child: Icon(icon, color: iconColor, size: 24),
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(AppLocalization.get(title), style: const TextStyle(fontSize: 15, fontWeight: FontWeight.bold, color: AppColors.textPrimary)),
                    Text(AppLocalization.get(time), style: const TextStyle(fontSize: 12, color: AppColors.textSecondary)),
                  ],
                ),
                const SizedBox(height: 8),
                content,
                const SizedBox(height: 12),
                bottomRow,
              ],
            ),
          ),
        ],
      ),
    );
  }
}
