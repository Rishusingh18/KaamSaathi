import 'package:flutter/material.dart';
import '../theme/colors.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.surfaceCanvas,
      appBar: AppBar(
        backgroundColor: AppColors.surfaceCanvas,
        elevation: 0,
        automaticallyImplyLeading: false,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Text(
              'Cooperative Profile',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: AppColors.primaryContainer,
              ),
            ),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
              decoration: BoxDecoration(
                color: Colors.grey.shade100,
                border: Border.all(color: AppColors.borderSubtle),
                borderRadius: BorderRadius.circular(16),
              ),
              child: Row(
                children: const [
                  Text('EN', style: TextStyle(fontSize: 11, fontWeight: FontWeight.bold, color: AppColors.primaryContainer)),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 4.0),
                    child: Text('|', style: TextStyle(fontSize: 11, color: Colors.grey)),
                  ),
                  Text('हिन्दी', style: TextStyle(fontSize: 11, color: Colors.grey)),
                ],
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
            const Text(
              'Manage cooperative information, settings and verification.',
              style: TextStyle(fontSize: 13, color: AppColors.textSecondary),
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
                            children: const [
                              Text(
                                'Nirman Shramik Cooperative',
                                style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold, color: AppColors.textPrimary),
                              ),
                              SizedBox(height: 2),
                              Text(
                                'Reg: COOP-DL-2026-0142',
                                style: TextStyle(fontSize: 11, fontFamily: 'monospace', color: AppColors.textSecondary),
                              ),
                            ],
                          ),
                        ],
                      ),
                      Container(
                        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                        decoration: BoxDecoration(
                          color: AppColors.cooperativeGreen.withOpacity(0.1),
                          borderRadius: BorderRadius.circular(12),
                          border: Border.all(color: AppColors.cooperativeGreen.withOpacity(0.3)),
                        ),
                        child: const Text(
                          '✓ Verified',
                          style: TextStyle(fontSize: 10, fontWeight: FontWeight.bold, color: AppColors.cooperativeGreen),
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
                        _buildInfoRow('Location:', 'Dwarka, New Delhi'),
                        const SizedBox(height: 8),
                        _buildInfoRow('Service Areas:', 'Dwarka • Najafgarh • West Delhi'),
                      ],
                    ),
                  ),
                  const SizedBox(height: 16),
                  const Text('PRIMARY SERVICES', style: TextStyle(fontSize: 10, fontWeight: FontWeight.bold, color: AppColors.textSecondary)),
                  const SizedBox(height: 8),
                  Wrap(
                    spacing: 8,
                    runSpacing: 8,
                    children: ['Construction', 'Painting', 'Electrical', 'Plumbing'].map((service) {
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
                      const Text('Profile status active', style: TextStyle(fontSize: 11, color: AppColors.textSecondary)),
                      InkWell(
                        onTap: () {},
                        child: Row(
                          children: const [
                            Text(
                              'Edit Profile',
                              style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold, color: AppColors.primaryContainer),
                            ),
                            Icon(Icons.arrow_forward, size: 14, color: AppColors.primaryContainer),
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
                        children: const [
                          Text('AUTHORIZED REPRESENTATIVE', style: TextStyle(fontSize: 11, fontWeight: FontWeight.bold, color: AppColors.textPrimary)),
                          SizedBox(height: 2),
                          Text('Personal details for registered cooperative account', style: TextStyle(fontSize: 10, color: AppColors.textSecondary)),
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
                        _buildInfoRow('Admin Name:', 'Rajesh Kumar', isBold: true),
                        const SizedBox(height: 8),
                        _buildInfoRow('Role:', 'Cooperative Administrator'),
                        const SizedBox(height: 8),
                        _buildInfoRow('Mobile:', '+91 XXXXXXX3210'),
                        const SizedBox(height: 8),
                        _buildInfoRow('Email:', 'admin@nirman.coop'),
                      ],
                    ),
                  ),
                  const SizedBox(height: 12),
                  SizedBox(
                    width: double.infinity,
                    child: OutlinedButton.icon(
                      onPressed: () {},
                      icon: const Icon(Icons.edit, size: 16),
                      label: const Text('Edit Admin Details', style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold)),
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
                    children: const [
                      Text('COOPERATIVE SETTINGS', style: TextStyle(fontSize: 11, fontWeight: FontWeight.bold, color: AppColors.textPrimary)),
                      Text('Preferences', style: TextStyle(fontSize: 10, color: AppColors.textSecondary)),
                    ],
                  ),
                  const SizedBox(height: 12),
                  _buildSettingItem(icon: '🔔', title: 'Notifications', subtitle: 'Request and payment updates'),
                  const SizedBox(height: 8),
                  _buildSettingItem(icon: '📍', title: 'Service Areas', subtitle: 'Manage locations served'),
                  const SizedBox(height: 8),
                  _buildSettingItem(icon: '👷', title: 'Workforce Preferences', subtitle: 'Skills and availability settings'),
                  const SizedBox(height: 8),
                  _buildSettingItem(icon: '🔐', title: 'Privacy & Security', subtitle: 'Account and access controls'),
                  const SizedBox(height: 8),
                  _buildSettingItem(icon: '🌐', title: 'Language', subtitle: 'English (हिन्दी available)'),
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
                        children: const [
                          Text('COOPERATIVE VERIFICATION', style: TextStyle(fontSize: 11, fontWeight: FontWeight.bold, color: AppColors.textPrimary)),
                          SizedBox(height: 2),
                          Text('Government of NCT Delhi Compliance', style: TextStyle(fontSize: 10, color: AppColors.textSecondary)),
                        ],
                      ),
                      Container(
                        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                        decoration: BoxDecoration(
                          color: AppColors.cooperativeGreen.withOpacity(0.1),
                          borderRadius: BorderRadius.circular(12),
                          border: Border.all(color: AppColors.cooperativeGreen.withOpacity(0.3)),
                        ),
                        child: const Text(
                          'Approved',
                          style: TextStyle(fontSize: 10, fontWeight: FontWeight.bold, color: AppColors.cooperativeGreen),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 16),
                  _buildVerificationRow('Mobile Number Verified', 'Aug 2026'),
                  const SizedBox(height: 8),
                  _buildVerificationRow('Registration Details Submitted', 'Aug 2026'),
                  const SizedBox(height: 8),
                  _buildVerificationRow('Cooperative Society Verified', 'Sep 2026'),
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
                      child: const Text(
                        'View Verification Certificate & Details ↓',
                        style: TextStyle(fontSize: 11, fontWeight: FontWeight.bold, color: AppColors.primaryContainer),
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
                onPressed: () {},
                icon: const Icon(Icons.logout, size: 16, color: Colors.red),
                label: const Text('Log Out', style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold, color: Colors.red)),
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

  Widget _buildSectionContainer({required Widget child}) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: AppColors.borderSubtle),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.02),
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

  Widget _buildSettingItem({required String icon, required String title, required String subtitle}) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.grey.shade50,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: AppColors.borderSubtle),
      ),
      child: ListTile(
        leading: Text(icon, style: const TextStyle(fontSize: 20)),
        title: Text(title, style: const TextStyle(fontSize: 12, fontWeight: FontWeight.bold, color: AppColors.textPrimary)),
        subtitle: Text(subtitle, style: const TextStyle(fontSize: 10, color: AppColors.textSecondary)),
        trailing: const Icon(Icons.arrow_forward, size: 14, color: Colors.grey),
        dense: true,
        contentPadding: const EdgeInsets.symmetric(horizontal: 12, vertical: 2),
        onTap: () {},
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
