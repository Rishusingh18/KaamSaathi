import 'package:flutter/material.dart';
import '../theme/colors.dart';
import '../widgets/custom_buttons.dart';
import '../utils/localization.dart';
import 'verification_screen.dart';
import 'worker_verification_screen.dart';
import 'household_dashboard_screen.dart';

class OtpScreen extends StatefulWidget {
  final String mobileNumber;
  final String role;

  const OtpScreen({Key? key, required this.mobileNumber, this.role = 'Cooperative'}) : super(key: key);

  @override
  State<OtpScreen> createState() => _OtpScreenState();
}

class _OtpScreenState extends State<OtpScreen> {
  final List<TextEditingController> _otpControllers = List.generate(6, (index) => TextEditingController());
  final List<FocusNode> _focusNodes = List.generate(6, (index) => FocusNode());
  bool _isError = false;

  @override
  void dispose() {
    for (var controller in _otpControllers) {
      controller.dispose();
    }
    for (var node in _focusNodes) {
      node.dispose();
    }
    super.dispose();
  }

  void _onOtpChanged(String value, int index) {
    setState(() {
      _isError = false;
    });
    if (value.isNotEmpty && index < 5) {
      _focusNodes[index + 1].requestFocus();
    }
  }

  String _getOtp() {
    return _otpControllers.map((c) => c.text).join();
  }

