import 'package:flutter/material.dart';
import '../theme/colors.dart';
import '../utils/localization.dart';

class AiInsightsScreen extends StatelessWidget {
  const AiInsightsScreen({Key? key}) : super(key: key);

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
            title: Row(
              children: [
                Text(
                  AppLocalization.get('AI Workforce Insights'),
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: AppColors.primaryContainer,
                  ),
                ),
                const SizedBox(width: 8),
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 4, vertical: 2),
                  decoration: BoxDecoration(color: Colors.blue.shade50, borderRadius: BorderRadius.circular(4), border: Border.all(color: Colors.blue.shade100)),
                  child: Text(AppLocalization.get('AI-Assisted'), style: const TextStyle(fontSize: 9, fontWeight: FontWeight.bold, color: AppColors.primaryContainer)),
                )
              ],
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
                    AppLocalization.get('Use demand trends to plan your workforce.'),
                    style: const TextStyle(fontSize: 12, color: AppColors.textSecondary, fontWeight: FontWeight.w500),
                  ),
                ),
                
                const SizedBox(height: 16),

                // Demand Forecast
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(AppLocalization.get('Demand Forecast'), style: const TextStyle(fontSize: 14, fontWeight: FontWeight.bold, color: AppColors.primaryContainer)),
                      Text(AppLocalization.get('Next 7 Days'), style: const TextStyle(fontSize: 11, color: AppColors.textSecondary)),
                    ],
                  ),
                ),
                const SizedBox(height: 12),

                Container(
                  margin: const EdgeInsets.symmetric(horizontal: 16),
                  padding: const EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(16),
                    border: Border.all(color: AppColors.borderSubtle),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(AppLocalization.get('Weekly Outlook'), style: const TextStyle(fontSize: 12, fontWeight: FontWeight.bold, color: AppColors.primaryContainer)),
                      const SizedBox(height: 16),
                      _buildForecastRow(AppLocalization.get('🎨 Painting'), '+24%', Colors.purple),
                      _buildForecastRow(AppLocalization.get('⚡ Electrical'), '+12%', Colors.blue),
                      _buildForecastRow(AppLocalization.get('🧱 Masonry'), '+8%', Colors.orange),
                      const SizedBox(height: 12),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(AppLocalization.get('Forecast based on recent service requests.'), style: const TextStyle(fontSize: 10, color: AppColors.textSecondary)),
                          Text('${AppLocalization.get("Forecast Confidence")} 82%', style: const TextStyle(fontSize: 10, fontWeight: FontWeight.bold, color: AppColors.primaryContainer)),
                        ],
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

  Widget _buildForecastRow(String title, String percent, Color color) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(title, style: const TextStyle(fontSize: 13, fontWeight: FontWeight.w500, color: AppColors.primaryContainer)),
          Row(
            children: [
              Text(percent, style: TextStyle(fontSize: 13, fontWeight: FontWeight.bold, color: color)),
              const SizedBox(width: 4),
              Text(AppLocalization.get('next week'), style: const TextStyle(fontSize: 11, color: AppColors.textSecondary)),
            ],
          ),
        ],
      ),
    );
  }
}
