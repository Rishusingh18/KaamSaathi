import 'package:flutter/material.dart';
import '../theme/colors.dart';
import '../utils/localization.dart';
import 'role_selection_screen.dart';
import 'worker_welfare_screen.dart';

class WorkerProfileScreen extends StatelessWidget {
  final VoidCallback? onBack;

  const WorkerProfileScreen({super.key, this.onBack});

  void _showLogoutDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (ctx) => AlertDialog(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
        title: Row(
          children: [
            const Icon(Icons.logout, color: Colors.red, size: 22),
            const SizedBox(width: 8),
            Text(
              AppLocalization.get('Log Out'),
              style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Color(0xFF0F172A)),
            ),
          ],
        ),
        content: Text(
          AppLocalization.get('Are you sure you want to log out?'),
          style: const TextStyle(fontSize: 14, color: Color(0xFF475569)),
        ),
        actionsPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(ctx),
            child: Text(
              AppLocalization.get('Cancel'),
              style: const TextStyle(color: Color(0xFF64748B), fontWeight: FontWeight.w600),
            ),
          ),
          ElevatedButton(
            onPressed: () {
              Navigator.pop(ctx);
              Navigator.pushAndRemoveUntil(
                context,
                MaterialPageRoute(builder: (context) => const RoleSelectionScreen()),
                (route) => false,
              );
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: const Color(0xFFDC2626),
              foregroundColor: Colors.white,
              elevation: 0,
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
            ),
            child: Text(
              AppLocalization.get('Log Out'),
              style: const TextStyle(fontWeight: FontWeight.bold),
            ),
          ),
        ],
      ),
    );
  }

  void _showIdCardModal(BuildContext context) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (context) => Container(
        padding: const EdgeInsets.all(24),
        decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.vertical(top: Radius.circular(24)),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              width: 40,
              height: 4,
              decoration: BoxDecoration(
                color: Colors.grey.shade300,
                borderRadius: BorderRadius.circular(2),
              ),
            ),
            const SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      AppLocalization.get('Worker Profile and ID'),
                      style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: AppColors.textPrimary),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      AppLocalization.get('Cooperative Digital Membership ID Card'),
                      style: const TextStyle(fontSize: 12, color: AppColors.textSecondary),
                    ),
                  ],
                ),
                GestureDetector(
                  onTap: () => Navigator.pop(context),
                  child: Container(
                    padding: const EdgeInsets.all(8),
                    decoration: BoxDecoration(
                      color: Colors.grey.shade100,
                      shape: BoxShape.circle,
                    ),
                    child: const Icon(Icons.close, size: 16, color: AppColors.textSecondary),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 20),
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(16),
                border: Border.all(color: AppColors.borderSubtle),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withValues(alpha: 0.03),
                    blurRadius: 8,
                    offset: const Offset(0, 2),
                  ),
                ],
              ),
              child: Column(
                children: [
                  Container(
                    width: 64,
                    height: 64,
                    decoration: BoxDecoration(
                      color: Colors.blue.shade50,
                      shape: BoxShape.circle,
                      border: Border.all(color: Colors.blue.shade100, width: 2),
                    ),
                    alignment: Alignment.center,
                    child: Text('RK', style: TextStyle(color: Colors.blue.shade900, fontSize: 22, fontWeight: FontWeight.bold)),
                  ),
                  const SizedBox(height: 12),
                  Text(AppLocalization.get('Ramlal Kumar'), style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: AppColors.textPrimary)),
                  const SizedBox(height: 4),
                  Text('${AppLocalization.get("Member ID:")} COOP-DEL-40912', style: const TextStyle(fontSize: 12, color: AppColors.textSecondary)),
                  const SizedBox(height: 10),
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
                    decoration: BoxDecoration(
                      color: const Color(0xFFE6F4EA),
                      borderRadius: BorderRadius.circular(16),
                    ),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        const Icon(Icons.check, size: 14, color: AppColors.cooperativeGreen),
                        const SizedBox(width: 4),
                        Text(AppLocalization.get('Cooperative verified worker'), style: const TextStyle(fontSize: 11, fontWeight: FontWeight.bold, color: AppColors.cooperativeGreen)),
                      ],
                    ),
                  ),
                  const SizedBox(height: 16),
                  const Divider(color: AppColors.borderSubtle),
                  const SizedBox(height: 12),
                  _buildIdRow(AppLocalization.get('Mobile:'), '+91 98765 43210'),
                  const SizedBox(height: 8),
                  _buildIdRow(AppLocalization.get('Guild Branch:'), AppLocalization.get('West Delhi Guild #104')),
                  const SizedBox(height: 8),
                  _buildIdRow('e-Shram UAN:', '1234 5678 9012'),
                ],
              ),
            ),
            const SizedBox(height: 20),
            Row(
              children: [
                Expanded(
                  child: OutlinedButton.icon(
                    onPressed: () {
                      Navigator.pop(context);
                      _showLogoutDialog(context);
                    },
                    icon: const Icon(Icons.logout, size: 16, color: Colors.red),
                    label: Text(
                      AppLocalization.get('Log Out'),
                      style: const TextStyle(fontSize: 14, fontWeight: FontWeight.bold, color: Colors.red),
                    ),
                    style: OutlinedButton.styleFrom(
                      padding: const EdgeInsets.symmetric(vertical: 14),
                      side: BorderSide(color: Colors.red.shade200),
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                    ),
                  ),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: ElevatedButton(
                    onPressed: () => Navigator.pop(context),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: AppColors.primaryContainer,
                      padding: const EdgeInsets.symmetric(vertical: 14),
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                    ),
                    child: Text(AppLocalization.get('Close'), style: const TextStyle(fontSize: 14, fontWeight: FontWeight.bold, color: Colors.white)),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 12),
          ],
        ),
      ),
    );
  }

  static Widget _buildIdRow(String label, String value) {
    return Row(
      children: [
        Text(label, style: const TextStyle(fontSize: 13, fontWeight: FontWeight.bold, color: AppColors.textPrimary)),
        const SizedBox(width: 6),
        Expanded(child: Text(value, style: const TextStyle(fontSize: 13, color: AppColors.textSecondary))),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<String>(
      valueListenable: AppLocalization.currentLang,
      builder: (context, lang, child) {
        return Scaffold(
          backgroundColor: const Color(0xFFF8FAFC),
          appBar: AppBar(
            backgroundColor: Colors.white,
            elevation: 0,
            leading: IconButton(
              icon: const Icon(Icons.arrow_back_ios_new, size: 18, color: AppColors.primaryContainer),
              onPressed: onBack ?? () {
                if (Navigator.canPop(context)) Navigator.pop(context);
              },
            ),
            title: Text(
              AppLocalization.get('Worker Profile'),
              style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Color(0xFF0F172A)),
            ),
            actions: [
              GestureDetector(
                onTap: AppLocalization.toggleLanguage,
                child: Container(
                  margin: const EdgeInsets.only(right: 16, top: 12, bottom: 12),
                  padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                  decoration: BoxDecoration(
                    color: Colors.grey[100],
                    borderRadius: BorderRadius.circular(16),
                    border: Border.all(color: Colors.grey[300]!),
                  ),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        'EN',
                        style: TextStyle(
                          fontSize: 11,
                          fontWeight: lang == 'EN' ? FontWeight.bold : FontWeight.normal,
                          color: lang == 'EN' ? AppColors.primaryContainer : Colors.grey,
                        ),
                      ),
                      const Padding(
                        padding: EdgeInsets.symmetric(horizontal: 4.0),
                        child: Text('|', style: TextStyle(fontSize: 11, color: Colors.grey)),
                      ),
                      Text(
                        'हिन्दी',
                        style: TextStyle(
                          fontSize: 11,
                          fontWeight: lang == 'HI' ? FontWeight.bold : FontWeight.normal,
                          color: lang == 'HI' ? AppColors.primaryContainer : Colors.grey,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
          body: SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Profile Header Card
                Container(
                  width: double.infinity,
                  padding: const EdgeInsets.all(20),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(16),
                    border: Border.all(color: const Color(0xFFE2E8F0)),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withValues(alpha: 0.03),
                        blurRadius: 10,
                        offset: const Offset(0, 3),
                      ),
                    ],
                  ),
                  child: Column(
                    children: [
                      Row(
                        children: [
                          Stack(
                            children: [
                              Container(
                                width: 68,
                                height: 68,
                                decoration: BoxDecoration(
                                  color: const Color(0xFFEFF6FF),
                                  shape: BoxShape.circle,
                                  border: Border.all(color: const Color(0xFFBFDBFE), width: 2),
                                ),
                                alignment: Alignment.center,
                                child: const Text(
                                  'RK',
                                  style: TextStyle(color: Color(0xFF1D4ED8), fontSize: 24, fontWeight: FontWeight.bold),
                                ),
                              ),
                              Positioned(
                                right: 0,
                                bottom: 0,
                                child: Container(
                                  padding: const EdgeInsets.all(4),
                                  decoration: BoxDecoration(
                                    color: const Color(0xFF087443),
                                    shape: BoxShape.circle,
                                    border: Border.all(color: Colors.white, width: 2),
                                  ),
                                  child: const Icon(Icons.check, size: 12, color: Colors.white),
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(width: 16),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  AppLocalization.get('Ramlal Kumar'),
                                  style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Color(0xFF0F172A)),
                                ),
                                const SizedBox(height: 2),
                                Text(
                                  '${AppLocalization.get("Member ID:")} COOP-DEL-40912',
                                  style: const TextStyle(fontSize: 12, color: Color(0xFF64748B)),
                                ),
                                const SizedBox(height: 6),
                                Container(
                                  padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 3),
                                  decoration: BoxDecoration(
                                    color: const Color(0xFFECFDF5),
                                    borderRadius: BorderRadius.circular(12),
                                    border: Border.all(color: const Color(0xFFA7F3D0)),
                                  ),
                                  child: Text(
                                    AppLocalization.get('Cooperative verified worker'),
                                    style: const TextStyle(fontSize: 10.5, fontWeight: FontWeight.bold, color: Color(0xFF065F46)),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 16),
                      const Divider(color: Color(0xFFE2E8F0)),
                      const SizedBox(height: 12),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          _buildStatItem('4.9 ★', AppLocalization.get('Rating')),
                          Container(width: 1, height: 28, color: const Color(0xFFE2E8F0)),
                          _buildStatItem('42', AppLocalization.get('Workdays')),
                          Container(width: 1, height: 28, color: const Color(0xFFE2E8F0)),
                          _buildStatItem('₹31.5K', AppLocalization.get('Earnings')),
                        ],
                      ),
                    ],
                  ),
                ),

                const SizedBox(height: 16),

                // Digital Membership Card Trigger
                InkWell(
                  onTap: () => _showIdCardModal(context),
                  borderRadius: BorderRadius.circular(12),
                  child: Container(
                    padding: const EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(12),
                      border: Border.all(color: const Color(0xFFE2E8F0)),
                    ),
                    child: Row(
                      children: [
                        Container(
                          padding: const EdgeInsets.all(10),
                          decoration: BoxDecoration(
                            color: const Color(0xFFEFF6FF),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: const Icon(Icons.badge_outlined, color: Color(0xFF1D4ED8), size: 20),
                        ),
                        const SizedBox(width: 12),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                AppLocalization.get('View Digital Membership Card'),
                                style: const TextStyle(fontSize: 13, fontWeight: FontWeight.bold, color: Color(0xFF0F172A)),
                              ),
                              const SizedBox(height: 2),
                              Text(
                                AppLocalization.get('Official cooperative guild identity & QR code'),
                                style: const TextStyle(fontSize: 11, color: Color(0xFF64748B)),
                              ),
                            ],
                          ),
                        ),
                        const Icon(Icons.chevron_right, color: Color(0xFF94A3B8), size: 20),
                      ],
                    ),
                  ),
                ),

                const SizedBox(height: 20),

                // Details Section
                Text(
                  AppLocalization.get('Membership & Compliance Details'),
                  style: const TextStyle(fontSize: 13, fontWeight: FontWeight.bold, color: Color(0xFF475569)),
                ),
                const SizedBox(height: 8),

                Container(
                  padding: const EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(12),
                    border: Border.all(color: const Color(0xFFE2E8F0)),
                  ),
                  child: Column(
                    children: [
                      _buildDetailRow(Icons.phone_android, AppLocalization.get('Registered Mobile'), '+91 98765 43210', isVerified: true),
                      const Divider(height: 20, color: Color(0xFFF1F5F9)),
                      _buildDetailRow(Icons.groups, AppLocalization.get('Cooperative Society'), AppLocalization.get('West Delhi Guild #104')),
                      const Divider(height: 20, color: Color(0xFFF1F5F9)),
                      _buildDetailRow(Icons.verified_user_outlined, 'e-Shram UAN', '1234 5678 9012', isVerified: true),
                      const Divider(height: 20, color: Color(0xFFF1F5F9)),
                      _buildDetailRow(Icons.account_balance, AppLocalization.get('Wage Escrow Settlement'), 'SBI • Linked with Aadhaar', isVerified: true),
                    ],
                  ),
                ),

                const SizedBox(height: 20),

                // Settings & Assistance Section
                Text(
                  AppLocalization.get('Preferences & Support'),
                  style: const TextStyle(fontSize: 13, fontWeight: FontWeight.bold, color: Color(0xFF475569)),
                ),
                const SizedBox(height: 8),

                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(12),
                    border: Border.all(color: const Color(0xFFE2E8F0)),
                  ),
                  child: Column(
                    children: [
                      _buildSettingRow(
                        Icons.health_and_safety_outlined,
                        AppLocalization.get('Worker Welfare & Insurance'),
                        AppLocalization.get('View PMJJBY, PMSBY & cooperative benefits'),
                        onTap: () {
                          Navigator.push(context, MaterialPageRoute(builder: (context) => const WorkerWelfareScreen()));
                        },
                      ),
                      const Divider(height: 12, color: Color(0xFFF1F5F9)),
                      _buildSettingRow(
                        Icons.translate,
                        AppLocalization.get('Language Preference'),
                        lang == 'HI' ? 'हिन्दी (Tap to switch to English)' : 'English (Tap to switch to हिन्दी)',
                        onTap: AppLocalization.toggleLanguage,
                      ),
                      const Divider(height: 12, color: Color(0xFFF1F5F9)),
                      _buildSettingRow(
                        Icons.support_agent,
                        AppLocalization.get('Cooperative Support Helpline'),
                        'Toll-free: 1800-SAHYOG-01',
                        onTap: () {
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                              content: Text('Helpline: 1800-SAHYOG-01 (Mon-Sat 9AM-6PM)'),
                              backgroundColor: Color(0xFF123B5D),
                            ),
                          );
                        },
                      ),
                    ],
                  ),
                ),

                const SizedBox(height: 28),

                // Prominent Log Out Button
                SizedBox(
                  width: double.infinity,
                  child: OutlinedButton.icon(
                    onPressed: () => _showLogoutDialog(context),
                    icon: const Icon(Icons.logout, color: Color(0xFFDC2626), size: 18),
                    label: Text(
                      AppLocalization.get('Log Out'),
                      style: const TextStyle(color: Color(0xFFDC2626), fontWeight: FontWeight.bold, fontSize: 14),
                    ),
                    style: OutlinedButton.styleFrom(
                      backgroundColor: Colors.white,
                      padding: const EdgeInsets.symmetric(vertical: 14),
                      side: const BorderSide(color: Color(0xFFFCA5A5)),
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                    ),
                  ),
                ),

                const SizedBox(height: 16),

                Center(
                  child: Text(
                    'SAHYOG DPI • Version 1.0.0',
                    style: TextStyle(fontSize: 11, color: Colors.grey.shade400, fontWeight: FontWeight.w500),
                  ),
                ),

                const SizedBox(height: 24),
              ],
            ),
          ),
        );
      },
    );
  }

  Widget _buildStatItem(String value, String label) {
    return Column(
      children: [
        Text(value, style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Color(0xFF0F172A))),
        const SizedBox(height: 2),
        Text(label, style: const TextStyle(fontSize: 11, color: Color(0xFF64748B))),
      ],
    );
  }

  Widget _buildDetailRow(IconData icon, String title, String value, {bool isVerified = false}) {
    return Row(
      children: [
        Icon(icon, size: 18, color: const Color(0xFF64748B)),
        const SizedBox(width: 12),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(title, style: const TextStyle(fontSize: 11, color: Color(0xFF64748B))),
              const SizedBox(height: 2),
              Text(value, style: const TextStyle(fontSize: 13, fontWeight: FontWeight.w600, color: Color(0xFF0F172A))),
            ],
          ),
        ),
        if (isVerified)
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
            decoration: BoxDecoration(
              color: const Color(0xFFF0FDF4),
              borderRadius: BorderRadius.circular(6),
            ),
            child: const Row(
              children: [
                Icon(Icons.check_circle, size: 12, color: Color(0xFF16A34A)),
                SizedBox(width: 3),
                Text('Verified', style: TextStyle(fontSize: 10, color: Color(0xFF16A34A), fontWeight: FontWeight.bold)),
              ],
            ),
          ),
      ],
    );
  }

  Widget _buildSettingRow(IconData icon, String title, String subtitle, {required VoidCallback onTap}) {
    return InkWell(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 8.0),
        child: Row(
          children: [
            Icon(icon, size: 20, color: const Color(0xFF123B5D)),
            const SizedBox(width: 12),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(title, style: const TextStyle(fontSize: 13, fontWeight: FontWeight.bold, color: Color(0xFF0F172A))),
                  const SizedBox(height: 2),
                  Text(subtitle, style: const TextStyle(fontSize: 11, color: Color(0xFF64748B))),
                ],
              ),
            ),
            const Icon(Icons.chevron_right, size: 18, color: Color(0xFF94A3B8)),
          ],
        ),
      ),
    );
  }
}
