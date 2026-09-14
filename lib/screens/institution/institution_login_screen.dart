import 'package:flutter/material.dart';
import '../../utils/localization.dart';
import 'institution_otp_screen.dart';
import 'institution_registration_screen.dart';

class InstitutionLoginScreen extends StatefulWidget {
  const InstitutionLoginScreen({super.key});

  @override
  State<InstitutionLoginScreen> createState() => _InstitutionLoginScreenState();
}

class _InstitutionLoginScreenState extends State<InstitutionLoginScreen> {
  final TextEditingController _phoneController = TextEditingController();

  @override
  void dispose() {
    _phoneController.dispose();
    super.dispose();
  }

  void _onQuickFill() {
    setState(() {
      _phoneController.text = '9876543210';
    });
  }

  void _sendOtp() {
    final phone = _phoneController.text.trim();
    if (phone.length == 10) {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => InstitutionOtpScreen(phoneNumber: '+91 $phone'),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final isPhoneValid = _phoneController.text.trim().length == 10;

    return ValueListenableBuilder<String>(
      valueListenable: AppLocalization.currentLang,
      builder: (context, lang, child) {
        return Scaffold(
          backgroundColor: const Color(0xFFF8FAFC),
          body: SafeArea(
            child: SingleChildScrollView(
              padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  // Top Navigation Bar
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      GestureDetector(
                        onTap: () => Navigator.pop(context),
                        child: Row(
                          children: [
                            const Icon(Icons.arrow_back_ios_new, size: 14, color: Color(0xFF123B5D)),
                            const SizedBox(width: 4),
                            Text(
                              AppLocalization.get('Back'),
                              style: const TextStyle(
                                fontSize: 13,
                                fontWeight: FontWeight.w600,
                                color: Color(0xFF123B5D),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 3),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(12),
                          border: Border.all(color: const Color(0xFFE2E8F0)),
                        ),
                        child: const Text(
                          'Institution Portal',
                          style: TextStyle(
                            fontSize: 10,
                            fontWeight: FontWeight.bold,
                            letterSpacing: 0.5,
                            color: Color(0xFF64748B),
                          ),
                        ),
                      ),
                      GestureDetector(
                        onTap: () => AppLocalization.toggleLanguage(),
                        child: Container(
                          padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(14),
                            border: Border.all(color: const Color(0xFFE2E8F0)),
                          ),
                          child: Row(
                            children: [
                              Text(
                                'EN',
                                style: TextStyle(
                                  fontSize: 11,
                                  fontWeight: lang == 'EN' ? FontWeight.bold : FontWeight.normal,
                                  color: lang == 'EN' ? const Color(0xFF123B5D) : const Color(0xFF94A3B8),
                                ),
                              ),
                              const Padding(
                                padding: EdgeInsets.symmetric(horizontal: 3.0),
                                child: Text('|', style: TextStyle(fontSize: 11, color: Color(0xFF94A3B8))),
                              ),
                              Text(
                                'हिन्दी',
                                style: TextStyle(
                                  fontSize: 11,
                                  fontWeight: lang == 'HI' ? FontWeight.bold : FontWeight.normal,
                                  color: lang == 'HI' ? const Color(0xFF123B5D) : const Color(0xFF94A3B8),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 20),

                  // SAHYOG Logo & Role Pill
                  Image.asset(
                    'assets/images/logo.png',
                    height: 52,
                    errorBuilder: (context, error, stackTrace) =>
                        const Text('SAHYOG', style: TextStyle(fontSize: 26, fontWeight: FontWeight.bold, color: Color(0xFF123B5D))),
                  ),
                  const SizedBox(height: 12),

                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 3.5),
                    decoration: BoxDecoration(
                      color: const Color(0xFFEFF6FF),
                      borderRadius: BorderRadius.circular(14),
                      border: Border.all(color: const Color(0xFFBFDBFE)),
                    ),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        const Text('🏛️', style: TextStyle(fontSize: 12)),
                        const SizedBox(width: 5),
                        Text(
                          AppLocalization.get('INSTITUTION / संस्थान'),
                          style: const TextStyle(
                            fontSize: 11,
                            fontWeight: FontWeight.bold,
                            color: Color(0xFF1D4ED8),
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 12),

                  // Welcome Back
                  Text(
                    AppLocalization.get('Welcome Back'),
                    style: const TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF123B5D),
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    AppLocalization.get('Login to access your institution account and workforce requests.'),
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                      fontSize: 12,
                      color: Color(0xFF64748B),
                    ),
                  ),
                  const SizedBox(height: 24),

                  // LOGIN CARD
                  Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(16),
                      border: Border.all(color: const Color(0xFFE2E8F0)),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withValues(alpha: 0.02),
                          blurRadius: 8,
                          offset: const Offset(0, 2),
                        ),
                      ],
                    ),
                    padding: const EdgeInsets.all(16),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              AppLocalization.get('Mobile Number'),
                              style: const TextStyle(
                                fontSize: 11.5,
                                fontWeight: FontWeight.bold,
                                color: Color(0xFF123B5D),
                                letterSpacing: 0.3,
                              ),
                            ),
                            Text(
                              AppLocalization.get('Authorised Rep.'),
                              style: const TextStyle(
                                fontSize: 11,
                                color: Color(0xFF94A3B8),
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 8),

                        // Mobile Input
                        Container(
                          decoration: BoxDecoration(
                            color: const Color(0xFFF8FAFC),
                            borderRadius: BorderRadius.circular(12),
                            border: Border.all(color: const Color(0xFFCBD5E1)),
                          ),
                          child: Row(
                            children: [
                              Container(
                                padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
                                decoration: const BoxDecoration(
                                  border: Border(right: BorderSide(color: Color(0xFFE2E8F0))),
                                ),
                                child: const Row(
                                  children: [
                                    Text('+91', style: TextStyle(fontSize: 13, fontWeight: FontWeight.bold, color: Color(0xFF123B5D))),
                                    SizedBox(width: 4),
                                    Icon(Icons.keyboard_arrow_down, size: 14, color: Color(0xFF94A3B8)),
                                  ],
                                ),
                              ),
                              Expanded(
                                child: TextField(
                                  controller: _phoneController,
                                  keyboardType: TextInputType.phone,
                                  maxLength: 10,
                                  onChanged: (val) => setState(() {}),
                                  decoration: const InputDecoration(
                                    counterText: '',
                                    border: InputBorder.none,
                                    contentPadding: EdgeInsets.symmetric(horizontal: 12),
                                    hintText: 'Enter 10-digit mobile number',
                                    hintStyle: TextStyle(fontSize: 13, color: Color(0xFF94A3B8)),
                                  ),
                                  style: const TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.w600,
                                    color: Color(0xFF0F172A),
                                  ),
                                ),
                              ),
                              if (_phoneController.text.isNotEmpty)
                                IconButton(
                                  icon: const Icon(Icons.close, size: 16, color: Color(0xFF94A3B8)),
                                  onPressed: () {
                                    setState(() {
                                      _phoneController.clear();
                                    });
                                  },
                                ),
                            ],
                          ),
                        ),
                        const SizedBox(height: 8),

                        // Helper Text & Digit Counter
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: [
                                const Icon(Icons.shield_outlined, size: 13, color: Color(0xFF087443)),
                                const SizedBox(width: 4),
                                Text(
                                  AppLocalization.get('We’ll send you a one-time password (OTP).'),
                                  style: const TextStyle(fontSize: 10.5, color: Color(0xFF64748B)),
                                ),
                              ],
                            ),
                            Text(
                              '${_phoneController.text.length}/10',
                              style: TextStyle(
                                fontSize: 11,
                                fontWeight: FontWeight.bold,
                                color: isPhoneValid ? const Color(0xFF087443) : const Color(0xFF94A3B8),
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 12),

                        // Demo Auto-Fill
                        Container(
                          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 8),
                          decoration: BoxDecoration(
                            color: const Color(0xFFEFF6FF),
                            borderRadius: BorderRadius.circular(8),
                            border: Border.all(color: const Color(0xFFDBEAFE)),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              const Text('Demo Auto-Fill:', style: TextStyle(fontSize: 10.5, fontWeight: FontWeight.w600, color: Color(0xFF64748B))),
                              GestureDetector(
                                onTap: _onQuickFill,
                                child: Container(
                                  padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 3),
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(6),
                                    border: Border.all(color: const Color(0xFFBFDBFE)),
                                  ),
                                  child: const Text(
                                    '+91 98765 43210 ⚡',
                                    style: TextStyle(fontSize: 11, fontWeight: FontWeight.bold, color: Color(0xFF1D4ED8)),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(height: 16),

                        // Send OTP Button
                        SizedBox(
                          width: double.infinity,
                          height: 46,
                          child: ElevatedButton(
                            onPressed: isPhoneValid ? _sendOtp : null,
                            style: ElevatedButton.styleFrom(
                              backgroundColor: const Color(0xFF123B5D),
                              disabledBackgroundColor: const Color(0xFFCBD5E1),
                              foregroundColor: Colors.white,
                              disabledForegroundColor: Colors.white,
                              elevation: 0,
                              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  AppLocalization.get('Send OTP'),
                                  style: const TextStyle(fontSize: 13.5, fontWeight: FontWeight.bold),
                                ),
                                const SizedBox(width: 6),
                                const Icon(Icons.arrow_forward, size: 16),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 16),

                  // Institutional Account Access Trust Card
                  Container(
                    padding: const EdgeInsets.all(12),
                    decoration: BoxDecoration(
                      color: const Color(0xFFF0FDF4),
                      borderRadius: BorderRadius.circular(12),
                      border: Border.all(color: const Color(0xFFBBF7D0)),
                    ),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Icon(Icons.verified_user, size: 18, color: Color(0xFF087443)),
                        const SizedBox(width: 10),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                AppLocalization.get('Institutional Account Access'),
                                style: const TextStyle(
                                  fontSize: 12,
                                  fontWeight: FontWeight.bold,
                                  color: Color(0xFF065F46),
                                ),
                              ),
                              const SizedBox(height: 2),
                              Text(
                                AppLocalization.get('Secure authentication for authorized school, hospital, public facility and municipal service coordinators.'),
                                style: const TextStyle(
                                  fontSize: 11,
                                  color: Color(0xFF047857),
                                  height: 1.3,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 20),

                  // Registration Prompt Card
                  Container(
                    padding: const EdgeInsets.all(14),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(14),
                      border: Border.all(color: const Color(0xFFE2E8F0)),
                    ),
                    child: Column(
                      children: [
                        Text(
                          AppLocalization.get('Don’t have an institution account?'),
                          style: const TextStyle(fontSize: 12, color: Color(0xFF64748B)),
                        ),
                        const SizedBox(height: 10),
                        SizedBox(
                          width: double.infinity,
                          height: 42,
                          child: OutlinedButton(
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(builder: (context) => const InstitutionRegistrationScreen()),
                              );
                            },
                            style: OutlinedButton.styleFrom(
                              foregroundColor: const Color(0xFF123B5D),
                              side: const BorderSide(color: Color(0xFF123B5D)),
                              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  AppLocalization.get('Create Institution Account'),
                                  style: const TextStyle(fontSize: 12.5, fontWeight: FontWeight.bold),
                                ),
                                const SizedBox(width: 4),
                                const Icon(Icons.arrow_forward, size: 14),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 24),

                  // Footer Slogan
                  Text(
                    'COOPERATE. EMPOWER. GROW. / साथ मिलकर, समृद्धि की ओर',
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                      fontSize: 9.5,
                      fontWeight: FontWeight.bold,
                      letterSpacing: 0.5,
                      color: Color(0xFF94A3B8),
                    ),
                  ),
                  const SizedBox(height: 16),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