  void _handleVerify() {
    final otp = _getOtp();
    if (otp == '794258') {
      Widget destination;
      if (widget.role == 'Worker') {
        destination = const WorkerVerificationScreen();
      } else if (widget.role == 'Household') {
        destination = const HouseholdDashboardScreen();
      } else {
        destination = const VerificationScreen();
      }
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => destination),
      );
    } else {
      setState(() {
        _isError = true;
      });
    }
  }

  void _demoOtp() {
    final demo = '794258';
    for (int i = 0; i < 6; i++) {
      _otpControllers[i].text = demo[i];
    }
    setState(() {
      _isError = false;
    });
    _handleVerify();
  }

  void _clearOtp() {
    for (int i = 0; i < 6; i++) {
      _otpControllers[i].text = '';
    }
    setState(() {
      _isError = false;
    });
    _focusNodes[0].requestFocus();
  }

  @override
  Widget build(BuildContext context) {
    final isComplete = _getOtp().length == 6;

    return Scaffold(
      backgroundColor: AppColors.surfaceCanvas,
      appBar: AppBar(
        leading: TextButton.icon(
          onPressed: () => Navigator.pop(context),
          icon: const Icon(Icons.arrow_back_ios_new, size: 16),
          label: Text(AppLocalization.get('Back').replaceAll('Back', AppLocalization.currentLang.value == 'HI' ? 'पीछे' : 'Back')),
          style: TextButton.styleFrom(foregroundColor: AppColors.textSecondary),
        ),
        leadingWidth: 80,
        actions: [
          Container(
            margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 16),
            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
            decoration: BoxDecoration(
              color: Colors.grey[100],
              borderRadius: BorderRadius.circular(16),
              border: Border.all(color: Colors.grey[300]!),
            ),
            child: Row(
              children: [
                GestureDetector(
                  onTap: () => AppLocalization.setLanguage('EN'),
                  child: Text(AppLocalization.get('EN'), 
                    style: TextStyle(
                      fontWeight: AppLocalization.currentLang.value == 'EN' ? FontWeight.bold : FontWeight.normal, 
                      fontSize: 11, 
                      color: AppLocalization.currentLang.value == 'EN' ? AppColors.primaryContainer : Colors.grey
                    )
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 4.0),
                  child: Text('|', style: TextStyle(fontSize: 11, color: Colors.grey)),
                ),
                GestureDetector(
                  onTap: () => AppLocalization.setLanguage('HI'),
                  child: Text(AppLocalization.get('हिन्दी'), 
                    style: TextStyle(
                      fontWeight: AppLocalization.currentLang.value == 'HI' ? FontWeight.bold : FontWeight.normal, 
                      fontSize: 11, 
                      color: AppLocalization.currentLang.value == 'HI' ? AppColors.primaryContainer : Colors.grey
                    )
                  ),
                ),
              ],
            ),
          )
        ],
      ),
      body: SafeArea(
        child: ValueListenableBuilder<String>(
          valueListenable: AppLocalization.currentLang,
          builder: (context, lang, child) {
            return SingleChildScrollView(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Image.asset(
                'assets/images/logo.png',
                height: 56,
                errorBuilder: (context, error, stackTrace) => 
                    const Text('SAHYOG', style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: AppColors.primaryContainer)),
              ),
              const SizedBox(height: 8),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                decoration: BoxDecoration(
                  color: const Color(0xFFECFDF5),
                  borderRadius: BorderRadius.circular(16),
                  border: Border.all(color: const Color(0xFFD1FAE5)),
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(widget.role == 'Worker' ? '👷' : (widget.role == 'Household' ? '🏠' : '🏢'), style: const TextStyle(fontSize: 12)),
                    const SizedBox(width: 6),
                    Text(
                      widget.role == 'Worker'
                          ? AppLocalization.get('WORKER • ओटीपी सत्यापन')
                          : (widget.role == 'Household'
                              ? AppLocalization.get('HOUSEHOLD • ओटीपी सत्यापन')
                              : AppLocalization.get('COOPERATIVE ADMIN • ओटीपी सत्यापन')),
                      style: const TextStyle(
                        fontSize: 11,
                        fontWeight: FontWeight.bold,
                        color: AppColors.cooperativeGreen,
                        letterSpacing: 0.5,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 12),
              Text(
                AppLocalization.get('Verify your mobile number'),
                style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: AppColors.primaryContainer),
              ),
              const SizedBox(height: 6),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    AppLocalization.get('Enter the 6-digit OTP sent to '),
                    style: const TextStyle(fontSize: 12, color: AppColors.textSecondary),
                  ),
                  Text(
                    '+91 XXXXXXX${widget.mobileNumber.length >= 4 ? widget.mobileNumber.substring(widget.mobileNumber.length - 3) : "XXX"}',
                    style: const TextStyle(fontSize: 12, fontWeight: FontWeight.bold, color: AppColors.textPrimary),
                  ),
                  const SizedBox(width: 4),
                  const Icon(Icons.edit, size: 14, color: AppColors.primaryContainer),
                ],
              ),
              const SizedBox(height: 24),
              
              Container(
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: Colors.white,
                  border: Border.all(color: AppColors.borderSubtle),
                  borderRadius: BorderRadius.circular(16),
                  boxShadow: [
                    BoxShadow(color: Colors.black.withOpacity(0.02), blurRadius: 8, offset: const Offset(0, 2))
                  ]
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            Container(width: 6, height: 12, color: AppColors.primaryContainer, margin: const EdgeInsets.only(right: 6)),
                            Text(AppLocalization.get('SECURITY PIN'), style: const TextStyle(fontSize: 11, fontWeight: FontWeight.bold, color: AppColors.primaryContainer)),
                          ],
                        ),
                        Container(
                          padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
                          decoration: BoxDecoration(
                            color: Colors.grey[100],
                            borderRadius: BorderRadius.circular(4),
                          ),
                          child: Text(
                            lang == 'HI' ? '${_getOtp().length}/6 अंक' : 'Entered ${_getOtp().length} of 6 digits',
                            style: const TextStyle(fontSize: 10, fontWeight: FontWeight.bold, color: AppColors.textSecondary),
                          ),
                        )
                      ],
                    ),
                    const SizedBox(height: 16),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: List.generate(6, (index) {
                        return SizedBox(
                          width: 44,
                          height: 48,
                          child: TextField(
                            controller: _otpControllers[index],
                            focusNode: _focusNodes[index],
                            keyboardType: TextInputType.number,
                            textAlign: TextAlign.center,
                            maxLength: 1,
                            onChanged: (val) => _onOtpChanged(val, index),
                            decoration: InputDecoration(
                              counterText: '',
                              filled: true,
                              fillColor: _otpControllers[index].text.isNotEmpty ? Colors.white : Colors.grey[50],
                              border: OutlineInputBorder(borderRadius: BorderRadius.circular(12), borderSide: BorderSide(color: Colors.grey[300]!)),
                              enabledBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(12), borderSide: BorderSide(color: _otpControllers[index].text.isNotEmpty ? AppColors.primaryContainer : Colors.grey[300]!)),
                              focusedBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(12), borderSide: const BorderSide(color: AppColors.primaryContainer, width: 2)),
                              contentPadding: EdgeInsets.zero,
                            ),
                            style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: AppColors.primaryContainer),
                          ),
                        );
                      }),
                    ),
                    if (_isError)
                      Padding(
                        padding: const EdgeInsets.only(top: 12.0),
                        child: Container(
                          padding: const EdgeInsets.all(8),
                          decoration: BoxDecoration(
                            color: Colors.red[50],
                            borderRadius: BorderRadius.circular(8),
                            border: Border.all(color: Colors.red[200]!),
                          ),
                          child: Row(
                            children: [
                              const Icon(Icons.error_outline, color: Colors.red, size: 16),
                              const SizedBox(width: 8),
                              Expanded(child: Text(AppLocalization.get('Incorrect OTP. Please check the code or click resend below.'), style: const TextStyle(fontSize: 11, color: Colors.red))),
                            ],
                          ),
                        ),
                      ),
                    const SizedBox(height: 12),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        TextButton.icon(
                          onPressed: _demoOtp,
                          icon: const Icon(Icons.flash_on, size: 14),
                          label: Text(AppLocalization.get('Test Demo OTP (794258)')),
                          style: TextButton.styleFrom(
                            foregroundColor: AppColors.cooperativeGreen,
                            backgroundColor: const Color(0xFFECFDF5),
                            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                            minimumSize: const Size(0, 0),
                            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
                          ),
                        ),
                        TextButton(
                          onPressed: _clearOtp,
                          style: TextButton.styleFrom(
                            foregroundColor: AppColors.textSecondary,
                            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                            minimumSize: const Size(0, 0),
                          ),
                          child: Text(AppLocalization.get('Clear'), style: const TextStyle(fontSize: 11)),
                        )
                      ],
                    ),
                    const SizedBox(height: 16),
                    PrimaryButton(
                      text: AppLocalization.get('Verify & Continue →').replaceAll(' →', ''),
                      onPressed: isComplete ? _handleVerify : null,
                    ),
                    const SizedBox(height: 12),
                    Center(
                      child: Column(
                        children: [
                          Text(AppLocalization.get('Didn\'t receive the OTP?'), style: const TextStyle(fontSize: 11, color: AppColors.textSecondary)),
                          const SizedBox(height: 4),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              const Icon(Icons.refresh, size: 12, color: AppColors.textSecondary),
                              const SizedBox(width: 4),
                              Text(AppLocalization.get('Resend OTP in 00:30'), style: const TextStyle(fontSize: 11, fontWeight: FontWeight.bold, color: AppColors.textSecondary)),
                            ],
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),

              const SizedBox(height: 16),
              Container(
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                  color: const Color(0xFFECFDF5),
                  border: Border.all(color: const Color(0xFFD1FAE5)),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      padding: const EdgeInsets.all(4),
                      decoration: const BoxDecoration(shape: BoxShape.circle, color: AppColors.cooperativeGreen),
                      child: const Icon(Icons.shield, size: 12, color: Colors.white),
                    ),
                    const SizedBox(width: 8),
                    Expanded(
                      child: Text.rich(
                        TextSpan(
                          children: widget.role == 'Worker' ? [
                            TextSpan(text: AppLocalization.get('Worker Mobile Verification\n'), style: const TextStyle(fontWeight: FontWeight.bold, color: AppColors.cooperativeGreen)),
                            TextSpan(text: AppLocalization.get('This OTP verifies your mobile number. Your profile and skills will be verified on the next step.'), style: const TextStyle(color: Color(0xFF022C22))),
                          ] : widget.role == 'Household' ? [
                            TextSpan(text: AppLocalization.get('Household Mobile Verification\n'), style: const TextStyle(fontWeight: FontWeight.bold, color: AppColors.cooperativeGreen)),
                            TextSpan(text: AppLocalization.get('This OTP verifies your mobile number for booking trusted local services under SAHYOG.'), style: const TextStyle(color: Color(0xFF022C22))),
                          ] : [
                            TextSpan(text: AppLocalization.get('Authorized Representative Verification\n'), style: const TextStyle(fontWeight: FontWeight.bold, color: AppColors.cooperativeGreen)),
                            TextSpan(text: AppLocalization.get('This OTP verifies the registered administrator mobile number under SAHYOG Digital Public Infrastructure. Cooperative entity verification occurs on the next step.'), style: const TextStyle(color: Color(0xFF022C22))),
                          ],
                        ),
                        style: const TextStyle(fontSize: 11, height: 1.4),
                      ),
                    ),
                  ],
                ),
              ),
              
              const SizedBox(height: 24),
              Text(
                AppLocalization.get('COOPERATE. EMPOWER. GROW.'),
                style: const TextStyle(fontSize: 10, color: Colors.grey, fontWeight: FontWeight.bold, letterSpacing: 1),
                textAlign: TextAlign.center,
              ),
            ],
          ),
          );
        },
        ),
      ),
    );
  }
}
