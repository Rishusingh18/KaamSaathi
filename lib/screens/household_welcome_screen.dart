import 'package:flutter/material.dart';
import '../theme/colors.dart';
import '../utils/localization.dart';
import 'household_login_screen.dart';
import 'household_registration_screen.dart';

class HouseholdWelcomeScreen extends StatelessWidget {
  const HouseholdWelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<String>(
      valueListenable: AppLocalization.currentLang,
      builder: (context, lang, child) {
        return Scaffold(
          backgroundColor: AppColors.surfaceCanvas,
          body: SafeArea(
            child: SingleChildScrollView(
              padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  // Header: Back + Tricolor
                  SizedBox(
                    height: 44,
                    child: Stack(
                      alignment: Alignment.center,
                      children: [
                        Align(
                          alignment: Alignment.centerLeft,
                          child: IconButton(
                            icon: const Icon(Icons.arrow_back_ios_new, size: 20),
                            color: AppColors.primaryContainer,
                            onPressed: () => Navigator.pop(context),
                          ),
                        ),
                        Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Container(width: 15, height: 3, color: AppColors.saffron),
                            Container(width: 15, height: 3, color: Colors.white),
                            Container(width: 15, height: 3, color: AppColors.cooperativeGreen),
                          ],
                        ),
                      ],
                    ),
                  ),

                  const SizedBox(height: 16),

                  // Brand Logo
                  Image.asset(
                    'assets/images/logo.png',
                    height: 56,
                    errorBuilder: (context, error, stackTrace) =>
                        const Text('SAHYOG', style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold, color: AppColors.primaryContainer)),
                  ),

                  const SizedBox(height: 16),

                  // Hero Illustration: house icon in green circle
                  Container(
                    width: 124,
                    height: 124,
                    padding: const EdgeInsets.all(4),
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: const Color(0xFFECFDF5),
                      border: Border.all(color: const Color(0xFFD1FAE5), width: 2),
                    ),
                    child: Center(
                      child: Stack(
                        alignment: Alignment.center,
                        children: [
                          const Icon(Icons.home_outlined, size: 64, color: AppColors.primaryContainer),
                          Positioned(
                            right: 6,
                            bottom: 6,
                            child: Container(
                              decoration: const BoxDecoration(
                                shape: BoxShape.circle,
                                color: AppColors.cooperativeGreen,
                              ),
                              padding: const EdgeInsets.all(3),
                              child: const Icon(Icons.check, size: 14, color: Colors.white),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),

                  const SizedBox(height: 12),

                  // Role pill
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
                    decoration: BoxDecoration(
                      color: const Color(0xFFFFF7ED),
                      borderRadius: BorderRadius.circular(16),
                      border: Border.all(color: const Color(0xFFFED7AA)),
                    ),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        const Text('🏠', style: TextStyle(fontSize: 12)),
                        const SizedBox(width: 6),
                        Text(
                          AppLocalization.get('HOUSEHOLD / नागरिक'),
                          style: const TextStyle(
                            fontSize: 11,
                            fontWeight: FontWeight.bold,
                            color: Color(0xFFEA580C),
                            letterSpacing: 0.5,
                          ),
                        ),
                      ],
                    ),
                  ),

                  const SizedBox(height: 16),

                  // Title
                  Text(
                    AppLocalization.get('Welcome to SAHYOG'),
                    style: const TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: AppColors.primaryContainer,
                    ),
                    textAlign: TextAlign.center,
                  ),

                  const SizedBox(height: 4),

                  // Subtitle (saffron)
                  Text(
                    AppLocalization.get('Get trusted services from skilled local workers.'),
                    style: const TextStyle(
                      fontSize: 14.5,
                      fontWeight: FontWeight.w500,
                      color: AppColors.saffron,
                    ),
                    textAlign: TextAlign.center,
                  ),

                  const SizedBox(height: 8),

                  // Description
                  Text(
                    AppLocalization.get('Request household services, connect with skilled workers or verified cooperatives, track your service, and manage payments — all in one place.'),
                    style: const TextStyle(
                      fontSize: 12.5,
                      color: AppColors.textSecondary,
                      height: 1.5,
                    ),
                    textAlign: TextAlign.center,
                  ),

                  const SizedBox(height: 24),

                  // Feature card
                  Container(
                    width: double.infinity,
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
                          children: [
                            Container(
                              padding: const EdgeInsets.all(4),
                              decoration: const BoxDecoration(
                                shape: BoxShape.circle,
                                color: Color(0xFFD1FAE5),
                              ),
                              child: const Icon(Icons.check, size: 14, color: AppColors.cooperativeGreen),
                            ),
                            const SizedBox(width: 8),
                            Text(
                              AppLocalization.get('With SAHYOG, you can'),
                              style: const TextStyle(
                                fontSize: 13.5,
                                fontWeight: FontWeight.w600,
                                color: AppColors.textPrimary,
                              ),
                            ),
                          ],
                        ),
                        const Padding(
                          padding: EdgeInsets.symmetric(vertical: 8.0),
                          child: Divider(color: AppColors.borderSubtle),
                        ),
                        _buildFeatureItem(AppLocalization.get('Find skilled workers for household services')),
                        _buildFeatureItem(AppLocalization.get('Request services from verified cooperatives')),
                        _buildFeatureItem(AppLocalization.get('See transparent service quotes')),
                        _buildFeatureItem(AppLocalization.get('Track your service from request to completion')),
                        _buildFeatureItem(AppLocalization.get('Get digital invoices and service records')),
                      ],
                    ),
                  ),

                  const SizedBox(height: 16),

                  // Trust badge
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Icon(Icons.shield, size: 16, color: AppColors.cooperativeGreen),
                      const SizedBox(width: 8),
                      Flexible(
                        child: Text(
                          AppLocalization.get('Verified skills. Transparent services. Better opportunities for workers.'),
                          style: const TextStyle(
                            fontSize: 11.5,
                            fontWeight: FontWeight.w500,
                            color: AppColors.cooperativeGreen,
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ],
                  ),

                  const SizedBox(height: 32),

                  // Login CTA — dotted border
                  Container(
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.blue.withOpacity(0.3), width: 2),
                      borderRadius: BorderRadius.circular(16),
                    ),
                    padding: const EdgeInsets.all(3),
                    child: SizedBox(
                      width: double.infinity,
                      child: ElevatedButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const HouseholdLoginScreen(),
                            ),
                          );
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: AppColors.primaryContainer,
                          padding: const EdgeInsets.symmetric(vertical: 16),
                          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                          elevation: 0,
                        ),
                        child: Text(
                          AppLocalization.get('Login →'),
                          style: const TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                  ),

                  const SizedBox(height: 12),

                  // Create account secondary
                  SizedBox(
                    width: double.infinity,
                    child: OutlinedButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const HouseholdRegistrationScreen(),
                          ),
                        );
                      },
                      style: OutlinedButton.styleFrom(
                        padding: const EdgeInsets.symmetric(vertical: 16),
                        side: const BorderSide(color: AppColors.borderSubtle, width: 1.5),
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                        backgroundColor: Colors.white,
                      ),
                      child: Text(
                        AppLocalization.get('+ Create Account'),
                        style: const TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.w600,
                          color: AppColors.primaryContainer,
                        ),
                      ),
                    ),
                  ),

                  const SizedBox(height: 24),

                  // Footer motto
                  Text(
                    AppLocalization.get('COOPERATE. EMPOWER. GROW. / साथ मिलकर, समृद्धि की ओर'),
                    style: const TextStyle(
                      fontSize: 11,
                      fontWeight: FontWeight.w600,
                      letterSpacing: 1.0,
                      color: Colors.grey,
                    ),
                    textAlign: TextAlign.center,
                  ),

                  const SizedBox(height: 24),
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  Widget _buildFeatureItem(String text) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            '✓',
            style: TextStyle(
              color: AppColors.cooperativeGreen,
              fontWeight: FontWeight.bold,
              fontSize: 13,
            ),
          ),
          const SizedBox(width: 8),
          Expanded(
            child: Text(
              text,
              style: const TextStyle(
                fontSize: 12,
                color: AppColors.textPrimary,
                height: 1.3,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
