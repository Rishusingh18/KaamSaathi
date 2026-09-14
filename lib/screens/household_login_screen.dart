import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../theme/colors.dart';
import '../utils/localization.dart';
import 'otp_screen.dart';
import 'household_registration_screen.dart';

class HouseholdLoginScreen extends StatefulWidget {
  const HouseholdLoginScreen({super.key});

  @override
  State<HouseholdLoginScreen> createState() => _HouseholdLoginScreenState();
}

class _HouseholdLoginScreenState extends State<HouseholdLoginScreen> {
  final TextEditingController _mobileController =
      TextEditingController(text: '9876543210');

  @override
  void dispose() {
    _mobileController.dispose();
    super.dispose();
  }

  void _handleSendOTP() {
    if (_mobileController.text.length == 10) {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => OtpScreen(
            mobileNumber: _mobileController.text,
            role: 'Household',
          ),
        ),
      );
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(
              AppLocalization.get('Please enter a valid 10-digit mobile number')),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<String>(
      valueListenable: AppLocalization.currentLang,
      builder: (context, lang, child) {
        final bool isValid = _mobileController.text.length == 10;

        return Scaffold(
          backgroundColor: AppColors.surfaceCanvas,
          body: SafeArea(
            child: Column(
              children: [
                // ── Top Nav ──────────────────────────────────────────
                Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 16.0, vertical: 8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      // Back button — dotted border style
                      GestureDetector(
                        onTap: () => Navigator.pop(context),
                        child: Container(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 12, vertical: 6),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(8),
                            border: Border.all(
                              color: Colors.blue.withOpacity(0.4),
                              width: 1.5,
                              // Dashed border approximated via custom paint below
                            ),
                          ),
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              const Icon(Icons.arrow_back_ios_new,
                                  size: 14, color: AppColors.primaryContainer),
                              const SizedBox(width: 4),
                              Text(
                                AppLocalization.get('Back'),
                                style: const TextStyle(
                                  fontSize: 13,
                                  fontWeight: FontWeight.w600,
                                  color: AppColors.primaryContainer,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),

                      // Language Toggle EN | हिन्दी
                      GestureDetector(
                        onTap: AppLocalization.toggleLanguage,
                        child: Container(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 10, vertical: 5),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            border: Border.all(color: AppColors.borderSubtle),
                            borderRadius: BorderRadius.circular(16),
                          ),
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Text(
                                'EN',
                                style: TextStyle(
                                  fontWeight: lang == 'EN'
                                      ? FontWeight.bold
                                      : FontWeight.normal,
                                  fontSize: 12,
                                  color: lang == 'EN'
                                      ? AppColors.primaryContainer
                                      : Colors.black54,
                                ),
                              ),
                              const Padding(
                                padding: EdgeInsets.symmetric(horizontal: 4.0),
                                child: Text('|',
                                    style: TextStyle(color: Colors.black26)),
                              ),
                              Text(
                                'हिन्दी',
                                style: TextStyle(
                                  fontWeight: lang == 'HI'
                                      ? FontWeight.bold
                                      : FontWeight.normal,
                                  fontSize: 12,
                                  color: lang == 'HI'
                                      ? AppColors.primaryContainer
                                      : Colors.black54,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),

                // ── Scrollable Body ───────────────────────────────────
                Expanded(
                  child: SingleChildScrollView(
                    padding: const EdgeInsets.symmetric(horizontal: 24.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        const SizedBox(height: 8),

                        // Logo
                        Image.asset(
                          'assets/images/logo.png',
                          height: 56,
                          errorBuilder: (context, error, stackTrace) =>
                              const Text('SAHYOG',
                                  style: TextStyle(
                                      fontSize: 28,
                                      fontWeight: FontWeight.bold,
                                      color: AppColors.primaryContainer)),
                        ),

                        const SizedBox(height: 8),

                        // Tricolor accent
                        Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Container(
                                width: 20, height: 3, color: AppColors.saffron),
                            Container(
                                width: 20,
                                height: 3,
                                color: Colors.grey.shade200),
                            Container(
                                width: 20,
                                height: 3,
                                color: AppColors.cooperativeGreen),
                          ],
                        ),

                        const SizedBox(height: 20),

                        // Title
                        Text(
                          AppLocalization.get('Welcome Back'),
                          style: const TextStyle(
                            fontSize: 26,
                            fontWeight: FontWeight.bold,
                            color: AppColors.primaryContainer,
                          ),
                          textAlign: TextAlign.center,
                        ),

                        const SizedBox(height: 6),

                        Text(
                          AppLocalization.get(
                              'Login to request verified household services and manage bookings'),
                          style: const TextStyle(
                            fontSize: 13,
                            color: AppColors.textSecondary,
                            height: 1.4,
                          ),
                          textAlign: TextAlign.center,
                        ),

                        const SizedBox(height: 14),

                        // Role pill
                        Container(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 14, vertical: 5),
                          decoration: BoxDecoration(
                            color: const Color(0xFFFFF7ED),
                            borderRadius: BorderRadius.circular(20),
                            border:
                                Border.all(color: const Color(0xFFFED7AA)),
                          ),
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              const Text('🏠',
                                  style: TextStyle(fontSize: 13)),
                              const SizedBox(width: 6),
                              Text(
                                AppLocalization.get(
                                    'HOUSEHOLD • नागरिक लॉगिन'),
                                style: const TextStyle(
                                  fontSize: 11,
                                  fontWeight: FontWeight.bold,
                                  color: Color(0xFFEA580C),
                                  letterSpacing: 0.4,
                                ),
                              ),
                            ],
                          ),
                        ),

                        const SizedBox(height: 24),

                        // ── Mobile Number Card ─────────────────────────
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
                              // Label row
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    AppLocalization.get(
                                        'Mobile Number / मोबाइल नंबर'),
                                    style: const TextStyle(
                                      fontSize: 12,
                                      fontWeight: FontWeight.w600,
                                      color: AppColors.textPrimary,
                                    ),
                                  ),
                                  Container(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 8, vertical: 3),
                                    decoration: BoxDecoration(
                                      color:
                                          AppColors.cooperativeGreen.withOpacity(0.1),
                                      borderRadius: BorderRadius.circular(6),
                                      border: Border.all(
                                          color: AppColors.cooperativeGreen,
                                          width: 1),
                                    ),
                                    child: Text(
                                      AppLocalization.get('OTP Login'),
                                      style: const TextStyle(
                                        fontSize: 10,
                                        fontWeight: FontWeight.bold,
                                        color: AppColors.cooperativeGreen,
                                      ),
                                    ),
                                  ),
                                ],
                              ),

                              const SizedBox(height: 10),

                              // Input field
                              Container(
                                decoration: BoxDecoration(
                                  color: const Color(0xFFF8FAFC),
                                  borderRadius: BorderRadius.circular(10),
                                  border: Border.all(
                                    color: isValid
                                        ? AppColors.cooperativeGreen
                                        : AppColors.borderSubtle,
                                    width: isValid ? 1.5 : 1,
                                  ),
                                ),
                                child: Row(
                                  children: [
                                    // Flag + dial code
                                    Container(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 12, vertical: 14),
                                      decoration: const BoxDecoration(
                                        border: Border(
                                          right: BorderSide(
                                              color: Color(0xFFE2E8F0)),
                                        ),
                                      ),
                                      child: Row(
                                        children: const [
                                          Text('🇮🇳',
                                              style:
                                                  TextStyle(fontSize: 16)),
                                          SizedBox(width: 4),
                                          Text('+91',
                                              style: TextStyle(
                                                  fontSize: 13,
                                                  fontWeight: FontWeight.bold,
                                                  color: AppColors.textPrimary)),
                                        ],
                                      ),
                                    ),

                                    // Number input
                                    Expanded(
                                      child: TextField(
                                        controller: _mobileController,
                                        keyboardType: TextInputType.phone,
                                        maxLength: 10,
                                        inputFormatters: [
                                          FilteringTextInputFormatter.digitsOnly,
                                        ],
                                        onChanged: (_) => setState(() {}),
                                        decoration: InputDecoration(
                                          counterText: '',
                                          border: InputBorder.none,
                                          contentPadding:
                                              const EdgeInsets.symmetric(
                                                  horizontal: 12),
                                          hintText: '0000000000',
                                          hintStyle: const TextStyle(
                                              color: Color(0xFFCBD5E1)),
                                          suffixIcon: isValid
                                              ? const Icon(Icons.check,
                                                  color: AppColors.cooperativeGreen,
                                                  size: 18)
                                              : null,
                                        ),
                                        style: const TextStyle(
                                          fontSize: 15,
                                          fontWeight: FontWeight.w600,
                                          color: AppColors.textPrimary,
                                          letterSpacing: 1,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),

                              const SizedBox(height: 10),

                              // Info + counter
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Row(
                                    children: [
                                      const Icon(Icons.info_outline,
                                          size: 13,
                                          color: AppColors.textSecondary),
                                      const SizedBox(width: 4),
                                      Text(
                                        AppLocalization.get(
                                            "We'll send a 6-digit OTP code"),
                                        style: const TextStyle(
                                          fontSize: 11,
                                          color: AppColors.textSecondary,
                                        ),
                                      ),
                                    ],
                                  ),
                                  Text(
                                    '${_mobileController.text.length}/10',
                                    style: TextStyle(
                                      fontSize: 11,
                                      fontWeight: FontWeight.w600,
                                      color: isValid
                                          ? AppColors.cooperativeGreen
                                          : AppColors.textSecondary,
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),

                        const SizedBox(height: 16),

                        // ── Send OTP Button (dotted border) ────────────
                        Container(
                          decoration: BoxDecoration(
                            border: Border.all(
                                color: Colors.blue.withOpacity(0.3), width: 2),
                            borderRadius: BorderRadius.circular(14),
                          ),
                          padding: const EdgeInsets.all(3),
                          child: SizedBox(
                            width: double.infinity,
                            child: ElevatedButton(
                              onPressed: _handleSendOTP,
                              style: ElevatedButton.styleFrom(
                                backgroundColor: AppColors.primaryContainer,
                                padding:
                                    const EdgeInsets.symmetric(vertical: 16),
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10)),
                                elevation: 0,
                              ),
                              child: Text(
                                AppLocalization.get('Send OTP →'),
                                style: const TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          ),
                        ),

                        const SizedBox(height: 16),

                        // OR divider
                        Row(
                          children: [
                            const Expanded(
                                child: Divider(color: Color(0xFFE2E8F0))),
                            Padding(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 12.0),
                              child: Text(
                                AppLocalization.get('OR'),
                                style: const TextStyle(
                                    fontSize: 12,
                                    color: AppColors.textSecondary,
                                    fontWeight: FontWeight.w500),
                              ),
                            ),
                            const Expanded(
                                child: Divider(color: Color(0xFFE2E8F0))),
                          ],
                        ),

                        const SizedBox(height: 16),

                        // ── MeriPehchaan / Jan Parichay ───────────────
                        Container(
                          width: double.infinity,
                          padding: const EdgeInsets.all(16),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(12),
                            border: Border.all(color: AppColors.borderSubtle),
                          ),
                          child: Column(
                            children: [
                              Row(
                                children: [
                                  // Gov logo placeholder
                                  Container(
                                    width: 40,
                                    height: 40,
                                    decoration: BoxDecoration(
                                      color: const Color(0xFFF1F5F9),
                                      borderRadius: BorderRadius.circular(8),
                                    ),
                                    child: const Center(
                                      child: Text('🏛️',
                                          style: TextStyle(fontSize: 20)),
                                    ),
                                  ),
                                  const SizedBox(width: 12),
                                  Expanded(
                                    child: Text(
                                      AppLocalization.get(
                                          'Continue with MeriPehchaan / Jan Parichay'),
                                      style: const TextStyle(
                                        fontSize: 14,
                                        fontWeight: FontWeight.w600,
                                        color: AppColors.primaryContainer,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              const SizedBox(height: 8),
                              Text(
                                AppLocalization.get(
                                    'National Single Sign-On (NSSO) for verified citizen services.'),
                                style: const TextStyle(
                                  fontSize: 11.5,
                                  color: AppColors.textSecondary,
                                  height: 1.4,
                                ),
                                textAlign: TextAlign.center,
                              ),
                            ],
                          ),
                        ),

                        const SizedBox(height: 20),

                        // ── Trust badge ───────────────────────────────
                        Container(
                          width: double.infinity,
                          padding: const EdgeInsets.all(14),
                          decoration: BoxDecoration(
                            color: const Color(0xFFF0FDF4),
                            borderRadius: BorderRadius.circular(10),
                            border: Border.all(
                                color: const Color(0xFFBBF7D0)),
                          ),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                margin: const EdgeInsets.only(top: 2),
                                padding: const EdgeInsets.all(3),
                                decoration: const BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: AppColors.cooperativeGreen,
                                ),
                                child: const Icon(Icons.check,
                                    size: 12, color: Colors.white),
                              ),
                              const SizedBox(width: 10),
                              Expanded(
                                child: RichText(
                                  text: TextSpan(
                                    children: [
                                      TextSpan(
                                        text: AppLocalization.get(
                                                'Verified Citizen Services:') +
                                            ' ',
                                        style: const TextStyle(
                                          fontSize: 12,
                                          fontWeight: FontWeight.bold,
                                          color: AppColors.cooperativeGreen,
                                        ),
                                      ),
                                      TextSpan(
                                        text: AppLocalization.get(
                                            'Transparent fixed quotes, direct worker payouts, and verified cooperative accountability.'),
                                        style: const TextStyle(
                                          fontSize: 12,
                                          color: AppColors.cooperativeGreen,
                                          height: 1.4,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),

                        const SizedBox(height: 20),

                        // Don't have account row
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              AppLocalization.get("Don't have an account?"),
                              style: const TextStyle(
                                  fontSize: 13,
                                  color: AppColors.textSecondary),
                            ),
                            const SizedBox(width: 4),
                            GestureDetector(
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) =>
                                        const HouseholdRegistrationScreen(),
                                  ),
                                );
                              },
                              child: Text(
                                AppLocalization.get('Create Account'),
                                style: const TextStyle(
                                  fontSize: 13,
                                  fontWeight: FontWeight.bold,
                                  color: AppColors.cooperativeGreen,
                                ),
                              ),
                            ),
                          ],
                        ),

                        const SizedBox(height: 20),

                        // Footer motto
                        Text(
                          AppLocalization.get(
                              'COOPERATE. EMPOWER. GROW. / साथ मिलकर, समृद्धि की ओर'),
                          style: const TextStyle(
                            fontSize: 10,
                            fontWeight: FontWeight.w600,
                            letterSpacing: 1.2,
                            color: Colors.grey,
                          ),
                          textAlign: TextAlign.center,
                        ),

                        const SizedBox(height: 24),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
