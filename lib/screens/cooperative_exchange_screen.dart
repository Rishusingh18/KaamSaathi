import 'package:flutter/material.dart';
import 'package:dotted_border/dotted_border.dart';
import '../theme/colors.dart';
import '../utils/localization.dart';

class CooperativeExchangeScreen extends StatefulWidget {
  final bool showBackButton;

  const CooperativeExchangeScreen({
    super.key,
    this.showBackButton = true,
  });

  @override
  State<CooperativeExchangeScreen> createState() =>
      _CooperativeExchangeScreenState();
}

class _CooperativeExchangeScreenState extends State<CooperativeExchangeScreen> {
  int _selectedIndex = 0; // 0: Work Opps, 1: Workforce, 2: Equipment

  void _showActionToast(String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
        backgroundColor: const Color(0xFF1E3A5F),
        behavior: SnackBarBehavior.floating,
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
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 10),
                  _buildTopNav(context, lang),
                  const SizedBox(height: 14),
                  _buildHeaderSubtitle(lang),
                  const SizedBox(height: 14),
                  _buildSegmentedTabSelector(lang),
                  const SizedBox(height: 18),
                  if (_selectedIndex == 0)
                    _buildWorkOppsTab(lang)
                  else if (_selectedIndex == 1)
                    _buildWorkforceTab(lang)
                  else
                    _buildEquipmentTab(lang),
                  const SizedBox(height: 28),
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  // ── TOP NAVIGATION ────────────────────────────────────────────────────────
  Widget _buildTopNav(BuildContext context, String lang) {
    final canGoBack = widget.showBackButton && Navigator.canPop(context);

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        // Back button with blue dotted border
        if (canGoBack)
          GestureDetector(
            onTap: () => Navigator.pop(context),
            child: DottedBorder(
              options: RoundedRectDottedBorderOptions(
                color: const Color(0xFF93C5FD),
                dashPattern: const [4, 3],
                strokeWidth: 1.5,
                radius: const Radius.circular(6),
              ),
              child: Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                color: Colors.transparent,
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const Icon(Icons.arrow_back_ios_new,
                        size: 13, color: Color(0xFF1E3A8A)),
                    const SizedBox(width: 4),
                    Text(
                      AppLocalization.get('Back'),
                      style: const TextStyle(
                        fontSize: 13,
                        fontWeight: FontWeight.bold,
                        color: Color(0xFF1E3A8A),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          )
        else
          const SizedBox(width: 24),

        // Title
        Text(
          AppLocalization.get('Cooperative Exchange'),
          style: const TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
            color: Color(0xFF0F172A),
            letterSpacing: -0.3,
          ),
        ),

        // Language toggle pill
        GestureDetector(
          onTap: () => AppLocalization.toggleLanguage(),
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
            decoration: BoxDecoration(
              color: Colors.white,
              border: Border.all(color: const Color(0xFFE2E8F0)),
              borderRadius: BorderRadius.circular(16),
            ),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  'EN',
                  style: TextStyle(
                    fontWeight:
                        lang == 'EN' ? FontWeight.bold : FontWeight.normal,
                    fontSize: 12,
                    color: lang == 'EN'
                        ? const Color(0xFF0F172A)
                        : const Color(0xFF64748B),
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 5.0),
                  child: Text('|',
                      style: TextStyle(color: Color(0xFFCBD5E1), fontSize: 11)),
                ),
                Text(
                  'हिन्दी',
                  style: TextStyle(
                    fontWeight:
                        lang == 'HI' ? FontWeight.bold : FontWeight.normal,
                    fontSize: 12,
                    color: lang == 'HI'
                        ? const Color(0xFF0F172A)
                        : const Color(0xFF64748B),
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }

  // ── SUBTITLE ──────────────────────────────────────────────────────────────
  Widget _buildHeaderSubtitle(String lang) {
    return Text(
      AppLocalization.get(
          'Share resources. Find opportunities. Grow together.'),
      style: const TextStyle(
        fontSize: 12.5,
        color: Color(0xFF64748B),
      ),
    );
  }

  // ── SEGMENTED 3-TAB SELECTOR ──────────────────────────────────────────────
  Widget _buildSegmentedTabSelector(String lang) {
    return Container(
      padding: const EdgeInsets.all(4),
      decoration: BoxDecoration(
        color: const Color(0xFFF1F5F9),
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: const Color(0xFFE2E8F0)),
      ),
      child: Row(
        children: [
          _buildSegmentTab(0, AppLocalization.get('Work Opps')),
          _buildSegmentTab(1, AppLocalization.get('Workforce')),
          _buildSegmentTab(2, AppLocalization.get('Equipment')),
        ],
      ),
    );
  }

  Widget _buildSegmentTab(int index, String label) {
    final isSelected = _selectedIndex == index;
    return Expanded(
      child: GestureDetector(
        onTap: () {
          setState(() {
            _selectedIndex = index;
          });
        },
        child: Container(
          padding: const EdgeInsets.symmetric(vertical: 9),
          decoration: BoxDecoration(
            color: isSelected ? const Color(0xFF1E3A5F) : Colors.transparent,
            borderRadius: BorderRadius.circular(8),
          ),
          child: Text(
            label,
            style: TextStyle(
              fontSize: 12.5,
              fontWeight: isSelected ? FontWeight.bold : FontWeight.w600,
              color: isSelected ? Colors.white : const Color(0xFF64748B),
            ),
            textAlign: TextAlign.center,
          ),
        ),
      ),
    );
  }

  // ── TAB 1: WORK OPPS ──────────────────────────────────────────────────────
  Widget _buildWorkOppsTab(String lang) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Subheader Row
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              AppLocalization.get('AVAILABLE OPPORTUNITIES'),
              style: const TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.w800,
                letterSpacing: 0.5,
                color: Color(0xFF0F172A),
              ),
            ),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 3),
              decoration: BoxDecoration(
                color: const Color(0xFFECFDF5),
                borderRadius: BorderRadius.circular(12),
              ),
              child: Text(
                AppLocalization.get('3 Open'),
                style: const TextStyle(
                  fontSize: 11,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF16A34A),
                ),
              ),
            ),
          ],
        ),
        const SizedBox(height: 12),

        // Card 1: Community Park Maintenance
        _buildOpportunityCard(
          title: 'Community Park Maintenance',
          institution: 'Municipal Institution • Najafgarh',
          schedule: 'Sep 20–25',
          workforce: '8 workers',
          skills: ['Gardening', 'General Labour'],
          onTap: () => _showActionToast(
              '${AppLocalization.get('View Opportunity →')}: Community Park Maintenance'),
        ),
        const SizedBox(height: 14),

        // Card 2: School Building Painting
        _buildOpportunityCard(
          title: 'School Building Painting',
          institution: 'Local Institution • Dwarka',
          schedule: 'Sep 22–28',
          workforce: '6 workers',
          skills: ['Painting', 'Masonry'],
          onTap: () => _showActionToast(
              '${AppLocalization.get('View Opportunity →')}: School Building Painting'),
        ),
        const SizedBox(height: 14),

        // Card 3: Community Centre Electrical Work
        _buildOpportunityCard(
          title: 'Community Centre Electrical Work',
          institution: 'Community Organisation • Janakpuri',
          schedule: 'Sep 24–26',
          workforce: '3 workers',
          skills: ['Electrical', 'Wiring'],
          onTap: () => _showActionToast(
              '${AppLocalization.get('View Opportunity →')}: Community Centre Electrical Work'),
        ),
      ],
    );
  }

  Widget _buildOpportunityCard({
    required String title,
    required String institution,
    required String schedule,
    required String workforce,
    required List<String> skills,
    required VoidCallback onTap,
  }) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: const Color(0xFFE2E8F0)),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.02),
            blurRadius: 4,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Title & Open Pill
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: Text(
                  AppLocalization.get(title),
                  style: const TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF0F172A),
                  ),
                ),
              ),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 3),
                decoration: BoxDecoration(
                  color: const Color(0xFFECFDF5),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Text(
                  AppLocalization.get('Open'),
                  style: const TextStyle(
                    fontSize: 11,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF16A34A),
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 3),

          // Subtitle / Institution
          Row(
            children: [
              const Text('🏢', style: TextStyle(fontSize: 12)),
              const SizedBox(width: 4),
              Expanded(
                child: Text(
                  AppLocalization.get(institution),
                  style: const TextStyle(
                    fontSize: 12,
                    color: Color(0xFF64748B),
                  ),
                  overflow: TextOverflow.ellipsis,
                ),
              ),
            ],
          ),
          const SizedBox(height: 12),

          // Schedule & Workforce Requirement Box
          Container(
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(
              color: const Color(0xFFF8FAFC),
              borderRadius: BorderRadius.circular(10),
              border: Border.all(color: const Color(0xFFF1F5F9)),
            ),
            child: Row(
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        AppLocalization.get('SCHEDULE'),
                        style: const TextStyle(
                          fontSize: 10,
                          fontWeight: FontWeight.w700,
                          color: Color(0xFF94A3B8),
                          letterSpacing: 0.3,
                        ),
                      ),
                      const SizedBox(height: 2),
                      Text(
                        AppLocalization.get(schedule),
                        style: const TextStyle(
                          fontSize: 13,
                          fontWeight: FontWeight.bold,
                          color: Color(0xFF0F172A),
                        ),
                      ),
                    ],
                  ),
                ),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        AppLocalization.get('WORKFORCE REQ.'),
                        style: const TextStyle(
                          fontSize: 10,
                          fontWeight: FontWeight.w700,
                          color: Color(0xFF94A3B8),
                          letterSpacing: 0.3,
                        ),
                      ),
                      const SizedBox(height: 2),
                      Text(
                        AppLocalization.get(workforce),
                        style: const TextStyle(
                          fontSize: 13,
                          fontWeight: FontWeight.bold,
                          color: Color(0xFF0F172A),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 12),

          // Skills Row
          Row(
            children: [
              Text(
                AppLocalization.get('Skills:'),
                style: const TextStyle(
                  fontSize: 11.5,
                  color: Color(0xFF64748B),
                ),
              ),
              const SizedBox(width: 8),
              Expanded(
                child: Wrap(
                  spacing: 6,
                  children: skills.map((skill) {
                    return Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 8, vertical: 3),
                      decoration: BoxDecoration(
                        color: const Color(0xFFF1F5F9),
                        borderRadius: BorderRadius.circular(6),
                      ),
                      child: Text(
                        AppLocalization.get(skill),
                        style: const TextStyle(
                          fontSize: 11,
                          fontWeight: FontWeight.w600,
                          color: Color(0xFF334155),
                        ),
                      ),
                    );
                  }).toList(),
                ),
              ),
            ],
          ),
          const SizedBox(height: 14),

          // View Opportunity Action Button
          SizedBox(
            width: double.infinity,
            child: OutlinedButton(
              onPressed: onTap,
              style: OutlinedButton.styleFrom(
                padding: const EdgeInsets.symmetric(vertical: 11),
                side: const BorderSide(color: Color(0xFF16A34A), width: 1.2),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
                backgroundColor: Colors.white,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    AppLocalization.get('View Opportunity →'),
                    style: const TextStyle(
                      fontSize: 13,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF16A34A),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  // ── TAB 2: WORKFORCE ──────────────────────────────────────────────────────
  Widget _buildWorkforceTab(String lang) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          AppLocalization.get('Workforce Support'),
          style: const TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
            color: Color(0xFF0F172A),
          ),
        ),
        const SizedBox(height: 2),
        Text(
          AppLocalization.get('Need additional workers for a project?'),
          style: const TextStyle(
            fontSize: 12.5,
            color: Color(0xFF64748B),
          ),
        ),
        const SizedBox(height: 14),

        // Shared Workers Card
        Container(
          padding: const EdgeInsets.all(14),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(16),
            border: Border.all(color: const Color(0xFFE2E8F0)),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.02),
                blurRadius: 4,
                offset: const Offset(0, 2),
              ),
            ],
          ),
          child: Column(
            children: [
              // Row 1: Painting
              _buildWorkforceItem(
                emoji: '🎨',
                bgColor: const Color(0xFFECFDF5),
                title: '4 Painting Workers Available',
                fromCoop: 'From Janakpuri Shramik Co-op',
                badgeText: 'Ready',
                badgeBorderColor: const Color(0xFFA7F3D0),
                badgeTextColor: const Color(0xFF16A34A),
              ),
              const SizedBox(height: 10),

              // Row 2: Electricians
              _buildWorkforceItem(
                emoji: '⚡',
                bgColor: const Color(0xFFEFF6FF),
                title: '2 Electricians Available',
                fromCoop: 'From Najafgarh Guild Co-op',
                badgeText: 'Ready',
                badgeBorderColor: const Color(0xFFBFDBFE),
                badgeTextColor: const Color(0xFF2563EB),
              ),
              const SizedBox(height: 10),

              // Row 3: General Labour
              _buildWorkforceItem(
                emoji: '🧱',
                bgColor: const Color(0xFFFFFBEB),
                title: '3 General Labour Workers Available',
                fromCoop: 'From Dwarka Ekta Co-op',
                badgeText: 'Ready',
                badgeBorderColor: const Color(0xFFFDE68A),
                badgeTextColor: const Color(0xFFD97706),
              ),
              const SizedBox(height: 16),

              // Request Workforce Support Button
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () => _showActionToast(
                      AppLocalization.get('Workforce Support Requested')),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFF047857),
                    padding: const EdgeInsets.symmetric(vertical: 14),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    elevation: 0,
                  ),
                  child: Text(
                    AppLocalization.get('Request Workforce Support →'),
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
        const SizedBox(height: 14),

        // Info banner
        _buildInfoBanner(
          text: AppLocalization.get(
              'Connect with nearby cooperatives when your own workforce is unavailable.'),
        ),
      ],
    );
  }

  Widget _buildWorkforceItem({
    required String emoji,
    required Color bgColor,
    required String title,
    required String fromCoop,
    required String badgeText,
    required Color badgeBorderColor,
    required Color badgeTextColor,
  }) {
    return Container(
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: const Color(0xFFF8FAFC),
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: const Color(0xFFF1F5F9)),
      ),
      child: Row(
        children: [
          Container(
            width: 38,
            height: 38,
            decoration: BoxDecoration(
              color: bgColor,
              borderRadius: BorderRadius.circular(8),
            ),
            child: Center(
              child: Text(emoji, style: const TextStyle(fontSize: 18)),
            ),
          ),
          const SizedBox(width: 10),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  AppLocalization.get(title),
                  style: const TextStyle(
                    fontSize: 13.5,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF0F172A),
                  ),
                ),
                const SizedBox(height: 2),
                Text(
                  AppLocalization.get(fromCoop),
                  style: const TextStyle(
                    fontSize: 11.5,
                    color: Color(0xFF64748B),
                  ),
                ),
              ],
            ),
          ),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 3),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(12),
              border: Border.all(color: badgeBorderColor),
            ),
            child: Text(
              AppLocalization.get(badgeText),
              style: TextStyle(
                fontSize: 11,
                fontWeight: FontWeight.bold,
                color: badgeTextColor,
              ),
            ),
          ),
        ],
      ),
    );
  }

  // ── TAB 3: EQUIPMENT ──────────────────────────────────────────────────────
  Widget _buildEquipmentTab(String lang) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          AppLocalization.get('Shared Equipment'),
          style: const TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
            color: Color(0xFF0F172A),
          ),
        ),
        const SizedBox(height: 2),
        Text(
          AppLocalization.get(
              'Borrow tools from fellow cooperatives at affordable day rates.'),
          style: const TextStyle(
            fontSize: 12.5,
            color: Color(0xFF64748B),
          ),
        ),
        const SizedBox(height: 14),

        // Card 1: Paint Sprayer
        _buildEquipmentCard(
          title: '1. Paint Sprayer',
          subtitle: 'Available from nearby cooperative',
          rate: '₹500',
          onTap: () => _showActionToast(
              '${AppLocalization.get('Request Equipment')}: Paint Sprayer'),
        ),
        const SizedBox(height: 14),

        // Card 2: Concrete Mixer
        _buildEquipmentCard(
          title: '2. Concrete Mixer',
          subtitle: 'Available (Najafgarh Sector 3)',
          rate: '₹1,200',
          onTap: () => _showActionToast(
              '${AppLocalization.get('Request Equipment')}: Concrete Mixer'),
        ),
        const SizedBox(height: 14),

        // Card 3: Electric Drill Set
        _buildEquipmentCard(
          title: '3. Electric Drill Set',
          subtitle: 'Available (Heavy duty kit)',
          rate: '₹300',
          onTap: () => _showActionToast(
              '${AppLocalization.get('Request Equipment')}: Electric Drill Set'),
        ),
        const SizedBox(height: 14),

        // Info banner
        _buildInfoBanner(
          text: AppLocalization.get(
              'Cooperatives can share underused equipment and reduce project costs.'),
        ),
      ],
    );
  }

  Widget _buildEquipmentCard({
    required String title,
    required String subtitle,
    required String rate,
    required VoidCallback onTap,
  }) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: const Color(0xFFE2E8F0)),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.02),
            blurRadius: 4,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Title & Rate Row
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                AppLocalization.get(title),
                style: const TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF0F172A),
                ),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text(
                    rate,
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w900,
                      color: Color(0xFF0F172A),
                    ),
                  ),
                  Text(
                    AppLocalization.get('/day'),
                    style: const TextStyle(
                      fontSize: 11,
                      color: Color(0xFF64748B),
                    ),
                  ),
                ],
              ),
            ],
          ),
          const SizedBox(height: 2),

          // Subtitle
          Text(
            AppLocalization.get(subtitle),
            style: const TextStyle(
              fontSize: 12.5,
              color: Color(0xFF64748B),
            ),
          ),
          const SizedBox(height: 14),

          // Request Button
          SizedBox(
            width: double.infinity,
            child: ElevatedButton(
              onPressed: onTap,
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFF047857),
                padding: const EdgeInsets.symmetric(vertical: 12),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
                elevation: 0,
              ),
              child: Text(
                AppLocalization.get('Request Equipment'),
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 13.5,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  // ── REUSABLE INFO BANNER ──────────────────────────────────────────────────
  Widget _buildInfoBanner({required String text}) {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: const Color(0xFFF0F7FF),
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: const Color(0xFFE0F2FE)),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Icon(Icons.info_outline, size: 16, color: Color(0xFF2563EB)),
          const SizedBox(width: 8),
          Expanded(
            child: Text(
              text,
              style: const TextStyle(
                fontSize: 12,
                color: Color(0xFF334155),
                height: 1.35,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
