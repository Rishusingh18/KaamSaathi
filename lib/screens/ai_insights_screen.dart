import 'package:flutter/material.dart';
import '../theme/colors.dart';

class AiInsightsScreen extends StatelessWidget {
  const AiInsightsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.surfaceCanvas,
      appBar: AppBar(
        title: const Text('AI Insights (15C)', style: TextStyle(color: AppColors.primaryContainer, fontSize: 16)),
        backgroundColor: AppColors.surfaceCanvas,
        elevation: 0,
        iconTheme: const IconThemeData(color: AppColors.primaryContainer),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.auto_awesome, size: 64, color: Colors.purple.withOpacity(0.5)),
            const SizedBox(height: 16),
            const Text('AI Insights & Predictions', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.purple)),
            const SizedBox(height: 8),
            const Text('Demand forecasting and smart scheduling.', style: TextStyle(color: AppColors.textSecondary)),
          ],
        ),
      ),
    );
  }
}
