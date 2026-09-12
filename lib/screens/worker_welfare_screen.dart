import 'package:flutter/material.dart';
import '../theme/colors.dart';

class WorkerWelfareScreen extends StatelessWidget {
  const WorkerWelfareScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.surfaceCanvas,
      appBar: AppBar(
        title: const Text('Worker Welfare & Issues (17C)', style: TextStyle(color: AppColors.primaryContainer, fontSize: 16)),
        backgroundColor: AppColors.surfaceCanvas,
        elevation: 0,
        iconTheme: const IconThemeData(color: AppColors.primaryContainer),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.health_and_safety, size: 64, color: Colors.red.withOpacity(0.5)),
            const SizedBox(height: 16),
            const Text('Worker Welfare', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.red)),
            const SizedBox(height: 8),
            const Text('Manage grievances and welfare programs.', style: TextStyle(color: AppColors.textSecondary)),
          ],
        ),
      ),
    );
  }
}
