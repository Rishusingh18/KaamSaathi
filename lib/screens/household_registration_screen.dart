import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../theme/colors.dart';
import '../utils/localization.dart';
import 'otp_screen.dart';
import 'household_login_screen.dart';

class HouseholdRegistrationScreen extends StatefulWidget {
  const HouseholdRegistrationScreen({super.key});

  @override
  State<HouseholdRegistrationScreen> createState() =>
      _HouseholdRegistrationScreenState();
}

class _HouseholdRegistrationScreenState
    extends State<HouseholdRegistrationScreen> {
  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController(text: 'Anita Sharma');
  final _mobileController = TextEditingController(text: '9876543210');
  final _locationController =
      TextEditingController(text: 'Dwarka Sector 12, New Delhi');
  final _addressController =
      TextEditingController(text: 'Flat 402, Shivalik Apartments');

  @override
  void dispose() {
    _nameController.dispose();
    _mobileController.dispose();
    _locationController.dispose();
    _addressController.dispose();
    super.dispose();
  }

  void _handleContinue() {
    if (_mobileController.text.length == 10 &&
        _nameController.text.isNotEmpty &&
        _locationController.text.isNotEmpty &&
        _addressController.text.isNotEmpty) {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => OtpScreen(
            mobileNumber: _mobileController.text,
            role: 'Household',
          ),
        ),
      );
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(AppLocalization.get('Please fill all required fields')),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<String>(
      valueListenable: AppLocalization.currentLang,
      builder: (context, lang, child) {
        final bool mobileValid = _mobileController.text.length == 10;

        return Scaffold(
          backgroundColor: AppColors.surfaceCanvas,
          body: SafeArea(
            child: Column(
              children: [
                // ── Top Nav ─────────────────────────────────────────
                Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 16.0, vertical: 8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      // Back — dotted border
                      GestureDetector(
                        onTap: () => Navigator.pop(context),
                        child: Container(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 12, vertical: 6),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(8),
                            border: Border.all(
                              color: Colors.blue.withOpacity(0.4),
                              width: 1.5,
                            ),
                          ),
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              const Icon(Icons.arrow_back_ios_new,
                                  size: 14,
                                  color: AppColors.primaryContainer),
                              const SizedBox(width: 4),
                              Text(
                                AppLocalization.get('Back'),
                                style: const TextStyle(
                                  fontSize: 13,
                                  fontWeight: FontWeight.w600,
                                  color: AppColors.primaryContainer,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),

                      // Language toggle
                      GestureDetector(
                        onTap: AppLocalization.toggleLanguage,
                        child: Container(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 10, vertical: 5),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            border:
                                Border.all(color: AppColors.borderSubtle),
                            borderRadius: BorderRadius.circular(16),
                          ),
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Text('EN',
                                  style: TextStyle(
                                    fontWeight: lang == 'EN'
                                        ? FontWeight.bold
                                        : FontWeight.normal,
                                    fontSize: 12,
                                    color: lang == 'EN'
                                        ? AppColors.primaryContainer
                                        : Colors.black54,
                                  )),
                              const Padding(
                                padding:
                                    EdgeInsets.symmetric(horizontal: 4.0),
                                child: Text('|',
                                    style:
                                        TextStyle(color: Colors.black26)),
                              ),
                              Text('हिन्दी',
                                  style: TextStyle(
                                    fontWeight: lang == 'HI'
                                        ? FontWeight.bold
                                        : FontWeight.normal,
                                    fontSize: 12,
                                    color: lang == 'HI'
                                        ? AppColors.primaryContainer
                                        : Colors.black54,
                                  )),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),

                // ── Scrollable Body ──────────────────────────────────
                Expanded(
                  child: SingleChildScrollView(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 24.0),
                    child: Form(
                      key: _formKey,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          const SizedBox(height: 4),

                          // Logo
                          Image.asset(
                            'assets/images/logo.png',
                            height: 52,
                            errorBuilder: (c, e, s) => const Text(
                                'SAHYOG',
                                style: TextStyle(
                                    fontSize: 26,
                                    fontWeight: FontWeight.bold,
                                    color: AppColors.primaryContainer)),
                          ),

                          const SizedBox(height: 6),

                          // Tricolor
                          Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Container(
                                  width: 20,
                                  height: 3,
                                  color: AppColors.saffron),
                              Container(
                                  width: 20,
                                  height: 3,
                                  color: Colors.grey.shade200),
                              Container(
                                  width: 20,
                                  height: 3,
                                  color: AppColors.cooperativeGreen),
                            ],
                          ),

                          const SizedBox(height: 16),

                          // Role pill — warm orange gradient
                          Container(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 14, vertical: 5),
                            decoration: BoxDecoration(
                              gradient: const LinearGradient(
                                colors: [
                                  Color(0xFFFFF3E0),
                                  Color(0xFFFFF7ED)
                                ],
                              ),
                              borderRadius: BorderRadius.circular(20),
                              border: Border.all(
                                  color: const Color(0xFFFED7AA)),
                            ),
                            child: Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                const Text('🏠',
                                    style: TextStyle(fontSize: 13)),
                                const SizedBox(width: 6),
                                Text(
                                  AppLocalization.get(
                                      'HOUSEHOLD REGISTRATION • नागरिक पंजीकरण'),
                                  style: const TextStyle(
                                    fontSize: 10.5,
                                    fontWeight: FontWeight.bold,
                                    color: Color(0xFFEA580C),
                                    letterSpacing: 0.3,
                                  ),
                                ),
                              ],
                            ),
                          ),

                          const SizedBox(height: 14),

                          // Title
                          Text(
                            AppLocalization.get(
                                'Create your household profile'),
                            style: const TextStyle(
                              fontSize: 22,
                              fontWeight: FontWeight.bold,
                              color: AppColors.primaryContainer,
                            ),
                            textAlign: TextAlign.center,
                          ),

                          const SizedBox(height: 4),

                          Text(
                            AppLocalization.get(
                                'Tell us a little about yourself to get started.'),
                            style: const TextStyle(
                              fontSize: 13,
                              color: AppColors.textSecondary,
                            ),
                            textAlign: TextAlign.center,
                          ),

                          const SizedBox(height: 20),

                          // ── Form Card ──────────────────────────────
                          Container(
                            width: double.infinity,
                            padding: const EdgeInsets.all(16),
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(14),
                              border:
                                  Border.all(color: AppColors.borderSubtle),
                            ),
                            child: Column(
                              crossAxisAlignment:
                                  CrossAxisAlignment.start,
                              children: [
                                // ── Full Name ──
                                _buildFieldLabel(
                                  AppLocalization.get('Full Name'),
                                  AppLocalization.get('पूरा नाम'),
                                  required: true,
                                ),
                                const SizedBox(height: 6),
                                _buildInputField(
                                  controller: _nameController,
                                  prefixIcon: Icons.person_outline,
                                  hintText: 'Anita Sharma',
                                  keyboardType: TextInputType.name,
                                ),

                                const SizedBox(height: 14),

                                // ── Mobile Number ──
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    _buildFieldLabelInline(
                                        AppLocalization.get(
                                            'Mobile Number'),
                                        required: true),
                                    Container(
                                      padding:
                                          const EdgeInsets.symmetric(
                                              horizontal: 8, vertical: 3),
                                      decoration: BoxDecoration(
                                        color: AppColors.cooperativeGreen
                                            .withOpacity(0.1),
                                        borderRadius:
                                            BorderRadius.circular(6),
                                        border: Border.all(
                                            color:
                                                AppColors.cooperativeGreen,
                                            width: 1),
                                      ),
                                      child: Text(
                                        AppLocalization.get('OTP Login'),
                                        style: const TextStyle(
                                          fontSize: 10,
                                          fontWeight: FontWeight.bold,
                                          color:
                                              AppColors.cooperativeGreen,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                const SizedBox(height: 6),

                                // Phone input with flag prefix
                                Container(
                                  decoration: BoxDecoration(
                                    color: const Color(0xFFF8FAFC),
                                    borderRadius:
                                        BorderRadius.circular(10),
                                    border: Border.all(
                                      color: mobileValid
                                          ? AppColors.cooperativeGreen
                                          : AppColors.borderSubtle,
                                      width: mobileValid ? 1.5 : 1,
                                    ),
                                  ),
                                  child: Row(
                                    children: [
                                      Container(
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 10, vertical: 13),
                                        decoration: const BoxDecoration(
                                          border: Border(
                                            right: BorderSide(
                                                color:
                                                    Color(0xFFE2E8F0)),
                                          ),
                                        ),
                                        child: Row(
                                          children: const [
                                            Text('🇮🇳',
                                                style: TextStyle(
                                                    fontSize: 16)),
                                            SizedBox(width: 4),
                                            Text('+91',
                                                style: TextStyle(
                                                  fontSize: 13,
                                                  fontWeight:
                                                      FontWeight.bold,
                                                  color: AppColors
                                                      .textPrimary,
                                                )),
                                          ],
                                        ),
                                      ),
                                      Expanded(
                                        child: TextField(
                                          controller: _mobileController,
                                          keyboardType:
                                              TextInputType.phone,
                                          maxLength: 10,
                                          inputFormatters: [
                                            FilteringTextInputFormatter
                                                .digitsOnly,
                                          ],
                                          onChanged: (_) =>
                                              setState(() {}),
                                          decoration: InputDecoration(
                                            counterText: '',
                                            border: InputBorder.none,
                                            contentPadding:
                                                const EdgeInsets
                                                    .symmetric(
                                                    horizontal: 12),
                                            hintText: '0000000000',
                                            hintStyle: const TextStyle(
                                                color:
                                                    Color(0xFFCBD5E1)),
                                            suffixIcon: mobileValid
                                                ? const Icon(
                                                    Icons.check,
                                                    color: AppColors
                                                        .cooperativeGreen,
                                                    size: 18)
                                                : null,
                                          ),
                                          style: const TextStyle(
                                            fontSize: 15,
                                            fontWeight: FontWeight.w600,
                                            color: AppColors.textPrimary,
                                            letterSpacing: 1,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                const SizedBox(height: 6),
                                Text(
                                  AppLocalization.get(
                                      "We'll verify this with an SMS OTP in the next step."),
                                  style: const TextStyle(
                                      fontSize: 11,
                                      color: AppColors.textSecondary),
                                ),

                                const SizedBox(height: 14),

                                // ── Location ──
                                _buildFieldLabel(
                                  AppLocalization.get('Location'),
                                  AppLocalization.get('क्षेत्र / इलाका'),
                                  required: true,
                                ),
                                const SizedBox(height: 6),
                                _buildInputField(
                                  controller: _locationController,
                                  prefixIcon: Icons.location_on,
                                  prefixIconColor:
                                      Colors.red.shade400,
                                  hintText:
                                      'Dwarka Sector 12, New Delhi',
                                  keyboardType: TextInputType.streetAddress,
                                ),

                                const SizedBox(height: 14),

                                // ── Address ──
                                _buildFieldLabel(
                                  AppLocalization.get('Address'),
                                  AppLocalization.get('घर का पता'),
                                  required: true,
                                ),
                                const SizedBox(height: 6),
                                _buildInputField(
                                  controller: _addressController,
                                  prefixIcon: Icons.home_outlined,
                                  hintText:
                                      'Flat 402, Shivalik Apartments',
                                  keyboardType: TextInputType.streetAddress,
                                ),

                                const SizedBox(height: 10),

                                // Location info banner
                                Container(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 12, vertical: 9),
                                  decoration: BoxDecoration(
                                    color: const Color(0xFFF0FDF4),
                                    borderRadius:
                                        BorderRadius.circular(8),
                                    border: Border.all(
                                        color:
                                            const Color(0xFFBBF7D0)),
                                  ),
                                  child: Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      const Icon(Icons.location_on,
                                          size: 16,
                                          color:
                                              AppColors.cooperativeGreen),
                                      const SizedBox(width: 8),
                                      Expanded(
                                        child: Text(
                                          AppLocalization.get(
                                              'Your location helps us find nearby workers and cooperatives.'),
                                          style: const TextStyle(
                                            fontSize: 11.5,
                                            color:
                                                AppColors.cooperativeGreen,
                                            height: 1.4,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),

                          const SizedBox(height: 16),

                          // ── Privacy note ─────────────────────────────
                          Row(
                            crossAxisAlignment:
                                CrossAxisAlignment.start,
                            children: [
                              Container(
                                margin: const EdgeInsets.only(top: 2),
                                padding: const EdgeInsets.all(3),
                                decoration: const BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: AppColors.cooperativeGreen,
                                ),
                                child: const Icon(Icons.check,
                                    size: 12, color: Colors.white),
                              ),
                              const SizedBox(width: 10),
                              Expanded(
                                child: Text(
                                  AppLocalization.get(
                                      'Your information is used only to help provide relevant services.'),
                                  style: const TextStyle(
                                    fontSize: 12,
                                    color: AppColors.textSecondary,
                                    height: 1.4,
                                  ),
                                ),
                              ),
                            ],
                          ),

                          const SizedBox(height: 20),

                          // ── Continue Button ────────────────────────
                          Container(
                            decoration: BoxDecoration(
                              border: Border.all(
                                  color:
                                      Colors.blue.withOpacity(0.3),
                                  width: 2),
                              borderRadius: BorderRadius.circular(14),
                            ),
                            padding: const EdgeInsets.all(3),
                            child: SizedBox(
                              width: double.infinity,
                              child: ElevatedButton(
                                onPressed: _handleContinue,
                                style: ElevatedButton.styleFrom(
                                  backgroundColor:
                                      AppColors.primaryContainer,
                                  padding: const EdgeInsets.symmetric(
                                      vertical: 16),
                                  shape: RoundedRectangleBorder(
                                      borderRadius:
                                          BorderRadius.circular(10)),
                                  elevation: 0,
                                ),
                                child: Text(
                                  AppLocalization.get('Continue →'),
                                  style: const TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                            ),
                          ),

                          const SizedBox(height: 14),

                          // ── Already registered ─────────────────────
                          Row(
                            mainAxisAlignment:
                                MainAxisAlignment.center,
                            children: [
                              Text(
                                AppLocalization.get(
                                    'Already registered?'),
                                style: const TextStyle(
                                    fontSize: 13,
                                    color: AppColors.textSecondary),
                              ),
                              const SizedBox(width: 4),
                              GestureDetector(
                                onTap: () {
                                  Navigator.pushReplacement(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) =>
                                          const HouseholdLoginScreen(),
                                    ),
                                  );
                                },
                                child: Container(
                                  decoration: BoxDecoration(
                                    border: Border(
                                      bottom: BorderSide(
                                        color: Colors.blue
                                            .withOpacity(0.5),
                                        width: 1.5,
                                        style: BorderStyle.solid,
                                      ),
                                    ),
                                  ),
                                  child: Text(
                                    AppLocalization.get('Login here'),
                                    style: const TextStyle(
                                      fontSize: 13,
                                      fontWeight: FontWeight.w600,
                                      color: AppColors.primaryContainer,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),

                          const SizedBox(height: 20),

                          // Footer
                          Text(
                            AppLocalization.get(
                                'COOPERATE. EMPOWER. GROW. / साथ मिलकर, समृद्धि की ओर'),
                            style: const TextStyle(
                              fontSize: 10,
                              fontWeight: FontWeight.w600,
                              letterSpacing: 1.2,
                              color: Colors.grey,
                            ),
                            textAlign: TextAlign.center,
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
      },
    );
  }

  Widget _buildFieldLabel(String label, String hint,
      {bool required = false}) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            Text(
              label,
              style: const TextStyle(
                fontSize: 13,
                fontWeight: FontWeight.w600,
                color: AppColors.textPrimary,
              ),
            ),
            if (required)
              const Text(' *',
                  style: TextStyle(
                      color: Colors.red,
                      fontSize: 13,
                      fontWeight: FontWeight.bold)),
          ],
        ),
        Text(
          hint,
          style: const TextStyle(
              fontSize: 11, color: AppColors.textSecondary),
        ),
      ],
    );
  }

  Widget _buildFieldLabelInline(String label, {bool required = false}) {
    return Row(
      children: [
        Text(
          label,
          style: const TextStyle(
            fontSize: 13,
            fontWeight: FontWeight.w600,
            color: AppColors.textPrimary,
          ),
        ),
        if (required)
          const Text(' *',
              style: TextStyle(
                  color: Colors.red,
                  fontSize: 13,
                  fontWeight: FontWeight.bold)),
      ],
    );
  }

  Widget _buildInputField({
    required TextEditingController controller,
    required IconData prefixIcon,
    Color? prefixIconColor,
    required String hintText,
    required TextInputType keyboardType,
  }) {
    return Container(
      decoration: BoxDecoration(
        color: const Color(0xFFF8FAFC),
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: AppColors.borderSubtle),
      ),
      child: TextField(
        controller: controller,
        keyboardType: keyboardType,
        onChanged: (_) => setState(() {}),
        decoration: InputDecoration(
          border: InputBorder.none,
          contentPadding:
              const EdgeInsets.symmetric(horizontal: 12, vertical: 14),
          prefixIcon: Icon(prefixIcon,
              size: 18,
              color: prefixIconColor ?? AppColors.textSecondary),
          hintText: hintText,
          hintStyle: const TextStyle(color: Color(0xFFCBD5E1)),
        ),
        style: const TextStyle(
          fontSize: 14,
          color: AppColors.textPrimary,
        ),
      ),
    );
  }
}
