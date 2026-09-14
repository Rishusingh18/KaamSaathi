import 'package:flutter/material.dart';
import 'package:dotted_border/dotted_border.dart';
import '../theme/colors.dart';
import '../utils/localization.dart';
import 'household_service_completion_screen.dart';

class HouseholdTrackServiceScreen extends StatefulWidget {
  final String bookingId;
  final String serviceTitle;
  final String serviceSub;
  final String amount;
  final String location;
  final String dateTime;
  final int workerCount;

  const HouseholdTrackServiceScreen({
    super.key,
    this.bookingId = '#SHG-8842',
    this.serviceTitle = 'Painting Service',
    this.serviceSub = 'Interior wall painting (2 rooms)',
    this.amount = '₹1,550',
    this.location = 'Dwarka, Delhi',
    this.dateTime = '18 Sep • 10:00 AM',
    this.workerCount = 2,
  });

  @override
  State<HouseholdTrackServiceScreen> createState() =>
      _HouseholdTrackServiceScreenState();
}

class _HouseholdTrackServiceScreenState
    extends State<HouseholdTrackServiceScreen> {
  // 3: Worker Assigned, 4: In Progress, 5: Completed
  int _currentStage = 3;
  bool _isCooperative = true;

  void _nextStage() {
    setState(() {
      if (_currentStage == 3) {
        _currentStage = 4;
      } else if (_currentStage == 4) {
        _currentStage = 5;
      } else {
        _currentStage = 3;
      }
    });
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
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(height: 10),
                    _buildTopHeader(context, lang),
                    const SizedBox(height: 18),
                    _buildTitleSection(lang),
                    const SizedBox(height: 16),
                    _buildServiceSummaryCard(lang),
                    const SizedBox(height: 16),
                    _buildServiceProgressCard(lang),
                    const SizedBox(height: 16),
                    _buildServiceProviderCard(lang),
                    const SizedBox(height: 16),
                    _buildWorkDetailsCard(lang),
                    const SizedBox(height: 16),
                    _buildPaymentCard(lang),
                    const SizedBox(height: 20),
                    _buildActionButtons(context, lang),
                    const SizedBox(height: 12),
                    _buildViewDetailsButton(context, lang),
                    const SizedBox(height: 28),
                    _buildFooter(lang),
                    const SizedBox(height: 24),
                  ],
                ),
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
        // Back button with dotted border
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

        // Center Switch Pill (Cooperative / Individual)
        GestureDetector(
          onTap: () {
            setState(() {
              _isCooperative = !_isCooperative;
            });
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text(
                  _isCooperative
                      ? AppLocalization.get('Switched to Cooperative view')
                      : AppLocalization.get('Switched to Direct Worker view'),
                ),
                duration: const Duration(seconds: 1),
                behavior: SnackBarBehavior.floating,
              ),
            );
          },
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(20),
              border: Border.all(color: const Color(0xFFE2E8F0)),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.02),
                  blurRadius: 4,
                  offset: const Offset(0, 2),
                )
              ],
            ),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  _isCooperative ? '🤝' : '👷',
                  style: const TextStyle(fontSize: 13),
                ),
                const SizedBox(width: 4),
                Text(
                  _isCooperative
                      ? AppLocalization.get('Cooperative ⇄ Switch')
                      : AppLocalization.get('Worker ⇄ Switch'),
                  style: const TextStyle(
                    fontSize: 11.5,
                    fontWeight: FontWeight.w600,
                    color: Color(0xFF334155),
                  ),
                ),
              ],
            ),
          ),
        ),

        // Right Status Pill (Confirmed / In Progress / Completed)
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
          decoration: BoxDecoration(
            color: _currentStage == 5
                ? const Color(0xFFF0FDF4)
                : const Color(0xFFECFDF5),
            borderRadius: BorderRadius.circular(20),
            border: Border.all(
              color: _currentStage == 5
                  ? const Color(0xFF86EFAC)
                  : const Color(0xFFA7F3D0),
            ),
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                width: 7,
                height: 7,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: _currentStage == 5
                      ? const Color(0xFF16A34A)
                      : const Color(0xFF059669),
                ),
              ),
              const SizedBox(width: 5),
              Text(
                _currentStage == 5
                    ? AppLocalization.get('Completed')
                    : _currentStage == 4
                        ? AppLocalization.get('In Progress')
                        : AppLocalization.get('Confirmed'),
                style: TextStyle(
                  fontSize: 11.5,
                  fontWeight: FontWeight.bold,
                  color: _currentStage == 5
                      ? const Color(0xFF16A34A)
                      : const Color(0xFF059669),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  // ── TITLE & ID SECTION ───────────────────────────────────────────────────
  Widget _buildTitleSection(String lang) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                AppLocalization.get('Track Your Service'),
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
                    'Real-time status of your household service booking'),
                style: const TextStyle(
                  fontSize: 12.5,
                  color: Color(0xFF64748B),
                  height: 1.3,
                ),
              ),
            ],
          ),
        ),
        const SizedBox(width: 12),
        Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Text(
              AppLocalization.get('ID'),
              style: const TextStyle(
                fontSize: 11,
                fontWeight: FontWeight.w600,
                color: Color(0xFF64748B),
              ),
            ),
            const SizedBox(height: 2),
            Text(
              widget.bookingId,
              style: const TextStyle(
                fontSize: 13.5,
                fontWeight: FontWeight.w800,
                color: Color(0xFF0F172A),
                letterSpacing: 0.2,
              ),
            ),
          ],
        ),
      ],
    );
  }

  // ── SERVICE SUMMARY CARD ─────────────────────────────────────────────────
  Widget _buildServiceSummaryCard(String lang) {
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
        children: [
          // Row 1: Icon, Title & Amount
          Row(
            children: [
              Container(
                width: 44,
                height: 44,
                decoration: BoxDecoration(
                  color: const Color(0xFFFFF7ED),
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(color: const Color(0xFFFED7AA)),
                ),
                child: const Center(
                  child: Text('🎨', style: TextStyle(fontSize: 22)),
                ),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      AppLocalization.get(widget.serviceTitle),
                      style: const TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.bold,
                        color: Color(0xFF0F172A),
                      ),
                    ),
                    const SizedBox(height: 2),
                    Text(
                      AppLocalization.get(widget.serviceSub),
                      style: const TextStyle(
                        fontSize: 12,
                        color: Color(0xFF64748B),
                      ),
                    ),
                  ],
                ),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text(
                    AppLocalization.get('Estimated Total'),
                    style: const TextStyle(
                      fontSize: 10.5,
                      color: Color(0xFF64748B),
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  const SizedBox(height: 2),
                  Text(
                    widget.amount,
                    style: const TextStyle(
                      fontSize: 17,
                      fontWeight: FontWeight.w800,
                      color: Color(0xFF059669),
                    ),
                  ),
                ],
              ),
            ],
          ),
          const SizedBox(height: 14),
          const Divider(height: 1, color: Color(0xFFF1F5F9)),
          const SizedBox(height: 14),
          // Row 2: Details Grid
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    _buildInfoBadge(
                      Icons.location_on_outlined,
                      AppLocalization.get(widget.location),
                    ),
                    const SizedBox(height: 8),
                    _buildInfoBadge(
                      Icons.people_outline,
                      widget.workerCount == 1
                          ? AppLocalization.get('1 worker requested')
                          : '${widget.workerCount} ${AppLocalization.get('workers requested')}',
                    ),
                  ],
                ),
              ),
              const SizedBox(width: 8),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    _buildInfoBadge(
                      Icons.calendar_today_outlined,
                      AppLocalization.get(widget.dateTime),
                    ),
                    const SizedBox(height: 8),
                    _buildInfoBadge(
                      Icons.verified_outlined,
                      AppLocalization.get('SAHYOG Verified Quote'),
                      iconColor: const Color(0xFF059669),
                      textColor: const Color(0xFF059669),
                      isBold: true,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildInfoBadge(IconData icon, String text,
      {Color? iconColor, Color? textColor, bool isBold = false}) {
    return Row(
      children: [
        Icon(icon, size: 14, color: iconColor ?? const Color(0xFF64748B)),
        const SizedBox(width: 5),
        Expanded(
          child: Text(
            text,
            style: TextStyle(
              fontSize: 11.5,
              fontWeight: isBold ? FontWeight.bold : FontWeight.w500,
              color: textColor ?? const Color(0xFF334155),
            ),
            overflow: TextOverflow.ellipsis,
          ),
        ),
      ],
    );
  }

  // ── SERVICE PROGRESS CARD (TIMELINE) ─────────────────────────────────────
  Widget _buildServiceProgressCard(String lang) {
    String stepPillText;
    if (_currentStage == 3) {
      stepPillText = AppLocalization.get('Step 3 of 5: Worker Assigned');
    } else if (_currentStage == 4) {
      stepPillText = AppLocalization.get('Step 4 of 5: In Progress');
    } else {
      stepPillText = AppLocalization.get('Step 5 of 5: Completed');
    }

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
          // Header Row
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                AppLocalization.get('SERVICE PROGRESS'),
                style: const TextStyle(
                  fontSize: 12.5,
                  fontWeight: FontWeight.w800,
                  letterSpacing: 0.5,
                  color: Color(0xFF0F172A),
                ),
              ),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                decoration: BoxDecoration(
                  color: const Color(0xFFF1F5F9),
                  borderRadius: BorderRadius.circular(6),
                ),
                child: Text(
                  stepPillText,
                  style: const TextStyle(
                    fontSize: 11,
                    fontWeight: FontWeight.w600,
                    color: Color(0xFF334155),
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 18),

          // 5-Stage Stepper
          // Step 1: Request Submitted
          _buildTimelineStep(
            isDone: true,
            isActive: false,
            isLast: false,
            title: AppLocalization.get('Request Submitted'),
            timeOrStatus: '09:40 AM',
            description: AppLocalization.get(
                'Your request has been received by SAHYOG platform.'),
          ),

          // Step 2: Cooperative Accepted
          _buildTimelineStep(
            isDone: true,
            isActive: false,
            isLast: false,
            title: AppLocalization.get('Cooperative Accepted'),
            timeOrStatus: '09:42 AM',
            description: AppLocalization.get(
                'Your service provider has accepted the request and confirmed slot.'),
          ),

          // Step 3: Workers Assigned
          _buildTimelineStep(
            isDone: _currentStage > 3,
            isActive: _currentStage == 3,
            isLast: false,
            title: AppLocalization.get('Workers Assigned'),
            timeOrStatus: _currentStage == 3 ? 'Just now' : '09:50 AM',
            description: AppLocalization.get(
                'Your service team is being prepared and dispatched for tomorrow 10:00 AM.'),
            hasActiveBox: _currentStage == 3,
            activeTag: AppLocalization.get('Active'),
          ),

          // Step 4: Service In Progress
          _buildTimelineStep(
            isDone: _currentStage > 4,
            isActive: _currentStage == 4,
            isLast: false,
            title: AppLocalization.get('Service In Progress'),
            timeOrStatus: _currentStage >= 4 ? '10:00 AM' : AppLocalization.get('Pending'),
            description: AppLocalization.get(
                'Workers arrive on-site and check-in with start OTP code.'),
            hasActiveBox: _currentStage == 4,
            activeTag: AppLocalization.get('Active'),
          ),

          // Step 5: Service Completed
          _buildTimelineStep(
            isDone: _currentStage == 5,
            isActive: _currentStage == 5,
            isLast: true,
            title: AppLocalization.get('Service Completed'),
            timeOrStatus: _currentStage == 5 ? '12:30 PM' : AppLocalization.get('Final'),
            description: AppLocalization.get(
                'Review work, sign off, and pay securely via UPI/Cash.'),
            hasActiveBox: _currentStage == 5,
            activeTag: AppLocalization.get('Completed'),
            isCompletedTag: true,
          ),

          const SizedBox(height: 14),
          const Divider(height: 1, color: Color(0xFFF1F5F9)),
          const SizedBox(height: 12),

          // Interactive simulation trigger
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                AppLocalization.get('Simulate Stage Transition:'),
                style: const TextStyle(
                  fontSize: 11.5,
                  color: Color(0xFF64748B),
                  fontWeight: FontWeight.w500,
                ),
              ),
              GestureDetector(
                onTap: _nextStage,
                child: DottedBorder(
                  options: RoundedRectDottedBorderOptions(
                    color: const Color(0xFF3B82F6),
                    dashPattern: const [4, 3],
                    strokeWidth: 1.2,
                    radius: const Radius.circular(6),
                  ),
                  child: Container(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                    color: const Color(0xFFEFF6FF),
                    child: Text(
                      _currentStage == 3
                          ? AppLocalization.get('Preview Next: In Progress →')
                          : _currentStage == 4
                              ? AppLocalization.get('Preview Next: Completed →')
                              : AppLocalization.get('Reset to Assigned ↺'),
                      style: const TextStyle(
                        fontSize: 11,
                        fontWeight: FontWeight.w700,
                        color: Color(0xFF1D4ED8),
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

  Widget _buildTimelineStep({
    required bool isDone,
    required bool isActive,
    required bool isLast,
    required String title,
    required String timeOrStatus,
    required String description,
    bool hasActiveBox = false,
    String? activeTag,
    bool isCompletedTag = false,
  }) {
    return IntrinsicHeight(
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Left indicator + vertical line
          SizedBox(
            width: 24,
            child: Column(
              children: [
                // Node
                if (isDone && !isActive)
                  Container(
                     width: 22,
                    height: 22,
                    decoration: const BoxDecoration(
                      shape: BoxShape.circle,
                      color: Color(0xFF16A34A),
                    ),
                    child: const Icon(Icons.check, size: 14, color: Colors.white),
                  )
                else if (isActive)
                  Container(
                    width: 22,
                    height: 22,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: const Color(0xFF1E293B),
                      border: Border.all(color: const Color(0xFFCA8A04), width: 3),
                    ),
                  )
                else
                  Container(
                    width: 22,
                    height: 22,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: const Color(0xFFF1F5F9),
                      border: Border.all(color: const Color(0xFFCBD5E1), width: 2),
                    ),
                    child: Center(
                      child: Container(
                        width: 6,
                        height: 6,
                        decoration: const BoxDecoration(
                          shape: BoxShape.circle,
                          color: Color(0xFF94A3B8),
                        ),
                      ),
                    ),
                  ),
                // Connector line
                if (!isLast)
                  Expanded(
                    child: Container(
                      width: 2,
                      color: isDone
                          ? const Color(0xFF16A34A)
                          : const Color(0xFFE2E8F0),
                    ),
                  ),
              ],
            ),
          ),
          const SizedBox(width: 12),
          // Content
          Expanded(
            child: Padding(
              padding: EdgeInsets.only(bottom: isLast ? 0 : 16.0),
              child: hasActiveBox
                  ? Container(
                      padding: const EdgeInsets.all(12),
                      decoration: BoxDecoration(
                        color: const Color(0xFFF8FAFC),
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(color: const Color(0xFFE2E8F0)),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              Text(
                                title,
                                style: const TextStyle(
                                  fontSize: 13,
                                  fontWeight: FontWeight.bold,
                                  color: Color(0xFF0F172A),
                                ),
                              ),
                              if (activeTag != null) ...[
                                const SizedBox(width: 6),
                                Container(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 6, vertical: 2),
                                  decoration: BoxDecoration(
                                    color: isCompletedTag
                                        ? const Color(0xFF16A34A)
                                        : const Color(0xFFEA580C),
                                    borderRadius: BorderRadius.circular(4),
                                  ),
                                  child: Text(
                                    activeTag,
                                    style: const TextStyle(
                                      fontSize: 9.5,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white,
                                    ),
                                  ),
                                ),
                              ],
                              const Spacer(),
                              Text(
                                timeOrStatus,
                                style: const TextStyle(
                                  fontSize: 10.5,
                                  color: Color(0xFF64748B),
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 4),
                          Text(
                            description,
                            style: const TextStyle(
                              fontSize: 11.5,
                              color: Color(0xFF475569),
                              height: 1.35,
                            ),
                          ),
                        ],
                      ),
                    )
                  : Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              title,
                              style: TextStyle(
                                fontSize: 13,
                                fontWeight: isDone
                                    ? FontWeight.bold
                                    : FontWeight.w600,
                                color: isDone
                                    ? const Color(0xFF0F172A)
                                    : const Color(0xFF475569),
                              ),
                            ),
                            Text(
                              timeOrStatus,
                              style: TextStyle(
                                fontSize: 10.5,
                                color: isDone
                                    ? const Color(0xFF64748B)
                                    : const Color(0xFF94A3B8),
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 3),
                        Text(
                          description,
                          style: TextStyle(
                            fontSize: 11.5,
                            color: isDone
                                ? const Color(0xFF64748B)
                                : const Color(0xFF94A3B8),
                            height: 1.3,
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

  // ── SERVICE PROVIDER CARD ────────────────────────────────────────────────
  Widget _buildServiceProviderCard(String lang) {
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
          // Header Row
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                AppLocalization.get('SERVICE PROVIDER'),
                style: const TextStyle(
                  fontSize: 12.5,
                  fontWeight: FontWeight.w800,
                  letterSpacing: 0.5,
                  color: Color(0xFF0F172A),
                ),
              ),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                decoration: BoxDecoration(
                  color: const Color(0xFFECFDF5),
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(color: const Color(0xFFA7F3D0)),
                ),
                child: Text(
                  AppLocalization.get('✓ Verified Cooperative'),
                  style: const TextStyle(
                    fontSize: 11,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF059669),
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 14),

          // Provider Info Row
          Row(
            children: [
              Container(
                width: 44,
                height: 44,
                decoration: BoxDecoration(
                  color: const Color(0xFF0F172A),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: const Center(
                  child: Text('🤝', style: TextStyle(fontSize: 22)),
                ),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      AppLocalization.get('Nirman Shramik Cooperative'),
                      style: const TextStyle(
                        fontSize: 14.5,
                        fontWeight: FontWeight.bold,
                        color: Color(0xFF0F172A),
                      ),
                    ),
                    const SizedBox(height: 2),
                    Text(
                      AppLocalization.get(
                          '24 skilled workers • Painting & Construction'),
                      style: const TextStyle(
                        fontSize: 12,
                        color: Color(0xFF64748B),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(height: 14),

          // Assigned Workers Inner Card
          Container(
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: const Color(0xFFF8FAFC),
              borderRadius: BorderRadius.circular(12),
              border: Border.all(color: const Color(0xFFE2E8F0)),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  AppLocalization.get('Your Assigned Workers:'),
                  style: const TextStyle(
                    fontSize: 11.5,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF334155),
                  ),
                ),
                const SizedBox(height: 10),
                Row(
                  children: [
                    // Worker Avatar Circle
                    Container(
                      width: 36,
                      height: 36,
                      decoration: const BoxDecoration(
                        shape: BoxShape.circle,
                        color: Color(0xFF0F172A),
                      ),
                      child: const Center(
                        child: Text(
                          'RK',
                          style: TextStyle(
                            fontSize: 13,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
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
                              fontSize: 13,
                              fontWeight: FontWeight.bold,
                              color: Color(0xFF0F172A),
                            ),
                          ),
                          const SizedBox(height: 2),
                          Text(
                            AppLocalization.get(
                                '5 yrs exp • Skill Passport Active'),
                            style: const TextStyle(
                              fontSize: 11,
                              color: Color(0xFF64748B),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 8, vertical: 4),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(8),
                        border: Border.all(color: const Color(0xFFE2E8F0)),
                      ),
                      child: Text(
                        AppLocalization.get('+ 1 helper worker'),
                        style: const TextStyle(
                          fontSize: 11,
                          fontWeight: FontWeight.w600,
                          color: Color(0xFF475569),
                        ),
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

  // ── WORK DETAILS CARD ────────────────────────────────────────────────────
  Widget _buildWorkDetailsCard(String lang) {
    String dynamicNotice;
    if (_currentStage == 3) {
      dynamicNotice = AppLocalization.get(
          'Workers will arrive tomorrow at 10:00 AM with equipment and verified credentials.');
    } else if (_currentStage == 4) {
      dynamicNotice = AppLocalization.get(
          'Your service is currently in progress. Workers are on-site carrying out the requested tasks.');
    } else {
      dynamicNotice = AppLocalization.get(
          'Service has been completed successfully. Please review quality before payment.');
    }

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
          Text(
            AppLocalization.get('WORK DETAILS'),
            style: const TextStyle(
              fontSize: 12.5,
              fontWeight: FontWeight.w800,
              letterSpacing: 0.5,
              color: Color(0xFF0F172A),
            ),
          ),
          const SizedBox(height: 14),
          _buildWorkDetailRow(
              AppLocalization.get('Service'), AppLocalization.get('Painting')),
          const SizedBox(height: 8),
          _buildWorkDetailRow(AppLocalization.get('Location'),
              AppLocalization.get(widget.location)),
          const SizedBox(height: 8),
          _buildWorkDetailRow(AppLocalization.get('Workers assigned'),
              '${widget.workerCount}'),
          const SizedBox(height: 8),
          _buildWorkDetailRow(
            AppLocalization.get('Started'),
            _currentStage >= 4
                ? AppLocalization.get('Today, 10:00 AM')
                : AppLocalization.get('Scheduled: 18 Sep, 10:00 AM'),
          ),
          const SizedBox(height: 14),

          // Blue Info Box
          Container(
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: const Color(0xFFEFF6FF),
              borderRadius: BorderRadius.circular(10),
              border: Border.all(color: const Color(0xFFDBEAFE)),
            ),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Icon(Icons.info_outline,
                    size: 16, color: Color(0xFF2563EB)),
                const SizedBox(width: 8),
                Expanded(
                  child: Text(
                    dynamicNotice,
                    style: const TextStyle(
                      fontSize: 11.5,
                      color: Color(0xFF1E40AF),
                      height: 1.35,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildWorkDetailRow(String label, String value) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          label,
          style: const TextStyle(
            fontSize: 12.5,
            color: Color(0xFF64748B),
            fontWeight: FontWeight.w500,
          ),
        ),
        Text(
          value,
          style: const TextStyle(
            fontSize: 12.5,
            fontWeight: FontWeight.bold,
            color: Color(0xFF0F172A),
          ),
        ),
      ],
    );
  }

  // ── PAYMENT CARD ─────────────────────────────────────────────────────────
  Widget _buildPaymentCard(String lang) {
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
          // Header Row
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                AppLocalization.get('PAYMENT'),
                style: const TextStyle(
                  fontSize: 12.5,
                  fontWeight: FontWeight.w800,
                  letterSpacing: 0.5,
                  color: Color(0xFF0F172A),
                ),
              ),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                decoration: BoxDecoration(
                  color: _currentStage == 5
                      ? const Color(0xFFECFDF5)
                      : const Color(0xFFFEF3C7),
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(
                    color: _currentStage == 5
                        ? const Color(0xFFA7F3D0)
                        : const Color(0xFFFDE68A),
                  ),
                ),
                child: Text(
                  _currentStage == 5
                      ? AppLocalization.get('Ready to Pay')
                      : AppLocalization.get('Payment pending'),
                  style: TextStyle(
                    fontSize: 11,
                    fontWeight: FontWeight.bold,
                    color: _currentStage == 5
                        ? const Color(0xFF059669)
                        : const Color(0xFFD97706),
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 12),

          // Amount Row
          Row(
            crossAxisAlignment: CrossAxisAlignment.baseline,
            textBaseline: TextBaseline.alphabetic,
            children: [
              Text(
                widget.amount,
                style: const TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.w900,
                  color: Color(0xFF0F172A),
                ),
              ),
              const Spacer(),
              Text(
                AppLocalization.get('Transparent quote'),
                style: const TextStyle(
                  fontSize: 11.5,
                  color: Color(0xFF64748B),
                  fontWeight: FontWeight.w500,
                ),
              ),
            ],
          ),
          const SizedBox(height: 8),

          // Description
          Text(
            AppLocalization.get(
                'Payment will be completed after the service is finished. Pay securely via UPI, Cash, or QR code directly upon satisfactory inspection.'),
            style: const TextStyle(
              fontSize: 11.5,
              color: Color(0xFF64748B),
              height: 1.4,
            ),
          ),
        ],
      ),
    );
  }

  // ── ACTION BUTTONS (GET HELP & REPORT A PROBLEM) ───────────────────────────
  Widget _buildActionButtons(BuildContext context, String lang) {
    return Row(
      children: [
        // Get Help Button
        Expanded(
          child: OutlinedButton.icon(
            onPressed: () => _showHelpBottomSheet(context, lang),
            icon: const Icon(Icons.language, size: 16, color: Color(0xFF0F172A)),
            label: Text(
              AppLocalization.get('Get Help'),
              style: const TextStyle(
                fontSize: 13,
                fontWeight: FontWeight.bold,
                color: Color(0xFF0F172A),
              ),
            ),
            style: OutlinedButton.styleFrom(
              padding: const EdgeInsets.symmetric(vertical: 13),
              side: const BorderSide(color: Color(0xFFCBD5E1)),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
              backgroundColor: Colors.white,
            ),
          ),
        ),
        const SizedBox(width: 12),

        // Report a Problem Button
        Expanded(
          child: OutlinedButton.icon(
            onPressed: () => _showReportProblemDialog(context, lang),
            icon: const Icon(Icons.warning_amber_rounded,
                size: 16, color: Color(0xFF0F172A)),
            label: Text(
              AppLocalization.get('Report a Problem'),
              style: const TextStyle(
                fontSize: 13,
                fontWeight: FontWeight.bold,
                color: Color(0xFF0F172A),
              ),
            ),
            style: OutlinedButton.styleFrom(
              padding: const EdgeInsets.symmetric(vertical: 13),
              side: const BorderSide(color: Color(0xFFCBD5E1)),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
              backgroundColor: Colors.white,
            ),
          ),
        ),
      ],
    );
  }

  // ── PRIMARY CTA: VIEW SERVICE DETAILS ───────────────────────────────────
  Widget _buildViewDetailsButton(BuildContext context, String lang) {
    return SizedBox(
      width: double.infinity,
      child: ElevatedButton(
        onPressed: () {
          if (_currentStage == 5) {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => HouseholdServiceCompletionScreen(
                  serviceTitle: widget.serviceTitle,
                  serviceSub: widget.serviceSub,
                  location: widget.location,
                  completionTime: 'Completed • Today, 11:45 AM',
                  providerName: 'Nirman Shramik Cooperative',
                  workerDetails:
                      'Workers: 2 workers (Ramlal Kumar + 1 worker)',
                  labourCost: '₹1,200',
                  materialsCost: '₹300',
                  serviceCharge: '₹50',
                  totalAmount: widget.amount,
                ),
              ),
            );
          } else {
            _showServiceDetailsModal(context, lang);
          }
        },
        style: ElevatedButton.styleFrom(
          backgroundColor: const Color(0xFF0F172A),
          padding: const EdgeInsets.symmetric(vertical: 15),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          elevation: 0,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              _currentStage == 5
                  ? AppLocalization.get('View Completion Summary →')
                  : AppLocalization.get('View Service Details >'),
              style: const TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.bold,
                color: Colors.white,
                letterSpacing: 0.3,
              ),
            ),
          ],
        ),
      ),
    );
  }

  // ── FOOTER ───────────────────────────────────────────────────────────────
  Widget _buildFooter(String lang) {
    return Center(
      child: Column(
        children: [
          const Text(
            'COOPERATE. EMPOWER. GROW.',
            style: TextStyle(
              fontSize: 11.5,
              fontWeight: FontWeight.w800,
              letterSpacing: 1.2,
              color: Color(0xFF94A3B8),
            ),
          ),
          const SizedBox(height: 3),
          Text(
            AppLocalization.get('साथ मिलकर, समृद्धि की ओर'),
            style: const TextStyle(
              fontSize: 11,
              fontWeight: FontWeight.w500,
              color: Color(0xFF94A3B8),
            ),
          ),
        ],
      ),
    );
  }

  // ── NEED ASSISTANCE (GET HELP) BOTTOM SHEET ─────────────────────────────
  void _showHelpBottomSheet(BuildContext context, String lang) {
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
              // Top drag handle
              Center(
                child: Container(
                  width: 44,
                  height: 4,
                  decoration: BoxDecoration(
                    color: const Color(0xFFE2E8F0),
                    borderRadius: BorderRadius.circular(4),
                  ),
                ),
              ),
              const SizedBox(height: 18),

              // Title and Close Row
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    AppLocalization.get('Need Assistance?'),
                    style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF0F172A),
                    ),
                  ),
                  GestureDetector(
                    onTap: () => Navigator.pop(context),
                    child: const Icon(Icons.close,
                        size: 20, color: Color(0xFF94A3B8)),
                  ),
                ],
              ),
              const SizedBox(height: 6),

              // Subtitle
              Text(
                AppLocalization.get(
                    'Our civic support desk is available to assist you during your ongoing service.'),
                style: const TextStyle(
                  fontSize: 12.5,
                  color: Color(0xFF64748B),
                  height: 1.35,
                ),
              ),
              const SizedBox(height: 18),

              // Card 1: Call Cooperative Coordinator
              Container(
                padding: const EdgeInsets.all(14),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(14),
                  border: Border.all(color: const Color(0xFFE2E8F0)),
                ),
                child: Row(
                  children: [
                    Container(
                      width: 40,
                      height: 40,
                      decoration: const BoxDecoration(
                        shape: BoxShape.circle,
                        color: Color(0xFFDCFCE7),
                      ),
                      child: const Center(
                        child: Icon(Icons.phone,
                            size: 18, color: Color(0xFF16A34A)),
                      ),
                    ),
                    const SizedBox(width: 12),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            AppLocalization.get(
                                'Call Cooperative Coordinator'),
                            style: const TextStyle(
                              fontSize: 13.5,
                              fontWeight: FontWeight.bold,
                              color: Color(0xFF0F172A),
                            ),
                          ),
                          const SizedBox(height: 2),
                          Text(
                            AppLocalization.get(
                                'Direct on-site supervisor desk'),
                            style: const TextStyle(
                              fontSize: 11.5,
                              color: Color(0xFF64748B),
                            ),
                          ),
                        ],
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.pop(context);
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: Text(AppLocalization.get(
                                'Calling Cooperative Coordinator...')),
                            behavior: SnackBarBehavior.floating,
                          ),
                        );
                      },
                      child: Text(
                        AppLocalization.get('Call Now'),
                        style: const TextStyle(
                          fontSize: 13,
                          fontWeight: FontWeight.bold,
                          color: Color(0xFF1E3A5F),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 12),

              // Card 2: SAHYOG Citizen Helpline
              Container(
                padding: const EdgeInsets.all(14),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(14),
                  border: Border.all(color: const Color(0xFFE2E8F0)),
                ),
                child: Row(
                  children: [
                    Container(
                      width: 40,
                      height: 40,
                      decoration: const BoxDecoration(
                        shape: BoxShape.circle,
                        color: Color(0xFFEFF6FF),
                      ),
                      child: const Center(
                        child: Icon(Icons.shield_outlined,
                            size: 18, color: Color(0xFFDC2626)),
                      ),
                    ),
                    const SizedBox(width: 12),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            AppLocalization.get('SAHYOG Citizen Helpline'),
                            style: const TextStyle(
                              fontSize: 13.5,
                              fontWeight: FontWeight.bold,
                              color: Color(0xFF0F172A),
                            ),
                          ),
                          const SizedBox(height: 2),
                          Text(
                            AppLocalization.get(
                                'Toll-free digital public support'),
                            style: const TextStyle(
                              fontSize: 11.5,
                              color: Color(0xFF64748B),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Text(
                      AppLocalization.get('1800-SAHYOG'),
                      style: const TextStyle(
                        fontSize: 13,
                        fontWeight: FontWeight.bold,
                        color: Color(0xFF1E3A5F),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 18),

              // Dismiss button
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () => Navigator.pop(context),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFFF1F5F9),
                    foregroundColor: const Color(0xFF334155),
                    elevation: 0,
                    padding: const EdgeInsets.symmetric(vertical: 14),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  child: Text(
                    AppLocalization.get('Dismiss'),
                    style: const TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 10),
            ],
          ),
        );
      },
    );
  }

  // ── REPORT AN ISSUE BOTTOM SHEET ─────────────────────────────────────────
  void _showReportProblemDialog(BuildContext context, String lang) {
    int selectedIssueIndex = 0;
    final List<String> issues = [
      'Worker arrived late / delayed',
      'Materials or equipment shortage',
      'Scope of work discrepancy',
      'Other service concern',
    ];

    showModalBottomSheet(
      context: context,
      backgroundColor: Colors.transparent,
      isScrollControlled: true,
      builder: (context) {
        return StatefulBuilder(
          builder: (context, setModalState) {
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
                  // Top drag handle
                  Center(
                    child: Container(
                      width: 44,
                      height: 4,
                      decoration: BoxDecoration(
                        color: const Color(0xFFE2E8F0),
                        borderRadius: BorderRadius.circular(4),
                      ),
                    ),
                  ),
                  const SizedBox(height: 18),

                  // Header row
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        AppLocalization.get('Report an Issue'),
                        style: const TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Color(0xFF0F172A),
                        ),
                      ),
                      GestureDetector(
                        onTap: () => Navigator.pop(context),
                        child: const Icon(Icons.close,
                            size: 20, color: Color(0xFF94A3B8)),
                      ),
                    ],
                  ),
                  const SizedBox(height: 6),

                  // Subtitle
                  Text(
                    AppLocalization.get(
                        'Let us know what went wrong so we can immediately address it with the cooperative.'),
                    style: const TextStyle(
                      fontSize: 12.5,
                      color: Color(0xFF64748B),
                      height: 1.35,
                    ),
                  ),
                  const SizedBox(height: 18),

                  // 4 Radio Option Cards
                  ...issues.asMap().entries.map((entry) {
                    final index = entry.key;
                    final issueKey = entry.value;
                    final isSelected = selectedIssueIndex == index;

                    return GestureDetector(
                      onTap: () {
                        setModalState(() {
                          selectedIssueIndex = index;
                        });
                      },
                      child: Container(
                        margin: const EdgeInsets.only(bottom: 10),
                        padding: const EdgeInsets.symmetric(
                            horizontal: 14, vertical: 14),
                        decoration: BoxDecoration(
                          color: isSelected
                              ? const Color(0xFFF0F7FF)
                              : Colors.white,
                          borderRadius: BorderRadius.circular(12),
                          border: Border.all(
                            color: isSelected
                                ? const Color(0xFF3B82F6)
                                : const Color(0xFFE2E8F0),
                            width: isSelected ? 1.5 : 1,
                          ),
                        ),
                        child: Row(
                          children: [
                            // Radio indicator
                            Container(
                              width: 20,
                              height: 20,
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                border: Border.all(
                                  color: isSelected
                                      ? const Color(0xFF2563EB)
                                      : const Color(0xFF94A3B8),
                                  width: 2,
                                ),
                              ),
                              child: isSelected
                                  ? Center(
                                      child: Container(
                                        width: 10,
                                        height: 10,
                                        decoration: const BoxDecoration(
                                          shape: BoxShape.circle,
                                          color: Color(0xFF2563EB),
                                        ),
                                      ),
                                    )
                                  : null,
                            ),
                            const SizedBox(width: 12),
                            Expanded(
                              child: Text(
                                AppLocalization.get(issueKey),
                                style: const TextStyle(
                                  fontSize: 13,
                                  fontWeight: FontWeight.w600,
                                  color: Color(0xFF0F172A),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  }),
                  const SizedBox(height: 8),

                  // Submit Report button
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: () {
                        Navigator.pop(context);
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: Text(AppLocalization.get(
                                'Report submitted. A cooperative coordinator will contact you shortly.')),
                            backgroundColor: const Color(0xFF1E3A5F),
                            behavior: SnackBarBehavior.floating,
                          ),
                        );
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xFF1E3A5F),
                        padding: const EdgeInsets.symmetric(vertical: 15),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        elevation: 0,
                      ),
                      child: Text(
                        AppLocalization.get('Submit Report'),
                        style: const TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 10),
                ],
              ),
            );
          },
        );
      },
    );
  }

  // ── SERVICE DETAILS MODAL ────────────────────────────────────────────────
  void _showServiceDetailsModal(BuildContext context, String lang) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      builder: (context) {
        return Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    AppLocalization.get('Service Scope & Invoice'),
                    style: const TextStyle(
                      fontSize: 17,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF0F172A),
                    ),
                  ),
                  IconButton(
                    icon: const Icon(Icons.close),
                    onPressed: () => Navigator.pop(context),
                  ),
                ],
              ),
              const SizedBox(height: 14),
              _buildModalRow(AppLocalization.get('Service'),
                  AppLocalization.get('Painting (2 rooms)')),
              _buildModalRow(AppLocalization.get('Provider'),
                  AppLocalization.get('Nirman Shramik Cooperative')),
              _buildModalRow(AppLocalization.get('Base Labour Rate'), '₹1,200'),
              _buildModalRow(AppLocalization.get('Equipment & Safety Kit'), '₹250'),
              _buildModalRow(AppLocalization.get('Cooperative Platform Fee'), '₹100'),
              const Divider(height: 20),
              _buildModalRow(AppLocalization.get('Total Estimated'), widget.amount,
                  isTotal: true),
              const SizedBox(height: 16),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () => Navigator.pop(context),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFF0F172A),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  child: Text(
                    AppLocalization.get('Close'),
                    style: const TextStyle(color: Colors.white),
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  Widget _buildModalRow(String label, String value, {bool isTotal = false}) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            label,
            style: TextStyle(
              fontSize: isTotal ? 14 : 12.5,
              fontWeight: isTotal ? FontWeight.bold : FontWeight.w500,
              color: isTotal ? const Color(0xFF0F172A) : const Color(0xFF64748B),
            ),
          ),
          Text(
            value,
            style: TextStyle(
              fontSize: isTotal ? 16 : 12.5,
              fontWeight: FontWeight.bold,
              color: isTotal ? const Color(0xFF059669) : const Color(0xFF0F172A),
            ),
          ),
        ],
      ),
    );
  }
}
