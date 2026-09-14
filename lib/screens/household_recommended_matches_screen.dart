import 'package:flutter/material.dart';
import 'package:dotted_border/dotted_border.dart';
import '../theme/colors.dart';
import '../utils/localization.dart';
import 'household_track_service_screen.dart';

class HouseholdRecommendedMatchesScreen extends StatefulWidget {
  final String service;
  final String description;
  final String date;
  final String time;
  final String location;
  final int workerCount;
  final String initialMethod;

  const HouseholdRecommendedMatchesScreen({
    super.key,
    required this.service,
    required this.description,
    required this.date,
    required this.time,
    required this.location,
    required this.workerCount,
    this.initialMethod = 'cooperative',
  });

  @override
  State<HouseholdRecommendedMatchesScreen> createState() =>
      _HouseholdRecommendedMatchesScreenState();
}

class _HouseholdRecommendedMatchesScreenState
    extends State<HouseholdRecommendedMatchesScreen> {
  late bool _showCooperative;

  @override
  void initState() {
    super.initState();
    _showCooperative = widget.initialMethod == 'cooperative';
  }

  void _onSelectMatch({
    required String name,
    required String price,
    required bool isCoop,
  }) {
    showModalBottomSheet(
      context: context,
      backgroundColor: Colors.transparent,
      isScrollControlled: true,
      builder: (context) {
        return Container(
          decoration: const BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.vertical(top: Radius.circular(24)),
          ),
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Drag handle
              Center(
                child: Container(
                  width: 44,
                  height: 4,
                  decoration: BoxDecoration(
                    color: const Color(0xFFCBD5E1),
                    borderRadius: BorderRadius.circular(4),
                  ),
                ),
              ),
              const SizedBox(height: 18),

              // Match Selected Badge
              Row(
                children: [
                  const Icon(Icons.check_circle,
                      size: 18, color: Color(0xFF16A34A)),
                  const SizedBox(width: 8),
                  Text(
                    AppLocalization.get('MATCH SELECTED'),
                    style: const TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.w800,
                      letterSpacing: 0.5,
                      color: Color(0xFF16A34A),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 8),

              // Title
              Text(
                '$name ($price)',
                style: const TextStyle(
                  fontSize: 17,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF0F172A),
                ),
              ),
              const SizedBox(height: 6),

              // Description
              Text(
                '${AppLocalization.get('Selected')} ${isCoop ? AppLocalization.get('Cooperative') : AppLocalization.get('Worker')}. ${AppLocalization.get('Carrying forward')} ${AppLocalization.get(widget.service)} ${AppLocalization.get('request details')} (${widget.location} • ${widget.date}, ${widget.time} • ${widget.workerCount} ${AppLocalization.get('workers')}) ${AppLocalization.get('to confirmation.')}',
                style: const TextStyle(
                  fontSize: 12.5,
                  color: Color(0xFF64748B),
                  height: 1.4,
                ),
              ),
              const SizedBox(height: 24),

              // Buttons Row: Change & Proceed
              Row(
                children: [
                  Expanded(
                    child: OutlinedButton(
                      onPressed: () => Navigator.pop(context),
                      style: OutlinedButton.styleFrom(
                        padding: const EdgeInsets.symmetric(vertical: 14),
                        side: const BorderSide(color: Color(0xFFCBD5E1)),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        backgroundColor: Colors.white,
                      ),
                      child: Text(
                        AppLocalization.get('Change'),
                        style: const TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                          color: Color(0xFF0F172A),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: ElevatedButton(
                      onPressed: () {
                        Navigator.pop(context); // close bottom sheet
                        // Navigate to Track Your Service
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => HouseholdTrackServiceScreen(
                              bookingId: '#SHG-8842',
                              serviceTitle: '${widget.service} Service',
                              serviceSub: widget.description,
                              amount: price,
                              location: widget.location,
                              dateTime: '${widget.date} • ${widget.time}',
                              workerCount: widget.workerCount,
                            ),
                          ),
                        );
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xFF1E3A5F),
                        padding: const EdgeInsets.symmetric(vertical: 14),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        elevation: 0,
                      ),
                      child: Text(
                        AppLocalization.get('proceed'),
                        style: const TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                          letterSpacing: 0.5,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 12),
            ],
          ),
        );
      },
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
                  _buildTopHeader(context, lang),
                  const SizedBox(height: 16),
                  _buildTitleSection(lang),
                  const SizedBox(height: 16),
                  _buildSummaryCard(context, lang),
                  const SizedBox(height: 18),
                  _buildSegmentedToggle(lang),
                  const SizedBox(height: 20),
                  if (_showCooperative) ...[
                    _buildCooperativeSectionHeader(lang),
                    const SizedBox(height: 14),
                    _buildCoopCard1(lang),
                    const SizedBox(height: 16),
                    _buildCoopCard2(lang),
                  ] else ...[
                    _buildWorkersSectionHeader(lang),
                    const SizedBox(height: 14),
                    _buildWorkerCard1(lang),
                    const SizedBox(height: 16),
                    _buildWorkerCard2(lang),
                  ],
                  const SizedBox(height: 28),
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  // ── TOP HEADER ───────────────────────────────────────────────────────────
  Widget _buildTopHeader(BuildContext context, String lang) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        GestureDetector(
          onTap: () => Navigator.pop(context),
          child: DottedBorder(
            options: RoundedRectDottedBorderOptions(
              color: const Color(0xFF93C5FD),
              dashPattern: const [4, 3],
              strokeWidth: 1.5,
              radius: const Radius.circular(8),
            ),
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
              color: Colors.white,
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
                      fontWeight: FontWeight.w600,
                      color: Color(0xFF1E3A8A),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
          decoration: BoxDecoration(
            color: const Color(0xFFECFDF5),
            borderRadius: BorderRadius.circular(20),
            border: Border.all(color: const Color(0xFFA7F3D0)),
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                width: 7,
                height: 7,
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  color: Color(0xFF059669),
                ),
              ),
              const SizedBox(width: 5),
              Text(
                AppLocalization.get('Matching Active'),
                style: const TextStyle(
                  fontSize: 11.5,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF059669),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  // ── TITLE SECTION ────────────────────────────────────────────────────────
  Widget _buildTitleSection(String lang) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          AppLocalization.get('Recommended Matches'),
          style: const TextStyle(
            fontSize: 22,
            fontWeight: FontWeight.bold,
            color: Color(0xFF0F172A),
            letterSpacing: -0.5,
          ),
        ),
        const SizedBox(height: 4),
        Text(
          AppLocalization.get(
              'Based on your service, location, skills and availability.'),
          style: const TextStyle(
            fontSize: 13,
            color: Color(0xFF64748B),
          ),
        ),
      ],
    );
  }

  // ── SUMMARY CARD ─────────────────────────────────────────────────────────
  Widget _buildSummaryCard(BuildContext context, String lang) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(14),
        border: Border.all(color: const Color(0xFFE2E8F0)),
      ),
      padding: const EdgeInsets.all(14),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Text(_getServiceEmoji(widget.service)),
                  const SizedBox(width: 6),
                  Text(
                    AppLocalization.get(widget.service),
                    style: const TextStyle(
                      fontSize: 13,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF0F172A),
                    ),
                  ),
                  const SizedBox(width: 8),
                  Container(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
                    decoration: BoxDecoration(
                      color: const Color(0xFFF1F5F9),
                      borderRadius: BorderRadius.circular(6),
                    ),
                    child: Text(
                      '${widget.workerCount} ${AppLocalization.get('workers')}',
                      style: const TextStyle(
                        fontSize: 11,
                        color: Color(0xFF475569),
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ],
              ),
              GestureDetector(
                onTap: () => Navigator.pop(context),
                child: Row(
                  children: [
                    Text(
                      AppLocalization.get('Edit Request'),
                      style: const TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.bold,
                        color: Color(0xFF059669),
                      ),
                    ),
                    const SizedBox(width: 3),
                    const Icon(Icons.edit_outlined,
                        size: 13, color: Color(0xFF059669)),
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(height: 10),
          Row(
            children: [
              const Icon(Icons.location_on_outlined,
                  size: 14, color: Color(0xFFDC2626)),
              const SizedBox(width: 4),
              Text(
                AppLocalization.get(widget.location),
                style: const TextStyle(fontSize: 11.5, color: Color(0xFF334155)),
              ),
              const SizedBox(width: 8),
              const Text('•', style: TextStyle(color: Color(0xFF94A3B8))),
              const SizedBox(width: 8),
              const Icon(Icons.calendar_today_outlined,
                  size: 12, color: Color(0xFF64748B)),
              const SizedBox(width: 4),
              Text(
                '${widget.date} • ${widget.time}',
                style: const TextStyle(fontSize: 11.5, color: Color(0xFF334155)),
              ),
            ],
          ),
        ],
      ),
    );
  }

  String _getServiceEmoji(String service) {
    switch (service) {
      case 'Plumbing':
        return '🔧';
      case 'Painting':
        return '🎨';
      case 'Electrical':
        return '⚡';
      case 'Carpentry':
        return '🪚';
      case 'Cleaning':
        return '🧹';
      case 'Gardening':
        return '🌱';
      case 'General Labour':
        return '👷';
      default:
        return '🛠️';
    }
  }

  // ── SEGMENTED TOGGLE ─────────────────────────────────────────────────────
  Widget _buildSegmentedToggle(String lang) {
    return Container(
      decoration: BoxDecoration(
        color: const Color(0xFFF1F5F9),
        borderRadius: BorderRadius.circular(10),
      ),
      padding: const EdgeInsets.all(4),
      child: Row(
        children: [
          Expanded(
            child: GestureDetector(
              onTap: () => setState(() => _showCooperative = true),
              child: Container(
                padding: const EdgeInsets.symmetric(vertical: 9),
                decoration: BoxDecoration(
                  color: _showCooperative
                      ? const Color(0xFF1E293B)
                      : Colors.transparent,
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text('🤝', style: TextStyle(fontSize: 13)),
                    const SizedBox(width: 6),
                    Text(
                      AppLocalization.get('Cooperative Workforce'),
                      style: TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.bold,
                        color: _showCooperative
                            ? Colors.white
                            : const Color(0xFF64748B),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          Expanded(
            child: GestureDetector(
              onTap: () => setState(() => _showCooperative = false),
              child: Container(
                padding: const EdgeInsets.symmetric(vertical: 9),
                decoration: BoxDecoration(
                  color: !_showCooperative
                      ? const Color(0xFF1E293B)
                      : Colors.transparent,
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text('👷', style: TextStyle(fontSize: 13)),
                    const SizedBox(width: 6),
                    Text(
                      AppLocalization.get('Individual Workers'),
                      style: TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.bold,
                        color: !_showCooperative
                            ? Colors.white
                            : const Color(0xFF64748B),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  // ── COOPERATIVE SECTION HEADER ───────────────────────────────────────────
  Widget _buildCooperativeSectionHeader(String lang) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          AppLocalization.get('RECOMMENDED COOPERATIVES'),
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
            borderRadius: BorderRadius.circular(10),
            border: Border.all(color: const Color(0xFFA7F3D0)),
          ),
          child: Text(
            AppLocalization.get('2 Verified Matches'),
            style: const TextStyle(
              fontSize: 11,
              fontWeight: FontWeight.bold,
              color: Color(0xFF059669),
            ),
          ),
        ),
      ],
    );
  }

  // ── COOPERATIVE CARD 1: NIRMAN SHRAMIK (95% Match) ───────────────────────
  Widget _buildCoopCard1(String lang) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: const Color(0xFF16A34A), width: 1.5),
        boxShadow: [
          BoxShadow(
            color: const Color(0xFF16A34A).withOpacity(0.06),
            blurRadius: 10,
            offset: const Offset(0, 4),
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
                AppLocalization.get('Nirman Shramik Cooperative'),
                style: const TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF0F172A),
                ),
              ),
              Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                decoration: BoxDecoration(
                  color: const Color(0xFFDCFCE7),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Text(
                  AppLocalization.get('95% Match'),
                  style: const TextStyle(
                    fontSize: 11,
                    fontWeight: FontWeight.w800,
                    color: Color(0xFF15803D),
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 6),
          Row(
            children: [
              Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
                decoration: BoxDecoration(
                  color: const Color(0xFFECFDF5),
                  borderRadius: BorderRadius.circular(6),
                ),
                child: Row(
                  children: [
                    const Icon(Icons.check_circle,
                        size: 12, color: Color(0xFF059669)),
                    const SizedBox(width: 4),
                    Text(
                      AppLocalization.get('Verified Cooperative'),
                      style: const TextStyle(
                        fontSize: 10.5,
                        fontWeight: FontWeight.bold,
                        color: Color(0xFF059669),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(width: 8),
              const Text('•', style: TextStyle(color: Color(0xFF94A3B8))),
              const SizedBox(width: 8),
              Text(
                AppLocalization.get('24 skilled workers'),
                style: const TextStyle(fontSize: 11.5, color: Color(0xFF64748B)),
              ),
            ],
          ),
          const SizedBox(height: 8),
          Text(
            AppLocalization.get('Painting • Construction • General Labour'),
            style: const TextStyle(fontSize: 12, color: Color(0xFF475569)),
          ),
          const SizedBox(height: 12),

          // WHY MATCHED BOX
          Container(
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: const Color(0xFFF8FAFC),
              borderRadius: BorderRadius.circular(10),
              border: Border.all(color: const Color(0xFFE2E8F0)),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  AppLocalization.get('WHY MATCHED'),
                  style: const TextStyle(
                    fontSize: 10.5,
                    fontWeight: FontWeight.w800,
                    letterSpacing: 0.5,
                    color: Color(0xFF64748B),
                  ),
                ),
                const SizedBox(height: 8),
                Row(
                  children: [
                    Expanded(
                        child: _buildMatchCheck(
                            AppLocalization.get('Required workforce available'))),
                    const SizedBox(width: 8),
                    Expanded(
                        child: _buildMatchCheck(
                            AppLocalization.get('Required skills available'))),
                  ],
                ),
                const SizedBox(height: 6),
                Row(
                  children: [
                    Expanded(
                        child: _buildMatchCheck(
                            AppLocalization.get('Nearby (Dwarka cluster)'))),
                    const SizedBox(width: 8),
                    Expanded(
                        child: _buildMatchCheck(
                            AppLocalization.get('Available on 18 Sep'))),
                  ],
                ),
              ],
            ),
          ),
          const SizedBox(height: 14),

          // Cost & Button
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    AppLocalization.get('ESTIMATED SERVICE COST'),
                    style: const TextStyle(
                      fontSize: 10,
                      fontWeight: FontWeight.w700,
                      color: Color(0xFF64748B),
                    ),
                  ),
                  const SizedBox(height: 2),
                  Row(
                    children: [
                      const Text(
                        '₹3,000',
                        style: TextStyle(
                          fontSize: 17,
                          fontWeight: FontWeight.w900,
                          color: Color(0xFF0F172A),
                        ),
                      ),
                      const SizedBox(width: 4),
                      Text(
                        '(${widget.workerCount} ${AppLocalization.get('workers')})',
                        style: const TextStyle(
                          fontSize: 11,
                          color: Color(0xFF64748B),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              GestureDetector(
                onTap: () => _onSelectMatch(
                  name: 'Nirman Shramik Cooperative',
                  price: '₹3,000',
                  isCoop: true,
                ),
                child: DottedBorder(
                  options: RoundedRectDottedBorderOptions(
                    color: const Color(0xFF93C5FD),
                    dashPattern: const [4, 3],
                    strokeWidth: 1.5,
                    radius: const Radius.circular(8),
                  ),
                  child: Container(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 14, vertical: 8),
                    decoration: BoxDecoration(
                      color: const Color(0xFF1E3A5F),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(
                          AppLocalization.get('View & Select >'),
                          style: const TextStyle(
                            fontSize: 12.5,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  // ── COOPERATIVE CARD 2: DELHI WORKERS (88% Match) ────────────────────────
  Widget _buildCoopCard2(String lang) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: const Color(0xFFE2E8F0)),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.02),
            blurRadius: 6,
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
                AppLocalization.get('Delhi Workers Cooperative'),
                style: const TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF0F172A),
                ),
              ),
              Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                decoration: BoxDecoration(
                  color: const Color(0xFFF1F5F9),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Text(
                  AppLocalization.get('88% Match'),
                  style: const TextStyle(
                    fontSize: 11,
                    fontWeight: FontWeight.w800,
                    color: Color(0xFF334155),
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 6),
          Row(
            children: [
              Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
                decoration: BoxDecoration(
                  color: const Color(0xFFECFDF5),
                  borderRadius: BorderRadius.circular(6),
                ),
                child: Row(
                  children: [
                    const Icon(Icons.check_circle,
                        size: 12, color: Color(0xFF059669)),
                    const SizedBox(width: 4),
                    Text(
                      AppLocalization.get('Verified Cooperative'),
                      style: const TextStyle(
                        fontSize: 10.5,
                        fontWeight: FontWeight.bold,
                        color: Color(0xFF059669),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(width: 8),
              const Text('•', style: TextStyle(color: Color(0xFF94A3B8))),
              const SizedBox(width: 8),
              Text(
                AppLocalization.get('18 skilled workers'),
                style: const TextStyle(fontSize: 11.5, color: Color(0xFF64748B)),
              ),
            ],
          ),
          const SizedBox(height: 8),
          Text(
            AppLocalization.get('Painting • Electrical • Maintenance'),
            style: const TextStyle(fontSize: 12, color: Color(0xFF475569)),
          ),
          const SizedBox(height: 12),

          // MATCH HIGHLIGHTS
          Container(
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: const Color(0xFFF8FAFC),
              borderRadius: BorderRadius.circular(10),
              border: Border.all(color: const Color(0xFFE2E8F0)),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  AppLocalization.get('MATCH HIGHLIGHTS'),
                  style: const TextStyle(
                    fontSize: 10.5,
                    fontWeight: FontWeight.w800,
                    letterSpacing: 0.5,
                    color: Color(0xFF64748B),
                  ),
                ),
                const SizedBox(height: 8),
                Row(
                  children: [
                    Expanded(
                        child: _buildMatchCheck(
                            AppLocalization.get('Workforce coordinated'))),
                    const SizedBox(width: 8),
                    Expanded(
                        child: _buildMatchCheck(
                            AppLocalization.get('Verified track record'))),
                  ],
                ),
              ],
            ),
          ),
          const SizedBox(height: 14),

          // Cost & Button
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    AppLocalization.get('ESTIMATED SERVICE COST'),
                    style: const TextStyle(
                      fontSize: 10,
                      fontWeight: FontWeight.w700,
                      color: Color(0xFF64748B),
                    ),
                  ),
                  const SizedBox(height: 2),
                  Row(
                    children: [
                      const Text(
                        '₹3,200',
                        style: TextStyle(
                          fontSize: 17,
                          fontWeight: FontWeight.w900,
                          color: Color(0xFF0F172A),
                        ),
                      ),
                      const SizedBox(width: 4),
                      Text(
                        '(${widget.workerCount} ${AppLocalization.get('workers')})',
                        style: const TextStyle(
                          fontSize: 11,
                          color: Color(0xFF64748B),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              OutlinedButton(
                onPressed: () => _onSelectMatch(
                  name: 'Delhi Workers Cooperative',
                  price: '₹3,200',
                  isCoop: true,
                ),
                style: OutlinedButton.styleFrom(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 14, vertical: 8),
                  side: const BorderSide(color: Color(0xFF1E3A5F)),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
                child: Text(
                  AppLocalization.get('View & Select >'),
                  style: const TextStyle(
                    fontSize: 12.5,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF1E3A5F),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  // ── INDIVIDUAL WORKERS TAB CONTENT ────────────────────────────────────────
  Widget _buildWorkersSectionHeader(String lang) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          AppLocalization.get('AVAILABLE INDIVIDUAL WORKERS'),
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
            borderRadius: BorderRadius.circular(10),
            border: Border.all(color: const Color(0xFFA7F3D0)),
          ),
          child: Text(
            AppLocalization.get('Nearby Verified'),
            style: const TextStyle(
              fontSize: 11,
              fontWeight: FontWeight.bold,
              color: Color(0xFF059669),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildWorkerCard1(String lang) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: const Color(0xFF16A34A), width: 1.5),
        boxShadow: [
          BoxShadow(
            color: const Color(0xFF16A34A).withOpacity(0.06),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Container(
                width: 40,
                height: 40,
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  color: Color(0xFF0F172A),
                ),
                child: const Center(
                  child: Text(
                    'RK',
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 14,
                    ),
                  ),
                ),
              ),
              const SizedBox(width: 10),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      AppLocalization.get('Ramlal Kumar (Lead)'),
                      style: const TextStyle(
                        fontSize: 14.5,
                        fontWeight: FontWeight.bold,
                        color: Color(0xFF0F172A),
                      ),
                    ),
                    const SizedBox(height: 2),
                    Text(
                      AppLocalization.get('5 yrs exp • Skill Passport Active'),
                      style: const TextStyle(
                          fontSize: 11.5, color: Color(0xFF64748B)),
                    ),
                  ],
                ),
              ),
              Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                decoration: BoxDecoration(
                  color: const Color(0xFFDCFCE7),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Text(
                  AppLocalization.get('96% Match'),
                  style: const TextStyle(
                    fontSize: 11,
                    fontWeight: FontWeight.w800,
                    color: Color(0xFF15803D),
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 14),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    AppLocalization.get('ESTIMATED SERVICE COST'),
                    style: const TextStyle(
                      fontSize: 10,
                      fontWeight: FontWeight.w700,
                      color: Color(0xFF64748B),
                    ),
                  ),
                  const SizedBox(height: 2),
                  const Text(
                    '₹1,550',
                    style: TextStyle(
                      fontSize: 17,
                      fontWeight: FontWeight.w900,
                      color: Color(0xFF0F172A),
                    ),
                  ),
                ],
              ),
              GestureDetector(
                onTap: () => _onSelectMatch(
                  name: 'Ramlal Kumar',
                  price: '₹1,550',
                  isCoop: false,
                ),
                child: DottedBorder(
                  options: RoundedRectDottedBorderOptions(
                    color: const Color(0xFF93C5FD),
                    dashPattern: const [4, 3],
                    strokeWidth: 1.5,
                    radius: const Radius.circular(8),
                  ),
                  child: Container(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 14, vertical: 8),
                    decoration: BoxDecoration(
                      color: const Color(0xFF1E3A5F),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Text(
                      AppLocalization.get('View & Select >'),
                      style: const TextStyle(
                        fontSize: 12.5,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildWorkerCard2(String lang) {
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
          Row(
            children: [
              Container(
                width: 40,
                height: 40,
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  color: Color(0xFF334155),
                ),
                child: const Center(
                  child: Text(
                    'SV',
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 14,
                    ),
                  ),
                ),
              ),
              const SizedBox(width: 10),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      AppLocalization.get('Suresh Verma'),
                      style: const TextStyle(
                        fontSize: 14.5,
                        fontWeight: FontWeight.bold,
                        color: Color(0xFF0F172A),
                      ),
                    ),
                    const SizedBox(height: 2),
                    Text(
                      AppLocalization.get('7 yrs exp • Verified Master'),
                      style: const TextStyle(
                          fontSize: 11.5, color: Color(0xFF64748B)),
                    ),
                  ],
                ),
              ),
              Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                decoration: BoxDecoration(
                  color: const Color(0xFFF1F5F9),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Text(
                  AppLocalization.get('91% Match'),
                  style: const TextStyle(
                    fontSize: 11,
                    fontWeight: FontWeight.w800,
                    color: Color(0xFF334155),
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 14),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    AppLocalization.get('ESTIMATED SERVICE COST'),
                    style: const TextStyle(
                      fontSize: 10,
                      fontWeight: FontWeight.w700,
                      color: Color(0xFF64748B),
                    ),
                  ),
                  const SizedBox(height: 2),
                  const Text(
                    '₹1,600',
                    style: TextStyle(
                      fontSize: 17,
                      fontWeight: FontWeight.w900,
                      color: Color(0xFF0F172A),
                    ),
                  ),
                ],
              ),
              OutlinedButton(
                onPressed: () => _onSelectMatch(
                  name: 'Suresh Verma',
                  price: '₹1,600',
                  isCoop: false,
                ),
                style: OutlinedButton.styleFrom(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 14, vertical: 8),
                  side: const BorderSide(color: Color(0xFF1E3A5F)),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
                child: Text(
                  AppLocalization.get('View & Select >'),
                  style: const TextStyle(
                    fontSize: 12.5,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF1E3A5F),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildMatchCheck(String text) {
    return Row(
      children: [
        const Icon(Icons.check, size: 13, color: Color(0xFF16A34A)),
        const SizedBox(width: 4),
        Expanded(
          child: Text(
            text,
            style: const TextStyle(fontSize: 11, color: Color(0xFF334155)),
            overflow: TextOverflow.ellipsis,
          ),
        ),
      ],
    );
  }
}
