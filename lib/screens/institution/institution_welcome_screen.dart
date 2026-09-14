import 'package:flutter/material.dart';
import '../../utils/localization.dart';
import 'institution_login_screen.dart';
import 'institution_registration_screen.dart';

class InstitutionWelcomeScreen extends StatelessWidget {
  const InstitutionWelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<String>(
      valueListenable: AppLocalization.currentLang,
      builder: (context, lang, child) {
        return Scaffold(
          backgroundColor: const Color(0xFFF8FAFC),
          body: SafeArea(
            child: Column(
              children: [
                // Top Bar
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
                  child: Column(
                    children: [
                      // Tricolor Strip
                      Container(
                        height: 2.5,
                        width: double.infinity,
                        margin: const EdgeInsets.only(bottom: 8),
                        child: Row(
                          children: [
                            Expanded(child: Container(color: const Color(0xFFFF9933))),
                            Expanded(child: Container(color: Colors.white)),
                            Expanded(child: Container(color: const Color(0xFF138808))),
                          ],
                        ),
                      ),
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
                            child: Text(
                              AppLocalization.get('Institutional Gateway'),
                              style: const TextStyle(
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
                    ],
                  ),
                ),

                // Scrollable Content
                Expanded(
                  child: SingleChildScrollView(
                    physics: const BouncingScrollPhysics(),
                    padding: const EdgeInsets.symmetric(horizontal: 20.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        const SizedBox(height: 8),

                        // SAHYOG Official Logo
                        Image.asset(
                          'assets/images/logo.png',
                          height: 52,
                          errorBuilder: (context, error, stackTrace) =>
                              const Text('SAHYOG', style: TextStyle(fontSize: 26, fontWeight: FontWeight.bold, color: Color(0xFF123B5D))),
                        ),
                        const SizedBox(height: 12),

                        // Institutional Portal Badge & Icon
                        Stack(
                          alignment: Alignment.bottomRight,
                          children: [
                            Container(
                              width: 90,
                              height: 90,
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: Colors.white,
                                border: Border.all(color: const Color(0xFFE2E8F0), width: 1.5),
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.black.withValues(alpha: 0.04),
                                    blurRadius: 10,
                                    offset: const Offset(0, 4),
                                  ),
                                ],
                              ),
                              child: const Center(
                                child: Text('🏛️', style: TextStyle(fontSize: 44)),
                              ),
                            ),
                            Container(
                              padding: const EdgeInsets.all(4),
                              decoration: BoxDecoration(
                                color: const Color(0xFF087443),
                                shape: BoxShape.circle,
                                border: Border.all(color: Colors.white, width: 2),
                              ),
                              child: const Icon(Icons.check, size: 12, color: Colors.white),
                            ),
                          ],
                        ),
                        const SizedBox(height: 12),

                        // Institutional Role Pill Badge
                        Container(
                          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
                          decoration: BoxDecoration(
                            color: const Color(0xFFE0F2FE),
                            borderRadius: BorderRadius.circular(16),
                            border: Border.all(color: const Color(0xFFBAE6FD)),
                          ),
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              const Text('🏛️', style: TextStyle(fontSize: 12)),
                              const SizedBox(width: 6),
                              Text(
                                AppLocalization.get('INSTITUTION / संस्थान'),
                                style: const TextStyle(
                                  fontSize: 11,
                                  fontWeight: FontWeight.bold,
                                  color: Color(0xFF0369A1),
                                ),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(height: 10),

                        // Welcome Title
                        Text(
                          AppLocalization.get('Welcome to SAHYOG'),
                          textAlign: TextAlign.center,
                          style: const TextStyle(
                            fontSize: 22,
                            fontWeight: FontWeight.w800,
                            color: Color(0xFF123B5D),
                            letterSpacing: -0.3,
                          ),
                        ),
                        const SizedBox(height: 4),
                        Text(
                          AppLocalization.get('Connect your institution with trusted skilled workforce.'),
                          textAlign: TextAlign.center,
                          style: const TextStyle(
                            fontSize: 13,
                            fontWeight: FontWeight.bold,
                            color: Color(0xFFEA580C),
                          ),
                        ),
                        const SizedBox(height: 6),
                        Text(
                          AppLocalization.get('Request skilled workers or cooperative teams for maintenance, repairs, events and community services.'),
                          textAlign: TextAlign.center,
                          style: const TextStyle(
                            fontSize: 12,
                            color: Color(0xFF64748B),
                            height: 1.35,
                          ),
                        ),
                        const SizedBox(height: 18),

                        // Platform Advantages Card
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
                              Text(
                                AppLocalization.get('Platform Advantages'),
                                style: const TextStyle(
                                  fontSize: 11,
                                  fontWeight: FontWeight.bold,
                                  letterSpacing: 0.5,
                                  color: Color(0xFF94A3B8),
                                ),
                              ),
                              const SizedBox(height: 12),
                              _buildBenefitItem(
                                emoji: '🏢',
                                title: AppLocalization.get('Workforce for Institutions'),
                                desc: AppLocalization.get('Find skilled workers for institutional requirements.'),
                                bgColor: const Color(0xFFEFF6FF),
                                borderColor: const Color(0xFFDBEAFE),
                              ),
                              const SizedBox(height: 10),
                              _buildBenefitItem(
                                emoji: '✓',
                                title: AppLocalization.get('Verified Skills'),
                                desc: AppLocalization.get('Access workers with Skill Passports and verified experience.'),
                                bgColor: const Color(0xFFECFDF5),
                                borderColor: const Color(0xFFA7F3D0),
                              ),
                              const SizedBox(height: 10),
                              _buildBenefitItem(
                                emoji: '🤝',
                                title: AppLocalization.get('Cooperative Workforce'),
                                desc: AppLocalization.get('Request coordinated teams through verified cooperatives.'),
                                bgColor: const Color(0xFFFEF3C7),
                                borderColor: const Color(0xFFFDE68A),
                              ),
                              const SizedBox(height: 10),
                              _buildBenefitItem(
                                emoji: '📋',
                                title: AppLocalization.get('Transparent Service'),
                                desc: AppLocalization.get('Track requests, assignments, payments and work history.'),
                                bgColor: const Color(0xFFE0F2FE),
                                borderColor: const Color(0xFFBAE6FD),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(height: 14),

                        // Trust Banner
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
                              Container(
                                padding: const EdgeInsets.all(4),
                                decoration: const BoxDecoration(
                                  color: Color(0xFF087443),
                                  shape: BoxShape.circle,
                                ),
                                child: const Icon(Icons.shield, size: 14, color: Colors.white),
                              ),
                              const SizedBox(width: 10),
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      AppLocalization.get('Built for reliable institutional and community services.'),
                                      style: const TextStyle(
                                        fontSize: 12,
                                        fontWeight: FontWeight.bold,
                                        color: Color(0xFF0F172A),
                                      ),
                                    ),
                                    const SizedBox(height: 2),
                                    Text(
                                      AppLocalization.get('Connect with skilled workers and cooperative teams through one trusted platform.'),
                                      style: const TextStyle(
                                        fontSize: 11,
                                        color: Color(0xFF334155),
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

                        // Primary Login Button
                        SizedBox(
                          width: double.infinity,
                          height: 48,
                          child: ElevatedButton(
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(builder: (context) => const InstitutionLoginScreen()),
                              );
                            },
                            style: ElevatedButton.styleFrom(
                              backgroundColor: const Color(0xFF123B5D),
                              foregroundColor: Colors.white,
                              elevation: 0,
                              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  AppLocalization.get('Login'),
                                  style: const TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
                                ),
                                const SizedBox(width: 6),
                                const Icon(Icons.arrow_forward, size: 16),
                              ],
                            ),
                          ),
                        ),
                        const SizedBox(height: 10),

                        // Secondary Outline Button (Create Account)
                        SizedBox(
                          width: double.infinity,
                          height: 46,
                          child: OutlinedButton(
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(builder: (context) => const InstitutionRegistrationScreen()),
                              );
                            },
                            style: OutlinedButton.styleFrom(
                              foregroundColor: const Color(0xFF123B5D),
                              side: const BorderSide(color: Color(0xFF123B5D), width: 1.5),
                              backgroundColor: Colors.white,
                              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                const Icon(Icons.add, size: 16),
                                const SizedBox(width: 4),
                                Text(
                                  AppLocalization.get('Create Institution Account'),
                                  style: const TextStyle(fontSize: 13, fontWeight: FontWeight.bold),
                                ),
                              ],
                            ),
                          ),
                        ),
                        const SizedBox(height: 24),

                        // Footer Motto
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
              ],
            ),
          ),
        );
      },
    );
  }

  Widget _buildBenefitItem({
    required String emoji,
    required String title,
    required String desc,
    required Color bgColor,
    required Color borderColor,
  }) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          width: 34,
          height: 34,
          decoration: BoxDecoration(
            color: bgColor,
            borderRadius: BorderRadius.circular(10),
            border: Border.all(color: borderColor),
          ),
          child: Center(
            child: Text(emoji, style: const TextStyle(fontSize: 16)),
          ),
        ),
        const SizedBox(width: 10),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: const TextStyle(
                  fontSize: 13,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF17212B),
                ),
              ),
              const SizedBox(height: 2),
              Text(
                desc,
                style: const TextStyle(
                  fontSize: 11.5,
                  color: Color(0xFF64748B),
                  height: 1.3,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
