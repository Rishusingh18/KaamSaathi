import 'package:flutter/material.dart';
import '../../utils/localization.dart';
import 'institution_matching_workforce_screen.dart';

class InstitutionChooseWorkforceScreen extends StatefulWidget {
  const InstitutionChooseWorkforceScreen({super.key});

  @override
  State<InstitutionChooseWorkforceScreen> createState() =>
      _InstitutionChooseWorkforceScreenState();
}

class _InstitutionChooseWorkforceScreenState
    extends State<InstitutionChooseWorkforceScreen> {
  int _selectedModel = 0; // 0: Cooperative Teams, 1: Individual Workers

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
                // Top Bar
                Container(
                  color: Colors.white,
                  padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      GestureDetector(
                        onTap: () => Navigator.pop(context),
                        child: Row(
                          children: [
                            const Icon(Icons.arrow_back_ios_new, size: 14, color: Color(0xFF123B5D)),
                            const SizedBox(width: 4),
                            Text(
                              AppLocalization.get('Back'),
                              style: const TextStyle(fontSize: 13, fontWeight: FontWeight.w600, color: Color(0xFF123B5D)),
                            ),
                          ],
                        ),
                      ),
                      Text(
                        AppLocalization.get('Choose Workforce'),
                        style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Color(0xFF0F172A)),
                      ),
                      const SizedBox(width: 40),
                    ],
                  ),
                ),

                // Subheader requirement badge
                Container(
                  color: Colors.white,
                  padding: const EdgeInsets.fromLTRB(16, 0, 16, 12),
                  child: Row(
                    children: [
                      Container(
                        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                        decoration: BoxDecoration(
                          color: const Color(0xFFEFF6FF),
                          borderRadius: BorderRadius.circular(12),
                          border: Border.all(color: const Color(0xFFBFDBFE)),
                        ),
                        child: const Row(
                          children: [
                            Text('🎨', style: TextStyle(fontSize: 12)),
                            SizedBox(width: 4),
                            Text(
                              'College Campus Painting • 5 Workers',
                              style: TextStyle(fontSize: 11, fontWeight: FontWeight.bold, color: Color(0xFF1D4ED8)),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),

                // Segmented Selector
                Container(
                  margin: const EdgeInsets.all(16),
                  padding: const EdgeInsets.all(4),
                  decoration: BoxDecoration(
                    color: const Color(0xFFE2E8F0),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Row(
                    children: [
                      Expanded(
                        child: GestureDetector(
                          onTap: () => setState(() => _selectedModel = 0),
                          child: Container(
                            padding: const EdgeInsets.symmetric(vertical: 8),
                            decoration: BoxDecoration(
                              color: _selectedModel == 0 ? Colors.white : Colors.transparent,
                              borderRadius: BorderRadius.circular(10),
                              boxShadow: _selectedModel == 0
                                  ? [BoxShadow(color: Colors.black.withValues(alpha: 0.05), blurRadius: 4)]
                                  : null,
                            ),
                            child: Center(
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  const Text('🤝', style: TextStyle(fontSize: 13)),
                                  const SizedBox(width: 6),
                                  Text(
                                    'Cooperative Teams',
                                    style: TextStyle(
                                      fontSize: 12,
                                      fontWeight: FontWeight.bold,
                                      color: _selectedModel == 0 ? const Color(0xFF0F172A) : const Color(0xFF64748B),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                      Expanded(
                        child: GestureDetector(
                          onTap: () => setState(() => _selectedModel = 1),
                          child: Container(
                            padding: const EdgeInsets.symmetric(vertical: 8),
                            decoration: BoxDecoration(
                              color: _selectedModel == 1 ? Colors.white : Colors.transparent,
                              borderRadius: BorderRadius.circular(10),
                              boxShadow: _selectedModel == 1
                                  ? [BoxShadow(color: Colors.black.withValues(alpha: 0.05), blurRadius: 4)]
                                  : null,
                            ),
                            child: Center(
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  const Text('👷', style: TextStyle(fontSize: 13)),
                                  const SizedBox(width: 6),
                                  Text(
                                    'Direct Workers',
                                    style: TextStyle(
                                      fontSize: 12,
                                      fontWeight: FontWeight.bold,
                                      color: _selectedModel == 1 ? const Color(0xFF0F172A) : const Color(0xFF64748B),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),

                // Recommendation Badge
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  child: Container(
                    padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                    decoration: BoxDecoration(
                      color: const Color(0xFFECFDF5),
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(color: const Color(0xFFA7F3D0)),
                    ),
                    child: Row(
                      children: [
                        const Icon(Icons.thumb_up_alt_outlined, size: 14, color: Color(0xFF087443)),
                        const SizedBox(width: 8),
                        Expanded(
                          child: Text(
                            _selectedModel == 0
                                ? 'SAHYOG Recommendation: Co-ops provide coordinated supervisors, replacement guarantees, and GST invoices.'
                                : 'Direct Workers: Individual verified tradesmen engaged on daily wages with skill passport tracking.',
                            style: const TextStyle(fontSize: 11, color: Color(0xFF065F46), fontWeight: FontWeight.w500),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(height: 14),

                // List of matching teams / workers
                Expanded(
                  child: _selectedModel == 0
                      ? ListView(
                          padding: const EdgeInsets.symmetric(horizontal: 16),
                          physics: const BouncingScrollPhysics(),
                          children: [
                            // Cooperative Card 1: Nirman Shramik Co-op (Best Match)
                            _buildCoopCard(
                              context: context,
                              name: 'Nirman Shramik Cooperative',
                              rating: '4.9 ★',
                              reviews: '(124 projects)',
                              distance: '2.8 km away • Dwarka',
                              workersCount: '12 Available Painters (Team of 5 Ready)',
                              supervisor: 'Ramlal Kumar (Team Lead)',
                              quote: '₹750 / day / worker',
                              totalEst: '₹18,750 (5 days)',
                              isRecommended: true,
                            ),
                            const SizedBox(height: 14),

                            // Cooperative Card 2: Dwarka Ekta Co-op
                            _buildCoopCard(
                              context: context,
                              name: 'Dwarka Ekta Shramik Cooperative',
                              rating: '4.8 ★',
                              reviews: '(89 projects)',
                              distance: '4.1 km away • Janakpuri',
                              workersCount: '8 Available Painters (Team of 5 Ready)',
                              supervisor: 'Mohan Lal (Supervisor)',
                              quote: '₹780 / day / worker',
                              totalEst: '₹19,500 (5 days)',
                              isRecommended: false,
                            ),
                            const SizedBox(height: 20),
                          ],
                        )
                      : ListView(
                          padding: const EdgeInsets.symmetric(horizontal: 16),
                          physics: const BouncingScrollPhysics(),
                          children: [
                            _buildDirectWorkerCard(
                              context: context,
                              name: 'Ramlal Kumar',
                              trade: 'Senior Painter & Surface Specialist',
                              rating: '4.9 ★',
                              experience: '8 yrs exp',
                              distance: '1.5 km away',
                              rate: '₹750 / day',
                              passportId: 'SHY-DEL-2024-89',
                              isAvailable: true,
                            ),
                            const SizedBox(height: 14),
                            _buildDirectWorkerCard(
                              context: context,
                              name: 'Vikas Mehra',
                              trade: 'Commercial Interior Painter',
                              rating: '4.8 ★',
                              experience: '5 yrs exp',
                              distance: '2.3 km away',
                              rate: '₹720 / day',
                              passportId: 'SHY-DEL-2024-112',
                              isAvailable: true,
                            ),
                            const SizedBox(height: 14),
                            _buildDirectWorkerCard(
                              context: context,
                              name: 'Suresh Yadav',
                              trade: 'Exterior & Weatherproofing Painter',
                              rating: '4.7 ★',
                              experience: '6 yrs exp',
                              distance: '3.1 km away',
                              rate: '₹700 / day',
                              passportId: 'SHY-DEL-2023-45',
                              isAvailable: true,
                            ),
                            const SizedBox(height: 20),
                          ],
                        ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  Widget _buildCoopCard({
    required BuildContext context,
    required String name,
    required String rating,
    required String reviews,
    required String distance,
    required String workersCount,
    required String supervisor,
    required String quote,
    required String totalEst,
    required bool isRecommended,
  }) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(
          color: isRecommended ? const Color(0xFF087443) : const Color(0xFFE2E8F0),
          width: isRecommended ? 1.5 : 1,
        ),
        boxShadow: [
          BoxShadow(
            color: isRecommended ? const Color(0xFF087443).withValues(alpha: 0.04) : Colors.black.withValues(alpha: 0.02),
            blurRadius: 10,
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
              Row(
                children: [
                  Container(
                    width: 40,
                    height: 40,
                    decoration: BoxDecoration(
                      color: const Color(0xFFEFF6FF),
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(color: const Color(0xFFDBEAFE)),
                    ),
                    child: const Center(child: Text('🤝', style: TextStyle(fontSize: 18))),
                  ),
                  const SizedBox(width: 10),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(name, style: const TextStyle(fontSize: 14, fontWeight: FontWeight.bold, color: Color(0xFF0F172A))),
                      const SizedBox(height: 2),
                      Row(
                        children: [
                          Text(rating, style: const TextStyle(fontSize: 11, fontWeight: FontWeight.bold, color: Color(0xFF087443))),
                          const SizedBox(width: 4),
                          Text(reviews, style: const TextStyle(fontSize: 10.5, color: Color(0xFF94A3B8))),
                          const SizedBox(width: 6),
                          Text('• $distance', style: const TextStyle(fontSize: 10.5, color: Color(0xFF64748B))),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
              if (isRecommended)
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 3),
                  decoration: BoxDecoration(
                    color: const Color(0xFFDCFCE7),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: const Text('Top Match', style: TextStyle(fontSize: 10, fontWeight: FontWeight.bold, color: Color(0xFF087443))),
                ),
            ],
          ),
          const SizedBox(height: 12),
          Container(
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(
              color: const Color(0xFFF8FAFC),
              borderRadius: BorderRadius.circular(10),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    const Icon(Icons.group, size: 14, color: Color(0xFF087443)),
                    const SizedBox(width: 6),
                    Text(workersCount, style: const TextStyle(fontSize: 11.5, fontWeight: FontWeight.bold, color: Color(0xFF087443))),
                  ],
                ),
                const SizedBox(height: 4),
                Row(
                  children: [
                    const Icon(Icons.person_pin, size: 14, color: Color(0xFF64748B)),
                    const SizedBox(width: 6),
                    Text('Supervisor: $supervisor', style: const TextStyle(fontSize: 11.5, color: Color(0xFF334155))),
                  ],
                ),
              ],
            ),
          ),
          const SizedBox(height: 12),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(quote, style: const TextStyle(fontSize: 11, color: Color(0xFF64748B))),
                  Text(totalEst, style: const TextStyle(fontSize: 14, fontWeight: FontWeight.bold, color: Color(0xFF123B5D))),
                ],
              ),
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => InstitutionMatchingWorkforceScreen(coopName: name),
                    ),
                  );
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFF087443),
                  foregroundColor: Colors.white,
                  elevation: 0,
                  padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 8),
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                ),
                child: const Text('Select Team →', style: TextStyle(fontSize: 12.5, fontWeight: FontWeight.bold)),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildDirectWorkerCard({
    required BuildContext context,
    required String name,
    required String trade,
    required String rating,
    required String experience,
    required String distance,
    required String rate,
    required String passportId,
    required bool isAvailable,
  }) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: const Color(0xFFE2E8F0)),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.02),
            blurRadius: 10,
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
              Row(
                children: [
                  Container(
                    width: 40,
                    height: 40,
                    decoration: BoxDecoration(
                      color: const Color(0xFFFEF3C7),
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(color: const Color(0xFFFDE68A)),
                    ),
                    child: const Center(child: Text('👷', style: TextStyle(fontSize: 18))),
                  ),
                  const SizedBox(width: 10),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(name, style: const TextStyle(fontSize: 14, fontWeight: FontWeight.bold, color: Color(0xFF0F172A))),
                      const SizedBox(height: 2),
                      Row(
                        children: [
                          Text(rating, style: const TextStyle(fontSize: 11, fontWeight: FontWeight.bold, color: Color(0xFF087443))),
                          const SizedBox(width: 4),
                          Text('• $experience', style: const TextStyle(fontSize: 10.5, color: Color(0xFF64748B))),
                          const SizedBox(width: 4),
                          Text('• $distance', style: const TextStyle(fontSize: 10.5, color: Color(0xFF64748B))),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 3),
                decoration: BoxDecoration(
                  color: isAvailable ? const Color(0xFFDCFCE7) : const Color(0xFFF1F5F9),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Text(
                  isAvailable ? 'Available' : 'Engaged',
                  style: TextStyle(
                    fontSize: 10,
                    fontWeight: FontWeight.bold,
                    color: isAvailable ? const Color(0xFF087443) : const Color(0xFF64748B),
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 12),
          Container(
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(
              color: const Color(0xFFF8FAFC),
              borderRadius: BorderRadius.circular(10),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(trade, style: const TextStyle(fontSize: 11.5, color: Color(0xFF334155), fontWeight: FontWeight.w500)),
                Text('ID: $passportId', style: const TextStyle(fontSize: 11, color: Color(0xFF64748B))),
              ],
            ),
          ),
          const SizedBox(height: 12),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(rate, style: const TextStyle(fontSize: 14, fontWeight: FontWeight.bold, color: Color(0xFF123B5D))),
              ElevatedButton(
                onPressed: isAvailable
                    ? () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => InstitutionMatchingWorkforceScreen(coopName: 'Direct: $name'),
                          ),
                        );
                      }
                    : null,
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFF087443),
                  disabledBackgroundColor: const Color(0xFFE2E8F0),
                  foregroundColor: Colors.white,
                  disabledForegroundColor: const Color(0xFF94A3B8),
                  elevation: 0,
                  padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 8),
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                ),
                child: const Text('Assign Worker →', style: TextStyle(fontSize: 12.5, fontWeight: FontWeight.bold)),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
