import 'package:flutter/material.dart';
import '../theme/colors.dart';

class ReportsScreen extends StatelessWidget {
  const ReportsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.surfaceCanvas,
      appBar: AppBar(
        title: const Text('Reports (16C)', style: TextStyle(color: AppColors.primaryContainer, fontSize: 16)),
        backgroundColor: AppColors.surfaceCanvas,
        elevation: 0,
        iconTheme: const IconThemeData(color: AppColors.primaryContainer),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.bar_chart, size: 64, color: Colors.blue.withOpacity(0.5)),
            const SizedBox(height: 16),
            const Text('Analytics & Reports', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.blue)),
            const SizedBox(height: 8),
            const Text('View cooperative performance data.', style: TextStyle(color: AppColors.textSecondary)),
          ],
        ),
      ),
    );
  }
}
