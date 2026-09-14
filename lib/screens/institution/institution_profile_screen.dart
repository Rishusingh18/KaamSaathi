import 'package:flutter/material.dart';
import '../../utils/localization.dart';
import '../role_selection_screen.dart';

class InstitutionProfileModel {
  final String institutionName;
  final String shortCode;
  final String address;
  final String fullAddress;
  final String institutionId;
  final String institutionType;
  final String coordinator;
  final String phone;
  final String email;
  final bool isVerified;
  final List<String> servicesRequired;

  const InstitutionProfileModel({
    this.institutionName = 'ABC College',
    this.shortCode = 'ABC',
    this.address = 'Sector 14 Dwarka, New Delhi',
    this.fullAddress = 'Sector 14 Dwarka, New Delhi - 110078',
    this.institutionId = 'INST-DEL-2024-9981',
    this.institutionType = 'College / University',
    this.coordinator = 'Dr. Arvind Sharma (Registrar)',
    this.phone = '+91 98765 43210',
    this.email = 'admin@abccollege.edu.in',
    this.isVerified = true,
    this.servicesRequired = const [
      'Painting',
      'Electrical',
      'Campus Maintenance',
      'Plumbing',
      'Scaffolding',
    ],
  });
}

class InstitutionProfileScreen extends StatelessWidget {
  final InstitutionProfileModel profile;

  const InstitutionProfileScreen({
    super.key,
    this.profile = const InstitutionProfileModel(),
  });

