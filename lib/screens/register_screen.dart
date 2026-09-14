import 'package:flutter/material.dart';
import 'package:dotted_border/dotted_border.dart';
import '../theme/colors.dart';
import '../utils/localization.dart';
import 'otp_screen.dart';
import 'login_options_screen.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final TextEditingController _coopNameController =
      TextEditingController(text: 'Nirman Shramik Cooperative');
  final TextEditingController _regNoController =
      TextEditingController(text: 'MSCS/ND/2021/8472');
  final TextEditingController _locationController =
      TextEditingController(text: 'Dwarka, South West Delhi');
  final TextEditingController _serviceAreasController =
      TextEditingController(text: 'Dwarka, Janakpuri, Uttam Nagar, Palam');
  final TextEditingController _repNameController =
      TextEditingController(text: 'Ramesh Chandra Verma');
  final TextEditingController _phoneController =
      TextEditingController(text: '9876543210');
  final TextEditingController _emailController =
      TextEditingController(text: 'contact@nirmancoop.org.in');

  final List<String> _services = [
    'Plumbing',
    'Electrical',
    'Painting',
    'Carpentry',
    'Cleaning',
    'Gardening',
    'Construction',
    'Gen. Labour',
    'Other'
  ];

  final Set<String> _selectedServices = {
    'Painting',
    'Construction',
    'Gen. Labour'
  };

  @override
  void dispose() {
    _coopNameController.dispose();
    _regNoController.dispose();
    _locationController.dispose();
    _serviceAreasController.dispose();
    _repNameController.dispose();
    _phoneController.dispose();
    _emailController.dispose();
    super.dispose();
  }

  void _handleContinue() {
    if (_phoneController.text.length == 10 && _selectedServices.isNotEmpty) {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => OtpScreen(
            mobileNumber: _phoneController.text,
            role: 'Cooperative',
          ),
        ),
      );
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(
            AppLocalization.get(
                'Please enter a valid 10-digit mobile number and select at least one service.'),
          ),
          backgroundColor: const Color(0xFF1E3A5F),
          behavior: SnackBarBehavior.floating,
        ),
      );
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
            child: SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Column(
                children: [
                  const SizedBox(height: 10),
                  _buildTopNav(context, lang),
                  const SizedBox(height: 16),
                  _buildHeader(lang),
                  const SizedBox(height: 20),
                  _buildCooperativeDetailsCard(lang),
                  const SizedBox(height: 16),
                  _buildAuthorizedRepCard(lang),
                  const SizedBox(height: 16),
                  _buildServicesProvidedCard(lang),
                  const SizedBox(height: 16),
                  _buildTrustCard(lang),
                  const SizedBox(height: 20),
                  _buildActionSection(context, lang),
                  const SizedBox(height: 24),
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  // ── TOP NAVIGATION ────────────────────────────────────────────────────────
  Widget _buildTopNav(BuildContext context, String lang) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        // Back button with blue dotted border
        GestureDetector(
          onTap: () => Navigator.pop(context),
          child: DottedBorder(
            options: RoundedRectDottedBorderOptions(
              color: const Color(0xFF93C5FD),
              dashPattern: const [4, 3],
              strokeWidth: 1.5,
              radius: const Radius.circular(6),
            ),
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
              color: Colors.transparent,
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
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF1E3A8A),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),

        // Language toggle pill
        GestureDetector(
          onTap: () => AppLocalization.toggleLanguage(),
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
            decoration: BoxDecoration(
              color: Colors.white,
              border: Border.all(color: const Color(0xFFE2E8F0)),
              borderRadius: BorderRadius.circular(16),
            ),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  'EN',
                  style: TextStyle(
                    fontWeight:
                        lang == 'EN' ? FontWeight.bold : FontWeight.normal,
                    fontSize: 12,
                    color: lang == 'EN'
                        ? const Color(0xFF0F172A)
                        : const Color(0xFF64748B),
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 5.0),
                  child: Text('|',
                      style: TextStyle(color: Color(0xFFCBD5E1), fontSize: 11)),
                ),
                Text(
                  'हिन्दी',
                  style: TextStyle(
                    fontWeight:
                        lang == 'HI' ? FontWeight.bold : FontWeight.normal,
                    fontSize: 12,
                    color: lang == 'HI'
                        ? const Color(0xFF0F172A)
                        : const Color(0xFF64748B),
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }

  // ── HEADER ────────────────────────────────────────────────────────────────
  Widget _buildHeader(String lang) {
    return Column(
      children: [
        Image.asset(
          'assets/images/logo.png',
          height: 48,
          errorBuilder: (_, __, ___) => const Text(
            'SAHYOG',
            style: TextStyle(
              fontSize: 26,
              fontWeight: FontWeight.bold,
              color: Color(0xFF1E3A5F),
            ),
          ),
        ),
        const SizedBox(height: 14),

        // Role badge pill
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 5),
          decoration: BoxDecoration(
            color: const Color(0xFFECFDF5),
            borderRadius: BorderRadius.circular(16),
            border: Border.all(color: const Color(0xFFA7F3D0)),
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Text('🏢', style: TextStyle(fontSize: 12)),
              const SizedBox(width: 6),
              Text(
                AppLocalization.get('COOPERATIVE REGISTRATION / सहकारी संस्था'),
                style: const TextStyle(
                  fontSize: 11,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF16A34A),
                  letterSpacing: 0.2,
                ),
              ),
            ],
          ),
        ),
        const SizedBox(height: 12),

        Text(
          AppLocalization.get('Register Your Cooperative'),
          style: const TextStyle(
            fontSize: 22,
            fontWeight: FontWeight.bold,
            color: Color(0xFF0F172A),
            letterSpacing: -0.3,
          ),
          textAlign: TextAlign.center,
        ),
        const SizedBox(height: 4),
        Text(
          AppLocalization.get(
              'Create an account for your cooperative and its authorized representative.'),
          style: const TextStyle(
            fontSize: 12.5,
            color: Color(0xFF64748B),
            height: 1.35,
          ),
          textAlign: TextAlign.center,
        ),
      ],
    );
  }

  // ── SECTION 1: COOPERATIVE DETAILS ────────────────────────────────────────
  Widget _buildCooperativeDetailsCard(String lang) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: const Color(0xFFE2E8F0)),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.02),
            blurRadius: 4,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Section Title
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Container(
                    width: 4,
                    height: 14,
                    decoration: BoxDecoration(
                      color: const Color(0xFF1E3A5F),
                      borderRadius: BorderRadius.circular(2),
                    ),
                  ),
                  const SizedBox(width: 6),
                  Text(
                    AppLocalization.get('COOPERATIVE DETAILS'),
                    style: const TextStyle(
                      fontSize: 11.5,
                      fontWeight: FontWeight.bold,
                      letterSpacing: 0.5,
                      color: Color(0xFF1E3A5F),
                    ),
                  ),
                ],
              ),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 7, vertical: 2),
                decoration: BoxDecoration(
                  color: const Color(0xFFECFDF5),
                  borderRadius: BorderRadius.circular(4),
                ),
                child: Text(
                  AppLocalization.get('Organisation'),
                  style: const TextStyle(
                    fontSize: 10.5,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF059669),
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 14),

          // Field 1: Cooperative Name
          _buildInputField(
            label: AppLocalization.get('Cooperative Name'),
            controller: _coopNameController,
            isRequired: true,
            helperText: AppLocalization.get('e.g., Nirman Shramik Cooperative'),
          ),
          const SizedBox(height: 14),

          // Field 2: Registration Number
          _buildInputField(
            label: AppLocalization.get('Cooperative Registration Number'),
            controller: _regNoController,
            isRequired: true,
            helperText: AppLocalization.get(
                'Your registration details will be used for cooperative verification.'),
          ),
          const SizedBox(height: 14),

          // Field 3: Registered Location
          _buildInputField(
            label: AppLocalization.get('Registered Location (City / District)'),
            controller: _locationController,
            isRequired: true,
            prefixIcon: const Icon(Icons.location_on_outlined,
                size: 16, color: Color(0xFF94A3B8)),
          ),
          const SizedBox(height: 14),

          // Field 4: Service Areas
          _buildInputField(
            label: AppLocalization.get('Service Areas'),
            controller: _serviceAreasController,
            isRequired: true,
            helperText: AppLocalization.get('Separate locations by commas'),
          ),
        ],
      ),
    );
  }

  // ── SECTION 2: AUTHORIZED REPRESENTATIVE ──────────────────────────────────
  Widget _buildAuthorizedRepCard(String lang) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: const Color(0xFFE2E8F0)),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.02),
            blurRadius: 4,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Container(
                    width: 4,
                    height: 14,
                    decoration: BoxDecoration(
                      color: const Color(0xFF1E3A5F),
                      borderRadius: BorderRadius.circular(2),
                    ),
                  ),
                  const SizedBox(width: 6),
                  Text(
                    AppLocalization.get('AUTHORIZED REPRESENTATIVE'),
                    style: const TextStyle(
                      fontSize: 11.5,
                      fontWeight: FontWeight.bold,
                      letterSpacing: 0.5,
                      color: Color(0xFF1E3A5F),
                    ),
                  ),
                ],
              ),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 7, vertical: 2),
                decoration: BoxDecoration(
                  color: const Color(0xFFF1F5F9),
                  borderRadius: BorderRadius.circular(4),
                ),
                child: Text(
                  AppLocalization.get('Admin User'),
                  style: const TextStyle(
                    fontSize: 10.5,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF64748B),
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 14),

          // Field 1: Representative Name
          _buildInputField(
            label: AppLocalization.get('Representative Name'),
            controller: _repNameController,
            isRequired: true,
            helperText:
                AppLocalization.get('Secretary / Registered Administrator'),
          ),
          const SizedBox(height: 14),

          // Field 2: Admin Mobile Number
          _buildPhoneField(lang),
          const SizedBox(height: 14),

          // Field 3: Email Address
          _buildInputField(
            label: AppLocalization.get('Email Address'),
            controller: _emailController,
            isRequired: false,
            isOptional: true,
            keyboardType: TextInputType.emailAddress,
          ),
        ],
      ),
    );
  }

  // ── SECTION 3: SERVICES PROVIDED ──────────────────────────────────────────
  Widget _buildServicesProvidedCard(String lang) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: const Color(0xFFE2E8F0)),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.02),
            blurRadius: 4,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Container(
                    width: 4,
                    height: 14,
                    decoration: BoxDecoration(
                      color: const Color(0xFF1E3A5F),
                      borderRadius: BorderRadius.circular(2),
                    ),
                  ),
                  const SizedBox(width: 6),
                  Text(
                    AppLocalization.get('SERVICES PROVIDED'),
                    style: const TextStyle(
                      fontSize: 11.5,
                      fontWeight: FontWeight.bold,
                      letterSpacing: 0.5,
                      color: Color(0xFF1E3A5F),
                    ),
                  ),
                ],
              ),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 7, vertical: 2),
                decoration: BoxDecoration(
                  color: const Color(0xFFECFDF5),
                  borderRadius: BorderRadius.circular(4),
                ),
                child: Text(
                  '${_selectedServices.length} ${AppLocalization.get('selected')}',
                  style: const TextStyle(
                    fontSize: 10.5,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF059669),
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 4),
          Text(
            AppLocalization.get(
                'Services your cooperative provides (select all that apply)'),
            style: const TextStyle(
              fontSize: 11.5,
              color: Color(0xFF64748B),
            ),
          ),
          const SizedBox(height: 14),

          // 3-column Grid of Services
          GridView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: _services.length,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 3,
              crossAxisSpacing: 8,
              mainAxisSpacing: 8,
              childAspectRatio: 2.35,
            ),
            itemBuilder: (context, index) {
              final service = _services[index];
              final isSelected = _selectedServices.contains(service);
              return GestureDetector(
                onTap: () {
                  setState(() {
                    if (isSelected) {
                      _selectedServices.remove(service);
                    } else {
                      _selectedServices.add(service);
                    }
                  });
                },
                child: Container(
                  decoration: BoxDecoration(
                    color: isSelected
                        ? const Color(0xFF065F46)
                        : Colors.white,
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(
                      color: isSelected
                          ? const Color(0xFF065F46)
                          : const Color(0xFFE2E8F0),
                    ),
                  ),
                  child: Center(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        if (isSelected) ...[
                          const Icon(Icons.check,
                              size: 13, color: Colors.white),
                          const SizedBox(width: 4),
                        ],
                        Flexible(
                          child: Text(
                            AppLocalization.get(service),
                            style: TextStyle(
                              fontSize: 11.5,
                              fontWeight: isSelected
                                  ? FontWeight.bold
                                  : FontWeight.w500,
                              color: isSelected
                                  ? Colors.white
                                  : const Color(0xFF334155),
                            ),
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              );
            },
          ),
        ],
      ),
    );
  }

  // ── TRUST & ASSURANCE CARD ────────────────────────────────────────────────
  Widget _buildTrustCard(String lang) {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: const Color(0xFFF0FDF4),
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: const Color(0xFFBBF7D0)),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Icon(Icons.check_circle, size: 17, color: Color(0xFF16A34A)),
          const SizedBox(width: 9),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  AppLocalization.get('Verification & Trust Assurance'),
                  style: const TextStyle(
                    fontSize: 12.5,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF166534),
                  ),
                ),
                const SizedBox(height: 2),
                Text(
                  AppLocalization.get(
                      'After registration, your cooperative details may be reviewed and verified before full access is provided.'),
                  style: const TextStyle(
                    fontSize: 11.5,
                    color: Color(0xFF15803D),
                    height: 1.35,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  // ── ACTION BUTTONS & FOOTER ───────────────────────────────────────────────
  Widget _buildActionSection(BuildContext context, String lang) {
    return Column(
      children: [
        // Continue button with blue dotted border
        GestureDetector(
          onTap: _handleContinue,
          child: DottedBorder(
            options: RoundedRectDottedBorderOptions(
              color: const Color(0xFF93C5FD),
              dashPattern: const [4, 3],
              strokeWidth: 1.5,
              radius: const Radius.circular(12),
            ),
            child: Container(
              width: double.infinity,
              padding: const EdgeInsets.symmetric(vertical: 14),
              decoration: BoxDecoration(
                color: const Color(0xFF1E3A5F),
                borderRadius: BorderRadius.circular(12),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    AppLocalization.get('Continue →'),
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
        const SizedBox(height: 16),

        // Already registered? Login link with blue dotted border
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              AppLocalization.get('Already registered? '),
              style: const TextStyle(
                fontSize: 12.5,
                color: Color(0xFF64748B),
              ),
            ),
            GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) =>
                        const LoginOptionsScreen(role: 'Cooperative'),
                  ),
                );
              },
              child: DottedBorder(
                options: RoundedRectDottedBorderOptions(
                  color: const Color(0xFF93C5FD),
                  dashPattern: const [4, 3],
                  strokeWidth: 1.2,
                  radius: const Radius.circular(6),
                ),
                child: Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
                  color: Colors.transparent,
                  child: Text(
                    AppLocalization.get('Login to Cooperative Account'),
                    style: const TextStyle(
                      fontSize: 12.5,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF1E3A5F),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
        const SizedBox(height: 16),

        // Motto Footer
        Text(
          'COOPERATE. EMPOWER. GROW. / साथ मिलकर, समृद्धि की ओर',
          style: const TextStyle(
            fontSize: 10,
            fontWeight: FontWeight.w600,
            color: Color(0xFF94A3B8),
            letterSpacing: 0.3,
          ),
          textAlign: TextAlign.center,
        ),
      ],
    );
  }

  // ── REUSABLE INPUT FIELD ──────────────────────────────────────────────────
  Widget _buildInputField({
    required String label,
    required TextEditingController controller,
    bool isRequired = false,
    bool isOptional = false,
    String? helperText,
    Widget? prefixIcon,
    TextInputType keyboardType = TextInputType.text,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                Text(
                  label,
                  style: const TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF0F172A),
                  ),
                ),
                if (isRequired)
                  const Text(
                    ' *',
                    style: TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFFEF4444),
                    ),
                  ),
              ],
            ),
            if (isOptional)
              Text(
                AppLocalization.get('Optional'),
                style: const TextStyle(
                  fontSize: 11,
                  color: Color(0xFF94A3B8),
                ),
              ),
          ],
        ),
        const SizedBox(height: 5),
        TextField(
          controller: controller,
          keyboardType: keyboardType,
          style: const TextStyle(
            fontSize: 13,
            fontWeight: FontWeight.w600,
            color: Color(0xFF0F172A),
          ),
          decoration: InputDecoration(
            isDense: true,
            filled: true,
            fillColor: const Color(0xFFF8FAFC),
            prefixIcon: prefixIcon,
            prefixIconConstraints:
                const BoxConstraints(minWidth: 36, minHeight: 36),
            contentPadding:
                const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: const BorderSide(color: Color(0xFFCBD5E1)),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: const BorderSide(color: Color(0xFFE2E8F0)),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: const BorderSide(color: Color(0xFF1E3A5F), width: 1.5),
            ),
          ),
        ),
        if (helperText != null) ...[
          const SizedBox(height: 4),
          Text(
            helperText,
            style: const TextStyle(
              fontSize: 11,
              color: Color(0xFF94A3B8),
            ),
          ),
        ],
      ],
    );
  }

  // ── PHONE FIELD ───────────────────────────────────────────────────────────
  Widget _buildPhoneField(String lang) {
    final hasValidPhone = _phoneController.text.length == 10;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Text(
              AppLocalization.get('Admin Mobile Number'),
              style: const TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.bold,
                color: Color(0xFF0F172A),
              ),
            ),
            const Text(
              ' *',
              style: TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.bold,
                color: Color(0xFFEF4444),
              ),
            ),
          ],
        ),
        const SizedBox(height: 5),
        Row(
          children: [
            // Country flag & code container
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 12),
              decoration: BoxDecoration(
                color: const Color(0xFFF8FAFC),
                borderRadius: BorderRadius.circular(10),
                border: Border.all(color: const Color(0xFFE2E8F0)),
              ),
              child: const Row(
                children: [
                  Text('🇮🇳', style: TextStyle(fontSize: 13)),
                  SizedBox(width: 4),
                  Text(
                    '+91',
                    style: TextStyle(
                      fontSize: 13,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF0F172A),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(width: 8),

            // Number input
            Expanded(
              child: TextField(
                controller: _phoneController,
                keyboardType: TextInputType.phone,
                maxLength: 10,
                onChanged: (_) => setState(() {}),
                style: const TextStyle(
                  fontSize: 13,
                  fontWeight: FontWeight.w600,
                  color: Color(0xFF0F172A),
                ),
                decoration: InputDecoration(
                  counterText: '',
                  isDense: true,
                  filled: true,
                  fillColor: const Color(0xFFF8FAFC),
                  suffixIcon: hasValidPhone
                      ? const Icon(Icons.check,
                          size: 16, color: Color(0xFF16A34A))
                      : null,
                  contentPadding:
                      const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: const BorderSide(color: Color(0xFFCBD5E1)),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: const BorderSide(color: Color(0xFFE2E8F0)),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide:
                        const BorderSide(color: Color(0xFF1E3A5F), width: 1.5),
                  ),
                ),
              ),
            ),
          ],
        ),
        const SizedBox(height: 4),
        Text(
          AppLocalization.get(
              'This number will be used to manage the cooperative account and receive OTP.'),
          style: const TextStyle(
            fontSize: 11,
            color: Color(0xFF94A3B8),
          ),
        ),
      ],
    );
  }
}
