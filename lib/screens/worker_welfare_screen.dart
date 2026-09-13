import 'package:flutter/material.dart';
import '../theme/colors.dart';
import '../utils/localization.dart';

class WorkerWelfareScreen extends StatelessWidget {
  const WorkerWelfareScreen({Key? key}) : super(key: key);

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
              AppLocalization.get('Worker Welfare & Issues'),
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
                    AppLocalization.get('Support worker wellbeing, safety and timely assistance.'),
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
                        child: _buildMetricCard('3', AppLocalization.get('Pending Payments'), AppLocalization.get('Need attention'), Colors.amber),
                      ),
                      const SizedBox(width: 8),
                      Expanded(
                        child: _buildMetricCard('1', AppLocalization.get('Safety Issues'), AppLocalization.get('Open'), Colors.red),
                      ),
                      const SizedBox(width: 8),
                      Expanded(
                        child: _buildMetricCard('2', AppLocalization.get('Assistance Requests'), AppLocalization.get('Pending'), Colors.blue),
                      ),
                    ],
                  ),
                ),
                
                const SizedBox(height: 24),

                // Needs Attention Section
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(AppLocalization.get('Needs Attention'), style: const TextStyle(fontSize: 14, fontWeight: FontWeight.bold, color: AppColors.primaryContainer)),
                      Text('2 ${AppLocalization.get("Active")}', style: const TextStyle(fontSize: 11, color: AppColors.textSecondary)),
                    ],
                  ),
                ),
                const SizedBox(height: 12),
                
                _buildIssueCard(AppLocalization.get('⚠ Safety Issue'), AppLocalization.get('Sunita Devi'), AppLocalization.get('Electrical Maintenance'), AppLocalization.get('Safety equipment required before next assignment.'), Colors.red),
                _buildIssueCard(AppLocalization.get('💰 Pending Payment'), AppLocalization.get('Ramlal Kumar'), AppLocalization.get('Residential Painting'), AppLocalization.get('Payment pending for ₹1,200.'), Colors.amber),
                
                const SizedBox(height: 40),
              ],
            ),
          ),
        );
      }
    );
  }

  Widget _buildMetricCard(String value, String label, String sublabel, Color valueColor) {
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
          Text(value, style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: valueColor)),
          Text(label, style: const TextStyle(fontSize: 11, fontWeight: FontWeight.bold, color: AppColors.textPrimary)),
          Text(sublabel, style: const TextStyle(fontSize: 9, color: AppColors.textSecondary)),
        ],
      ),
    );
  }

  Widget _buildIssueCard(String title, String worker, String project, String description, Color accentColor) {
    return Container(
      margin: const EdgeInsets.only(left: 16, right: 16, bottom: 12),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: AppColors.borderSubtle),
        boxShadow: [BoxShadow(color: Colors.black.withOpacity(0.02), blurRadius: 4, offset: const Offset(0, 2))],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(title, style: TextStyle(fontSize: 13, fontWeight: FontWeight.bold, color: accentColor)),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                decoration: BoxDecoration(color: accentColor.withOpacity(0.1), borderRadius: BorderRadius.circular(6)),
                child: Text(AppLocalization.get('Open'), style: TextStyle(fontSize: 10, fontWeight: FontWeight.bold, color: accentColor)),
              ),
            ],
          ),
          const SizedBox(height: 8),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(worker, style: const TextStyle(fontSize: 14, fontWeight: FontWeight.bold, color: AppColors.primaryContainer)),
              Text(project, style: const TextStyle(fontSize: 11, color: AppColors.textSecondary)),
            ],
          ),
          const SizedBox(height: 8),
          Text(description, style: const TextStyle(fontSize: 12, color: AppColors.textPrimary)),
          const SizedBox(height: 16),
          SizedBox(
            width: double.infinity,
            child: OutlinedButton(
              onPressed: null,
              style: OutlinedButton.styleFrom(
                side: const BorderSide(color: AppColors.borderSubtle),
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
              ),
              child: Text(AppLocalization.get('View Issue') + ' →', style: const TextStyle(fontSize: 12, fontWeight: FontWeight.bold, color: AppColors.primaryContainer)),
            ),
          ),
        ],
      ),
    );
  }
}
