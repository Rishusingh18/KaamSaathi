import 'package:flutter/material.dart';
import '../theme/colors.dart';
import '../widgets/custom_buttons.dart';
import '../widgets/action_card.dart';
import 'login_options_screen.dart';
import 'register_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
                        onPressed: () {}, // Navigate back
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
              Image.network(
                'https://lh3.googleusercontent.com/aida-public/AB6AXuDIjwWBv2hHnWGgrPlZfTi1xlnKzgZqwory7H4dc-QxNiDBsM-DopItaUtFEtcK9I3dHxAsDvvWLINE9O6HaQRcew1uKiU0VdB_oP4AoGEeziFO9sIzJP_beAYG923r9x9hLwuPXneY7JnxGxq2feP24tkgsNTZPQQvy2jJ0zs5UmXI0hsKBfHZV4P2qx5Ohod5C372xVlKBXug7cfzyZfjRLFjp4p7juLlGWREtWxfsJkLWOA4bdBMprrluk6sxM3fyA',
                height: 56,
                errorBuilder: (context, error, stackTrace) => 
                    const Text('SAHYOG', style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold, color: AppColors.primaryContainer)),
              ),
              
              const SizedBox(height: 16),
              
              // Hero Cooperative Illustration & Role Badge
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
                  child: Image.network(
                    'https://lh3.googleusercontent.com/aida-public/AB6AXuCsJvnS-AET6WhEJeBy3_9kqmpFgDlVa0LxbFAC-JlzzCqvpXRn5aQoA0sLeJHEFqYB74KSE5374cmpPdxflW1KUn_b0Se6CCJlw7eQ6NT8W-452gnlyVPU97nTs2ZiMhL6Jl5_0WZeEi8Ohxbj8JEKUqbJkDz3jQpv269y-FdstcnXCbUsjo2lOhSwsd61D4HDa-o9FEZ0Oaopn1a3rGRLnEy68IlOq9qWedj98a4y1aRgbLGp6nNT',
                    fit: BoxFit.cover,
                    errorBuilder: (context, error, stackTrace) => const Icon(Icons.business, size: 64, color: AppColors.cooperativeGreen),
                  ),
                ),
              ),
              
              const SizedBox(height: 12),
              
              // Role pill tag
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
                decoration: BoxDecoration(
                  color: const Color(0xFFECFDF5),
                  borderRadius: BorderRadius.circular(16),
                  border: Border.all(color: const Color(0xFFD1FAE5)),
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: const [
                    Text('🏢', style: TextStyle(fontSize: 12)),
                    SizedBox(width: 6),
                    Text(
                      'COOPERATIVE / सहकारी संस्था',
                      style: TextStyle(
                        fontSize: 11,
                        fontWeight: FontWeight.bold,
                        color: AppColors.primaryContainer,
                        letterSpacing: 0.5,
                      ),
                    ),
                  ],
                ),
              ),
              
              const SizedBox(height: 16),
              
              // Title & Subheadings
              const Text(
                'Welcome to SAHYOG',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: AppColors.primaryContainer,
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 4),
              const Text(
                'Connect your cooperative with more work opportunities.',
                style: TextStyle(
                  fontSize: 14.5,
                  fontWeight: FontWeight.w500,
                  color: AppColors.saffron,
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 8),
              const Text(
                'Manage your workforce, receive service requests, assign workers, discover new opportunities, and track earnings — all in one place.',
                style: TextStyle(
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
                        const Text(
                          'With SAHYOG, your cooperative can',
                          style: TextStyle(
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
                    _buildFeatureItem('Manage your workers and their availability'),
                    _buildFeatureItem('Receive household and institution service requests'),
                    _buildFeatureItem('Match the right workers to each job'),
                    _buildFeatureItem('Discover opportunities through Cooperative Exchange'),
                    _buildFeatureItem('Track projects, payments and workforce performance'),
                  ],
                ),
              ),
              
              const SizedBox(height: 16),
              
              // Trust Note
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: const [
                  Icon(Icons.shield, size: 16, color: AppColors.cooperativeGreen),
                  SizedBox(width: 8),
                  Text(
                    'Empower workers. Build opportunities. Grow together.',
                    style: TextStyle(
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
                text: 'Login →',
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const LoginOptionsScreen()),
                  );
                },
              ),
              const SizedBox(height: 12),
              SecondaryButton(
                text: '+ Create Cooperative Account',
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const RegisterScreen()),
                  );
                },
              ),
              
              const SizedBox(height: 24),
              
              // Footer Brand Motto
              const Text(
                'COOPERATE. EMPOWER. GROW. / साथ मिलकर, समृद्धि की ओर',
                style: TextStyle(
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
