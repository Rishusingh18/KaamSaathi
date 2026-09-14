import 'package:flutter/material.dart';
import 'package:dotted_border/dotted_border.dart';
import '../theme/colors.dart';
import '../utils/localization.dart';
import 'earnings_screen.dart';
import 'ai_insights_screen.dart';
import 'cooperative_exchange_screen.dart';

class DashboardScreen extends StatelessWidget {
  final ValueChanged<int>? onNavigateTab;

  const DashboardScreen({super.key, this.onNavigateTab});

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<String>(
      valueListenable: AppLocalization.currentLang,
      builder: (context, lang, child) {
        return Scaffold(
          backgroundColor: AppColors.surfaceCanvas,
          appBar: AppBar(
            automaticallyImplyLeading: false,
            backgroundColor: AppColors.surfaceCanvas,
            elevation: 0,
            title: DottedBorder(
              options: RoundedRectDottedBorderOptions(
                color: const Color(0xFF3B82F6),
                strokeWidth: 1.2,
                dashPattern: const [4, 4],
                radius: const Radius.circular(4),
              ),
              child: Container(
                padding: const EdgeInsets.all(4),
                child: Image.asset(
                  'assets/images/logo.png',
                  height: 30,
                  errorBuilder: (context, error, stackTrace) => 
                      const Text('SAHYOG', style: TextStyle(fontWeight: FontWeight.bold, color: AppColors.primaryContainer)),
                ),
              ),
            ),
            actions: [
              IconButton(
                icon: Stack(
                  children: [
                    const Icon(Icons.notifications_none, color: AppColors.textPrimary),
                    Positioned(
                      right: 0,
                      top: 0,
                      child: Container(
                        padding: const EdgeInsets.all(2),
                        decoration: const BoxDecoration(color: Colors.red, shape: BoxShape.circle),
                        constraints: const BoxConstraints(minWidth: 14, minHeight: 14),
                        child: const Text('3', style: TextStyle(color: Colors.white, fontSize: 8, fontWeight: FontWeight.bold), textAlign: TextAlign.center),
                      ),
                    )
                  ],
                ),
                onPressed: () {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text(AppLocalization.get('Coming soon: Notifications'))),
                  );
                },
              ),
              GestureDetector(
                onTap: AppLocalization.toggleLanguage,
                child: Container(
                  margin: const EdgeInsets.only(right: 16, top: 12, bottom: 12, left: 4),
                  padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
                  decoration: BoxDecoration(
                    color: Colors.grey[100],
                    borderRadius: BorderRadius.circular(16),
                    border: Border.all(color: Colors.grey[300]!),
                  ),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text('EN', style: TextStyle(fontSize: 10, fontWeight: lang == 'EN' ? FontWeight.bold : FontWeight.normal, color: lang == 'EN' ? AppColors.primaryContainer : Colors.grey)),
                      const Padding(
                        padding: EdgeInsets.symmetric(horizontal: 4.0),
                        child: Text('|', style: TextStyle(fontSize: 10, color: Colors.grey)),
                      ),
                      Text('हिन्दी', style: TextStyle(fontSize: 10, fontWeight: lang == 'HI' ? FontWeight.bold : FontWeight.normal, color: lang == 'HI' ? AppColors.primaryContainer : Colors.grey)),
                    ],
                  ),
                ),
              )
            ],
          ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Greeting & Verification Badge
            Text(AppLocalization.get('Good morning, Nirman Shramik 👋'), style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: AppColors.textPrimary)),
            const SizedBox(height: 4),
            Text(AppLocalization.get('Manage your workforce, requests and opportunities.'), style: const TextStyle(fontSize: 12, color: AppColors.textSecondary)),
            const SizedBox(height: 8),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 2),
              decoration: BoxDecoration(
                color: const Color(0xFFE6F4EA),
                borderRadius: BorderRadius.circular(12),
                border: Border.all(color: const Color(0xFFBBF7D0)),
              ),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const Icon(Icons.check, size: 12, color: AppColors.cooperativeGreen),
                  const SizedBox(width: 4),
                  Text(AppLocalization.get('Cooperative Verified'), style: const TextStyle(fontSize: 10, fontWeight: FontWeight.bold, color: AppColors.cooperativeGreen)),
                ],
              ),
            ),
            
            const SizedBox(height: 16),
            
            // Key Metrics Grid
            GridView.count(
              crossAxisCount: 2,
              crossAxisSpacing: 10,
              mainAxisSpacing: 10,
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              childAspectRatio: 1.6,
              children: [
                _buildMetricCard(context, AppLocalization.get('👷 Workers'), '42', AppLocalization.get('28 Available'), AppColors.cooperativeGreen, hasDottedBorder: true),
                _buildMetricCard(context, AppLocalization.get('📋 Active Jobs'), '7', AppLocalization.get('5 Pending Requests'), Colors.orange[700]!),
                _buildMetricCard(context, AppLocalization.get('💰 Earnings'), '₹48,600', AppLocalization.get('This Month'), AppColors.textSecondary, isDot: false, onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) => const EarningsScreen()));
                }),
                _buildMetricCard(context, AppLocalization.get('📊 Workforce Utilization'), '78%', AppLocalization.get('This Month'), AppColors.cooperativeGreen, isDot: false),
              ],
            ),
            
            const SizedBox(height: 24),
            
            // Incoming Requests
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(AppLocalization.get('Incoming Requests'), style: const TextStyle(fontSize: 14, fontWeight: FontWeight.bold, color: AppColors.textPrimary)),
                DottedBorder(
                  options: RoundedRectDottedBorderOptions(
                    color: const Color(0xFF3B82F6),
                    strokeWidth: 1.2,
                    dashPattern: const [4, 4],
                    radius: const Radius.circular(4),
                  ),
                  child: Container(
                    padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 3),
                    child: Text(AppLocalization.get('View All Requests →'), style: const TextStyle(fontSize: 11, fontWeight: FontWeight.bold, color: AppColors.primaryContainer)),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 12),
            _buildRequestCard(AppLocalization.get('Residential Painting'), AppLocalization.get('Dwarka • Household'), AppLocalization.get('New'), AppLocalization.get('Sep 12 • 2 workers'), Colors.blue),
            const SizedBox(height: 10),
            _buildRequestCard(AppLocalization.get('Community Hall Repair'), AppLocalization.get('Najafgarh • Institution'), AppLocalization.get('Urgent'), AppLocalization.get('Sep 18–22 • 5 workers'), Colors.orange),
            
            const SizedBox(height: 24),
            
            // Workforce Overview
            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(12),
                border: Border.all(color: AppColors.borderSubtle),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(AppLocalization.get('Workforce Overview'), style: const TextStyle(fontSize: 14, fontWeight: FontWeight.bold, color: AppColors.textPrimary)),
                      DottedBorder(
                        options: RoundedRectDottedBorderOptions(
                          color: const Color(0xFF3B82F6),
                          strokeWidth: 1.2,
                          dashPattern: const [4, 4],
                          radius: const Radius.circular(4),
                        ),
                        child: Container(
                          padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 3),
                          child: Text(AppLocalization.get('Manage Workers →'), style: const TextStyle(fontSize: 11, fontWeight: FontWeight.bold, color: AppColors.primaryContainer)),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 16),
                  Row(
                    children: [
                      Expanded(child: _buildWorkforcePill(AppLocalization.get('Available'), '28', Colors.green)),
                      const SizedBox(width: 8),
                      Expanded(child: _buildWorkforcePill(AppLocalization.get('Working'), '7', Colors.blue)),
                    ],
                  ),
                  const SizedBox(height: 8),
                  Row(
                    children: [
                      Expanded(child: _buildWorkforcePill(AppLocalization.get('Assigned'), '5', Colors.orange)),
                      const SizedBox(width: 8),
                      Expanded(child: _buildWorkforcePill(AppLocalization.get('Unavailable'), '2', Colors.grey)),
                    ],
                  ),
                ],
              ),
            ),
            
            const SizedBox(height: 16),
            
            // AI Insight Card
            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(12),
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
                            padding: const EdgeInsets.all(4),
                            decoration: BoxDecoration(color: Colors.blue[50], borderRadius: BorderRadius.circular(6)),
                            child: const Icon(Icons.insights, size: 14, color: AppColors.primaryContainer),
                          ),
                          const SizedBox(width: 8),
                          Text(AppLocalization.get('WORKFORCE INSIGHT'), style: const TextStyle(fontSize: 11, fontWeight: FontWeight.bold, color: AppColors.textSecondary, letterSpacing: 1)),
                        ],
                      ),
                      Container(
                        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
                        decoration: BoxDecoration(color: Colors.grey[100], borderRadius: BorderRadius.circular(4)),
                        child: Text(AppLocalization.get('Confidence: 82%'), style: const TextStyle(fontSize: 9, fontWeight: FontWeight.bold, color: AppColors.textSecondary)),
                      )
                    ],
                  ),
                  const SizedBox(height: 12),
                  Text(AppLocalization.get('Painting demand is expected to increase by 24% next week.'), style: const TextStyle(fontSize: 12, fontWeight: FontWeight.bold, color: AppColors.textPrimary)),
                  const SizedBox(height: 4),
                  Text(AppLocalization.get('Consider adding 4–6 painting workers to your available pool.'), style: const TextStyle(fontSize: 11, color: AppColors.textSecondary)),
                  const SizedBox(height: 12),
                  SizedBox(
                    width: double.infinity,
                    child: OutlinedButton(
                      onPressed: () async {
                        final res = await Navigator.push<int>(
                          context,
                          MaterialPageRoute(
                            builder: (context) => AiInsightsScreen(onTabSelected: onNavigateTab),
                          ),
                        );
                        if (res != null) {
                          onNavigateTab?.call(res);
                        }
                      },
                      style: OutlinedButton.styleFrom(
                        foregroundColor: AppColors.primaryContainer,
                        side: BorderSide(color: Colors.grey[200]!),
                        backgroundColor: Colors.grey[50],
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
                      ),
                      child: Text(AppLocalization.get('View Insights →'), style: const TextStyle(fontSize: 12, fontWeight: FontWeight.bold)),
                    ),
                  )
                ],
              ),
            ),
            
            const SizedBox(height: 16),
            
            // Cooperative Exchange Card
            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: const Color(0xFFF0FDF4),
                borderRadius: BorderRadius.circular(12),
                border: Border.all(color: const Color(0xFF86EFAC)),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      const Text('🤝', style: TextStyle(fontSize: 14)),
                      const SizedBox(width: 8),
                      Text(AppLocalization.get('Cooperative Exchange'), style: const TextStyle(fontSize: 13, fontWeight: FontWeight.bold, color: AppColors.cooperativeGreen)),
                    ],
                  ),
                  const SizedBox(height: 8),
                  Text(AppLocalization.get('Find nearby work opportunities, workforce support and shared equipment.'), style: const TextStyle(fontSize: 11, color: AppColors.textSecondary)),
                  const SizedBox(height: 12),
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const CooperativeExchangeScreen(showBackButton: true),
                          ),
                        );
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: AppColors.cooperativeGreen,
                        foregroundColor: Colors.white,
                        elevation: 0,
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
                      ),
                      child: Text(AppLocalization.get('Explore Exchange →'), style: const TextStyle(fontSize: 12, fontWeight: FontWeight.bold)),
                    ),
                  )
                ],
              ),
            ),
            
            const SizedBox(height: 24),
          ],
        ),
      ),
    );
    }
    );
  }

  Widget _buildMetricCard(BuildContext context, String title, String value, String subtitle, Color subtitleColor, {bool isDot = true, bool hasDottedBorder = false, VoidCallback? onTap}) {
    final cardBody = Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        border: hasDottedBorder ? null : Border.all(color: AppColors.borderSubtle),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(title, style: const TextStyle(fontSize: 11, fontWeight: FontWeight.w600, color: AppColors.textSecondary)),
          const SizedBox(height: 6),
          Text(value, style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: AppColors.primaryContainer)),
          const SizedBox(height: 4),
          Row(
            children: [
              if (isDot) ...[
                Container(width: 6, height: 6, decoration: BoxDecoration(color: subtitleColor, shape: BoxShape.circle)),
                const SizedBox(width: 4),
              ],
              Expanded(child: Text(subtitle, style: TextStyle(fontSize: 10, fontWeight: FontWeight.w600, color: subtitleColor))),
            ],
          )
        ],
      ),
    );

    return GestureDetector(
      onTap: onTap,
      child: hasDottedBorder
          ? DottedBorder(
              options: RoundedRectDottedBorderOptions(
                color: const Color(0xFF3B82F6),
                strokeWidth: 1.2,
                dashPattern: const [4, 4],
                radius: const Radius.circular(12),
              ),
              child: cardBody,
            )
          : cardBody,
    );
  }

  Widget _buildRequestCard(String title, String location, String tag, String dateInfo, MaterialColor tagColor) {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: AppColors.borderSubtle),
      ),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(title, style: const TextStyle(fontSize: 13, fontWeight: FontWeight.bold, color: AppColors.textPrimary)),
                    const SizedBox(height: 4),
                    Row(
                      children: [
                        const Icon(Icons.location_on_outlined, size: 12, color: AppColors.textSecondary),
                        const SizedBox(width: 4),
                        Text(location, style: const TextStyle(fontSize: 11, color: AppColors.textSecondary)),
                      ],
                    )
                  ],
                ),
              ),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
                decoration: BoxDecoration(
                  color: tagColor[50],
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(color: tagColor[200]!),
                ),
                child: Text(tag, style: TextStyle(fontSize: 10, fontWeight: FontWeight.bold, color: tagColor[700])),
              )
            ],
          ),
          const Padding(
            padding: EdgeInsets.symmetric(vertical: 8.0),
            child: Divider(color: AppColors.borderSubtle, height: 1),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('🗓️ $dateInfo', style: const TextStyle(fontSize: 11, fontWeight: FontWeight.w600, color: AppColors.textSecondary)),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                decoration: BoxDecoration(
                  color: Colors.grey[50],
                  borderRadius: BorderRadius.circular(8),
                  border: Border.all(color: Colors.grey[200]!),
                ),
                child: Text(AppLocalization.get('View Request →'), style: const TextStyle(fontSize: 11, fontWeight: FontWeight.bold, color: AppColors.primaryContainer)),
              )
            ],
          )
        ],
      ),
    );
  }

  Widget _buildWorkforcePill(String label, String count, MaterialColor color) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
      decoration: BoxDecoration(
        color: color[50],
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: color[200]!),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(label, style: TextStyle(fontSize: 11, fontWeight: FontWeight.bold, color: color[700])),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(4),
              boxShadow: [BoxShadow(color: Colors.black.withValues(alpha: 0.05), blurRadius: 2)],
            ),
            child: Text(count, style: TextStyle(fontSize: 11, fontWeight: FontWeight.bold, color: color[700])),
          )
        ],
      ),
    );
  }
}
