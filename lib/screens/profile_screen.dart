import 'package:flutter/material.dart';
import 'package:dotted_border/dotted_border.dart';
import '../theme/colors.dart';
import '../utils/localization.dart';
import 'reports_screen.dart';
import 'worker_welfare_screen.dart';
import 'role_selection_screen.dart';

class ProfileScreen extends StatelessWidget {
  final VoidCallback? onBack;

  const ProfileScreen({super.key, this.onBack});

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<String>(
      valueListenable: AppLocalization.currentLang,
      builder: (context, lang, child) {
        return Scaffold(
          backgroundColor: AppColors.surfaceCanvas,
          appBar: AppBar(
            backgroundColor: AppColors.surfaceCanvas,
            elevation: 0,
            automaticallyImplyLeading: false,
            titleSpacing: 16,
            title: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                InkWell(
                  onTap: () {
                    if (onBack != null) {
                      onBack!();
                    } else if (Navigator.canPop(context)) {
                      Navigator.pop(context);
                    }
                  },
                  borderRadius: BorderRadius.circular(8),
                  child: DottedBorder(
                    options: RoundedRectDottedBorderOptions(
                      color: AppColors.primaryContainer,
                      strokeWidth: 1.2,
                      dashPattern: const [4, 4],
                      radius: const Radius.circular(8),
                    ),
                    child: Container(
                      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          const Icon(Icons.chevron_left, size: 16, color: AppColors.primaryContainer),
                          Text(
                            AppLocalization.get('Back'),
                            style: const TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.bold,
                              color: AppColors.primaryContainer,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                Text(
                  AppLocalization.get('Cooperative Profile'),
                  style: const TextStyle(
                    fontSize: 17,
                    fontWeight: FontWeight.bold,
                    color: AppColors.primaryContainer,
                  ),
                ),
                GestureDetector(
                  onTap: AppLocalization.toggleLanguage,
                  child: Container(
                    padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                    decoration: BoxDecoration(
                      color: Colors.grey.shade100,
                      border: Border.all(color: AppColors.borderSubtle),
                      borderRadius: BorderRadius.circular(16),
                    ),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text('EN', style: TextStyle(fontSize: 11, fontWeight: lang == 'EN' ? FontWeight.bold : FontWeight.normal, color: lang == 'EN' ? AppColors.primaryContainer : Colors.grey)),
                        const Padding(
                          padding: EdgeInsets.symmetric(horizontal: 4.0),
                          child: Text('|', style: TextStyle(fontSize: 11, color: Colors.grey)),
                        ),
                        Text('हिन्दी', style: TextStyle(fontSize: 11, fontWeight: lang == 'HI' ? FontWeight.bold : FontWeight.normal, color: lang == 'HI' ? AppColors.primaryContainer : Colors.grey)),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              AppLocalization.get('Manage cooperative information, settings and verification.'),
              style: const TextStyle(fontSize: 13, color: AppColors.textSecondary),
            ),
            const SizedBox(height: 16),
            
            // Profile Card
            _buildSectionContainer(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          Container(
                            width: 48,
                            height: 48,
                            decoration: BoxDecoration(
                              color: Colors.blue.shade50,
                              borderRadius: BorderRadius.circular(12),
                              border: Border.all(color: Colors.blue.shade100),
                            ),
                            alignment: Alignment.center,
                            child: const Text('🏛️', style: TextStyle(fontSize: 24)),
                          ),
                          const SizedBox(width: 12),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                AppLocalization.get('Nirman Shramik Cooperative'),
                                style: const TextStyle(fontSize: 15, fontWeight: FontWeight.bold, color: AppColors.textPrimary),
                              ),
                              const SizedBox(height: 2),
                              Text(
                                AppLocalization.get('Reg: COOP-DL-2026-0142'),
                                style: const TextStyle(fontSize: 11, fontFamily: 'monospace', color: AppColors.textSecondary),
                              ),
                            ],
                          ),
                        ],
                      ),
                      Container(
                        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                        decoration: BoxDecoration(
                          color: AppColors.cooperativeGreen.withValues(alpha: 0.1),
                          borderRadius: BorderRadius.circular(12),
                          border: Border.all(color: AppColors.cooperativeGreen.withValues(alpha: 0.3)),
                        ),
                        child: Text(
                          AppLocalization.get('✓ Verified'),
                          style: const TextStyle(fontSize: 10, fontWeight: FontWeight.bold, color: AppColors.cooperativeGreen),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 16),
                  Container(
                    padding: const EdgeInsets.all(12),
                    decoration: BoxDecoration(
                      color: Colors.grey.shade50,
                      borderRadius: BorderRadius.circular(12),
                      border: Border.all(color: AppColors.borderSubtle),
                    ),
                    child: Column(
                      children: [
                        _buildInfoRow(AppLocalization.get('Location:'), AppLocalization.get('Dwarka, New Delhi')),
                        const SizedBox(height: 8),
                        _buildInfoRow(AppLocalization.get('Service Areas:'), AppLocalization.get('Dwarka • Najafgarh • West Delhi')),
                      ],
                    ),
                  ),
                  const SizedBox(height: 16),
                  Text(AppLocalization.get('PRIMARY SERVICES'), style: const TextStyle(fontSize: 10, fontWeight: FontWeight.bold, color: AppColors.textSecondary)),
                  const SizedBox(height: 8),
                  Wrap(
                    spacing: 8,
                    runSpacing: 8,
                    children: [AppLocalization.get('Construction'), AppLocalization.get('Painting'), AppLocalization.get('Electrical'), AppLocalization.get('Plumbing')].map((service) {
                      return Container(
                        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                        decoration: BoxDecoration(
                          color: Colors.blue.shade50,
                          borderRadius: BorderRadius.circular(12),
                          border: Border.all(color: Colors.blue.shade200),
                        ),
                        child: Text(
                          service,
                          style: TextStyle(fontSize: 11, fontWeight: FontWeight.w500, color: Colors.blue.shade800),
                        ),
                      );
                    }).toList(),
                  ),
                  const SizedBox(height: 16),
                  const Divider(color: AppColors.borderSubtle, height: 1),
                  const SizedBox(height: 12),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(AppLocalization.get('Profile status active'), style: const TextStyle(fontSize: 11, color: AppColors.textSecondary)),
                      InkWell(
                        onTap: () {},
                        child: Row(
                          children: [
                            Text(
                              AppLocalization.get('Edit Profile'),
                              style: const TextStyle(fontSize: 12, fontWeight: FontWeight.bold, color: AppColors.primaryContainer),
                            ),
                            const Icon(Icons.arrow_forward, size: 14, color: AppColors.primaryContainer),
                          ],
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            
            const SizedBox(height: 16),
            
            // Authorized Representative
            _buildSectionContainer(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(AppLocalization.get('AUTHORIZED REPRESENTATIVE'), style: const TextStyle(fontSize: 11, fontWeight: FontWeight.bold, color: AppColors.textPrimary)),
                          const SizedBox(height: 2),
                          Text(AppLocalization.get('Personal details for registered cooperative account'), style: const TextStyle(fontSize: 10, color: AppColors.textSecondary)),
                        ],
                      ),
                      const Text('👤', style: TextStyle(fontSize: 18)),
                    ],
                  ),
                  const SizedBox(height: 12),
                  Container(
                    padding: const EdgeInsets.all(12),
                    decoration: BoxDecoration(
                      color: Colors.grey.shade50,
                      borderRadius: BorderRadius.circular(12),
                      border: Border.all(color: AppColors.borderSubtle),
                    ),
                    child: Column(
                      children: [
                        _buildInfoRow(AppLocalization.get('Admin Name:'), AppLocalization.get('Rajesh Kumar'), isBold: true),
                        const SizedBox(height: 8),
                        _buildInfoRow(AppLocalization.get('Role:'), AppLocalization.get('Cooperative Administrator')),
                        const SizedBox(height: 8),
                        _buildInfoRow(AppLocalization.get('Mobile:'), '+91 XXXXXXX3210'),
                        const SizedBox(height: 8),
                        _buildInfoRow(AppLocalization.get('Email:'), 'admin@nirman.coop'),
                      ],
                    ),
                  ),
                  const SizedBox(height: 12),
                  SizedBox(
                    width: double.infinity,
                    child: OutlinedButton.icon(
                      onPressed: () {},
                      icon: const Icon(Icons.edit, size: 16),
                      label: Text(AppLocalization.get('Edit Admin Details'), style: const TextStyle(fontSize: 12, fontWeight: FontWeight.bold)),
                      style: OutlinedButton.styleFrom(
                        padding: const EdgeInsets.symmetric(vertical: 12),
                        side: const BorderSide(color: AppColors.borderSubtle),
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            
            const SizedBox(height: 16),
            
            // Cooperative Settings
            _buildSectionContainer(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(AppLocalization.get('COOPERATIVE SETTINGS'), style: const TextStyle(fontSize: 11, fontWeight: FontWeight.bold, color: AppColors.textPrimary)),
                      Text(AppLocalization.get('Preferences'), style: const TextStyle(fontSize: 10, color: AppColors.textSecondary)),
                    ],
                  ),
                  const SizedBox(height: 12),
                  _buildSettingItem(icon: '🔔', title: AppLocalization.get('Notifications'), subtitle: AppLocalization.get('Request and payment updates'), onTap: () {}),
                  const SizedBox(height: 8),
                  _buildSettingItem(icon: '📍', title: AppLocalization.get('Service Areas'), subtitle: AppLocalization.get('Manage locations served'), onTap: () {}),
                  const SizedBox(height: 8),
                  _buildSettingItem(icon: '👷', title: AppLocalization.get('Worker Welfare'), subtitle: AppLocalization.get('Safety issues and assistance'), onTap: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context) => const WorkerWelfareScreen()));
                  }),
                  const SizedBox(height: 8),
                  _buildSettingItem(icon: '📊', title: AppLocalization.get('Reports & Work History'), subtitle: AppLocalization.get('Review cooperative performance'), onTap: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context) => const ReportsScreen()));
                  }),
                  const SizedBox(height: 8),
                  _buildSettingItem(icon: '🌐', title: AppLocalization.get('Language'), subtitle: lang == 'HI' ? 'हिन्दी (Tap for English)' : 'English (Tap for हिन्दी)', onTap: AppLocalization.toggleLanguage),
                ],
              ),
            ),
            
            const SizedBox(height: 16),
            
            // Cooperative Verification
            _buildSectionContainer(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(AppLocalization.get('COOPERATIVE VERIFICATION'), style: const TextStyle(fontSize: 11, fontWeight: FontWeight.bold, color: AppColors.textPrimary)),
                          const SizedBox(height: 2),
                          Text(AppLocalization.get('Government of NCT Delhi Compliance'), style: const TextStyle(fontSize: 10, color: AppColors.textSecondary)),
                        ],
                      ),
                      Container(
                        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                        decoration: BoxDecoration(
                          color: AppColors.cooperativeGreen.withValues(alpha: 0.1),
                          borderRadius: BorderRadius.circular(12),
                          border: Border.all(color: AppColors.cooperativeGreen.withValues(alpha: 0.3)),
                        ),
                        child: Text(
                          AppLocalization.get('Approved'),
                          style: const TextStyle(fontSize: 10, fontWeight: FontWeight.bold, color: AppColors.cooperativeGreen),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 16),
                  _buildVerificationRow(AppLocalization.get('Mobile Number Verified'), AppLocalization.get('Aug 2026')),
                  const SizedBox(height: 8),
                  _buildVerificationRow(AppLocalization.get('Registration Details Submitted'), AppLocalization.get('Aug 2026')),
                  const SizedBox(height: 8),
                  _buildVerificationRow(AppLocalization.get('Cooperative Society Verified'), AppLocalization.get('Sep 2026')),
                  const SizedBox(height: 16),
                  SizedBox(
                    width: double.infinity,
                    child: OutlinedButton(
                      onPressed: () {},
                      style: OutlinedButton.styleFrom(
                        padding: const EdgeInsets.symmetric(vertical: 12),
                        backgroundColor: Colors.grey.shade50,
                        side: const BorderSide(color: AppColors.borderSubtle),
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                      ),
                      child: Text(
                        AppLocalization.get('View Verification Certificate & Details ↓'),
                        style: const TextStyle(fontSize: 11, fontWeight: FontWeight.bold, color: AppColors.primaryContainer),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            
            const SizedBox(height: 24),
            
            // Log Out Button
            SizedBox(
              width: double.infinity,
              child: OutlinedButton.icon(
                onPressed: () {
                  showDialog(
                    context: context,
                    builder: (ctx) => AlertDialog(
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
                      title: Text(AppLocalization.get('Log Out'), style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
                      content: Text(AppLocalization.get('Are you sure you want to log out?'), style: const TextStyle(fontSize: 13)),
                      actions: [
                        TextButton(
                          onPressed: () => Navigator.pop(ctx),
                          child: Text(AppLocalization.get('Cancel'), style: const TextStyle(color: AppColors.textSecondary)),
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
                            backgroundColor: Colors.red,
                            foregroundColor: Colors.white,
                            elevation: 0,
                            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
                          ),
                          child: Text(AppLocalization.get('Log Out')),
                        ),
                      ],
                    ),
                  );
                },
                icon: const Icon(Icons.logout, size: 16, color: Colors.red),
                label: Text(AppLocalization.get('Log Out'), style: const TextStyle(fontSize: 12, fontWeight: FontWeight.bold, color: Colors.red)),
                style: OutlinedButton.styleFrom(
                  padding: const EdgeInsets.symmetric(vertical: 14),
                  backgroundColor: Colors.red.shade50,
                  side: BorderSide(color: Colors.red.shade200),
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                ),
              ),
            ),
            const SizedBox(height: 32),
          ],
        ),
      ),
    );
    }
    );
  }

  Widget _buildSectionContainer({required Widget child}) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: AppColors.borderSubtle),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.02),
            blurRadius: 8,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: child,
    );
  }

  Widget _buildInfoRow(String label, String value, {bool isBold = false}) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(label, style: const TextStyle(fontSize: 11, color: AppColors.textSecondary)),
        const SizedBox(width: 16),
        Expanded(
          child: Text(
            value,
            textAlign: TextAlign.right,
            style: TextStyle(
              fontSize: 11,
              fontWeight: isBold ? FontWeight.bold : FontWeight.w500,
              color: AppColors.textPrimary,
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildSettingItem({required String icon, required String title, required String subtitle, required VoidCallback onTap}) {
    return Material(
      color: Colors.grey.shade50,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
        side: const BorderSide(color: AppColors.borderSubtle),
      ),
      child: ListTile(
        leading: Text(icon, style: const TextStyle(fontSize: 20)),
        title: Text(title, style: const TextStyle(fontSize: 12, fontWeight: FontWeight.bold, color: AppColors.textPrimary)),
        subtitle: Text(subtitle, style: const TextStyle(fontSize: 10, color: AppColors.textSecondary)),
        trailing: const Icon(Icons.arrow_forward, size: 14, color: Colors.grey),
        dense: true,
        contentPadding: const EdgeInsets.symmetric(horizontal: 12, vertical: 2),
        onTap: onTap,
      ),
    );
  }

  Widget _buildVerificationRow(String title, String date) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            const Text('✓ ', style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold, color: AppColors.cooperativeGreen)),
            Text(title, style: const TextStyle(fontSize: 11, color: AppColors.textPrimary)),
          ],
        ),
        Text(date, style: const TextStyle(fontSize: 10, fontFamily: 'monospace', color: AppColors.textSecondary)),
      ],
    );
  }
}
