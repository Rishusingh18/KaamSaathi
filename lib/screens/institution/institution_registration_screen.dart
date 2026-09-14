import 'package:flutter/material.dart';
import '../../utils/localization.dart';
import 'institution_otp_screen.dart';

class InstitutionRegistrationScreen extends StatefulWidget {
  const InstitutionRegistrationScreen({super.key});

  @override
  State<InstitutionRegistrationScreen> createState() =>
      _InstitutionRegistrationScreenState();
}

class _InstitutionRegistrationScreenState
    extends State<InstitutionRegistrationScreen> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _repController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();
  final TextEditingController _locationController = TextEditingController();
  final TextEditingController _addressController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();

  String _selectedType = 'College / University';
  final List<String> _institutionTypes = [
    'College / University',
    'School',
    'Hospital / Healthcare',
    'NGO / Community Organisation',
    'Government Institution',
    'Other',
  ];

  final Set<String> _selectedServices = {'Painting', 'Maintenance', 'Electrical'};
  final List<String> _availableServices = [
    'Maintenance',
    'Electrical',
    'Plumbing',
    'Painting',
    'Cleaning',
    'Gardening',
    'Carpentry',
    'Construction',
    'General Labour',
    'Other',
  ];

  bool _hasConsent = true;

  @override
  void initState() {
    super.initState();
    _nameController.addListener(_updateState);
    _repController.addListener(_updateState);
    _phoneController.addListener(_updateState);
    _locationController.addListener(_updateState);
    _addressController.addListener(_updateState);
  }

  void _updateState() {
    setState(() {});
  }

  @override
  void dispose() {
    _nameController.removeListener(_updateState);
    _repController.removeListener(_updateState);
    _phoneController.removeListener(_updateState);
    _locationController.removeListener(_updateState);
    _addressController.removeListener(_updateState);
    _nameController.dispose();
    _repController.dispose();
    _phoneController.dispose();
    _locationController.dispose();
    _addressController.dispose();
    _emailController.dispose();
    super.dispose();
  }

  bool get _isFormValid {
    final name = _nameController.text.trim();
    final rep = _repController.text.trim();
    final phone = _phoneController.text.trim();
    final location = _locationController.text.trim();
    final address = _addressController.text.trim();

    return _hasConsent &&
        name.isNotEmpty &&
        _selectedType.isNotEmpty &&
        rep.isNotEmpty &&
        phone.length == 10 &&
        location.isNotEmpty &&
        address.isNotEmpty;
  }

  void _onDemoFill() {
    setState(() {
      _nameController.text = 'ABC College';
      _selectedType = 'College / University';
      _repController.text = 'Dr. Arvind Sharma';
      _phoneController.text = '9876543210';
      _locationController.text = 'Dwarka, New Delhi';
      _addressController.text = 'Sector 14, Dwarka, New Delhi - 110078';
      _emailController.text = 'admin@abccollege.edu.in';
      _selectedServices.addAll(['Painting', 'Electrical', 'Maintenance']);
      _hasConsent = true;
    });
  }

  void _onContinue() {
    if (!_isFormValid) return;
    final phone = _phoneController.text.trim();
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => InstitutionOtpScreen(
          phoneNumber: '+91 $phone',
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
            child: SingleChildScrollView(
              padding: const EdgeInsets.symmetric(horizontal: 18.0, vertical: 8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  // Top Navigation Bar
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
                        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 3),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(12),
                          border: Border.all(color: const Color(0xFFE2E8F0)),
                        ),
                        child: const Text(
                          'INSTITUTION REGISTRATION',
                          style: TextStyle(
                            fontSize: 9.5,
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
                  const SizedBox(height: 16),

                  // SAHYOG Logo & Role Pill
                  Image.asset(
                    'assets/images/logo.png',
                    height: 48,
                    errorBuilder: (context, error, stackTrace) =>
                        const Text('SAHYOG', style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Color(0xFF123B5D))),
                  ),
                  const SizedBox(height: 10),

                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 3.5),
                    decoration: BoxDecoration(
                      color: const Color(0xFFEFF6FF),
                      borderRadius: BorderRadius.circular(14),
                      border: Border.all(color: const Color(0xFFBFDBFE)),
                    ),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        const Text('🏛️', style: TextStyle(fontSize: 12)),
                        const SizedBox(width: 5),
                        Text(
                          AppLocalization.get('INSTITUTION / संस्थान'),
                          style: const TextStyle(
                            fontSize: 11,
                            fontWeight: FontWeight.bold,
                            color: Color(0xFF1D4ED8),
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 10),

                  // Title & Subtitle
                  Text(
                    AppLocalization.get('Create Institution Account'),
                    style: const TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF123B5D),
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    AppLocalization.get('Register your institution to request skilled workforce.'),
                    style: const TextStyle(fontSize: 12, color: Color(0xFF64748B)),
                  ),
                  const SizedBox(height: 14),

                  // Demo Auto-Fill Banner
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                    decoration: BoxDecoration(
                      color: const Color(0xFFEFF6FF),
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(color: const Color(0xFFDBEAFE)),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text('Testing demo setup?', style: TextStyle(fontSize: 11, color: Color(0xFF1E3A8A))),
                        GestureDetector(
                          onTap: _onDemoFill,
                          child: Container(
                            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(8),
                              border: Border.all(color: const Color(0xFF93C5FD)),
                            ),
                            child: const Text(
                              'Demo Auto-Fill ⚡',
                              style: TextStyle(fontSize: 11, fontWeight: FontWeight.bold, color: Color(0xFF1D4ED8)),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 16),

                  // Registration Form Card
                  Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(16),
                      border: Border.all(color: const Color(0xFFE2E8F0)),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withValues(alpha: 0.02),
                          blurRadius: 8,
                          offset: const Offset(0, 2),
                        ),
                      ],
                    ),
                    padding: const EdgeInsets.all(16),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // Field 1: Institution Name
                        _buildFieldLabel(AppLocalization.get('Institution Name'), required: true),
                        _buildTextField(_nameController, 'e.g. ABC College'),
                        const SizedBox(height: 12),

                        // Field 2: Institution Type
                        _buildFieldLabel(AppLocalization.get('Institution Type'), required: true),
                        Container(
                          padding: const EdgeInsets.symmetric(horizontal: 12),
                          decoration: BoxDecoration(
                            color: const Color(0xFFF8FAFC),
                            borderRadius: BorderRadius.circular(10),
                            border: Border.all(color: const Color(0xFFCBD5E1)),
                          ),
                          child: DropdownButtonHideUnderline(
                            child: DropdownButton<String>(
                              value: _selectedType,
                              isExpanded: true,
                              icon: const Icon(Icons.keyboard_arrow_down, size: 18),
                              style: const TextStyle(fontSize: 13, fontWeight: FontWeight.w600, color: Color(0xFF0F172A)),
                              items: _institutionTypes.map((type) {
                                return DropdownMenuItem(value: type, child: Text(type));
                              }).toList(),
                              onChanged: (val) {
                                if (val != null) setState(() => _selectedType = val);
                              },
                            ),
                          ),
                        ),
                        const SizedBox(height: 12),

                        // Field 3: Representative Name
                        _buildFieldLabel(AppLocalization.get('Representative Name'), required: true),
                        _buildTextField(_repController, 'e.g. Dr. Arvind Sharma'),
                        const SizedBox(height: 12),

                        // Field 4: Mobile Number
                        _buildFieldLabel(AppLocalization.get('Mobile Number'), required: true),
                        _buildTextField(_phoneController, '10-digit mobile number', keyboardType: TextInputType.phone, isPhone: true),
                        const SizedBox(height: 12),

                        // Field 5: Location / City
                        _buildFieldLabel(AppLocalization.get('Location / City'), required: true),
                        _buildTextField(_locationController, 'e.g. Dwarka, New Delhi'),
                        const SizedBox(height: 12),

                        // Field 6: Address
                        _buildFieldLabel(AppLocalization.get('Institution Address'), required: true),
                        _buildTextField(_addressController, 'e.g. Sector 14, Dwarka, New Delhi - 110078', maxLines: 2),
                        const SizedBox(height: 12),

                        // Field 7: Email
                        _buildFieldLabel('Email Address', required: false),
                        _buildTextField(_emailController, 'admin@abccollege.edu.in', keyboardType: TextInputType.emailAddress),
                      ],
                    ),
                  ),
                  const SizedBox(height: 16),

                  // Common Service Requirements Section
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
                        Text(
                          AppLocalization.get('Common Service Requirements'),
                          style: const TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.bold,
                            color: Color(0xFF123B5D),
                            letterSpacing: 0.3,
                          ),
                        ),
                        const SizedBox(height: 4),
                        Text(
                          AppLocalization.get('Select all that apply to match suitable workers or cooperative teams.'),
                          style: const TextStyle(fontSize: 11, color: Color(0xFF64748B)),
                        ),
                        const SizedBox(height: 12),

                        // Service Chips
                        Wrap(
                          spacing: 8,
                          runSpacing: 8,
                          children: _availableServices.map((service) {
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
                              child: AnimatedContainer(
                                duration: const Duration(milliseconds: 150),
                                padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                                decoration: BoxDecoration(
                                  color: isSelected ? const Color(0xFFDCFCE7) : Colors.white,
                                  borderRadius: BorderRadius.circular(16),
                                  border: Border.all(
                                    color: isSelected ? const Color(0xFF087443) : const Color(0xFFCBD5E1),
                                    width: isSelected ? 1.5 : 1,
                                  ),
                                ),
                                child: Row(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    if (isSelected) ...[
                                      const Icon(Icons.check, size: 13, color: Color(0xFF087443)),
                                      const SizedBox(width: 4),
                                    ],
                                    Text(
                                      AppLocalization.get(service),
                                      style: TextStyle(
                                        fontSize: 12,
                                        fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
                                        color: isSelected ? const Color(0xFF087443) : const Color(0xFF334155),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            );
                          }).toList(),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 14),

                  // Authorization Consent Card
                  Container(
                    padding: const EdgeInsets.all(12),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(14),
                      border: Border.all(color: const Color(0xFFE2E8F0)),
                    ),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Checkbox(
                          value: _hasConsent,
                          activeColor: const Color(0xFF123B5D),
                          onChanged: (val) => setState(() => _hasConsent = val ?? false),
                        ),
                        Expanded(
                          child: GestureDetector(
                            onTap: () => setState(() => _hasConsent = !_hasConsent),
                            child: Padding(
                              padding: const EdgeInsets.only(top: 8.0),
                              child: Text(
                                AppLocalization.get('I confirm that I am authorised to register this institution and manage workforce deployment on its behalf.'),
                                style: const TextStyle(fontSize: 11.5, color: Color(0xFF334155), height: 1.3),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 18),

                  // Continue Button
                  SizedBox(
                    width: double.infinity,
                    height: 48,
                    child: ElevatedButton(
                      onPressed: _isFormValid ? _onContinue : null,
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xFF123B5D),
                        foregroundColor: Colors.white,
                        elevation: 0,
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            AppLocalization.get('Continue'),
                            style: const TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
                          ),
                          const SizedBox(width: 6),
                          const Icon(Icons.arrow_forward, size: 16),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    AppLocalization.get('Next: Mobile OTP verification for authorised representative'),
                    style: const TextStyle(fontSize: 10.5, color: Color(0xFF94A3B8)),
                  ),
                  const SizedBox(height: 24),
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  Widget _buildFieldLabel(String label, {required bool required}) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 6.0),
      child: Row(
        children: [
          Text(
            label,
            style: const TextStyle(
              fontSize: 11,
              fontWeight: FontWeight.bold,
              color: Color(0xFF123B5D),
              letterSpacing: 0.3,
            ),
          ),
          if (required) ...[
            const SizedBox(width: 2),
            const Text('*', style: TextStyle(color: Colors.red, fontWeight: FontWeight.bold)),
          ],
        ],
      ),
    );
  }

  Widget _buildTextField(
    TextEditingController controller,
    String hint, {
    TextInputType keyboardType = TextInputType.text,
    int maxLines = 1,
    bool isPhone = false,
  }) {
    return Container(
      decoration: BoxDecoration(
        color: const Color(0xFFF8FAFC),
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: const Color(0xFFCBD5E1)),
      ),
      child: Row(
        children: [
          if (isPhone)
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 11),
              decoration: const BoxDecoration(
                border: Border(right: BorderSide(color: Color(0xFFCBD5E1))),
              ),
              child: const Text('+91', style: TextStyle(fontSize: 12.5, fontWeight: FontWeight.bold, color: Color(0xFF123B5D))),
            ),
          Expanded(
            child: TextField(
              controller: controller,
              keyboardType: keyboardType,
              maxLines: maxLines,
              style: const TextStyle(fontSize: 13, fontWeight: FontWeight.w600, color: Color(0xFF0F172A)),
              decoration: InputDecoration(
                border: InputBorder.none,
                contentPadding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
                hintText: hint,
                hintStyle: const TextStyle(fontSize: 12, color: Color(0xFF94A3B8)),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
