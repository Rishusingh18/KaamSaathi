import 'package:flutter/material.dart';
import '../../utils/localization.dart';
import 'institution_invoice_screen.dart';

class InstitutionCompletionPaymentScreen extends StatefulWidget {
  const InstitutionCompletionPaymentScreen({super.key});

  @override
  State<InstitutionCompletionPaymentScreen> createState() =>
      _InstitutionCompletionPaymentScreenState();
}

class _InstitutionCompletionPaymentScreenState
    extends State<InstitutionCompletionPaymentScreen> {
  int _rating = 5;
  int _selectedPaymentMethod = 0; // 0: Escrow Release, 1: Bank Transfer, 2: UPI

  void _onProceedToPayment() {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (context) => Container(
        padding: const EdgeInsets.all(24),
        decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.vertical(top: Radius.circular(24)),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              width: 56,
              height: 56,
              decoration: const BoxDecoration(
                color: Color(0xFFDCFCE7),
                shape: BoxShape.circle,
              ),
              child: const Center(
                child: Icon(Icons.check_circle, color: Color(0xFF087443), size: 36),
              ),
            ),
            const SizedBox(height: 16),
            Text(
              AppLocalization.get('Payment Initiated ✓'),
              style: const TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Color(0xFF0F172A),
              ),
            ),
            Text(
              _selectedPaymentMethod == 0
                  ? 'Payment of ₹21,788 has been successfully authorized and released from Escrow to Nirman Shramik Cooperative.'
                  : _selectedPaymentMethod == 1
                      ? 'Payment of ₹21,788 has been initiated via Direct Institutional Bank Transfer to Nirman Shramik Cooperative.'
                      : 'Payment of ₹21,788 has been successfully authorized via Corporate UPI / Net Banking to Nirman Shramik Cooperative.',
              textAlign: TextAlign.center,
              style: const TextStyle(fontSize: 13, color: Color(0xFF64748B), height: 1.4),
            ),
            const SizedBox(height: 8),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
              decoration: BoxDecoration(
                color: const Color(0xFFF1F5F9),
                borderRadius: BorderRadius.circular(10),
              ),
              child: const Text('Transaction Ref: TXN-SHY-2026-94812', style: TextStyle(fontSize: 11, fontWeight: FontWeight.bold, color: Color(0xFF1E293B))),
            ),
            const SizedBox(height: 24),
            SizedBox(
              width: double.infinity,
              height: 46,
              child: ElevatedButton(
                onPressed: () {
                  Navigator.pop(context);
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(builder: (context) => const InstitutionInvoiceScreen()),
                  );
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFF123B5D),
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                ),
                child: Text(
                  AppLocalization.get('View Digital Invoice →'),
                  style: const TextStyle(fontSize: 14, fontWeight: FontWeight.bold, color: Colors.white),
                ),
              ),
            ),
          ],
        ),
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
                        AppLocalization.get('Project Completion & Payment'),
                        style: const TextStyle(fontSize: 15, fontWeight: FontWeight.bold, color: Color(0xFF0F172A)),
                      ),
                      const SizedBox(width: 40),
                    ],
                  ),
                ),

                // Main Content
                Expanded(
                  child: SingleChildScrollView(
                    physics: const BouncingScrollPhysics(),
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // Completion Summary
                        Container(
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
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    AppLocalization.get('College Campus Painting'),
                                    style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Color(0xFF0F172A)),
                                  ),
                                  Container(
                                    padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 3),
                                    decoration: BoxDecoration(
                                      color: const Color(0xFFDCFCE7),
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                    child: const Text('Work Completed ✓', style: TextStyle(fontSize: 10.5, fontWeight: FontWeight.bold, color: Color(0xFF087443))),
                                  ),
                                ],
                              ),
                              const SizedBox(height: 4),
                              const Text('Nirman Shramik Cooperative • 5 Workers Deployed', style: TextStyle(fontSize: 12, color: Color(0xFF64748B))),
                              const SizedBox(height: 12),

                              // Rating Stars
                              const Text('Quality & Performance Rating', style: TextStyle(fontSize: 12.5, fontWeight: FontWeight.bold, color: Color(0xFF0F172A))),
                              const SizedBox(height: 8),
                              Row(
                                children: List.generate(5, (index) {
                                  return GestureDetector(
                                    onTap: () => setState(() => _rating = index + 1),
                                    child: Padding(
                                      padding: const EdgeInsets.only(right: 6.0),
                                      child: Icon(
                                        index < _rating ? Icons.star : Icons.star_border,
                                        size: 28,
                                        color: const Color(0xFFF59E0B),
                                      ),
                                    ),
                                  );
                                }),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(height: 14),

                        // Itemized Settlement Calculation
                        Container(
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(16),
                            border: Border.all(color: const Color(0xFFE2E8F0)),
                          ),
                          padding: const EdgeInsets.all(16),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Text('Cost & Payment Breakdown', style: TextStyle(fontSize: 13.5, fontWeight: FontWeight.bold, color: Color(0xFF0F172A))),
                              const SizedBox(height: 12),
                              _buildCostItem('Base Labor (5 workers × 5 days @ ₹750)', '₹18,750'),
                              const SizedBox(height: 6),
                              _buildCostItem('Equipment & Scaffolding Fee', '₹2,000'),
                              const SizedBox(height: 6),
                              _buildCostItem('GST & Platform Fee (5%)', '₹1,038'),
                              const Divider(height: 20),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: const [
                                  Text('Total Settlement Amount', style: TextStyle(fontSize: 13.5, fontWeight: FontWeight.bold, color: Color(0xFF0F172A))),
                                  Text('₹21,788', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Color(0xFF087443))),
                                ],
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(height: 14),

                        // Select Payment Method
                        Container(
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(16),
                            border: Border.all(color: const Color(0xFFE2E8F0)),
                          ),
                          padding: const EdgeInsets.all(16),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Text('Payment Settlement Method', style: TextStyle(fontSize: 13.5, fontWeight: FontWeight.bold, color: Color(0xFF0F172A))),
                              const SizedBox(height: 10),
                              _buildPaymentOption(0, 'Release from Pre-funded Escrow', 'Balance: ₹50,000 available', Icons.verified_user),
                              const SizedBox(height: 8),
                              _buildPaymentOption(1, 'Direct Institutional Bank Transfer', 'NEFT / RTGS Corporate Account', Icons.account_balance),
                              const SizedBox(height: 8),
                              _buildPaymentOption(2, 'Corporate UPI / Net Banking', 'Instant UPI verification', Icons.qr_code),
                            ],
                          ),
                        ),
                        const SizedBox(height: 20),

                        // Action Button
                        SizedBox(
                          width: double.infinity,
                          height: 48,
                          child: ElevatedButton(
                            onPressed: _onProceedToPayment,
                            style: ElevatedButton.styleFrom(
                              backgroundColor: const Color(0xFF087443),
                              foregroundColor: Colors.white,
                              elevation: 0,
                              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  AppLocalization.get('Proceed to Payment →'),
                                  style: const TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
                                ),
                              ],
                            ),
                          ),
                        ),
                        const SizedBox(height: 16),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  Widget _buildCostItem(String title, String amount) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(title, style: const TextStyle(fontSize: 12, color: Color(0xFF64748B))),
        Text(amount, style: const TextStyle(fontSize: 12, fontWeight: FontWeight.w600, color: Color(0xFF334155))),
      ],
    );
  }

  Widget _buildPaymentOption(int index, String title, String sub, IconData icon) {
    final isSelected = _selectedPaymentMethod == index;
    return GestureDetector(
      onTap: () => setState(() => _selectedPaymentMethod = index),
      child: Container(
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
          color: isSelected ? const Color(0xFFF0FDF4) : const Color(0xFFF8FAFC),
          borderRadius: BorderRadius.circular(12),
          border: Border.all(
            color: isSelected ? const Color(0xFF087443) : const Color(0xFFE2E8F0),
            width: isSelected ? 1.5 : 1,
          ),
        ),
        child: Row(
          children: [
            Icon(icon, size: 20, color: isSelected ? const Color(0xFF087443) : const Color(0xFF64748B)),
            const SizedBox(width: 10),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(title, style: const TextStyle(fontSize: 12.5, fontWeight: FontWeight.bold, color: Color(0xFF0F172A))),
                  Text(sub, style: const TextStyle(fontSize: 11, color: Color(0xFF64748B))),
                ],
              ),
            ),
            Container(
              width: 20,
              height: 20,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(
                  color: isSelected ? const Color(0xFF087443) : const Color(0xFF94A3B8),
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
                          color: Color(0xFF087443),
                        ),
                      ),
                    )
                  : null,
            ),
          ],
        ),
      ),
    );
  }
}
