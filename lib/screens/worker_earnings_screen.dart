import 'package:flutter/material.dart';
import '../theme/colors.dart';
import '../utils/localization.dart';
import 'package:dotted_border/dotted_border.dart';

class WorkerEarningsScreen extends StatelessWidget {
  final VoidCallback? onBack;

  const WorkerEarningsScreen({super.key, this.onBack});

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
                  onTap: () {
                    if (onBack != null) {
                      onBack!();
                    } else {
                      Navigator.pop(context);
                    }
                  },
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
                    AppLocalization.get('Earnings'),
                    style: const TextStyle(fontSize: 22, fontWeight: FontWeight.bold, color: AppColors.textPrimary),
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
                        AppLocalization.get('e-Shram Verified'),
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
              // Total Earnings Card
              Container(
                padding: const EdgeInsets.all(20),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(20),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withValues(alpha: 0.05),
                      blurRadius: 20,
                      offset: const Offset(0, 4),
                    ),
                  ],
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(AppLocalization.get('Total Earnings'), style: const TextStyle(fontSize: 14, fontWeight: FontWeight.bold, color: AppColors.textSecondary)),
                        Container(
                          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
                          decoration: BoxDecoration(
                            color: Colors.grey.shade100,
                            borderRadius: BorderRadius.circular(16),
                          ),
                          child: Text(AppLocalization.get('All time'), style: const TextStyle(fontSize: 12, fontWeight: FontWeight.bold, color: AppColors.textPrimary)),
                        ),
                      ],
                    ),
                    const SizedBox(height: 8),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        const Text('₹18,450', style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold, color: AppColors.textPrimary)),
                        const SizedBox(width: 12),
                        Container(
                          padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                          decoration: BoxDecoration(
                            color: const Color(0xFFE6F4EA),
                            borderRadius: BorderRadius.circular(6),
                          ),
                          child: Row(
                            children: [
                              Text(AppLocalization.get('Cooperative verified'), style: const TextStyle(fontSize: 11, fontWeight: FontWeight.bold, color: AppColors.cooperativeGreen)),
                              const SizedBox(width: 4),
                              const Icon(Icons.check, size: 12, color: AppColors.cooperativeGreen),
                            ],
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 24),
                    Row(
                      children: [
                        // This month
                        Expanded(
                          child: Container(
                            padding: const EdgeInsets.all(12),
                            decoration: BoxDecoration(
                              color: Colors.grey.shade50,
                              borderRadius: BorderRadius.circular(12),
                              border: Border.all(color: AppColors.borderSubtle),
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(AppLocalization.get('This month'), style: const TextStyle(fontSize: 12, color: AppColors.textSecondary)),
                                const SizedBox(height: 4),
                                const Text('₹6,200', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: AppColors.textPrimary)),
                                const SizedBox(height: 4),
                                Text(AppLocalization.get('↑ 5 jobs completed'), style: const TextStyle(fontSize: 11, fontWeight: FontWeight.bold, color: AppColors.cooperativeGreen)),
                              ],
                            ),
                          ),
                        ),
                        const SizedBox(width: 12),
                        // Pending
                        Expanded(
                          child: Container(
                            padding: const EdgeInsets.all(12),
                            decoration: BoxDecoration(
                              color: Colors.orange.shade50.withValues(alpha: 0.5),
                              borderRadius: BorderRadius.circular(12),
                              border: Border.all(color: Colors.orange.shade100),
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(AppLocalization.get('Pending'), style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold, color: Colors.orange.shade800)),
                                const SizedBox(height: 4),
                                Text('₹1,200', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.orange.shade700)),
                                const SizedBox(height: 4),
                                Row(
                                  children: [
                                    Icon(Icons.circle, size: 6, color: Colors.orange.shade700),
                                    const SizedBox(width: 4),
                                    Expanded(child: Text(AppLocalization.get('Payment processing'), style: TextStyle(fontSize: 10, fontWeight: FontWeight.bold, color: Colors.orange.shade800), overflow: TextOverflow.ellipsis)),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              
              const SizedBox(height: 24),
              
              // Recent Earnings Header
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(AppLocalization.get('Recent Earnings'), style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: AppColors.textPrimary)),
                  Text(AppLocalization.get('Last 30 days'), style: const TextStyle(fontSize: 13, color: AppColors.textSecondary)),
                ],
              ),
              const SizedBox(height: 12),
              
              // Item 1: Painting Job (Pending)
              _buildEarningItem(
                iconText: '🎨',
                iconBg: Colors.yellow.shade50,
                title: 'Painting Job',
                subtitleTop: 'Today • Dwarka, Delhi',
                subtitleBottom: 'Nirman Shramik Cooperative Society',
                subtitleBottomColor: AppColors.cooperativeGreen,
                amount: '₹1,200',
                statusText: 'Pending',
                isPending: true,
              ),
              
              const SizedBox(height: 12),
              
              // Item 2: Electrical Repair (Paid)
              _buildEarningItem(
                icon: Icons.bolt,
                iconColor: Colors.orange,
                iconBg: Colors.blue.shade50,
                title: 'Electrical Repair',
                subtitleTop: '10 Sep • Vasant Kunj',
                subtitleBottom: 'Ref: #TXN-90412',
                amount: '₹1,800',
                statusText: 'Payment done',
                isPending: false,
              ),
              
              const SizedBox(height: 12),
              
              // Item 3: Community Hall Repair (Paid)
              _buildEarningItem(
                icon: Icons.account_balance,
                iconColor: Colors.black54,
                iconBg: const Color(0xFFE6F4EA),
                title: 'Community Hall Repair',
                subtitleTop: '5 Sep • Rohini, Sector 7',
                subtitleBottom: 'Ref: #TXN-88210',
                amount: '₹2,400',
                statusText: 'Payment done',
                isPending: false,
              ),
              
              const SizedBox(height: 24),
              
              // Payment Information
              Text(AppLocalization.get('Payment Information'), style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: AppColors.textPrimary)),
              const SizedBox(height: 12),
              
              Container(
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(16),
                  border: Border.all(color: AppColors.borderSubtle),
                ),
                child: Column(
                  children: [
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          padding: const EdgeInsets.all(8),
                          decoration: BoxDecoration(
                            color: Colors.grey.shade100,
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: const Icon(Icons.account_balance, size: 20, color: AppColors.textSecondary),
                        ),
                        const SizedBox(width: 12),
                        Expanded(
                          child: Text(
                            AppLocalization.get('Your payments are processed through the cooperative society. Guaranteed minimum cooperative wage in direct bank account is ensured.'),
                            style: const TextStyle(fontSize: 13, color: AppColors.textSecondary, height: 1.4),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 16),
                    SizedBox(
                      width: double.infinity,
                      child: OutlinedButton(
                        onPressed: () {
                          _showPaymentHistoryBottomSheet(context);
                        },
                        style: OutlinedButton.styleFrom(
                          padding: const EdgeInsets.symmetric(vertical: 12),
                          side: const BorderSide(color: AppColors.borderSubtle),
                          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(AppLocalization.get('View Payment History'), style: const TextStyle(fontSize: 14, fontWeight: FontWeight.bold, color: AppColors.primaryContainer)),
                            const SizedBox(width: 8),
                            const Icon(Icons.arrow_forward, size: 16, color: AppColors.primaryContainer),
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

  Widget _buildEarningItem({
    String? iconText,
    IconData? icon,
    Color? iconColor,
    required Color iconBg,
    required String title,
    required String subtitleTop,
    required String subtitleBottom,
    Color subtitleBottomColor = AppColors.textSecondary,
    required String amount,
    required String statusText,
    required bool isPending,
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
            width: 44,
            height: 44,
            decoration: BoxDecoration(
              color: iconBg,
              borderRadius: BorderRadius.circular(12),
            ),
            alignment: Alignment.center,
            child: iconText != null 
                ? Text(iconText, style: const TextStyle(fontSize: 20))
                : Icon(icon, size: 24, color: iconColor),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(AppLocalization.get(title), style: const TextStyle(fontSize: 15, fontWeight: FontWeight.bold, color: AppColors.textPrimary)),
                const SizedBox(height: 2),
                Text(AppLocalization.get(subtitleTop), style: const TextStyle(fontSize: 12, color: AppColors.textSecondary)),
                const SizedBox(height: 2),
                Text(AppLocalization.get(subtitleBottom), style: TextStyle(fontSize: 12, color: subtitleBottomColor, fontWeight: subtitleBottomColor == AppColors.cooperativeGreen ? FontWeight.bold : FontWeight.normal)),
              ],
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text(amount, style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: AppColors.textPrimary)),
              const SizedBox(height: 8),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(16),
                  border: Border.all(color: isPending ? Colors.orange.shade200 : const Color(0xFFBBF7D0)),
                ),
                child: Row(
                  children: [
                    if (!isPending) ...[
                      const Icon(Icons.check, size: 12, color: AppColors.cooperativeGreen),
                      const SizedBox(width: 4),
                    ],
                    if (isPending) ...[
                      Icon(Icons.circle, size: 6, color: Colors.orange.shade700),
                      const SizedBox(width: 4),
                    ],
                    Text(
                      AppLocalization.get(statusText), 
                      style: TextStyle(
                        fontSize: 10, 
                        fontWeight: FontWeight.bold, 
                        color: isPending ? Colors.orange.shade700 : AppColors.cooperativeGreen
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  void _showPaymentHistoryBottomSheet(BuildContext context) {
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
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Text(
                      AppLocalization.get('Detailed Payment History'),
                      style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: AppColors.textPrimary),
                    ),
                    const SizedBox(width: 8),
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                      decoration: BoxDecoration(
                        color: const Color(0xFFE6F4EA),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Text(
                        AppLocalization.get('Verified Guild'),
                        style: const TextStyle(fontSize: 10, fontWeight: FontWeight.bold, color: AppColors.cooperativeGreen),
                      ),
                    ),
                  ],
                ),
                GestureDetector(
                  onTap: () => Navigator.pop(context),
                  child: Container(
                    padding: const EdgeInsets.all(8),
                    decoration: BoxDecoration(
                      color: Colors.grey.shade100,
                      shape: BoxShape.circle,
                    ),
                    child: const Icon(Icons.close, size: 16, color: AppColors.textSecondary),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 24),
            
            // Item 1
            _buildHistoryItem(
              title: 'Community Hall Repair',
              amount: '₹2,400',
              amountColor: AppColors.cooperativeGreen,
              subtitle: '5 Sep 2024 • Direct deposit to bank account (UAN-9012)',
              reference: 'UTR: NIRM-COOP-88210992 • Nirman Shramik Cooperative',
              bgColor: Colors.white,
              borderColor: AppColors.borderSubtle,
            ),
            const SizedBox(height: 12),
            
            // Item 2
            _buildHistoryItem(
              title: 'Electrical Repair',
              amount: '₹1,800',
              amountColor: AppColors.cooperativeGreen,
              subtitle: '10 Sep 2024 • Direct deposit to bank account (UAN-9012)',
              reference: 'UTR: NIRM-COOP-90412883 • Nirman Shramik Cooperative',
              bgColor: Colors.white,
              borderColor: AppColors.borderSubtle,
            ),
            const SizedBox(height: 12),
            
            // Item 3 (Pending)
            _buildHistoryItem(
              title: 'Painting Job (Processing)',
              amount: '₹1,200',
              amountColor: Colors.orange.shade800,
              subtitle: 'Today\'s job • Approved by customer, cooperative payment in 24 hours',
              reference: '',
              bgColor: Colors.orange.shade50.withValues(alpha: 0.5),
              borderColor: Colors.orange.shade200,
              subtitleColor: Colors.orange.shade800,
            ),
            
            const SizedBox(height: 24),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () => Navigator.pop(context),
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppColors.primaryContainer,
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                ),
                child: Text(AppLocalization.get('Close'), style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.white)),
              ),
            ),
            const SizedBox(height: 16),
          ],
        ),
      ),
    );
  }

  Widget _buildHistoryItem({
    required String title,
    required String amount,
    required Color amountColor,
    required String subtitle,
    required String reference,
    required Color bgColor,
    required Color borderColor,
    Color subtitleColor = AppColors.textSecondary,
  }) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: bgColor,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: borderColor),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(AppLocalization.get(title), style: const TextStyle(fontSize: 15, fontWeight: FontWeight.bold, color: AppColors.textPrimary)),
              Text(amount, style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold, color: amountColor)),
            ],
          ),
          const SizedBox(height: 8),
          Text(AppLocalization.get(subtitle), style: TextStyle(fontSize: 12, color: subtitleColor)),
          if (reference.isNotEmpty) ...[
            const SizedBox(height: 8),
            Text(AppLocalization.get(reference), style: const TextStyle(fontSize: 11, color: Colors.grey)),
          ],
        ],
      ),
    );
  }
}
