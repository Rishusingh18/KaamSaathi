import 'package:flutter/material.dart';
import '../theme/colors.dart';

class EarningsScreen extends StatelessWidget {
  const EarningsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.surfaceCanvas,
      appBar: AppBar(
        title: const Text('Earnings & Payments (13C)', style: TextStyle(color: AppColors.primaryContainer, fontSize: 16)),
        backgroundColor: AppColors.surfaceCanvas,
        elevation: 0,
        iconTheme: const IconThemeData(color: AppColors.primaryContainer),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.account_balance_wallet, size: 64, color: AppColors.primaryContainer.withOpacity(0.5)),
            const SizedBox(height: 16),
            const Text('Earnings Module', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: AppColors.primaryContainer)),
            const SizedBox(height: 8),
            const Text('Worker payments and cooperative revenue will appear here.', style: TextStyle(color: AppColors.textSecondary)),
          ],
        ),
      ),
    );
  }
}
