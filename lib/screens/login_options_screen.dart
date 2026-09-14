import 'package:flutter/material.dart';
import '../theme/colors.dart';
import '../widgets/custom_buttons.dart';
import '../utils/localization.dart';
import 'otp_screen.dart';
import 'main_layout.dart';

class LoginOptionsScreen extends StatefulWidget {
  final String role;
  const LoginOptionsScreen({Key? key, this.role = 'Cooperative'}) : super(key: key);

  @override
  State<LoginOptionsScreen> createState() => _LoginOptionsScreenState();
}

class _LoginOptionsScreenState extends State<LoginOptionsScreen> {
  bool _showCoopIdView = false;
  final TextEditingController _mobileController = TextEditingController(text: '9876543210');
  final TextEditingController _coopIdController = TextEditingController(text: 'COP-DL-2024-8842');
  final TextEditingController _pinController = TextEditingController(text: '123456');

  @override
  void dispose() {
    _mobileController.dispose();
    _coopIdController.dispose();
    _pinController.dispose();
    super.dispose();
  }

  void _handleSendOTP() {
    if (_mobileController.text.length == 10) {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => OtpScreen(mobileNumber: _mobileController.text, role: widget.role),
        ),
      );
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text(AppLocalization.get('Please enter a valid 10-digit mobile number'))),
      );
    }
  }

  void _handleCoopLogin() {
    if (_coopIdController.text.isNotEmpty && _pinController.text.length == 6) {
      // Direct jump to Dashboard in real app, but for now we'll route to Dashboard via Verification (or just skip OTP)
      Navigator.pushAndRemoveUntil(
        context,
        MaterialPageRoute(builder: (context) => const MainLayout()),
        (route) => false,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<String>(
      valueListenable: AppLocalization.currentLang,
      builder: (context, lang, child) {
        return Scaffold(
          backgroundColor: AppColors.surfaceCanvas,
          body: SafeArea(
            child: Column(
              children: [
            // Top Nav Bar
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  TextButton.icon(
                    onPressed: () => Navigator.pop(context),
                    icon: const Icon(Icons.arrow_back_ios_new, size: 16, color: AppColors.primaryContainer),
                    label: Text(AppLocalization.get('Back'), style: const TextStyle(fontWeight: FontWeight.bold, color: AppColors.primaryContainer)),
                    style: TextButton.styleFrom(padding: EdgeInsets.zero),
                  ),
                  GestureDetector(
                    onTap: AppLocalization.toggleLanguage,
                    child: Container(
                      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        border: Border.all(color: AppColors.borderSubtle),
                        borderRadius: BorderRadius.circular(16),
                      ),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text('EN', style: TextStyle(fontWeight: lang == 'EN' ? FontWeight.bold : FontWeight.normal, fontSize: 12, color: lang == 'EN' ? AppColors.primaryContainer : Colors.black54)),
                          const Padding(
                            padding: EdgeInsets.symmetric(horizontal: 4.0),
                            child: Text('|', style: TextStyle(color: Colors.black26)),
                          ),
                          Text('हिन्दी', style: TextStyle(fontWeight: lang == 'HI' ? FontWeight.bold : FontWeight.normal, fontSize: 12, color: lang == 'HI' ? AppColors.primaryContainer : Colors.black54)),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),

            Expanded(
              child: SingleChildScrollView(
                padding: const EdgeInsets.symmetric(horizontal: 24.0),
                child: SizedBox(
                  width: double.infinity,
                  child: Column(
                    children: [
                    // Brand Header
                    Image.asset(
                'assets/images/logo.png',
                      height: 64,
                      errorBuilder: (context, error, stackTrace) => 
                          const Text('SAHYOG', style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold, color: AppColors.primaryContainer)),
                    ),
                    const SizedBox(height: 8),
                    Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Container(width: 18, height: 3, color: AppColors.saffron),
                        Container(width: 18, height: 3, color: Colors.white),
                        Container(width: 18, height: 3, color: AppColors.cooperativeGreen),
                      ],
                    ),
                    const SizedBox(height: 12),
                    Text(
                      AppLocalization.get('Welcome Back'),
                      style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: AppColors.primaryContainer),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      AppLocalization.get(widget.role == 'Worker' ? 'Find work, manage skills & track earnings' : 'Login to manage your cooperative and workforce'),
                      style: const TextStyle(fontSize: 12, color: AppColors.textSecondary),
                    ),
                    const SizedBox(height: 12),
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
                      decoration: BoxDecoration(
                        color: const Color(0xFFECFDF5),
                        border: Border.all(color: const Color(0xFFD1FAE5)),
                        borderRadius: BorderRadius.circular(16),
                      ),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text(widget.role == 'Worker' ? '👷' : '🏢', style: const TextStyle(fontSize: 12)),
                          const SizedBox(width: 6),
                          Text(AppLocalization.get(widget.role == 'Worker' ? 'WORKER • कामगार' : 'COOPERATIVE ADMIN'), style: const TextStyle(fontSize: 11, fontWeight: FontWeight.bold, color: AppColors.cooperativeGreen)),
                        ],
                      ),
                    ),
                    const SizedBox(height: 24),

                    // Main Input Card
                    Container(
                      padding: const EdgeInsets.all(16),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(16),
                        border: Border.all(color: AppColors.borderSubtle),
                      ),
                      child: widget.role == 'Worker' ? _buildMobileView() : (_showCoopIdView ? _buildCoopIdView() : _buildMobileView()),
                    ),

                    const SizedBox(height: 16),

                    if (widget.role != 'Worker')
                      // Household Trust Banner
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
                              margin: const EdgeInsets.only(top: 2, right: 8),
                              decoration: const BoxDecoration(shape: BoxShape.circle, color: AppColors.cooperativeGreen),
                              padding: const EdgeInsets.all(2),
                              child: const Icon(Icons.check, size: 12, color: Colors.white),
                            ),
                            const Expanded(
                              child: Text.rich(
                                TextSpan(
                                  children: [
                                    TextSpan(text: 'Authorized Representative Access: ', style: TextStyle(fontWeight: FontWeight.bold, color: AppColors.cooperativeGreen)),
                                    TextSpan(text: 'Secure authentication for registered cooperatives under SAHYOG DPI network.', style: TextStyle(color: Color(0xFF022C22))),
                                  ],
                                ),
                                style: TextStyle(fontSize: 11, height: 1.4),
                              ),
                            ),
                          ],
                        ),
                      ),
                    const SizedBox(height: 24),
                  ],
                ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
      }
    );
  }

  Widget _buildMobileView() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(AppLocalization.get(widget.role == 'Worker' ? 'Mobile Number' : 'Admin Mobile Number'), style: const TextStyle(fontSize: 12, fontWeight: FontWeight.bold, color: AppColors.primaryContainer)),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
              decoration: BoxDecoration(
                color: const Color(0xFFECFDF5),
                border: Border.all(color: const Color(0xFFD1FAE5)),
                borderRadius: BorderRadius.circular(6),
              ),
              child: Text(AppLocalization.get('OTP Login'), style: const TextStyle(fontSize: 11, fontWeight: FontWeight.bold, color: AppColors.cooperativeGreen)),
            ),
          ],
        ),
        const SizedBox(height: 8),
        TextField(
          controller: _mobileController,
          keyboardType: TextInputType.number,
          maxLength: 10,
          onChanged: (val) => setState(() {}),
          decoration: InputDecoration(
            counterText: '',
            filled: true,
            fillColor: Colors.grey.shade50,
            contentPadding: const EdgeInsets.symmetric(horizontal: 12, vertical: 14),
            hintText: AppLocalization.get(widget.role == 'Worker' ? 'Enter 10-digit mobile' : 'Enter admin mobile number'),
            hintStyle: const TextStyle(color: Colors.black38, fontSize: 14),
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
            prefixIcon: Padding(
              padding: const EdgeInsets.only(right: 12.0),
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 12),
                decoration: const BoxDecoration(
                  border: Border(right: BorderSide(color: AppColors.borderSubtle)),
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text('🇮🇳', style: TextStyle(fontSize: 14)),
                    SizedBox(width: 4),
                    Text('+91', style: TextStyle(fontWeight: FontWeight.bold, color: AppColors.primaryContainer)),
                  ],
                ),
              ),
            ),
            prefixIconConstraints: const BoxConstraints(minWidth: 0, minHeight: 0),
            suffixIcon: _mobileController.text.length == 10
                ? const Icon(Icons.check, color: AppColors.cooperativeGreen, size: 20)
                : null,
          ),
          style: const TextStyle(fontWeight: FontWeight.bold, color: AppColors.primaryContainer, fontSize: 14),
        ),
        const SizedBox(height: 8),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: Text(
                AppLocalization.get("We'll send a one-time password (OTP) to the authorized representative."),
                style: const TextStyle(fontSize: 11, color: AppColors.textSecondary),
              ),
            ),
            Text('${_mobileController.text.length}/10', style: const TextStyle(fontSize: 11, fontWeight: FontWeight.bold, color: AppColors.primaryContainer)),
          ],
        ),
        const SizedBox(height: 16),
        PrimaryButton(
          text: AppLocalization.get('Send OTP'),
          onPressed: _mobileController.text.length == 10 ? _handleSendOTP : null,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 16.0),
          child: Row(
            children: [
              const Expanded(child: Divider(color: AppColors.borderSubtle)),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: Text(AppLocalization.get('OR'), style: const TextStyle(fontSize: 11, fontWeight: FontWeight.bold, color: Colors.black38)),
              ),
              const Expanded(child: Divider(color: AppColors.borderSubtle)),
            ],
          ),
        ),
        if (widget.role != 'Worker') ...[
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 16.0),
            child: Row(
              children: [
                const Expanded(child: Divider(color: AppColors.borderSubtle)),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                  child: Text(AppLocalization.get('OR'), style: const TextStyle(fontSize: 11, fontWeight: FontWeight.bold, color: Colors.black38)),
                ),
                const Expanded(child: Divider(color: AppColors.borderSubtle)),
              ],
            ),
          ),
          SizedBox(
            width: double.infinity,
            child: OutlinedButton.icon(
              onPressed: () => setState(() => _showCoopIdView = true),
              icon: const Text('🏢', style: TextStyle(fontSize: 14)),
              label: Text(AppLocalization.get('Continue with Cooperative ID'), style: const TextStyle(color: AppColors.primaryContainer, fontWeight: FontWeight.bold, fontSize: 12)),
              style: OutlinedButton.styleFrom(
                padding: const EdgeInsets.symmetric(vertical: 12),
                side: const BorderSide(color: AppColors.borderSubtle),
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                backgroundColor: Colors.grey.shade50,
              ),
            ),
          ),
        ],
      ],
    );
  }

  Widget _buildCoopIdView() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                const Text('🏢', style: TextStyle(fontSize: 16)),
                const SizedBox(width: 8),
                Text(AppLocalization.get('Cooperative ID Login'), style: const TextStyle(fontSize: 12, fontWeight: FontWeight.bold, color: AppColors.primaryContainer)),
              ],
            ),
            GestureDetector(
              onTap: () => setState(() => _showCoopIdView = false),
              child: Text(AppLocalization.get('Back to Mobile'), style: const TextStyle(fontSize: 11, fontWeight: FontWeight.bold, color: AppColors.cooperativeGreen)),
            ),
          ],
        ),
        const Padding(
          padding: EdgeInsets.symmetric(vertical: 12.0),
          child: Divider(color: AppColors.borderSubtle, height: 1),
        ),
        Text(AppLocalization.get('Registration / Cooperative ID'), style: const TextStyle(fontSize: 11, fontWeight: FontWeight.bold, color: AppColors.primaryContainer)),
        const SizedBox(height: 4),
        TextField(
          controller: _coopIdController,
          decoration: InputDecoration(
            filled: true,
            fillColor: Colors.grey.shade50,
            border: OutlineInputBorder(borderRadius: BorderRadius.circular(12), borderSide: const BorderSide(color: AppColors.borderSubtle)),
            enabledBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(12), borderSide: const BorderSide(color: AppColors.borderSubtle)),
            focusedBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(12), borderSide: const BorderSide(color: AppColors.primaryContainer)),
            contentPadding: const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
          ),
          style: const TextStyle(fontWeight: FontWeight.bold, color: AppColors.primaryContainer, fontSize: 12),
        ),
        const SizedBox(height: 12),
        Text(AppLocalization.get('Authorized Signatory PIN / Password'), style: const TextStyle(fontSize: 11, fontWeight: FontWeight.bold, color: AppColors.primaryContainer)),
        const SizedBox(height: 4),
        TextField(
          controller: _pinController,
          obscureText: true,
          decoration: InputDecoration(
            filled: true,
            fillColor: Colors.grey.shade50,
            border: OutlineInputBorder(borderRadius: BorderRadius.circular(12), borderSide: const BorderSide(color: AppColors.borderSubtle)),
            enabledBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(12), borderSide: const BorderSide(color: AppColors.borderSubtle)),
            focusedBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(12), borderSide: const BorderSide(color: AppColors.primaryContainer)),
            contentPadding: const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
          ),
          style: const TextStyle(fontWeight: FontWeight.bold, color: AppColors.primaryContainer, fontSize: 16, letterSpacing: 4),
        ),
        const SizedBox(height: 16),
        PrimaryButton(
          text: AppLocalization.get('Verify & Login'),
          onPressed: _handleCoopLogin,
        ),
        const SizedBox(height: 12),
        Center(
          child: Text(
            AppLocalization.get('For registered state federations and cooperative societies under MSCS Act.'),
            style: const TextStyle(fontSize: 10, color: Colors.black38),
            textAlign: TextAlign.center,
          ),
        ),
      ],
    );
  }
}
