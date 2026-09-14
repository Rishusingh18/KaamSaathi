import 'package:flutter/material.dart';
import '../theme/colors.dart';
import '../widgets/custom_buttons.dart';
import '../widgets/action_card.dart';
import 'main_layout.dart';
import '../utils/localization.dart';

class VerificationScreen extends StatefulWidget {
  const VerificationScreen({Key? key}) : super(key: key);

  @override
  State<VerificationScreen> createState() => _VerificationScreenState();
}

class _VerificationScreenState extends State<VerificationScreen> {
  bool _isSubmitted = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.surfaceCanvas,
      appBar: AppBar(
        leading: TextButton.icon(
          onPressed: () {},
          icon: const Icon(Icons.arrow_back_ios_new, size: 16),
          label: Text(AppLocalization.get('Back')),
          style: TextButton.styleFrom(foregroundColor: AppColors.textSecondary),
        ),
        leadingWidth: 80,
        actions: [
          Container(
            margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 16),
            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
            decoration: BoxDecoration(
              color: Colors.grey[100],
              borderRadius: BorderRadius.circular(16),
              border: Border.all(color: Colors.grey[300]!),
            ),
            child: Row(
              children: [
                Text(AppLocalization.get('EN'), style: TextStyle(fontSize: 11, fontWeight: FontWeight.bold, color: AppColors.primaryContainer)),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 4.0),
                  child: Text('|', style: TextStyle(fontSize: 11, color: Colors.grey)),
                ),
                Text(AppLocalization.get('हिन्दी'), style: TextStyle(fontSize: 11, color: Colors.grey)),
              ],
            ),
          )
        ],
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              // Header Image
              Image.asset(
                'assets/images/logo.png',
                height: 56,
                errorBuilder: (context, error, stackTrace) => 
                    const Icon(Icons.verified_user, size: 56, color: AppColors.primaryContainer),
              ),
              const SizedBox(height: 8),
              
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                decoration: BoxDecoration(
                  color: const Color(0xFFE6F4EA),
                  borderRadius: BorderRadius.circular(16),
                  border: Border.all(color: const Color(0xFFBBF7D0)),
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text('🏢', style: TextStyle(fontSize: 12)),
                    SizedBox(width: 6),
                    Text(AppLocalization.get('COOPERATIVE VERIFICATION • संस्था सत्यापन'),
                      style: TextStyle(
                        fontSize: 11,
                        fontWeight: FontWeight.bold,
                        color: AppColors.cooperativeGreen,
                        letterSpacing: 0.5,
                      ),
                    ),
                  ],
                ),
              ),
              
              const SizedBox(height: 12),
              Text(AppLocalization.get('Verify your cooperative'),
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: AppColors.primaryContainer),
              ),
              const SizedBox(height: 4),
              Text(AppLocalization.get('Submit your cooperative details for verification on SAHYOG.'),
                style: TextStyle(fontSize: 12, color: AppColors.textSecondary),
                textAlign: TextAlign.center,
              ),
              
              const SizedBox(height: 24),
              
              if (!_isSubmitted) _buildFormState() else _buildSuccessState(),
              
              const SizedBox(height: 24),
              Text(AppLocalization.get('COOPERATE. EMPOWER. GROW.\nसाथ मिलकर, समृद्धि की ओर'),
                style: TextStyle(fontSize: 10, color: Colors.grey, fontWeight: FontWeight.bold, letterSpacing: 1),
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildFormState() {
    return Column(
      children: [
        ActionCard(
          topBorderColor: AppColors.primaryContainer,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(AppLocalization.get('COOPERATIVE DETAILS'), style: TextStyle(fontSize: 11, fontWeight: FontWeight.bold, color: AppColors.primaryContainer)),
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
                    decoration: BoxDecoration(
                      color: const Color(0xFFECFDF5),
                      border: Border.all(color: const Color(0xFFD1FAE5)),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Text(AppLocalization.get('Pre-filled'), style: TextStyle(fontSize: 10, fontWeight: FontWeight.bold, color: Colors.green)),
                  )
                ],
              ),
              const Divider(height: 24),
              
              _buildDetailItem('Cooperative Name', 'Nirman Shramik Cooperative'),
              const SizedBox(height: 12),
              
              Text(AppLocalization.get('Registration Number'), style: TextStyle(fontSize: 10.5, color: AppColors.textSecondary)),
              const SizedBox(height: 4),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
                decoration: BoxDecoration(
                  color: Colors.grey[100],
                  border: Border.all(color: Colors.grey[300]!),
                  borderRadius: BorderRadius.circular(4),
                ),
                child: const Text('COOP-DL-2026-0142', style: TextStyle(fontSize: 11.5, fontWeight: FontWeight.bold, fontFamily: 'monospace', color: AppColors.primaryContainer)),
              ),
              
              const SizedBox(height: 12),
              Text(AppLocalization.get('Registered Location'), style: TextStyle(fontSize: 10.5, color: AppColors.textSecondary)),
              const SizedBox(height: 4),
              Row(
                children: [
                  Icon(Icons.location_on_outlined, size: 14, color: Colors.red),
                  SizedBox(width: 4),
                  Text(AppLocalization.get('Dwarka, New Delhi'), style: TextStyle(fontSize: 12.5, fontWeight: FontWeight.bold)),
                ],
              ),
              
              const SizedBox(height: 12),
              _buildDetailItem('Service Areas', 'Dwarka • Najafgarh • West Delhi'),
              
              const SizedBox(height: 12),
              Text(AppLocalization.get('Primary Services'), style: TextStyle(fontSize: 10.5, color: AppColors.textSecondary)),
              const SizedBox(height: 4),
              Wrap(
                spacing: 6,
                runSpacing: 6,
                children: [
                  _buildServiceChip('Construction'),
                  _buildServiceChip('Painting'),
                  _buildServiceChip('Electrical'),
                  _buildServiceChip('Plumbing'),
                ],
              )
            ],
          ),
        ),
        
        const SizedBox(height: 16),
        
        ActionCard(
          topBorderColor: AppColors.cooperativeGreen,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(AppLocalization.get('COOPERATIVE REGISTRATION DOCUMENT'), style: TextStyle(fontSize: 11, fontWeight: FontWeight.bold, color: AppColors.primaryContainer)),
              const SizedBox(height: 12),
              Container(
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                  color: AppColors.surfaceCanvas,
                  border: Border.all(color: AppColors.borderSubtle, style: BorderStyle.solid),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Row(
                  children: [
                    Container(
                      width: 36, height: 36,
                      decoration: BoxDecoration(
                        color: Colors.red[50],
                        borderRadius: BorderRadius.circular(8),
                        border: Border.all(color: Colors.red[100]!),
                      ),
                      alignment: Alignment.center,
                      child: Text(AppLocalization.get('PDF'), style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold, color: Colors.red)),
                    ),
                    const SizedBox(width: 12),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text('Cooperative_Registration.pdf', style: TextStyle(fontSize: 11.5, fontWeight: FontWeight.bold)),
                          Row(
                            children: [
                              Text('2.4 MB', style: TextStyle(fontSize: 10, color: Colors.grey)),
                              Text(' • ', style: TextStyle(fontSize: 10, color: Colors.grey)),
                              Icon(Icons.check, size: 12, color: Colors.green),
                              Text(' Document attached', style: TextStyle(fontSize: 10, color: Colors.green, fontWeight: FontWeight.bold)),
                            ],
                          )
                        ],
                      ),
                    ),
                    OutlinedButton(
                      onPressed: () {},
                      style: OutlinedButton.styleFrom(
                        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 0),
                        minimumSize: const Size(0, 32),
                      ),
                      child: Text(AppLocalization.get('Replace'), style: TextStyle(fontSize: 11)),
                    )
                  ],
                ),
              )
            ],
          ),
        ),
        
        const SizedBox(height: 16),
        
        Container(
          padding: const EdgeInsets.all(12),
          decoration: BoxDecoration(
            color: const Color(0xFFF0FDF4),
            border: Border.all(color: const Color(0xFFBBF7D0)),
            borderRadius: BorderRadius.circular(12),
          ),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                padding: const EdgeInsets.all(4),
                decoration: const BoxDecoration(shape: BoxShape.circle, color: AppColors.cooperativeGreen),
                child: const Icon(Icons.shield, size: 12, color: Colors.white),
              ),
              const SizedBox(width: 8),
              Expanded(
                child: Text(AppLocalization.get('Your cooperative details and registration document will be reviewed before your cooperative is verified.'),
                  style: const TextStyle(fontSize: 11, color: Colors.green, fontWeight: FontWeight.w500),
                ),
              ),
            ],
          ),
        ),
        
        const SizedBox(height: 24),
        
        CooperativeButton(
          text: 'Submit for Verification',
          onPressed: () {
            setState(() {
              _isSubmitted = true;
            });
          },
        ),
        TextButton(
          onPressed: () {},
          child: Text(AppLocalization.get('Skip for Now'), style: TextStyle(fontSize: 12)),
        )
      ],
    );
  }

  Widget _buildSuccessState() {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(color: const Color(0xFFBBF7D0)),
        borderRadius: BorderRadius.circular(16),
        boxShadow: [BoxShadow(color: Colors.black.withOpacity(0.05), blurRadius: 4, offset: const Offset(0, 2))],
      ),
      child: Column(
        children: [
          Container(
            width: 64, height: 64,
            decoration: BoxDecoration(
              color: const Color(0xFFE6F4EA),
              shape: BoxShape.circle,
              border: Border.all(color: const Color(0xFF6EE7B7)),
            ),
            alignment: Alignment.center,
            child: const Icon(Icons.check, size: 32, color: AppColors.cooperativeGreen),
          ),
          const SizedBox(height: 16),
          Text(AppLocalization.get('Verification submitted ✓'), style: TextStyle(fontSize: 19, fontWeight: FontWeight.bold, color: AppColors.cooperativeGreen)),
          const SizedBox(height: 4),
          Text(AppLocalization.get('Your cooperative details are under review.'), style: TextStyle(fontSize: 13, fontWeight: FontWeight.bold)),
          const SizedBox(height: 6),
          Text(AppLocalization.get('You can continue to your dashboard while verification is in progress.'),
            style: TextStyle(fontSize: 11.5, color: Colors.grey),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 16),
          Container(
            width: double.infinity,
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: Colors.grey[50],
              border: Border.all(color: Colors.grey[200]!),
              borderRadius: BorderRadius.circular(12),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Icon(Icons.circle, size: 8, color: Colors.orange),
                    SizedBox(width: 4),
                    Text(AppLocalization.get('STATUS'), style: TextStyle(fontSize: 10, fontWeight: FontWeight.bold, color: Colors.grey, letterSpacing: 1)),
                  ],
                ),
                const SizedBox(height: 8),
                const Text('Application Reference: #VER-DL-2026-0142', style: TextStyle(fontSize: 11, fontWeight: FontWeight.bold)),
                const SizedBox(height: 2),
                Text(AppLocalization.get('Pending Administrative Review'), style: TextStyle(fontSize: 10.5, fontWeight: FontWeight.bold, color: Colors.orange)),
              ],
            ),
          ),
          const SizedBox(height: 24),
          PrimaryButton(
            text: 'Go to Dashboard →',
            onPressed: () {
              Navigator.pushAndRemoveUntil(
                context,
                MaterialPageRoute(builder: (context) => const MainLayout()),
                (route) => false,
              );
            },
          )
        ],
      ),
    );
  }

  Widget _buildDetailItem(String label, String value) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(label, style: const TextStyle(fontSize: 10.5, color: AppColors.textSecondary)),
        const SizedBox(height: 2),
        Text(value, style: const TextStyle(fontSize: 14, fontWeight: FontWeight.bold)),
      ],
    );
  }

  Widget _buildServiceChip(String text) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      decoration: BoxDecoration(
        color: Colors.grey[100],
        border: Border.all(color: Colors.grey[200]!),
        borderRadius: BorderRadius.circular(6),
      ),
      child: Text(text, style: const TextStyle(fontSize: 10.5, fontWeight: FontWeight.bold, color: AppColors.textPrimary)),
    );
  }
}
