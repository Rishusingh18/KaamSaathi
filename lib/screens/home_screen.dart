import 'package:flutter/material.dart';
import '../theme/colors.dart';
import '../widgets/custom_buttons.dart';
import '../widgets/action_card.dart';
import '../utils/localization.dart';
import 'login_options_screen.dart';
import 'register_screen.dart';
import 'worker_registration_screen.dart';
import 'language_selection_screen.dart';

class HomeScreen extends StatelessWidget {
  final String role;
  
  const HomeScreen({Key? key, this.role = 'Cooperative'}) : super(key: key);

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
              // Header: Back Navigation & Tricolor Accent
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
                        onPressed: () {
                          Navigator.pop(context);
                        },
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
              
              // Brand Logo Placeholder
              Image.asset(
                'assets/images/logo.png',
                height: 56,
                errorBuilder: (context, error, stackTrace) => 
                    const Text('SAHYOG', style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold, color: AppColors.primaryContainer)),
              ),
              
              const SizedBox(height: 16),
              
              // Hero Illustration & Role Badge
              Container(
                width: 124,
                height: 124,
                padding: const EdgeInsets.all(4),
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: const Color(0xFFECFDF5),
                  border: Border.all(color: const Color(0xFFD1FAE5), width: 2),
                ),
                child: ClipOval(
                  child: Image.asset(
                    role == 'Worker' ? 'assets/images/worker_logo.png' : 'assets/images/logo.png',
                    fit: BoxFit.cover,
                    errorBuilder: (context, error, stackTrace) => Icon(
                      role == 'Worker' ? Icons.engineering : Icons.business, 
                      size: 64, 
                      color: AppColors.cooperativeGreen
                    ),
                  ),
                ),
              ),
              
              const SizedBox(height: 12),
              
              // Role pill tag
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
                decoration: BoxDecoration(
                  color: role == 'Worker' ? AppColors.cooperativeGreen : const Color(0xFFECFDF5),
                  borderRadius: BorderRadius.circular(16),
                  border: Border.all(color: role == 'Worker' ? AppColors.cooperativeGreen : const Color(0xFFD1FAE5)),
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    if (role != 'Worker') const Text('🏢', style: TextStyle(fontSize: 12)),
                    if (role != 'Worker') const SizedBox(width: 6),
                    Text(
                      role == 'Worker' 
                          ? AppLocalization.get('WORKER • कामगार') 
                          : AppLocalization.get('COOPERATIVE / सहकारी संस्था'),
                      style: TextStyle(
                        fontSize: 11,
                        fontWeight: FontWeight.bold,
                        color: role == 'Worker' ? Colors.white : AppColors.primaryContainer,
                        letterSpacing: 0.5,
                      ),
                    ),
                  ],
                ),
              ),
              
              const SizedBox(height: 16),
              
              // Title & Subheadings
              Text(
                role == 'Worker' 
                    ? AppLocalization.get('Welcome, Worker')
                    : AppLocalization.get('Welcome to SAHYOG'),
                style: const TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: AppColors.primaryContainer,
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 4),
              Text(
                role == 'Worker'
                    ? AppLocalization.get('Create your profile. Get better work opportunities.')
                    : AppLocalization.get('Connect your cooperative with more work opportunities.'),
                style: const TextStyle(
                  fontSize: 14.5,
                  fontWeight: FontWeight.w500,
                  color: AppColors.saffron,
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 8),
              Text(
                role == 'Worker'
                    ? AppLocalization.get('Find the right work opportunities, show your skills, manage your work and see your earnings — all in one place.')
                    : AppLocalization.get('Manage your workforce, receive service requests, assign workers, discover new opportunities, and track earnings — all in one place.'),
                style: const TextStyle(
                  fontSize: 12.5,
                  color: AppColors.textSecondary,
                  height: 1.5,
                ),
                textAlign: TextAlign.center,
              ),
              
              const SizedBox(height: 24),
              
              // Benefit Card
              ActionCard(
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
                          role == 'Worker' 
                              ? AppLocalization.get('With SAHYOG you')
                              : AppLocalization.get('With SAHYOG, your cooperative can'),
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
                    if (role == 'Worker') ...[
                      _buildFeatureItem(AppLocalization.get('Create your Skill Passport')),
                      _buildFeatureItem(AppLocalization.get('Find the right work opportunities for yourself')),
                      _buildFeatureItem(AppLocalization.get('Set your availability')),
                      _buildFeatureItem(AppLocalization.get('View earnings and payment history')),
                      _buildFeatureItem(AppLocalization.get('Connect with your cooperative')),
                    ] else ...[
                      _buildFeatureItem(AppLocalization.get('Manage your workers and their availability')),
                      _buildFeatureItem(AppLocalization.get('Receive household and institution service requests')),
                      _buildFeatureItem(AppLocalization.get('Match the right workers to each job')),
                      _buildFeatureItem(AppLocalization.get('Discover opportunities through Cooperative Exchange')),
                      _buildFeatureItem(AppLocalization.get('Track projects, payments and workforce performance')),
                    ],
                  ],
                ),
              ),
              
              const SizedBox(height: 16),
              
              // Trust Note
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Icon(Icons.shield, size: 16, color: AppColors.cooperativeGreen),
                  const SizedBox(width: 8),
                  Text(
                    role == 'Worker'
                        ? AppLocalization.get('Your information is secure and used with your permission.')
                        : AppLocalization.get('Empower workers. Build opportunities. Grow together.'),
                    style: const TextStyle(
                      fontSize: 11.5,
                      fontWeight: FontWeight.w500,
                      color: AppColors.cooperativeGreen,
                    ),
                  ),
                ],
              ),
              
              const SizedBox(height: 32),
              
              // Action CTAs
              PrimaryButton(
                text: role == 'Worker' ? AppLocalization.get('Log in →') : AppLocalization.get('Login →'),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => LoginOptionsScreen(role: role)),
                  );
                },
              ),
              const SizedBox(height: 12),
              SecondaryButton(
                text: role == 'Worker' ? AppLocalization.get('+ Create Account') : AppLocalization.get('+ Create Cooperative Account'),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => role == 'Worker' 
                          ? const WorkerRegistrationScreen() 
                          : const RegisterScreen()
                    ),
                  );
                },
              ),
              
              if (role == 'Worker') ...[
                const SizedBox(height: 16),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      AppLocalization.get('New to cooperatives?'),
                      style: const TextStyle(fontSize: 12, color: AppColors.textSecondary),
                    ),
                    const SizedBox(width: 4),
                    Text(
                      AppLocalization.get('Start in 2 mins'),
                      style: const TextStyle(fontSize: 12, fontWeight: FontWeight.bold, color: AppColors.cooperativeGreen),
                    ),
                  ],
                ),
              ],
              
              const SizedBox(height: 24),
              
              // Footer Brand Motto
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
    }
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
