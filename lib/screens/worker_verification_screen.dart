import 'package:flutter/material.dart';
import '../theme/colors.dart';
import '../widgets/custom_buttons.dart';
import '../utils/localization.dart';
import 'worker_main_layout.dart';
import 'skill_passport_screen.dart';

class WorkerVerificationScreen extends StatefulWidget {
  const WorkerVerificationScreen({Key? key}) : super(key: key);

  @override
  State<WorkerVerificationScreen> createState() => _WorkerVerificationScreenState();
}

class _WorkerVerificationScreenState extends State<WorkerVerificationScreen> {
  final TextEditingController _uanController = TextEditingController();
  bool _consentChecked = false;
  bool _isVerifying = false;
  
  @override
  void dispose() {
    _uanController.dispose();
    super.dispose();
  }

  void _fillSample() {
    setState(() {
      _uanController.text = '123456789012';
    });
  }

  void _handleVerify() async {
    setState(() { _isVerifying = true; });
    await Future.delayed(const Duration(milliseconds: 1500));
    if (mounted) {
      setState(() { _isVerifying = false; });
      
      // Simulated validation for demo
      if (RegExp(r'^\d{12}$').hasMatch(_uanController.text)) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(AppLocalization.get('Simulated Verification Successful')),
            backgroundColor: AppColors.cooperativeGreen,
            duration: const Duration(seconds: 2),
          ),
        );
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const SkillPassportScreen()),
        );
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(AppLocalization.get('Simulated Verification Failed: Invalid UAN')),
            backgroundColor: Colors.red,
            duration: const Duration(seconds: 3),
          ),
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<String>(
      valueListenable: AppLocalization.currentLang,
      builder: (context, lang, child) {
        return Scaffold(
          backgroundColor: AppColors.surfaceCanvas,
          appBar: AppBar(
            leading: TextButton.icon(
              onPressed: () => Navigator.pop(context),
              icon: const Icon(Icons.arrow_back_ios_new, size: 16),
              label: Text(AppLocalization.get('Back').replaceAll('Back', lang == 'HI' ? 'पीछे' : 'Back')),
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
                      child: Text(
                        'EN', 
                        style: TextStyle(
                          fontWeight: lang == 'EN' ? FontWeight.bold : FontWeight.normal, 
                          fontSize: 11, 
                          color: lang == 'EN' ? AppColors.primaryContainer : Colors.grey
                        )
                      ),
                    ),
                    const Padding(
                      padding: EdgeInsets.symmetric(horizontal: 4.0),
                      child: Text('|', style: TextStyle(fontSize: 11, color: Colors.grey)),
                    ),
                    GestureDetector(
                      onTap: () => AppLocalization.setLanguage('HI'),
                      child: Text(
                        'हिन्दी', 
                        style: TextStyle(
                          fontWeight: lang == 'HI' ? FontWeight.bold : FontWeight.normal, 
                          fontSize: 11, 
                          color: lang == 'HI' ? AppColors.primaryContainer : Colors.grey
                        )
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
          body: SafeArea(
            child: SingleChildScrollView(
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
                  const SizedBox(height: 12),
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
                        const Icon(Icons.circle, size: 8, color: AppColors.cooperativeGreen),
                        const SizedBox(width: 6),
                        Text(
                          AppLocalization.get('Identity Verification • ई-श्रम सत्यापन'),
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
                  const SizedBox(height: 16),
                  Text(
                    AppLocalization.get('Verify your identity'),
                    style: const TextStyle(fontSize: 22, fontWeight: FontWeight.bold, color: AppColors.primaryContainer),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    AppLocalization.get('Verify your details using your e-Shram record.'),
                    style: const TextStyle(fontSize: 13, color: AppColors.textSecondary),
                    textAlign: TextAlign.center,
                  ),
                  
                  const SizedBox(height: 24),
                  
                  // Info Card
                  Container(
                    padding: const EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(16),
                      border: Border.all(color: AppColors.borderSubtle),
                    ),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          padding: const EdgeInsets.all(8),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(12),
                            border: Border.all(color: AppColors.borderSubtle),
                          ),
                          child: const Icon(Icons.verified_user_outlined, color: AppColors.primaryContainer),
                        ),
                        // Small orange dot could be positioned top right of icon, but this is an approximation
                        const SizedBox(width: 12),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                children: [
                                  Text(
                                    AppLocalization.get('National Social Security (UAN)'),
                                    style: const TextStyle(fontSize: 12, fontWeight: FontWeight.bold, color: AppColors.primaryContainer),
                                  ),
                                  const SizedBox(width: 6),
                                  Container(
                                    padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
                                    decoration: BoxDecoration(
                                      color: const Color(0xFFECFDF5),
                                      borderRadius: BorderRadius.circular(4),
                                    ),
                                    child: Text(
                                      AppLocalization.get('GOVT'),
                                      style: const TextStyle(fontSize: 9, fontWeight: FontWeight.bold, color: AppColors.cooperativeGreen),
                                    ),
                                  ),
                                ],
                              ),
                              const SizedBox(height: 4),
                              Text(
                                AppLocalization.get('Connects your Skill Passport and cooperative gig benefits.'),
                                style: const TextStyle(fontSize: 11, color: AppColors.textSecondary),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  
                  const SizedBox(height: 16),
                  
                  // Form Card
                  Container(
                    padding: const EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(16),
                      border: Border.all(color: AppColors.borderSubtle),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              AppLocalization.get('e-Shram UAN (Universal Account Number)'),
                              style: const TextStyle(fontSize: 12, fontWeight: FontWeight.bold, color: AppColors.primaryContainer),
                            ),
                            Text(
                              '${_uanController.text.length} / 12',
                              style: const TextStyle(fontSize: 11, color: AppColors.textSecondary, fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                        const SizedBox(height: 8),
                        TextField(
                          controller: _uanController,
                          keyboardType: TextInputType.number,
                          maxLength: 12,
                          onChanged: (_) => setState(() {}),
                          decoration: InputDecoration(
                            counterText: '',
                            filled: true,
                            fillColor: Colors.white,
                            hintText: AppLocalization.get('Enter your 12-digit UAN'),
                            hintStyle: const TextStyle(color: Colors.black38, fontSize: 13),
                            contentPadding: const EdgeInsets.symmetric(horizontal: 12, vertical: 14),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(12),
                              borderSide: const BorderSide(color: AppColors.borderSubtle),
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(12),
                              borderSide: const BorderSide(color: AppColors.borderSubtle),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(12),
                              borderSide: const BorderSide(color: AppColors.primaryContainer),
                            ),
                          ),
                          style: const TextStyle(fontSize: 14, fontWeight: FontWeight.w600, color: AppColors.textPrimary),
                        ),
                        const SizedBox(height: 8),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              AppLocalization.get('Example: 1234 5678 9012'),
                              style: const TextStyle(fontSize: 11, color: AppColors.textSecondary),
                            ),
                            GestureDetector(
                              onTap: _fillSample,
                              child: Text(
                                AppLocalization.get('Fill Sample'),
                                style: const TextStyle(fontSize: 11, fontWeight: FontWeight.bold, color: AppColors.cooperativeGreen),
                              ),
                            ),
                          ],
                        ),
                        
                        const Padding(
                          padding: EdgeInsets.symmetric(vertical: 16.0),
                          child: Divider(height: 1, color: AppColors.borderSubtle),
                        ),
                        
                        GestureDetector(
                          onTap: () => setState(() => _consentChecked = !_consentChecked),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                width: 20,
                                height: 20,
                                margin: const EdgeInsets.only(top: 2, right: 10),
                                decoration: BoxDecoration(
                                  border: Border.all(color: _consentChecked ? AppColors.cooperativeGreen : AppColors.borderSubtle),
                                  borderRadius: BorderRadius.circular(4),
                                  color: _consentChecked ? AppColors.cooperativeGreen : Colors.white,
                                ),
                                child: _consentChecked 
                                    ? const Icon(Icons.check, size: 14, color: Colors.white)
                                    : null,
                              ),
                              Expanded(
                                child: Text.rich(
                                  TextSpan(
                                    children: [
                                      TextSpan(
                                        text: AppLocalization.get('I consent to verify my details through e-Shram.').replaceAll('e-Shram.', ''),
                                        style: const TextStyle(fontSize: 12, fontWeight: FontWeight.bold, color: AppColors.textPrimary)
                                      ),
                                      const TextSpan(
                                        text: 'e-Shram.',
                                        style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold, color: AppColors.primaryContainer)
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        
                        const SizedBox(height: 16),
                        
                        SizedBox(
                          width: double.infinity,
                          child: ElevatedButton(
                            onPressed: (_uanController.text.length == 12 && _consentChecked && !_isVerifying) ? _handleVerify : null,
                            style: ElevatedButton.styleFrom(
                              backgroundColor: AppColors.primaryContainer,
                              disabledBackgroundColor: Colors.grey.shade200,
                              foregroundColor: Colors.white,
                              disabledForegroundColor: Colors.grey.shade400,
                              padding: const EdgeInsets.symmetric(vertical: 14),
                              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                            ),
                            child: _isVerifying 
                                ? const SizedBox(height: 20, width: 20, child: CircularProgressIndicator(strokeWidth: 2, color: Colors.white))
                                : Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text(
                                        AppLocalization.get('Verify with e-Shram (Simulated) →').replaceAll(' →', ''),
                                        style: const TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
                                      ),
                                      const SizedBox(width: 8),
                                      const Icon(Icons.arrow_forward, size: 16),
                                    ],
                                  ),
                          ),
                        ),
                        const SizedBox(height: 12),
                        Center(
                          child: Text(
                            AppLocalization.get('Note: This is a simulated verification for demo purposes.'),
                            style: const TextStyle(fontSize: 11, color: AppColors.textSecondary, fontStyle: FontStyle.italic),
                            textAlign: TextAlign.center,
                          ),
                        ),
                      ],
                    ),
                  ),
                  
                  const SizedBox(height: 24),
                  
                  GestureDetector(
                    onTap: () {
                      Navigator.pushAndRemoveUntil(
                        context,
                        MaterialPageRoute(builder: (context) => const WorkerMainLayout()),
                        (route) => false,
                      );
                    },
                    child: Container(
                      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 10),
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.blue.withOpacity(0.3), style: BorderStyle.solid, width: 2),
                        borderRadius: BorderRadius.circular(16),
                      ),
                      child: Text(
                        AppLocalization.get('Skip for now'),
                        style: const TextStyle(fontSize: 13, fontWeight: FontWeight.bold, color: AppColors.primaryContainer),
                      ),
                    ),
                  ),
                  
                  const SizedBox(height: 32),
                  
                  // Trust Banner
                  Container(
                    padding: const EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      color: const Color(0xFFF0FDF4),
                      borderRadius: BorderRadius.circular(8),
                      border: Border.all(color: const Color(0xFFBBF7D0)),
                    ),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          padding: const EdgeInsets.all(4),
                          decoration: const BoxDecoration(shape: BoxShape.circle, color: AppColors.cooperativeGreen),
                          child: const Icon(Icons.check, size: 10, color: Colors.white),
                        ),
                        const SizedBox(width: 12),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                AppLocalization.get('Consent-Based Identity Verification'),
                                style: const TextStyle(fontSize: 11, fontWeight: FontWeight.bold, color: AppColors.textPrimary),
                              ),
                              const SizedBox(height: 4),
                              Text(
                                AppLocalization.get('Your information is used only with your consent. SAHYOG protects your worker rights and privacy.'),
                                style: const TextStyle(fontSize: 11, color: AppColors.textSecondary),
                              ),
                            ],
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
            ),
          ),
        );
      }
    );
  }
}
