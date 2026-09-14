import 'package:flutter/material.dart';
import '../theme/colors.dart';
import '../utils/localization.dart';
import 'household_track_service_screen.dart';
import 'household_service_request_screen.dart';
import 'household_service_completion_screen.dart';
import 'household_history_screen.dart';
import '../widgets/household_account_modal.dart';

class HouseholdDashboardScreen extends StatefulWidget {
  const HouseholdDashboardScreen({super.key});

  @override
  State<HouseholdDashboardScreen> createState() =>
      _HouseholdDashboardScreenState();
}

class _HouseholdDashboardScreenState extends State<HouseholdDashboardScreen> {
  int _currentIndex = 0;

  final List<_ServiceCategory> _categories = const [
    _ServiceCategory('🔧', 'Plumbing'),
    _ServiceCategory('⚡', 'Electrical'),
    _ServiceCategory('🎨', 'Painting'),
    _ServiceCategory('🪚', 'Carpentry'),
    _ServiceCategory('🧹', 'Cleaning'),
    _ServiceCategory('🌱', 'Gardening'),
    _ServiceCategory('👷', 'General Labour'),
  ];

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<String>(
      valueListenable: AppLocalization.currentLang,
      builder: (context, lang, child) {
        return Scaffold(
          backgroundColor: AppColors.surfaceCanvas,
          body: SafeArea(
            child: IndexedStack(
              index: _currentIndex,
              children: [
                _buildHomeTab(lang),
                _buildRequestsTab(lang),
                const HouseholdServiceRequestScreen(),
                const HouseholdHistoryScreen(showBackButton: false),
                _buildPlaceholderTab(AppLocalization.get('Profile')),
              ],
            ),
          ),
          bottomNavigationBar: _buildBottomNav(lang),
        );
      },
    );
  }

  // ── HOME TAB ──────────────────────────────────────────────────────────────
  Widget _buildHomeTab(String lang) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // ── App Bar ──────────────────────────────────────────────
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
            child: Row(
              children: [
                Image.asset(
                  'assets/images/logo.png',
                  height: 36,
                  errorBuilder: (_, __, ___) => Container(
                    width: 36,
                    height: 36,
                    decoration: BoxDecoration(
                      color: const Color(0xFFECFDF5),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: const Center(
                      child: Text('S',
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: AppColors.cooperativeGreen,
                              fontSize: 18)),
                    ),
                  ),
                ),
                const SizedBox(width: 10),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text('SAHYOG',
                        style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.bold,
                            color: AppColors.primaryContainer,
                            letterSpacing: 0.5)),
                    Text(AppLocalization.get('HOUSEHOLD'),
                        style: const TextStyle(
                            fontSize: 11,
                            fontWeight: FontWeight.w600,
                            color: AppColors.cooperativeGreen,
                            letterSpacing: 0.5)),
                  ],
                ),
                const Spacer(),
                // Notification bell
                Stack(
                  children: [
                    Container(
                      width: 40,
                      height: 40,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(12),
                        border: Border.all(color: AppColors.borderSubtle),
                      ),
                      child: const Icon(Icons.notifications_outlined,
                          size: 22, color: AppColors.primaryContainer),
                    ),
                    Positioned(
                      top: 6,
                      right: 6,
                      child: Container(
                        width: 8,
                        height: 8,
                        decoration: const BoxDecoration(
                          color: AppColors.saffron,
                          shape: BoxShape.circle,
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(width: 8),
                // Profile Avatar Button
                GestureDetector(
                  onTap: () => showHouseholdAccountModal(context),
                  child: Container(
                    width: 38,
                    height: 38,
                    decoration: const BoxDecoration(
                      color: Color(0xFF142E4E),
                      shape: BoxShape.circle,
                    ),
                    child: const Center(
                      child: Text(
                        'RS',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 13,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),

          // ── Greeting ─────────────────────────────────────────────
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Text(
                      AppLocalization.get('Good morning, Riya'),
                      style: const TextStyle(
                          fontSize: 22,
                          fontWeight: FontWeight.bold,
                          color: AppColors.primaryContainer),
                    ),
                    const SizedBox(width: 6),
                    const Text('👋', style: TextStyle(fontSize: 20)),
                  ],
                ),
                const SizedBox(height: 2),
                Text(
                  AppLocalization.get('What service do you need today?'),
                  style: const TextStyle(
                      fontSize: 13.5, color: AppColors.textSecondary),
                ),
              ],
            ),
          ),

          const SizedBox(height: 16),

          // ── Hero Request Card ─────────────────────────────────────
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Container(
              width: double.infinity,
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: AppColors.primaryContainer,
                borderRadius: BorderRadius.circular(16),
              ),
              child: Stack(
                children: [
                  // Decorative background circle
                  Positioned(
                    right: -20,
                    bottom: -20,
                    child: Container(
                      width: 100,
                      height: 100,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors.white.withOpacity(0.05),
                      ),
                    ),
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Badge
                      Container(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 8, vertical: 3),
                        decoration: BoxDecoration(
                          color: Colors.white.withOpacity(0.15),
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Container(
                              width: 6,
                              height: 6,
                              decoration: const BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: AppColors.cooperativeGreen),
                            ),
                            const SizedBox(width: 5),
                            Text(
                              AppLocalization.get('CIVIC GIG PLATFORM'),
                              style: const TextStyle(
                                  fontSize: 10,
                                  fontWeight: FontWeight.w600,
                                  color: Colors.white70,
                                  letterSpacing: 0.5),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 12),
                      Text(
                        AppLocalization.get('Request a Service'),
                        style: const TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: Colors.white),
                      ),
                      const SizedBox(height: 4),
                      Text(
                        AppLocalization.get(
                            'Find a skilled worker or connect with a verified cooperative.'),
                        style: const TextStyle(
                            fontSize: 12,
                            color: Colors.white70,
                            height: 1.4),
                      ),
                      const SizedBox(height: 16),
                      // Orange CTA button
                      Container(
                        decoration: BoxDecoration(
                          border: Border.all(
                              color: Colors.blue.withOpacity(0.4),
                              width: 1.5),
                          borderRadius: BorderRadius.circular(12),
                        ),
                        padding: const EdgeInsets.all(2),
                        child: SizedBox(
                          width: double.infinity,
                          child: ElevatedButton(
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) =>
                                      const HouseholdServiceRequestScreen(
                                    initialCategory: 'Plumbing',
                                  ),
                                ),
                              );
                            },
                            style: ElevatedButton.styleFrom(
                              backgroundColor: AppColors.saffron,
                              padding:
                                  const EdgeInsets.symmetric(vertical: 13),
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10)),
                              elevation: 0,
                            ),
                            child: Text(
                              AppLocalization.get('Request Service →'),
                              style: const TextStyle(
                                fontSize: 15,
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
            ),
          ),

          const SizedBox(height: 24),

          // ── Service Categories ────────────────────────────────────
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  AppLocalization.get('SERVICE CATEGORIES'),
                  style: const TextStyle(
                      fontSize: 13,
                      fontWeight: FontWeight.bold,
                      color: AppColors.primaryContainer,
                      letterSpacing: 0.5),
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) =>
                            const HouseholdServiceRequestScreen(
                          initialCategory: 'Plumbing',
                        ),
                      ),
                    );
                  },
                  child: Text(
                    AppLocalization.get('View All'),
                    style: const TextStyle(
                        fontSize: 12.5,
                        fontWeight: FontWeight.w600,
                        color: AppColors.cooperativeGreen),
                  ),
                ),
              ],
            ),
          ),

          const SizedBox(height: 12),

          // Category grid — 4 per row, 2 rows + "View All" tile
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: GridView.count(
              crossAxisCount: 4,
              crossAxisSpacing: 10,
              mainAxisSpacing: 10,
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              children: [
                ..._categories.asMap().entries.map((entry) {
                  final i = entry.key;
                  final cat = entry.value;
                  return _buildCategoryTile(
                    cat.emoji,
                    AppLocalization.get(cat.label),
                    isSelected: i == 0,
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => HouseholdServiceRequestScreen(
                            initialCategory: cat.label,
                          ),
                        ),
                      );
                    },
                  );
                }),
                // + View All tile
                _buildViewAllTile(
                  AppLocalization.get('View All'),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) =>
                            const HouseholdServiceRequestScreen(
                          initialCategory: 'Plumbing',
                        ),
                      ),
                    );
                  },
                ),
              ],
            ),
          ),

          const SizedBox(height: 24),

          // ── Active Services ───────────────────────────────────────
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Row(
              children: [
                Text(
                  AppLocalization.get('ACTIVE SERVICES'),
                  style: const TextStyle(
                      fontSize: 13,
                      fontWeight: FontWeight.bold,
                      color: AppColors.primaryContainer,
                      letterSpacing: 0.5),
                ),
                const SizedBox(width: 8),
                Container(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 8, vertical: 2),
                  decoration: BoxDecoration(
                    color: const Color(0xFFD1FAE5),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Text(
                    AppLocalization.get('1 ACTIVE'),
                    style: const TextStyle(
                        fontSize: 10,
                        fontWeight: FontWeight.bold,
                        color: AppColors.cooperativeGreen),
                  ),
                ),
              ],
            ),
          ),

          const SizedBox(height: 12),

          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: _buildActiveServiceCard(),
          ),

          const SizedBox(height: 24),

          // ── Recent Services ───────────────────────────────────────
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  AppLocalization.get('RECENT SERVICES'),
                  style: const TextStyle(
                      fontSize: 13,
                      fontWeight: FontWeight.bold,
                      color: AppColors.primaryContainer,
                      letterSpacing: 0.5),
                ),
                GestureDetector(
                  onTap: () {
                    setState(() {
                      _currentIndex = 3;
                    });
                  },
                  child: Text(
                    AppLocalization.get('View History'),
                    style: const TextStyle(
                        fontSize: 12.5,
                        fontWeight: FontWeight.w600,
                        color: AppColors.cooperativeGreen),
                  ),
                ),
              ],
            ),
          ),

          const SizedBox(height: 12),

          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              children: [
                _buildRecentServiceRow(
                  icon: '⚡',
                  iconBg: const Color(0xFFFFFBEB),
                  title: AppLocalization.get('Electrical Repair'),
                  categoryKey: 'electrical',
                  status: AppLocalization.get('Completed'),
                  date: AppLocalization.get('10 Sep'),
                  amount: '₹800',
                  labourCost: '₹600',
                  materialsCost: '₹150',
                  serviceCharge: '₹50',
                ),
                const SizedBox(height: 10),
                _buildRecentServiceRow(
                  icon: '🔧',
                  iconBg: const Color(0xFFF0F9FF),
                  title: AppLocalization.get('Plumbing Repair'),
                  categoryKey: 'plumbing',
                  status: AppLocalization.get('Completed'),
                  date: AppLocalization.get('5 Sep'),
                  amount: '₹600',
                  labourCost: '₹450',
                  materialsCost: '₹110',
                  serviceCharge: '₹40',
                ),
              ],
            ),
          ),

          const SizedBox(height: 16),

          // ── Your Choice Card ──────────────────────────────────────
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Container(
              width: double.infinity,
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: const Color(0xFFF0FDF4),
                borderRadius: BorderRadius.circular(14),
                border: Border.all(color: const Color(0xFFBBF7D0)),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Container(
                        padding: const EdgeInsets.all(6),
                        decoration: const BoxDecoration(
                          shape: BoxShape.circle,
                          color: AppColors.cooperativeGreen,
                        ),
                        child: const Icon(Icons.shield_outlined,
                            size: 16, color: Colors.white),
                      ),
                      const SizedBox(width: 10),
                      Text(
                        AppLocalization.get('Your choice, your service'),
                        style: const TextStyle(
                          fontSize: 13.5,
                          fontWeight: FontWeight.bold,
                          color: AppColors.primaryContainer,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 8),
                  Text(
                    AppLocalization.get(
                        'Connect with a skilled individual worker for simple jobs, or request a verified cooperative for larger or multi-worker services.'),
                    style: const TextStyle(
                      fontSize: 12,
                      color: AppColors.textSecondary,
                      height: 1.4,
                    ),
                  ),
                  const SizedBox(height: 10),
                  Row(
                    children: [
                      Row(
                        children: [
                          const Icon(Icons.check,
                              size: 13, color: AppColors.cooperativeGreen),
                          const SizedBox(width: 3),
                          Text(AppLocalization.get('Direct Worker'),
                              style: const TextStyle(
                                  fontSize: 12,
                                  fontWeight: FontWeight.w600,
                                  color: AppColors.cooperativeGreen)),
                        ],
                      ),
                      const Padding(
                        padding: EdgeInsets.symmetric(horizontal: 10),
                        child: Text('|',
                            style: TextStyle(
                                color: AppColors.borderSubtle,
                                fontSize: 14)),
                      ),
                      Row(
                        children: [
                          const Icon(Icons.check,
                              size: 13, color: AppColors.cooperativeGreen),
                          const SizedBox(width: 3),
                          Text(AppLocalization.get('Verified Cooperative'),
                              style: const TextStyle(
                                  fontSize: 12,
                                  fontWeight: FontWeight.w600,
                                  color: AppColors.cooperativeGreen)),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),

          const SizedBox(height: 24),
        ],
      ),
    );
  }

  // ── Category Tile ─────────────────────────────────────────────────────────
  Widget _buildCategoryTile(String emoji, String label,
      {bool isSelected = false, VoidCallback? onTap}) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          color: isSelected ? const Color(0xFFF0F9FF) : Colors.white,
          borderRadius: BorderRadius.circular(12),
          border: Border.all(
            color: isSelected
                ? Colors.blue.withOpacity(0.5)
                : AppColors.borderSubtle,
            width: isSelected ? 1.5 : 1,
            style:
                isSelected ? BorderStyle.solid : BorderStyle.solid,
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(emoji, style: const TextStyle(fontSize: 22)),
            const SizedBox(height: 4),
            Text(
              label,
              style: TextStyle(
                fontSize: 10,
                fontWeight: FontWeight.w500,
                color: isSelected
                    ? AppColors.primaryContainer
                    : AppColors.textSecondary,
              ),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildViewAllTile(String label, {VoidCallback? onTap}) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12),
          border: Border.all(
              color: AppColors.borderSubtle,
              style: BorderStyle.solid),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text('+',
                style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w300,
                    color: AppColors.textSecondary)),
            const SizedBox(height: 2),
            Text(
              label,
              style: const TextStyle(
                  fontSize: 10,
                  fontWeight: FontWeight.w600,
                  color: AppColors.primaryContainer),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }

  // ── Active Service Card ───────────────────────────────────────────────────
  Widget _buildActiveServiceCard() {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(14),
        border: Border.all(color: AppColors.borderSubtle),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Container(
                width: 44,
                height: 44,
                decoration: BoxDecoration(
                  color: const Color(0xFFFFF3E0),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: const Center(
                    child: Text('🎨', style: TextStyle(fontSize: 22))),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      AppLocalization.get('Painting Work'),
                      style: const TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                          color: AppColors.textPrimary),
                    ),
                    const SizedBox(height: 3),
                    Row(
                      children: [
                        Container(
                          width: 6,
                          height: 6,
                          decoration: const BoxDecoration(
                              shape: BoxShape.circle,
                              color: AppColors.cooperativeGreen),
                        ),
                        const SizedBox(width: 5),
                        Text(AppLocalization.get('Worker assigned'),
                            style: const TextStyle(
                                fontSize: 12,
                                color: AppColors.cooperativeGreen)),
                      ],
                    ),
                  ],
                ),
              ),
              Container(
                padding: const EdgeInsets.symmetric(
                    horizontal: 10, vertical: 4),
                decoration: BoxDecoration(
                  color: const Color(0xFFF0FDF4),
                  borderRadius: BorderRadius.circular(8),
                  border: Border.all(color: const Color(0xFFBBF7D0)),
                ),
                child: Text(AppLocalization.get('Confirmed'),
                    style: const TextStyle(
                        fontSize: 11,
                        fontWeight: FontWeight.bold,
                        color: AppColors.cooperativeGreen)),
              ),
            ],
          ),
          const SizedBox(height: 12),
          Row(
            children: [
              const Icon(Icons.access_time,
                  size: 14, color: AppColors.textSecondary),
              const SizedBox(width: 5),
              Text(AppLocalization.get('Tomorrow, 10:00 AM'),
                  style: const TextStyle(
                      fontSize: 12.5, color: AppColors.textSecondary)),
            ],
          ),
          const SizedBox(height: 4),
          Row(
            children: [
              const Icon(Icons.location_on_outlined,
                  size: 14, color: AppColors.textSecondary),
              const SizedBox(width: 5),
              Text(AppLocalization.get('Dwarka, Delhi'),
                  style: const TextStyle(
                      fontSize: 12.5, color: AppColors.textSecondary)),
            ],
          ),
          const SizedBox(height: 14),
          // Track Service button
          Container(
            decoration: BoxDecoration(
              border: Border.all(
                  color: Colors.blue.withOpacity(0.3), width: 1.5),
              borderRadius: BorderRadius.circular(10),
            ),
            padding: const EdgeInsets.all(2),
            child: SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const HouseholdTrackServiceScreen(),
                    ),
                  );
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppColors.cooperativeGreen,
                  padding: const EdgeInsets.symmetric(vertical: 12),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8)),
                  elevation: 0,
                ),
                child: Text(
                  AppLocalization.get('Track Service →'),
                  style: const TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                      color: Colors.white),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  // ── Recent Service Row ────────────────────────────────────────────────────
  Widget _buildRecentServiceRow({
    required String icon,
    required Color iconBg,
    required String title,
    required String categoryKey,
    required String status,
    required String date,
    required String amount,
    required String labourCost,
    required String materialsCost,
    required String serviceCharge,
  }) {
    return Container(
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: AppColors.borderSubtle),
      ),
      child: Row(
        children: [
          Container(
            width: 40,
            height: 40,
            decoration: BoxDecoration(
                color: iconBg, borderRadius: BorderRadius.circular(10)),
            child: Center(child: Text(icon, style: const TextStyle(fontSize: 18))),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(title,
                    style: const TextStyle(
                        fontSize: 13.5,
                        fontWeight: FontWeight.w600,
                        color: AppColors.textPrimary)),
                const SizedBox(height: 3),
                Row(
                  children: [
                    Text(status,
                        style: const TextStyle(
                            fontSize: 11.5,
                            color: AppColors.cooperativeGreen)),
                    const Text('  •  ',
                        style: TextStyle(
                            fontSize: 11, color: AppColors.textSecondary)),
                    Text(date,
                        style: const TextStyle(
                            fontSize: 11.5,
                            color: AppColors.textSecondary)),
                  ],
                ),
              ],
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text(amount,
                  style: const TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                      color: AppColors.textPrimary)),
              const SizedBox(height: 3),
              GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => HouseholdServiceCompletionScreen(
                        serviceTitle: title,
                        serviceSub: categoryKey == 'electrical'
                            ? 'Fan regulator & switchboard replacement'
                            : 'Pipe joint sealing & faucet servicing',
                        location: 'Dwarka Sector 12, Delhi',
                        completionTime: 'Completed • $date',
                        providerName: 'Nirman Shramik Cooperative',
                        workerDetails: 'Workers: 1 worker (Verified Lead)',
                        labourCost: labourCost,
                        materialsCost: materialsCost,
                        serviceCharge: serviceCharge,
                        totalAmount: amount,
                      ),
                    ),
                  );
                },
                child: Text(
                  AppLocalization.get('View Details →'),
                  style: const TextStyle(
                      fontSize: 11,
                      fontWeight: FontWeight.w600,
                      color: AppColors.cooperativeGreen),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  // ── Requests Tab ─────────────────────────────────────────────────────────
  Widget _buildRequestsTab(String lang) {
    return SingleChildScrollView(
      physics: const BouncingScrollPhysics(),
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            AppLocalization.get('My Service Requests'),
            style: const TextStyle(
              fontSize: 22,
              fontWeight: FontWeight.bold,
              color: AppColors.primaryContainer,
            ),
          ),
          const SizedBox(height: 4),
          Text(
            AppLocalization.get('Active bookings & status tracking'),
            style: const TextStyle(
              fontSize: 13,
              color: AppColors.textSecondary,
            ),
          ),
          const SizedBox(height: 20),
          Row(
            children: [
              Text(
                AppLocalization.get('ACTIVE SERVICE'),
                style: const TextStyle(
                  fontSize: 12.5,
                  fontWeight: FontWeight.bold,
                  color: AppColors.primaryContainer,
                  letterSpacing: 0.5,
                ),
              ),
              const SizedBox(width: 8),
              Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
                decoration: BoxDecoration(
                  color: const Color(0xFFD1FAE5),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Text(
                  AppLocalization.get('1 ACTIVE'),
                  style: const TextStyle(
                    fontSize: 10,
                    fontWeight: FontWeight.bold,
                    color: AppColors.cooperativeGreen,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 12),
          _buildActiveServiceCard(),
          const SizedBox(height: 24),
          Text(
            AppLocalization.get('PREVIOUS REQUESTS'),
            style: const TextStyle(
              fontSize: 12.5,
              fontWeight: FontWeight.bold,
              color: AppColors.primaryContainer,
              letterSpacing: 0.5,
            ),
          ),
          const SizedBox(height: 12),
          _buildRecentServiceRow(
            icon: '⚡',
            iconBg: const Color(0xFFEDE9FE),
            title: AppLocalization.get('Electrical Repair'),
            categoryKey: 'electrical',
            status: AppLocalization.get('Completed'),
            date: '12 Sep 2026',
            amount: '₹650',
            labourCost: '₹500',
            materialsCost: '₹120',
            serviceCharge: '₹30',
          ),
          const SizedBox(height: 10),
          _buildRecentServiceRow(
            icon: '🔧',
            iconBg: const Color(0xFFE0F2FE),
            title: AppLocalization.get('Plumbing Repair'),
            categoryKey: 'plumbing',
            status: AppLocalization.get('Completed'),
            date: '28 Aug 2026',
            amount: '₹420',
            labourCost: '₹320',
            materialsCost: '₹70',
            serviceCharge: '₹30',
          ),
          const SizedBox(height: 20),
        ],
      ),
    );
  }

  // ── Placeholder tabs ──────────────────────────────────────────────────────
  Widget _buildPlaceholderTab(String label) {
    return Center(
      child: Text(label,
          style: const TextStyle(
              fontSize: 18,
              color: AppColors.textSecondary,
              fontWeight: FontWeight.w500)),
    );
  }

  // ── Bottom Navigation ─────────────────────────────────────────────────────
  Widget _buildBottomNav(String lang) {
    final items = [
      _NavItem(Icons.home_rounded, Icons.home_outlined,
          AppLocalization.get('Home')),
      _NavItem(Icons.receipt_long, Icons.receipt_long_outlined,
          AppLocalization.get('Requests')),
      _NavItem(Icons.apps_rounded, Icons.apps_outlined,
          AppLocalization.get('Services')),
      _NavItem(Icons.access_time_rounded, Icons.access_time_outlined,
          AppLocalization.get('History')),
      _NavItem(Icons.person_rounded, Icons.person_outline_rounded,
          AppLocalization.get('Profile')),
    ];

    return Container(
      decoration: const BoxDecoration(
        color: Colors.white,
        border: Border(top: BorderSide(color: AppColors.borderSubtle)),
      ),
      child: Row(
        children: items.asMap().entries.map((entry) {
          final i = entry.key;
          final item = entry.value;
          final isActive = _currentIndex == i;
          return Expanded(
            child: GestureDetector(
              onTap: () {
                if (i == 4) {
                  showHouseholdAccountModal(context);
                } else {
                  setState(() => _currentIndex = i);
                }
              },
              behavior: HitTestBehavior.opaque,
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 10),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Icon(
                      isActive ? item.activeIcon : item.icon,
                      size: 22,
                      color: isActive
                          ? AppColors.cooperativeGreen
                          : AppColors.textSecondary,
                    ),
                    const SizedBox(height: 3),
                    Text(
                      item.label,
                      style: TextStyle(
                        fontSize: 10,
                        fontWeight: isActive
                            ? FontWeight.bold
                            : FontWeight.normal,
                        color: isActive
                            ? AppColors.cooperativeGreen
                            : AppColors.textSecondary,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        }).toList(),
      ),
    );
  }
}

// ── Data classes ──────────────────────────────────────────────────────────────
class _ServiceCategory {
  final String emoji;
  final String label;
  const _ServiceCategory(this.emoji, this.label);
}

class _NavItem {
  final IconData activeIcon;
  final IconData icon;
  final String label;
  const _NavItem(this.activeIcon, this.icon, this.label);
}
