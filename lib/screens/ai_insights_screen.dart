import 'package:flutter/material.dart';
import '../utils/localization.dart';
import 'cooperative_exchange_screen.dart';

class AiInsightsScreen extends StatefulWidget {
  final ValueChanged<int>? onTabSelected;

  const AiInsightsScreen({super.key, this.onTabSelected});

  @override
  State<AiInsightsScreen> createState() => _AiInsightsScreenState();
}

class _AiInsightsScreenState extends State<AiInsightsScreen> {
  int _bottomNavIndex = 4; // 'More' is highlighted

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
                // Top Header
                _buildHeader(context, lang),

                // Main Scrollable Content
                Expanded(
                  child: SingleChildScrollView(
                    physics: const BouncingScrollPhysics(),
                    padding: const EdgeInsets.symmetric(horizontal: 16.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const SizedBox(height: 12),

                        // 1. Demand Forecast Card
                        _buildDemandForecastCard(lang),
                        const SizedBox(height: 16),

                        // 2. Forecast Confidence Card
                        _buildForecastConfidenceCard(lang),
                        const SizedBox(height: 16),

                        // 3. Recommended Action Card
                        _buildRecommendedActionCard(context, lang),
                        const SizedBox(height: 20),

                        // 4. Workforce Gap Section
                        _buildWorkforceGapSection(lang),
                        const SizedBox(height: 16),

                        // 5. How this helps Card
                        _buildHowThisHelpsCard(lang),
                        const SizedBox(height: 24),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          bottomNavigationBar: _buildBottomNav(context),
        );
      },
    );
  }

  // ── HEADER ────────────────────────────────────────────────────────────────
  Widget _buildHeader(BuildContext context, String lang) {
    return Container(
      color: Colors.white,
      padding: const EdgeInsets.fromLTRB(12, 8, 16, 12),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              // Back button
              GestureDetector(
                onTap: () => Navigator.pop(context),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const Icon(Icons.arrow_back_ios_new, size: 14, color: Color(0xFF0F172A)),
                    const SizedBox(width: 4),
                    Text(
                      AppLocalization.get('Back'),
                      style: const TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w600,
                        color: Color(0xFF0F172A),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(width: 10),

              // Title: AI Workforce Insights
              Expanded(
                child: Text(
                  AppLocalization.get('AI Workforce Insights'),
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF0F172A),
                    letterSpacing: -0.2,
                  ),
                ),
              ),

              // AI-Assisted Pill
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 3),
                decoration: BoxDecoration(
                  color: const Color(0xFFEFF6FF),
                  borderRadius: BorderRadius.circular(6),
                  border: Border.all(color: const Color(0xFFBFDBFE)),
                ),
                child: Text(
                  AppLocalization.get('AI-Assisted'),
                  style: const TextStyle(
                    fontSize: 10,
                    fontWeight: FontWeight.w600,
                    color: Color(0xFF1D4ED8),
                  ),
                ),
              ),
              const SizedBox(width: 8),

              // EN | हिन्दी Toggle Pill
              GestureDetector(
                onTap: () => AppLocalization.toggleLanguage(),
                child: Container(
                  padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                  decoration: BoxDecoration(
                    color: const Color(0xFFF1F5F9),
                    borderRadius: BorderRadius.circular(16),
                    border: Border.all(color: const Color(0xFFE2E8F0)),
                  ),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        'EN',
                        style: TextStyle(
                          fontSize: 11,
                          fontWeight: lang == 'EN' ? FontWeight.bold : FontWeight.normal,
                          color: lang == 'EN' ? const Color(0xFF0F172A) : const Color(0xFF94A3B8),
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
                          color: lang == 'HI' ? const Color(0xFF0F172A) : const Color(0xFF94A3B8),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 8),
          Padding(
            padding: const EdgeInsets.only(left: 4.0),
            child: Text(
              AppLocalization.get('Use demand trends to plan your workforce.'),
              style: const TextStyle(
                fontSize: 12,
                color: Color(0xFF64748B),
                fontWeight: FontWeight.w400,
              ),
            ),
          ),
        ],
      ),
    );
  }

  // ── 1. DEMAND FORECAST CARD ───────────────────────────────────────────────
  Widget _buildDemandForecastCard(String lang) {
    return Container(
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
          // Top Row: Title + Next 7 Days
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                AppLocalization.get('Demand Forecast'),
                style: const TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF0F172A),
                ),
              ),
              Text(
                AppLocalization.get('Next 7 Days'),
                style: const TextStyle(
                  fontSize: 12,
                  color: Color(0xFF64748B),
                ),
              ),
            ],
          ),
          const SizedBox(height: 10),

          // Sub-row: Expected Service Demand + Weekly Outlook
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                AppLocalization.get('Expected Service Demand'),
                style: const TextStyle(
                  fontSize: 13,
                  fontWeight: FontWeight.w600,
                  color: Color(0xFF0F172A),
                ),
              ),
              Text(
                AppLocalization.get('Weekly Outlook'),
                style: const TextStyle(
                  fontSize: 11,
                  color: Color(0xFF94A3B8),
                ),
              ),
            ],
          ),
          const SizedBox(height: 14),

          // 7-day Bar Chart
          Container(
            padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 8),
            decoration: BoxDecoration(
              color: const Color(0xFFF8FAFC),
              borderRadius: BorderRadius.circular(12),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                _buildBar(AppLocalization.get('Mon'), 0.55, const Color(0xFF1E3A5F), isHighlight: false),
                _buildBar(AppLocalization.get('Tue'), 0.65, const Color(0xFF1E3A5F), isHighlight: false),
                _buildBar(AppLocalization.get('Wed'), 0.95, const Color(0xFF0E7044), isHighlight: true),
                _buildBar(AppLocalization.get('Thu'), 0.4, const Color(0xFF0E7044), isHighlight: true),
                _buildBar(AppLocalization.get('Fri'), 0.4, const Color(0xFF0E7044), isHighlight: true),
                _buildBar(AppLocalization.get('Sat'), 0.45, const Color(0xFF1E3A5F), isHighlight: false),
                _buildBar(AppLocalization.get('Sun'), 0.35, const Color(0xFFCBD5E1), isHighlight: false),
              ],
            ),
          ),
          const SizedBox(height: 16),

          // Trade Demand Trend Rows
          _buildTradePillRow(
            iconEmoji: '🎨',
            name: AppLocalization.get('Painting'),
            percentBadge: AppLocalization.get('+24% next week'),
            badgeBg: const Color(0xFFDCFCE7),
            badgeBorder: const Color(0xFF86EFAC),
            badgeText: const Color(0xFF15803D),
          ),
          const SizedBox(height: 10),
          _buildTradePillRow(
            iconEmoji: '⚡',
            name: AppLocalization.get('Electrical'),
            percentBadge: AppLocalization.get('+12% next week'),
            badgeBg: const Color(0xFFE0F2FE),
            badgeBorder: const Color(0xFF7DD3FC),
            badgeText: const Color(0xFF0284C7),
          ),
          const SizedBox(height: 10),
          _buildTradePillRow(
            iconEmoji: '🧱',
            name: AppLocalization.get('Masonry'),
            percentBadge: AppLocalization.get('+8% next week'),
            badgeBg: const Color(0xFFFEF3C7),
            badgeBorder: const Color(0xFFFDE68A),
            badgeText: const Color(0xFFB45309),
          ),
          const SizedBox(height: 14),

          // Footnote
          Center(
            child: Text(
              AppLocalization.get('Forecast based on recent service requests and historical demand.'),
              textAlign: TextAlign.center,
              style: const TextStyle(
                fontSize: 10.5,
                color: Color(0xFF94A3B8),
                height: 1.3,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildBar(String day, double heightFraction, Color color, {required bool isHighlight}) {
    const double maxHeight = 80;
    final barHeight = maxHeight * heightFraction;

    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          width: 24,
          height: barHeight < 4 ? 4 : barHeight,
          decoration: BoxDecoration(
            color: color,
            borderRadius: const BorderRadius.vertical(top: Radius.circular(4)),
          ),
        ),
        const SizedBox(height: 8),
        Text(
          day,
          style: TextStyle(
            fontSize: 11,
            fontWeight: isHighlight ? FontWeight.bold : FontWeight.w500,
            color: isHighlight ? const Color(0xFF0E7044) : const Color(0xFF64748B),
          ),
        ),
      ],
    );
  }

  Widget _buildTradePillRow({
    required String iconEmoji,
    required String name,
    required String percentBadge,
    required Color badgeBg,
    required Color badgeBorder,
    required Color badgeText,
  }) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            Text(iconEmoji, style: const TextStyle(fontSize: 15)),
            const SizedBox(width: 8),
            Text(
              name,
              style: const TextStyle(
                fontSize: 13.5,
                fontWeight: FontWeight.w600,
                color: Color(0xFF0F172A),
              ),
            ),
          ],
        ),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
          decoration: BoxDecoration(
            color: badgeBg,
            borderRadius: BorderRadius.circular(16),
            border: Border.all(color: badgeBorder),
          ),
          child: Text(
            percentBadge,
            style: TextStyle(
              fontSize: 11.5,
              fontWeight: FontWeight.bold,
              color: badgeText,
            ),
          ),
        ),
      ],
    );
  }

  // ── 2. FORECAST CONFIDENCE CARD ───────────────────────────────────────────
  Widget _buildForecastConfidenceCard(String lang) {
    return Container(
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
                AppLocalization.get('Forecast Confidence'),
                style: const TextStyle(
                  fontSize: 14.5,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF0F172A),
                ),
              ),
              const Text(
                '82%',
                style: TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF0E7044),
                ),
              ),
            ],
          ),
          const SizedBox(height: 10),

          // Progress Track
          ClipRRect(
            borderRadius: BorderRadius.circular(6),
            child: Container(
              height: 7,
              width: double.infinity,
              color: const Color(0xFFE2E8F0),
              alignment: Alignment.centerLeft,
              child: FractionallySizedBox(
                widthFactor: 0.82,
                child: Container(
                  color: const Color(0xFF0E7044),
                ),
              ),
            ),
          ),
          const SizedBox(height: 10),

          Text(
            AppLocalization.get('Higher confidence means stronger agreement between recent demand patterns and the forecast.'),
            style: const TextStyle(
              fontSize: 11.5,
              color: Color(0xFF64748B),
              height: 1.35,
            ),
          ),
          const SizedBox(height: 12),

          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 3.5),
                decoration: BoxDecoration(
                  color: const Color(0xFFEFF6FF),
                  borderRadius: BorderRadius.circular(6),
                  border: Border.all(color: const Color(0xFFDBEAFE)),
                ),
                child: Text(
                  AppLocalization.get('Prototype decision support model'),
                  style: const TextStyle(
                    fontSize: 10.5,
                    fontWeight: FontWeight.w500,
                    color: Color(0xFF2563EB),
                  ),
                ),
              ),
              Text(
                AppLocalization.get('Validated weekly'),
                style: const TextStyle(
                  fontSize: 11,
                  color: Color(0xFF94A3B8),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  // ── 3. RECOMMENDED ACTION CARD ────────────────────────────────────────────
  Widget _buildRecommendedActionCard(BuildContext context, String lang) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: const Color(0xFF107548), width: 1.2),
        boxShadow: [
          BoxShadow(
            color: const Color(0xFF107548).withValues(alpha: 0.04),
            blurRadius: 10,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Top pill + bulb icon
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 3),
                decoration: BoxDecoration(
                  color: const Color(0xFFDCFCE7),
                  borderRadius: BorderRadius.circular(6),
                  border: Border.all(color: const Color(0xFF86EFAC)),
                ),
                child: Text(
                  AppLocalization.get('RECOMMENDED ACTION'),
                  style: const TextStyle(
                    fontSize: 9.5,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF15803D),
                    letterSpacing: 0.3,
                  ),
                ),
              ),
              const Icon(Icons.lightbulb_outline, size: 18, color: Color(0xFFD97706)),
            ],
          ),
          const SizedBox(height: 12),

          Text(
            AppLocalization.get('Painting demand is expected to increase next week.'),
            style: const TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.bold,
              color: Color(0xFF0F172A),
              height: 1.3,
            ),
          ),
          const SizedBox(height: 6),

          Text(
            AppLocalization.get('Consider adding 4–6 painting workers to your available workforce to meet incoming opportunities.'),
            style: const TextStyle(
              fontSize: 12,
              color: Color(0xFF475569),
              height: 1.4,
            ),
          ),
          const SizedBox(height: 14),

          // Find Workforce → Button
          SizedBox(
            width: double.infinity,
            height: 42,
            child: ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const CooperativeExchangeScreen(showBackButton: true),
                  ),
                );
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFF0E7044),
                foregroundColor: Colors.white,
                elevation: 0,
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
              ),
              child: Text(
                AppLocalization.get('Find Workforce →'),
                style: const TextStyle(
                  fontSize: 13,
                  fontWeight: FontWeight.bold,
                  letterSpacing: 0.2,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  // ── 4. WORKFORCE GAP SECTION ──────────────────────────────────────────────
  Widget _buildWorkforceGapSection(String lang) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              AppLocalization.get('WORKFORCE GAP'),
              style: const TextStyle(
                fontSize: 12.5,
                fontWeight: FontWeight.bold,
                color: Color(0xFF334155),
                letterSpacing: 0.5,
              ),
            ),
            Text(
              AppLocalization.get('Next 7 Days'),
              style: const TextStyle(
                fontSize: 11.5,
                color: Color(0xFF94A3B8),
              ),
            ),
          ],
        ),
        const SizedBox(height: 10),

        // Painting Gap Card
        _buildGapItemCard(
          iconEmoji: '🎨',
          tradeName: AppLocalization.get('Painting'),
          gapBadge: '⚠️ ${AppLocalization.get('Gap: 5 workers')}',
          isWarning: true,
          requiredCount: '12',
          availableCount: '7',
          lang: lang,
        ),
        const SizedBox(height: 10),

        // Electrical Gap Card
        _buildGapItemCard(
          iconEmoji: '⚡',
          tradeName: AppLocalization.get('Electrical'),
          gapBadge: '⚠️ ${AppLocalization.get('Gap: 2 workers')}',
          isWarning: true,
          requiredCount: '8',
          availableCount: '6',
          lang: lang,
        ),
        const SizedBox(height: 10),

        // Masonry Gap Card
        _buildGapItemCard(
          iconEmoji: '🧱',
          tradeName: AppLocalization.get('Masonry'),
          gapBadge: 'ℹ️ ${AppLocalization.get('Gap: 1 worker')}',
          isWarning: false,
          requiredCount: '10',
          availableCount: '9',
          lang: lang,
        ),
      ],
    );
  }

  Widget _buildGapItemCard({
    required String iconEmoji,
    required String tradeName,
    required String gapBadge,
    required bool isWarning,
    required String requiredCount,
    required String availableCount,
    required String lang,
  }) {
    final badgeBg = isWarning ? const Color(0xFFFEF3C7) : const Color(0xFFE0F2FE);
    final badgeBorder = isWarning ? const Color(0xFFFDE68A) : const Color(0xFFBAE6FD);
    final badgeTextColor = isWarning ? const Color(0xFFB45309) : const Color(0xFF0369A1);

    return Container(
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
          // Top Row: Trade + Gap badge
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Text(iconEmoji, style: const TextStyle(fontSize: 15)),
                  const SizedBox(width: 8),
                  Text(
                    tradeName,
                    style: const TextStyle(
                      fontSize: 13.5,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF0F172A),
                    ),
                  ),
                ],
              ),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 9, vertical: 3.5),
                decoration: BoxDecoration(
                  color: badgeBg,
                  borderRadius: BorderRadius.circular(14),
                  border: Border.all(color: badgeBorder),
                ),
                child: Text(
                  gapBadge,
                  style: TextStyle(
                    fontSize: 11,
                    fontWeight: FontWeight.bold,
                    color: badgeTextColor,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 10),

          // Bottom Stats: Required & Available
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 7),
            decoration: BoxDecoration(
              color: const Color(0xFFF8FAFC),
              borderRadius: BorderRadius.circular(8),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Text(
                      AppLocalization.get('Required:'),
                      style: const TextStyle(
                        fontSize: 12,
                        color: Color(0xFF64748B),
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    const SizedBox(width: 6),
                    Text(
                      requiredCount,
                      style: const TextStyle(
                        fontSize: 13,
                        fontWeight: FontWeight.bold,
                        color: Color(0xFF0F172A),
                      ),
                    ),
                  ],
                ),
                Row(
                  children: [
                    Text(
                      AppLocalization.get('Available:'),
                      style: const TextStyle(
                        fontSize: 12,
                        color: Color(0xFF64748B),
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    const SizedBox(width: 6),
                    Text(
                      availableCount,
                      style: const TextStyle(
                        fontSize: 13,
                        fontWeight: FontWeight.bold,
                        color: Color(0xFF0F172A),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  // ── 5. HOW THIS HELPS CARD ────────────────────────────────────────────────
  Widget _buildHowThisHelpsCard(String lang) {
    return Container(
      decoration: BoxDecoration(
        color: const Color(0xFFF0F7FF),
        borderRadius: BorderRadius.circular(14),
        border: Border.all(color: const Color(0xFFDBEAFE)),
      ),
      padding: const EdgeInsets.all(14),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Container(
                padding: const EdgeInsets.all(2),
                decoration: BoxDecoration(
                  color: const Color(0xFF93C5FD),
                  borderRadius: BorderRadius.circular(4),
                ),
                child: const Icon(Icons.info, size: 14, color: Colors.white),
              ),
              const SizedBox(width: 8),
              Text(
                AppLocalization.get('How this helps'),
                style: const TextStyle(
                  fontSize: 13,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF1E3A8A),
                ),
              ),
            ],
          ),
          const SizedBox(height: 8),
          Text(
            AppLocalization.get('SAHYOG compares expected service demand with available cooperative workers to highlight potential workforce gaps before projects begin.'),
            style: const TextStyle(
              fontSize: 11.5,
              color: Color(0xFF1E293B),
              height: 1.4,
            ),
          ),
          const SizedBox(height: 8),
          Text(
            AppLocalization.get('Decision support — final workforce decisions remain with the cooperative.'),
            style: const TextStyle(
              fontSize: 10.5,
              color: Color(0xFF64748B),
              height: 1.3,
            ),
          ),
        ],
      ),
    );
  }

  // ── BOTTOM NAVIGATION ─────────────────────────────────────────────────────
  Widget _buildBottomNav(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.05),
            blurRadius: 10,
            offset: const Offset(0, -5),
          ),
        ],
      ),
      child: BottomNavigationBar(
        currentIndex: _bottomNavIndex,
        type: BottomNavigationBarType.fixed,
        selectedItemColor: const Color(0xFF0F172A),
        unselectedItemColor: const Color(0xFF64748B),
        selectedFontSize: 11,
        unselectedFontSize: 11,
        onTap: (index) {
          widget.onTabSelected?.call(index);
          Navigator.pop(context, index);
        },
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home_outlined),
            activeIcon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.assignment_outlined),
            activeIcon: Icon(Icons.assignment),
            label: 'Requests',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.people_outline),
            activeIcon: Icon(Icons.people),
            label: 'Workers',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.business_center_outlined),
            activeIcon: Icon(Icons.business_center),
            label: 'Projects',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.more_horiz),
            activeIcon: Icon(Icons.more_horiz),
            label: 'More',
          ),
        ],
      ),
    );
  }
}
