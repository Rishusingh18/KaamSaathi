import 'package:flutter/material.dart';
import '../theme/colors.dart';
import '../utils/localization.dart';

class ReportsScreen extends StatelessWidget {
  const ReportsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<String>(
      valueListenable: AppLocalization.currentLang,
      builder: (context, lang, child) {
        return Scaffold(
          backgroundColor: AppColors.surfaceCanvas,
          appBar: AppBar(
            backgroundColor: Colors.white,
            elevation: 0,
            leading: IconButton(
              icon: const Icon(Icons.arrow_back, color: AppColors.textPrimary),
              onPressed: () => Navigator.pop(context),
            ),
            title: Text(
              AppLocalization.get('Reports & Work History'),
              style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: AppColors.primaryContainer,
              ),
            ),
            actions: [
              Padding(
                padding: const EdgeInsets.only(right: 16.0),
                child: Center(
                  child: GestureDetector(
                    onTap: AppLocalization.toggleLanguage,
                    child: Container(
                      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                      decoration: BoxDecoration(
                        color: Colors.grey.shade100,
                        border: Border.all(color: AppColors.borderSubtle),
                        borderRadius: BorderRadius.circular(16),
                      ),
                      child: Row(
                        children: [
                          Text(AppLocalization.get('EN'), style: TextStyle(fontSize: 11, fontWeight: lang == 'EN' ? FontWeight.bold : FontWeight.normal, color: lang == 'EN' ? AppColors.primaryContainer : Colors.grey)),
                          const Padding(
                            padding: EdgeInsets.symmetric(horizontal: 4.0),
                            child: Text('|', style: TextStyle(fontSize: 11, color: Colors.grey)),
                          ),
                          Text(AppLocalization.get('हिन्दी'), style: TextStyle(fontSize: 11, fontWeight: lang == 'HI' ? FontWeight.bold : FontWeight.normal, color: lang == 'HI' ? AppColors.primaryContainer : Colors.grey)),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
          body: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  color: Colors.white,
                  width: double.infinity,
                  padding: const EdgeInsets.fromLTRB(16, 0, 16, 16),
                  child: Text(
                    AppLocalization.get('Review completed work and cooperative performance.'),
                    style: const TextStyle(fontSize: 12, color: AppColors.textSecondary, fontWeight: FontWeight.w500),
                  ),
                ),
                
                const SizedBox(height: 16),

                // Top Metrics
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  child: Row(
                    children: [
                      Expanded(
                        child: _buildMetricCard('24', AppLocalization.get('Completed'), AppLocalization.get('This Year')),
                      ),
                      const SizedBox(width: 8),
                      Expanded(
                        child: _buildMetricCard('42', AppLocalization.get('Workers'), AppLocalization.get('Total')),
                      ),
                      const SizedBox(width: 8),
                      Expanded(
                        child: _buildMetricCard('₹4.82L', AppLocalization.get('Project Value'), AppLocalization.get('This Year')),
                      ),
                    ],
                  ),
                ),
                
                const SizedBox(height: 24),

                // Recent Projects Section
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(AppLocalization.get('Recent Projects'), style: const TextStyle(fontSize: 14, fontWeight: FontWeight.bold, color: AppColors.primaryContainer)),
                      Container(
                        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                        decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(16), border: Border.all(color: AppColors.borderSubtle)),
                        child: Text(AppLocalization.get('All'), style: const TextStyle(fontSize: 10, fontWeight: FontWeight.bold, color: AppColors.textPrimary)),
                      )
                    ],
                  ),
                ),
                const SizedBox(height: 12),
                
                _buildProjectHistoryCard(AppLocalization.get('Residential Painting'), AppLocalization.get('🏠 Household • Dwarka'), '₹3,250', AppLocalization.get('Sep 10, 2026'), 'Ramlal K., Rajesh S.', '5.0 ★'),
                _buildProjectHistoryCard(AppLocalization.get('Community Hall Repair'), AppLocalization.get('🏢 Institution • Najafgarh'), '₹7,800', AppLocalization.get('Sep 5, 2026'), 'Mohan L., Amit P. +2', '4.9 ★'),
                _buildProjectHistoryCard(AppLocalization.get('Electrical Maintenance'), AppLocalization.get('🏢 Institution • Janakpuri'), '₹5,800', AppLocalization.get('Aug 28, 2026'), 'Sunita D., Vikas K., Manoj', '5.0 ★'),
                
                const SizedBox(height: 40),
              ],
            ),
          ),
        );
      }
    );
  }

  Widget _buildMetricCard(String value, String label, String sublabel) {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: AppColors.borderSubtle),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(value, style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: AppColors.primaryContainer)),
          Text(label, style: const TextStyle(fontSize: 11, fontWeight: FontWeight.bold, color: AppColors.textPrimary)),
          Text(sublabel, style: const TextStyle(fontSize: 9, color: AppColors.textSecondary)),
        ],
      ),
    );
  }

  Widget _buildProjectHistoryCard(String title, String subtitle, String value, String date, String workers, String rating) {
    return Container(
      margin: const EdgeInsets.only(left: 16, right: 16, bottom: 12),
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
              Expanded(
                child: Text(title, style: const TextStyle(fontSize: 14, fontWeight: FontWeight.bold, color: AppColors.primaryContainer)),
              ),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                decoration: BoxDecoration(color: Colors.green.shade50, borderRadius: BorderRadius.circular(6)),
                child: Text(AppLocalization.get('Completed'), style: const TextStyle(fontSize: 10, fontWeight: FontWeight.bold, color: AppColors.cooperativeGreen)),
              ),
            ],
          ),
          const SizedBox(height: 4),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(subtitle, style: const TextStyle(fontSize: 12, color: AppColors.textSecondary)),
              Text(value, style: const TextStyle(fontSize: 12, fontWeight: FontWeight.bold, color: AppColors.primaryContainer)),
            ],
          ),
          const Padding(
            padding: EdgeInsets.symmetric(vertical: 12.0),
            child: Divider(height: 1, color: AppColors.borderSubtle),
          ),
          Text(date, style: const TextStyle(fontSize: 11, color: AppColors.textSecondary)),
          const SizedBox(height: 4),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(workers, style: const TextStyle(fontSize: 12, fontWeight: FontWeight.w500, color: AppColors.primaryContainer)),
              Text(rating, style: const TextStyle(fontSize: 12, fontWeight: FontWeight.bold, color: Colors.amber)),
            ],
          ),
        ],
      ),
    );
  }
}
