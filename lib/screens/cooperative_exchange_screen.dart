import 'package:flutter/material.dart';
import '../theme/colors.dart';

class CooperativeExchangeScreen extends StatelessWidget {
  const CooperativeExchangeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.surfaceCanvas,
      appBar: AppBar(
        title: const Text('Cooperative Exchange (14C)', style: TextStyle(color: AppColors.primaryContainer, fontSize: 16)),
        backgroundColor: AppColors.surfaceCanvas,
        elevation: 0,
        iconTheme: const IconThemeData(color: AppColors.primaryContainer),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.handshake, size: 64, color: AppColors.cooperativeGreen.withOpacity(0.5)),
            const SizedBox(height: 16),
            const Text('Cooperative Exchange', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: AppColors.cooperativeGreen)),
            const SizedBox(height: 8),
            const Text('B2B resource sharing and worker exchange.', style: TextStyle(color: AppColors.textSecondary)),
          ],
        ),
      ),
    );
  }
}
