import 'package:flutter/material.dart';
import 'package:dotted_border/dotted_border.dart';
import '../theme/colors.dart';
import '../utils/localization.dart';
import 'household_recommended_matches_screen.dart';

class HouseholdServiceMethodScreen extends StatefulWidget {
  final String service;
  final String description;
  final String date;
  final String time;
  final String location;
  final int workerCount;

  const HouseholdServiceMethodScreen({
    super.key,
    required this.service,
    required this.description,
    required this.date,
    required this.time,
    required this.location,
    required this.workerCount,
  });

  @override
  State<HouseholdServiceMethodScreen> createState() =>
      _HouseholdServiceMethodScreenState();
}

class _HouseholdServiceMethodScreenState
    extends State<HouseholdServiceMethodScreen> {
  // 'cooperative' or 'individual'
  String _selectedMethod = 'cooperative';

  void _onContinue() {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => HouseholdRecommendedMatchesScreen(
          service: widget.service,
          description: widget.description,
          date: widget.date,
          time: widget.time,
          location: widget.location,
          workerCount: widget.workerCount,
          initialMethod: _selectedMethod,
        ),
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
                Expanded(
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
                        const SizedBox(height: 20),
                        _buildIndividualWorkerOption(lang),
                        const SizedBox(height: 16),
                        _buildCooperativeOption(lang),
                        const SizedBox(height: 24),
                      ],
                    ),
                  ),
                ),
                _buildBottomBar(lang),
              ],
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
                AppLocalization.get('Step 2 of 2'),
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
          AppLocalization.get('How would you like to get this service?'),
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
              'Choose the option that works best for your request.'),
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
              Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                decoration: BoxDecoration(
                  color: const Color(0xFFF1F5F9),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
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
                  ],
                ),
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
                '${widget.date}, ${widget.time}',
                style: const TextStyle(fontSize: 11.5, color: Color(0xFF334155)),
              ),
              const SizedBox(width: 8),
              const Text('•', style: TextStyle(color: Color(0xFF94A3B8))),
              const SizedBox(width: 8),
              const Icon(Icons.people_outline,
                  size: 13, color: Color(0xFF64748B)),
              const SizedBox(width: 3),
              Text(
                '${widget.workerCount} ${AppLocalization.get('workers')}',
                style: const TextStyle(fontSize: 11.5, color: Color(0xFF334155)),
              ),
            ],
          ),
        ],
      ),
    );
  }

  // ── OPTION 1: INDIVIDUAL WORKER ──────────────────────────────────────────
  Widget _buildIndividualWorkerOption(String lang) {
    final isSelected = _selectedMethod == 'individual';

    return GestureDetector(
      onTap: () {
        setState(() {
          _selectedMethod = 'individual';
        });
      },
      child: Container(
        decoration: BoxDecoration(
          color: isSelected ? const Color(0xFFF0FDF4) : Colors.white,
          borderRadius: BorderRadius.circular(16),
          border: Border.all(
            color: isSelected
                ? const Color(0xFF16A34A)
                : const Color(0xFFE2E8F0),
            width: isSelected ? 1.5 : 1,
          ),
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
            // Header Row: Avatar, Badge & Radio
            Row(
              children: [
                Container(
                  width: 44,
                  height: 44,
                  decoration: BoxDecoration(
                    color: const Color(0xFFEFF6FF),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: const Center(
                    child: Text('👷', style: TextStyle(fontSize: 22)),
                  ),
                ),
                const SizedBox(width: 10),
                Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                  decoration: BoxDecoration(
                    color: const Color(0xFFF1F5F9),
                    borderRadius: BorderRadius.circular(6),
                  ),
                  child: Text(
                    AppLocalization.get('Best for simple jobs'),
                    style: const TextStyle(
                      fontSize: 11,
                      fontWeight: FontWeight.w600,
                      color: Color(0xFF475569),
                    ),
                  ),
                ),
                const Spacer(),
                // Radio indicator
                Container(
                  width: 22,
                  height: 22,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border: Border.all(
                      color: isSelected
                          ? const Color(0xFF16A34A)
                          : const Color(0xFFCBD5E1),
                      width: 2,
                    ),
                  ),
                  child: isSelected
                      ? Center(
                          child: Container(
                            width: 12,
                            height: 12,
                            decoration: const BoxDecoration(
                              shape: BoxShape.circle,
                              color: Color(0xFF16A34A),
                            ),
                          ),
                        )
                      : null,
                ),
              ],
            ),
            const SizedBox(height: 12),
            Text(
              AppLocalization.get('Find an Individual Worker'),
              style: const TextStyle(
                fontSize: 15,
                fontWeight: FontWeight.bold,
                color: Color(0xFF0F172A),
              ),
            ),
            const SizedBox(height: 4),
            Text(
              AppLocalization.get(
                  'Connect directly with a skilled worker for simple or smaller household jobs.'),
              style: const TextStyle(
                fontSize: 12,
                color: Color(0xFF64748B),
                height: 1.35,
              ),
            ),
            const SizedBox(height: 14),
            const Divider(height: 1, color: Color(0xFFF1F5F9)),
            const SizedBox(height: 12),
            _buildCheckPoint(AppLocalization.get('Skill Passport')),
            const SizedBox(height: 6),
            _buildCheckPoint(AppLocalization.get('Verified skills')),
            const SizedBox(height: 6),
            _buildCheckPoint(
                AppLocalization.get('Availability & location matching')),
          ],
        ),
      ),
    );
  }

  // ── OPTION 2: REQUEST THROUGH A COOPERATIVE ──────────────────────────────
  Widget _buildCooperativeOption(String lang) {
    final isSelected = _selectedMethod == 'cooperative';

    return GestureDetector(
      onTap: () {
        setState(() {
          _selectedMethod = 'cooperative';
        });
      },
      child: Container(
        decoration: BoxDecoration(
          color: isSelected ? const Color(0xFFF0FDF4) : Colors.white,
          borderRadius: BorderRadius.circular(16),
          border: Border.all(
            color: isSelected
                ? const Color(0xFF16A34A)
                : const Color(0xFFE2E8F0),
            width: isSelected ? 1.5 : 1,
          ),
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
            // Header Row: Avatar, Badge & Radio
            Row(
              children: [
                Container(
                  width: 44,
                  height: 44,
                  decoration: BoxDecoration(
                    color: const Color(0xFFECFDF5),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: const Center(
                    child: Text('🤝', style: TextStyle(fontSize: 22)),
                  ),
                ),
                const SizedBox(width: 10),
                Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                  decoration: BoxDecoration(
                    color: const Color(0xFFDCFCE7),
                    borderRadius: BorderRadius.circular(6),
                  ),
                  child: Text(
                    AppLocalization.get('Best for larger jobs'),
                    style: const TextStyle(
                      fontSize: 11,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF15803D),
                    ),
                  ),
                ),
                const Spacer(),
                // Radio indicator
                Container(
                  width: 22,
                  height: 22,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border: Border.all(
                      color: isSelected
                          ? const Color(0xFF16A34A)
                          : const Color(0xFFCBD5E1),
                      width: 2,
                    ),
                  ),
                  child: isSelected
                      ? Center(
                          child: Container(
                            width: 12,
                            height: 12,
                            decoration: const BoxDecoration(
                              shape: BoxShape.circle,
                              color: Color(0xFF16A34A),
                            ),
                          ),
                        )
                      : null,
                ),
              ],
            ),
            const SizedBox(height: 12),
            Text(
              AppLocalization.get('Request through a Cooperative'),
              style: const TextStyle(
                fontSize: 15,
                fontWeight: FontWeight.bold,
                color: Color(0xFF0F172A),
              ),
            ),
            const SizedBox(height: 4),
            Text(
              AppLocalization.get(
                  'Get coordinated workers from a verified local cooperative for larger or multi-worker jobs.'),
              style: const TextStyle(
                fontSize: 12,
                color: Color(0xFF64748B),
                height: 1.35,
              ),
            ),
            const SizedBox(height: 14),
            const Divider(height: 1, color: Color(0xFFF1F5F9)),
            const SizedBox(height: 12),
            _buildCheckPoint(AppLocalization.get('Verified cooperative')),
            const SizedBox(height: 6),
            _buildCheckPoint(AppLocalization.get('Coordinated workforce')),
            const SizedBox(height: 6),
            _buildCheckPoint(AppLocalization.get('Suitable for larger jobs')),
          ],
        ),
      ),
    );
  }

  Widget _buildCheckPoint(String text) {
    return Row(
      children: [
        const Icon(Icons.check, size: 14, color: Color(0xFF16A34A)),
        const SizedBox(width: 8),
        Text(
          text,
          style: const TextStyle(
            fontSize: 12,
            fontWeight: FontWeight.w500,
            color: Color(0xFF334155),
          ),
        ),
      ],
    );
  }

  // ── FIXED BOTTOM BAR ──────────────────────────────────────────────────────
  Widget _buildBottomBar(String lang) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.04),
            blurRadius: 10,
            offset: const Offset(0, -3),
          ),
        ],
      ),
      child: DottedBorder(
        options: RoundedRectDottedBorderOptions(
          color: const Color(0xFF93C5FD),
          dashPattern: const [5, 3],
          strokeWidth: 1.5,
          radius: const Radius.circular(10),
        ),
        child: SizedBox(
          width: double.infinity,
          child: ElevatedButton(
            onPressed: _onContinue,
            style: ElevatedButton.styleFrom(
              backgroundColor: const Color(0xFF1E3A5F),
              padding: const EdgeInsets.symmetric(vertical: 15),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8),
              ),
              elevation: 0,
            ),
            child: Text(
              AppLocalization.get('Continue →'),
              style: const TextStyle(
                fontSize: 15,
                fontWeight: FontWeight.bold,
                color: Colors.white,
                letterSpacing: 0.5,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
