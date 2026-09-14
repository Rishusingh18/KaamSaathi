import 'package:flutter/material.dart';
import '../../utils/localization.dart';
import 'institution_requirement_details_screen.dart';
import 'institution_work_progress_screen.dart';

class InstitutionDashboardScreen extends StatelessWidget {
  final VoidCallback? onNavigateToRequirements;
  final VoidCallback? onNavigateToProjects;
  final VoidCallback? onNavigateToInvoices;

  const InstitutionDashboardScreen({
    super.key,
    this.onNavigateToRequirements,
    this.onNavigateToProjects,
    this.onNavigateToInvoices,
  });

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
              padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 10.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Top Profile & Greeting Row
                  _buildHeader(context, lang),
                  const SizedBox(height: 16),

                  // Need Workforce Banner Card
                  _buildNeedWorkforceCard(context),
                  const SizedBox(height: 18),

                  // Current Requirements Section
                  _buildCurrentRequirementsSection(context),
                  const SizedBox(height: 20),

                  // How do you want to fulfil your requirement?
                  _buildFulfilmentModelsCard(),
                  const SizedBox(height: 20),

                  // Quick Actions Grid
                  _buildQuickActions(context),
                  const SizedBox(height: 24),
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  // ── HEADER ────────────────────────────────────────────────────────────────
  Widget _buildHeader(BuildContext context, String lang) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            Container(
              width: 44,
              height: 44,
              decoration: BoxDecoration(
                color: const Color(0xFF123B5D),
                borderRadius: BorderRadius.circular(12),
              ),
              child: const Center(
                child: Text('ABC', style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold, color: Colors.white)),
              ),
            ),
            const SizedBox(width: 10),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  AppLocalization.get('Good morning, ABC College 👋'),
                  style: const TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF0F172A),
                  ),
                ),
                const SizedBox(height: 2),
                Row(
                  children: [
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
                      decoration: BoxDecoration(
                        color: const Color(0xFFE0F2FE),
                        borderRadius: BorderRadius.circular(6),
                      ),
                      child: const Text(
                        'Verified Institution ✓',
                        style: TextStyle(fontSize: 10, fontWeight: FontWeight.bold, color: Color(0xFF0369A1)),
                      ),
                    ),
                    const SizedBox(width: 6),
                    const Text('Dwarka, Delhi', style: TextStyle(fontSize: 11, color: Color(0xFF64748B))),
                  ],
                ),
              ],
            ),
          ],
        ),

        // Language & Notification
        Row(
          children: [
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
                      padding: EdgeInsets.symmetric(horizontal: 2.0),
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
            const SizedBox(width: 8),
            Container(
              padding: const EdgeInsets.all(8),
              decoration: BoxDecoration(
                color: Colors.white,
                shape: BoxShape.circle,
                border: Border.all(color: const Color(0xFFE2E8F0)),
              ),
              child: const Badge(
                label: Text('3', style: TextStyle(fontSize: 9)),
                child: Icon(Icons.notifications_none, size: 20, color: Color(0xFF123B5D)),
              ),
            ),
          ],
        ),
      ],
    );
  }

  // ── NEED WORKFORCE HERO CARD ──────────────────────────────────────────────
  Widget _buildNeedWorkforceCard(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        gradient: const LinearGradient(
          colors: [Color(0xFF123B5D), Color(0xFF1E5B8E)],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        borderRadius: BorderRadius.circular(18),
        boxShadow: [
          BoxShadow(
            color: const Color(0xFF123B5D).withValues(alpha: 0.2),
            blurRadius: 12,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      padding: const EdgeInsets.all(18),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                decoration: BoxDecoration(
                  color: Colors.white.withValues(alpha: 0.15),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Row(
                  children: [
                    const Text('⚡', style: TextStyle(fontSize: 12)),
                    const SizedBox(width: 4),
                    Text(
                      AppLocalization.get('Need Workforce?'),
                      style: const TextStyle(fontSize: 12, fontWeight: FontWeight.bold, color: Colors.white),
                    ),
                  ],
                ),
              ),
              const Text('SAHYOG Gateway', style: TextStyle(fontSize: 10, color: Colors.white70)),
            ],
          ),
          const SizedBox(height: 12),
          const Text(
            'Request skilled workforce teams for your institution campus.',
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.white, height: 1.3),
          ),
          const SizedBox(height: 6),
          const Text(
            'Connect with verified local cooperatives for painting, repair, electrical & maintenance.',
            style: TextStyle(fontSize: 11.5, color: Colors.white70, height: 1.3),
          ),
          const SizedBox(height: 16),
          SizedBox(
            width: double.infinity,
            height: 42,
            child: ElevatedButton(
              onPressed: onNavigateToRequirements,
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFF087443),
                foregroundColor: Colors.white,
                elevation: 0,
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    AppLocalization.get('Create Workforce Requirement →'),
                    style: const TextStyle(fontSize: 13, fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  // ── CURRENT REQUIREMENTS SECTION ──────────────────────────────────────────
  Widget _buildCurrentRequirementsSection(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              AppLocalization.get('Current Requirements'),
              style: const TextStyle(
                fontSize: 14.5,
                fontWeight: FontWeight.bold,
                color: Color(0xFF0F172A),
              ),
            ),
            GestureDetector(
              onTap: onNavigateToRequirements,
              child: const Text(
                'View All (3) →',
                style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold, color: Color(0xFF1D4ED8)),
              ),
            ),
          ],
        ),
        const SizedBox(height: 10),

        // Item 1: Campus Painting (In Progress)
        _buildRequirementCard(
          context: context,
          title: AppLocalization.get('College Campus Painting'),
          workers: '5 Painting Workers',
          status: 'In Progress (Day 4/5)',
          statusBg: const Color(0xFFDCFCE7),
          statusColor: const Color(0xFF087443),
          dates: 'Sep 14–18, 2026',
          budget: '₹22,890',
          emoji: '🎨',
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const InstitutionWorkProgressScreen()),
            );
          },
        ),
        const SizedBox(height: 10),

        // Item 2: Electrical Upgradation (Matching)
        _buildRequirementCard(
          context: context,
          title: AppLocalization.get('Hostel Electrical Upgradation'),
          workers: '3 Electricians',
          status: AppLocalization.get('Matching in Progress'),
          statusBg: const Color(0xFFFEF3C7),
          statusColor: const Color(0xFFB45309),
          dates: 'Sep 20–22, 2026',
          budget: '₹14,500',
          emoji: '⚡',
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const InstitutionRequirementDetailsScreen()),
            );
          },
        ),
      ],
    );
  }

  Widget _buildRequirementCard({
    required BuildContext context,
    required String title,
    required String workers,
    required String status,
    required Color statusBg,
    required Color statusColor,
    required String dates,
    required String budget,
    required String emoji,
    required VoidCallback onTap,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(14),
          border: Border.all(color: const Color(0xFFE2E8F0)),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withValues(alpha: 0.02),
              blurRadius: 6,
              offset: const Offset(0, 1),
            ),
          ],
        ),
        padding: const EdgeInsets.all(14),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Text(emoji, style: const TextStyle(fontSize: 16)),
                    const SizedBox(width: 8),
                    Text(
                      title,
                      style: const TextStyle(
                        fontSize: 13.5,
                        fontWeight: FontWeight.bold,
                        color: Color(0xFF0F172A),
                      ),
                    ),
                  ],
                ),
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 3),
                  decoration: BoxDecoration(
                    color: statusBg,
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Text(
                    status,
                    style: TextStyle(fontSize: 10.5, fontWeight: FontWeight.bold, color: statusColor),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    const Icon(Icons.people_alt_outlined, size: 13, color: Color(0xFF64748B)),
                    const SizedBox(width: 4),
                    Text(workers, style: const TextStyle(fontSize: 11.5, color: Color(0xFF64748B))),
                  ],
                ),
                Row(
                  children: [
                    const Icon(Icons.calendar_today_outlined, size: 12, color: Color(0xFF64748B)),
                    const SizedBox(width: 4),
                    Text(dates, style: const TextStyle(fontSize: 11, color: Color(0xFF64748B))),
                  ],
                ),
                Text(
                  budget,
                  style: const TextStyle(fontSize: 12.5, fontWeight: FontWeight.bold, color: Color(0xFF123B5D)),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  // ── FULFILMENT MODELS CARD ────────────────────────────────────────────────
  Widget _buildFulfilmentModelsCard() {
    return Container(
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
            AppLocalization.get('How do you want to fulfil your requirement?'),
            style: const TextStyle(
              fontSize: 13.5,
              fontWeight: FontWeight.bold,
              color: Color(0xFF0F172A),
            ),
          ),
          const SizedBox(height: 12),
          _buildModelItem(
            emoji: '👷',
            title: AppLocalization.get('Direct Skilled Workers'),
            desc: AppLocalization.get('Verified individuals with Skill Passports for specific tasks.'),
            badge: 'Flexible',
            bgColor: const Color(0xFFEFF6FF),
          ),
          const SizedBox(height: 10),
          _buildModelItem(
            emoji: '🤝',
            title: AppLocalization.get('Cooperative Teams'),
            desc: AppLocalization.get('Full-scale coordinated teams managed by local cooperatives.'),
            badge: 'Recommended',
            bgColor: const Color(0xFFECFDF5),
          ),
        ],
      ),
    );
  }

  Widget _buildModelItem({
    required String emoji,
    required String title,
    required String desc,
    required String badge,
    required Color bgColor,
  }) {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: bgColor,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(emoji, style: const TextStyle(fontSize: 20)),
          const SizedBox(width: 10),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(title, style: const TextStyle(fontSize: 13, fontWeight: FontWeight.bold, color: Color(0xFF0F172A))),
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(6),
                      ),
                      child: Text(badge, style: const TextStyle(fontSize: 9.5, fontWeight: FontWeight.bold, color: Color(0xFF123B5D))),
                    ),
                  ],
                ),
                const SizedBox(height: 2),
                Text(desc, style: const TextStyle(fontSize: 11, color: Color(0xFF475569), height: 1.3)),
              ],
            ),
          ),
        ],
      ),
    );
  }

  // ── QUICK ACTIONS ─────────────────────────────────────────────────────────
  Widget _buildQuickActions(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Quick Actions',
          style: TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.bold,
            color: Color(0xFF0F172A),
          ),
        ),
        const SizedBox(height: 10),
        Row(
          children: [
            Expanded(
              child: _buildActionTile(
                icon: Icons.post_add,
                label: 'Post Req.',
                color: const Color(0xFF1D4ED8),
                onTap: onNavigateToRequirements,
              ),
            ),
            const SizedBox(width: 8),
            Expanded(
              child: _buildActionTile(
                icon: Icons.group_work_outlined,
                label: 'Browse Teams',
                color: const Color(0xFF087443),
                onTap: onNavigateToRequirements,
              ),
            ),
            const SizedBox(width: 8),
            Expanded(
              child: _buildActionTile(
                icon: Icons.receipt_long_outlined,
                label: 'Invoices',
                color: const Color(0xFFD97706),
                onTap: onNavigateToInvoices,
              ),
            ),
            const SizedBox(width: 8),
            Expanded(
              child: _buildActionTile(
                icon: Icons.support_agent_outlined,
                label: 'Support',
                color: const Color(0xFFDC2626),
                onTap: () {},
              ),
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildActionTile({
    required IconData icon,
    required String label,
    required Color color,
    required VoidCallback? onTap,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 12),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12),
          border: Border.all(color: const Color(0xFFE2E8F0)),
        ),
        child: Column(
          children: [
            Icon(icon, size: 22, color: color),
            const SizedBox(height: 6),
            Text(
              label,
              style: const TextStyle(fontSize: 11, fontWeight: FontWeight.bold, color: Color(0xFF334155)),
            ),
          ],
        ),
      ),
    );
  }
}