  void _onLogout(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Logout Institution'),
        content: const Text('Are you sure you want to log out of your institution portal account?'),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('Cancel', style: TextStyle(color: Color(0xFF64748B))),
          ),
          ElevatedButton(
            onPressed: () {
              Navigator.pop(context);
              Navigator.pushAndRemoveUntil(
                context,
                MaterialPageRoute(builder: (context) => const RoleSelectionScreen()),
                (route) => false,
              );
            },
            style: ElevatedButton.styleFrom(backgroundColor: const Color(0xFFDC2626)),
            child: const Text('Logout', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<String>(
      valueListenable: AppLocalization.currentLang,
      builder: (context, lang, child) {
        return Scaffold(
          backgroundColor: const Color(0xFFF8FAFC),
          body: SafeArea(
            child: SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
              padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 12.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Title Row
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        AppLocalization.get('Institution Profile'),
                        style: const TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Color(0xFF0F172A),
                        ),
                      ),
                      if (profile.isVerified)
                        Container(
                          padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 3.5),
                          decoration: BoxDecoration(
                            color: const Color(0xFFDCFCE7),
                            borderRadius: BorderRadius.circular(10),
                            border: Border.all(color: const Color(0xFF86EFAC)),
                          ),
                          child: const Row(
                            children: [
                              Icon(Icons.verified, size: 12, color: Color(0xFF087443)),
                              SizedBox(width: 4),
                              Text('Verified Institution ✓', style: TextStyle(fontSize: 10.5, fontWeight: FontWeight.bold, color: Color(0xFF087443))),
                            ],
                          ),
                        ),
                    ],
                  ),
                  const SizedBox(height: 16),

                  // Profile Header Card
                  Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(16),
                      border: Border.all(color: const Color(0xFFE2E8F0)),
                    ),
                    padding: const EdgeInsets.all(16),
                    child: Row(
                      children: [
                        Container(
                          width: 56,
                          height: 56,
                          decoration: BoxDecoration(
                            color: const Color(0xFF123B5D),
                            borderRadius: BorderRadius.circular(14),
                          ),
                          child: Center(
                            child: Text(
                              profile.shortCode,
                              style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.white),
                            ),
                          ),
                        ),
                        const SizedBox(width: 14),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                profile.institutionName,
                                style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Color(0xFF0F172A)),
                              ),
                              const SizedBox(height: 2),
                              Text(profile.address, style: const TextStyle(fontSize: 12, color: Color(0xFF64748B))),
                              const SizedBox(height: 4),
                              Text('ID: ${profile.institutionId}', style: const TextStyle(fontSize: 10.5, fontWeight: FontWeight.w600, color: Color(0xFF1D4ED8))),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 14),

                  // Institution Details Card
                  Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(16),
                      border: Border.all(color: const Color(0xFFE2E8F0)),
                    ),
                    padding: const EdgeInsets.all(16),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          AppLocalization.get('Institution Details'),
                          style: const TextStyle(fontSize: 13.5, fontWeight: FontWeight.bold, color: Color(0xFF0F172A)),
                        ),
                        const SizedBox(height: 12),
                        _buildInfoRow('Institution Type', profile.institutionType),
                        const Divider(height: 18),
                        _buildInfoRow('Authorised Coordinator', profile.coordinator),
                        const Divider(height: 18),
                        _buildInfoRow('Registered Phone', profile.phone),
                        const Divider(height: 18),
                        _buildInfoRow('Official Email', profile.email),
                        const Divider(height: 18),
                        _buildInfoRow('Campus Address', profile.fullAddress),
                      ],
                    ),
                  ),
                  const SizedBox(height: 14),

                  // Services We Require
                  Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(16),
                      border: Border.all(color: const Color(0xFFE2E8F0)),
                    ),
                    padding: const EdgeInsets.all(16),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          AppLocalization.get('Services We Require'),
                          style: const TextStyle(fontSize: 13.5, fontWeight: FontWeight.bold, color: Color(0xFF0F172A)),
                        ),
                        const SizedBox(height: 10),
                        Wrap(
                          spacing: 8,
                          runSpacing: 8,
                          children: profile.servicesRequired
                              .map(
                                (service) => Chip(
                                  label: Text(service, style: const TextStyle(fontSize: 11.5)),
                                  backgroundColor: const Color(0xFFEFF6FF),
                                ),
                              )
                              .toList(),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 14),

                  // Institutional Settings
                  Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(16),
                      border: Border.all(color: const Color(0xFFE2E8F0)),
                    ),
                    padding: const EdgeInsets.all(16),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          AppLocalization.get('Institutional Settings'),
                          style: const TextStyle(fontSize: 13.5, fontWeight: FontWeight.bold, color: Color(0xFF0F172A)),
                        ),
                        const SizedBox(height: 12),

                        // Language Toggle
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const Text('Language Preference', style: TextStyle(fontSize: 12.5, color: Color(0xFF334155))),
                            GestureDetector(
                              onTap: () => AppLocalization.toggleLanguage(),
                              child: Container(
                                padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                                decoration: BoxDecoration(
                                  color: const Color(0xFFF1F5F9),
                                  borderRadius: BorderRadius.circular(14),
                                  border: Border.all(color: const Color(0xFFE2E8F0)),
                                ),
                                child: Text(
                                  lang == 'EN' ? 'English (EN)' : 'हिन्दी (HI)',
                                  style: const TextStyle(fontSize: 11, fontWeight: FontWeight.bold, color: Color(0xFF123B5D)),
                                ),
                              ),
                            ),
                          ],
                        ),
                        const Divider(height: 18),
                        _buildSettingRow(Icons.account_balance_wallet_outlined, 'Institutional Escrow & Billing'),
                        const Divider(height: 18),
                        _buildSettingRow(Icons.notifications_outlined, 'Notification Preferences'),
                        const Divider(height: 18),
                        _buildSettingRow(Icons.support_outlined, 'Help & Technical Support'),
                        const Divider(height: 18),
                        _buildSettingRow(Icons.privacy_tip_outlined, 'Privacy & Service Agreement'),
                      ],
                    ),
                  ),
                  const SizedBox(height: 20),

                  // Logout Button
                  SizedBox(
                    width: double.infinity,
                    height: 46,
                    child: OutlinedButton.icon(
                      onPressed: () => _onLogout(context),
                      icon: const Icon(Icons.logout, size: 16, color: Color(0xFFDC2626)),
                      label: Text(
                        AppLocalization.get('Logout Institution'),
                        style: const TextStyle(fontSize: 13, fontWeight: FontWeight.bold, color: Color(0xFFDC2626)),
                      ),
                      style: OutlinedButton.styleFrom(
                        side: const BorderSide(color: Color(0xFFFCA5A5)),
                        backgroundColor: const Color(0xFFFEF2F2),
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                      ),
                    ),
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

  Widget _buildInfoRow(String label, String value) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(label, style: const TextStyle(fontSize: 11.5, color: Color(0xFF64748B))),
        const SizedBox(width: 10),
        Flexible(
          child: Text(
            value,
            textAlign: TextAlign.right,
            style: const TextStyle(fontSize: 12, fontWeight: FontWeight.w600, color: Color(0xFF0F172A)),
          ),
        ),
      ],
    );
  }

  Widget _buildSettingRow(IconData icon, String title) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            Icon(icon, size: 18, color: const Color(0xFF64748B)),
            const SizedBox(width: 10),
            Text(title, style: const TextStyle(fontSize: 12.5, color: Color(0xFF334155))),
          ],
        ),
        const Icon(Icons.chevron_right, size: 18, color: Color(0xFF94A3B8)),
      ],
    );
  }
}
