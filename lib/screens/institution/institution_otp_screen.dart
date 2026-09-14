import 'package:flutter/material.dart';
import '../../utils/localization.dart';
import 'institution_main_layout.dart';

class InstitutionOtpScreen extends StatefulWidget {
  final String phoneNumber;

  const InstitutionOtpScreen({
    super.key,
    this.phoneNumber = '+91 98765 43210',
  });

  @override
  State<InstitutionOtpScreen> createState() => _InstitutionOtpScreenState();
}

class _InstitutionOtpScreenState extends State<InstitutionOtpScreen> {
  final List<TextEditingController> _controllers =
      List.generate(6, (index) => TextEditingController());
  final List<FocusNode> _focusNodes = List.generate(6, (index) => FocusNode());

  @override
  void dispose() {
    for (var c in _controllers) {
      c.dispose();
    }
    for (var f in _focusNodes) {
      f.dispose();
    }
    super.dispose();
  }

  void _onQuickFillOtp() {
    const code = '794258';
    for (int i = 0; i < 6; i++) {
      _controllers[i].text = code[i];
    }
    setState(() {});
  }

  void _onClear() {
    for (var c in _controllers) {
      c.clear();
    }
    setState(() {});
    _focusNodes[0].requestFocus();
  }

  void _onVerify() {
    final enteredOtp = _controllers.map((c) => c.text).join();
    if (enteredOtp == '794258') {
      Navigator.pushAndRemoveUntil(
        context,
        MaterialPageRoute(builder: (context) => const InstitutionMainLayout()),
        (route) => false,
      );
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(AppLocalization.get('Invalid OTP code. Please enter 794258')),
          backgroundColor: Colors.red,
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final enteredOtp = _controllers.map((c) => c.text).join();
    final isComplete = enteredOtp.length == 6;

    return ValueListenableBuilder<String>(
      valueListenable: AppLocalization.currentLang,
      builder: (context, lang, child) {
        return Scaffold(
          backgroundColor: const Color(0xFFF8FAFC),
          body: SafeArea(
            child: SingleChildScrollView(
              padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  // Top Bar
                  Row(
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
                              style: const TextStyle(
                                fontSize: 13,
                                fontWeight: FontWeight.w600,
                                color: Color(0xFF123B5D),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 3),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(12),
                          border: Border.all(color: const Color(0xFFE2E8F0)),
                        ),
                        child: const Text(
                          'OTP VERIFICATION',
                          style: TextStyle(
                            fontSize: 10,
                            fontWeight: FontWeight.bold,
                            letterSpacing: 0.5,
                            color: Color(0xFF64748B),
                          ),
                        ),
                      ),
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
                                padding: EdgeInsets.symmetric(horizontal: 3.0),
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
                    ],
                  ),
                  const SizedBox(height: 24),

                  // SAHYOG Logo
                  Image.asset(
                    'assets/images/logo.png',
                    height: 50,
                    errorBuilder: (context, error, stackTrace) =>
                        const Text('SAHYOG', style: TextStyle(fontSize: 26, fontWeight: FontWeight.bold, color: Color(0xFF123B5D))),
                  ),
                  const SizedBox(height: 16),

                  // Key Icon Badge
                  Container(
                    width: 64,
                    height: 64,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: const Color(0xFFEFF6FF),
                      border: Border.all(color: const Color(0xFFBFDBFE)),
                    ),
                    child: const Center(
                      child: Icon(Icons.lock_clock_outlined, size: 28, color: Color(0xFF1D4ED8)),
                    ),
                  ),
                  const SizedBox(height: 16),

                  // Heading
                  Text(
                    AppLocalization.get('Verify your mobile number'),
                    style: const TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF123B5D),
                    ),
                  ),
                  const SizedBox(height: 6),
                  Text(
                    '${AppLocalization.get('Enter the 6-digit code sent to')}\n${widget.phoneNumber}',
                    textAlign: TextAlign.center,
                    style: const TextStyle(fontSize: 13, color: Color(0xFF64748B), height: 1.4),
                  ),
                  const SizedBox(height: 16),

                  // Quick Demo OTP Button
                  GestureDetector(
                    onTap: _onQuickFillOtp,
                    child: Container(
                      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                      decoration: BoxDecoration(
                        color: const Color(0xFFECFDF5),
                        borderRadius: BorderRadius.circular(16),
                        border: Border.all(color: const Color(0xFFA7F3D0)),
                      ),
                      child: const Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Icon(Icons.bolt, size: 14, color: Color(0xFF087443)),
                          SizedBox(width: 4),
                          Text(
                            'Valid OTP (794258) ⚡',
                            style: TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.bold,
                              color: Color(0xFF087443),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(height: 24),

                  // 6-digit OTP Input Boxes
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: List.generate(6, (index) {
                      return SizedBox(
                        width: 44,
                        height: 52,
                        child: TextField(
                          controller: _controllers[index],
                          focusNode: _focusNodes[index],
                          textAlign: TextAlign.center,
                          keyboardType: TextInputType.number,
                          maxLength: 1,
                          style: const TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: Color(0xFF0F172A),
                          ),
                          decoration: InputDecoration(
                            counterText: '',
                            filled: true,
                            fillColor: Colors.white,
                            contentPadding: EdgeInsets.zero,
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(12),
                              borderSide: BorderSide(
                                color: _controllers[index].text.isNotEmpty
                                    ? const Color(0xFF123B5D)
                                    : const Color(0xFFCBD5E1),
                                width: _controllers[index].text.isNotEmpty ? 1.5 : 1,
                              ),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(12),
                              borderSide: const BorderSide(
                                color: Color(0xFF123B5D),
                                width: 2,
                              ),
                            ),
                          ),
                          onChanged: (val) {
                            if (val.isNotEmpty && index < 5) {
                              _focusNodes[index + 1].requestFocus();
                            } else if (val.isEmpty && index > 0) {
                              _focusNodes[index - 1].requestFocus();
                            }
                            setState(() {});
                          },
                        ),
                      );
                    }),
                  ),
                  const SizedBox(height: 16),

                  // Clear & Resend Row
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      TextButton(
                        onPressed: _onClear,
                        child: const Text('Clear', style: TextStyle(fontSize: 12, color: Color(0xFF64748B))),
                      ),
                      Row(
                        children: [
                          const Icon(Icons.timer_outlined, size: 14, color: Color(0xFF64748B)),
                          const SizedBox(width: 4),
                          Text(
                            '${AppLocalization.get('Resend OTP')} in 45s',
                            style: const TextStyle(fontSize: 12, fontWeight: FontWeight.w600, color: Color(0xFF123B5D)),
                          ),
                        ],
                      ),
                    ],
                  ),
                  const SizedBox(height: 20),

                  // Verify & Continue Button
                  SizedBox(
                    width: double.infinity,
                    height: 48,
                    child: ElevatedButton(
                      onPressed: isComplete ? _onVerify : null,
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xFF123B5D),
                        disabledBackgroundColor: const Color(0xFFCBD5E1),
                        foregroundColor: Colors.white,
                        disabledForegroundColor: Colors.white,
                        elevation: 0,
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            AppLocalization.get('Verify & Continue'),
                            style: const TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
                          ),
                          const SizedBox(width: 6),
                          const Icon(Icons.arrow_forward, size: 16),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(height: 24),

                  // Security Note
                  Container(
                    padding: const EdgeInsets.all(12),
                    decoration: BoxDecoration(
                      color: const Color(0xFFF1F5F9),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: const Row(
                      children: [
                        Icon(Icons.shield_outlined, size: 16, color: Color(0xFF475569)),
                        SizedBox(width: 8),
                        Expanded(
                          child: Text(
                            'Authenticated via SAHYOG Digital Public Infrastructure Gateway.',
                            style: TextStyle(fontSize: 10.5, color: Color(0xFF475569)),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
