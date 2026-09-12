import 'package:flutter/material.dart';
import '../theme/colors.dart';
import '../widgets/custom_buttons.dart';
import 'otp_screen.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({Key? key}) : super(key: key);

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final TextEditingController _coopNameController = TextEditingController(text: 'Nirman Shramik Cooperative');
  final TextEditingController _regNoController = TextEditingController(text: 'MSCS/ND/2021/8472');
  final TextEditingController _locationController = TextEditingController(text: 'Dwarka, South West Delhi');
  final TextEditingController _serviceAreasController = TextEditingController(text: 'Dwarka, Janakpuri, Uttam Nagar, Palam');
  final TextEditingController _repNameController = TextEditingController(text: 'Ramesh Chandra Verma');
  final TextEditingController _phoneController = TextEditingController(text: '9876543210');
  final TextEditingController _emailController = TextEditingController(text: 'contact@nirmancoop.org.in');

  final List<String> _services = [
    'Plumbing',
    'Electrical',
    'Painting',
    'Carpentry',
    'Cleaning',
    'Gardening',
    'Construction',
    'General Labour',
    'Other'
  ];

  final Set<String> _selectedServices = {'Painting', 'Construction', 'General Labour'};

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
      // Show confirmation dialog before going to OTP
      showDialog(
        context: context,
        builder: (ctx) => AlertDialog(
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
          title: Column(
            children: [
              Container(
                width: 48,
                height: 48,
                decoration: BoxDecoration(
                  color: Colors.green.shade50,
                  shape: BoxShape.circle,
                ),
                child: const Icon(Icons.check, color: AppColors.cooperativeGreen),
              ),
              const SizedBox(height: 12),
              const Text('Proceeding to OTP Verification', textAlign: TextAlign.center, style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
            ],
          ),
          content: Text(
            'A 6-digit verification code will be sent to the authorized representative\'s mobile number:\n\n+91 ${_phoneController.text}',
            textAlign: TextAlign.center,
            style: const TextStyle(fontSize: 13, color: AppColors.textSecondary),
          ),
          actions: [
            Column(
              children: [
                PrimaryButton(
                  text: 'Continue to OTP →',
                  onPressed: () {
                    Navigator.pop(ctx);
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => OtpScreen(mobileNumber: _phoneController.text)),
                    );
                  },
                ),
                const SizedBox(height: 8),
                TextButton(
                  onPressed: () => Navigator.pop(ctx),
                  child: const Text('Edit Details', style: TextStyle(color: AppColors.textSecondary, fontWeight: FontWeight.bold)),
                ),
              ],
            )
          ],
        ),
      );
    }
  }

  Widget _buildTextField({
    required String label,
    required TextEditingController controller,
    String? placeholder,
    String? helperText,
    bool isRequired = true,
    bool isOptional = false,
    Widget? prefixIcon,
    TextInputType keyboardType = TextInputType.text,
    int? maxLength,
    void Function(String)? onChanged,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text.rich(
              TextSpan(
                text: label,
                style: const TextStyle(fontSize: 12, fontWeight: FontWeight.bold, color: AppColors.textPrimary),
                children: [
                  if (isRequired) const TextSpan(text: ' *', style: TextStyle(color: Colors.red)),
                ],
              ),
            ),
            if (isOptional)
              const Text('Optional', style: TextStyle(fontSize: 10, color: AppColors.textSecondary, fontWeight: FontWeight.bold)),
          ],
        ),
        const SizedBox(height: 4),
        TextField(
          controller: controller,
          keyboardType: keyboardType,
          maxLength: maxLength,
          onChanged: onChanged,
          decoration: InputDecoration(
            counterText: '',
            filled: true,
            fillColor: Colors.grey.shade50,
            hintText: placeholder,
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
            prefixIcon: prefixIcon,
            prefixIconConstraints: const BoxConstraints(minWidth: 0, minHeight: 0),
          ),
          style: const TextStyle(fontSize: 13, fontWeight: FontWeight.w600, color: AppColors.textPrimary),
        ),
        if (helperText != null)
          Padding(
            padding: const EdgeInsets.only(top: 4),
            child: Text(helperText, style: const TextStyle(fontSize: 11, color: AppColors.textSecondary)),
          ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    final bool isValid = _phoneController.text.length == 10 && _selectedServices.isNotEmpty && _coopNameController.text.isNotEmpty;

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
                    label: const Text('Back', style: TextStyle(fontWeight: FontWeight.bold, color: AppColors.primaryContainer)),
                    style: TextButton.styleFrom(padding: EdgeInsets.zero),
                  ),
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      border: Border.all(color: AppColors.borderSubtle),
                      borderRadius: BorderRadius.circular(16),
                    ),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: const [
                        Text('EN', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 12, color: AppColors.primaryContainer)),
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 4.0),
                          child: Text('|', style: TextStyle(color: Colors.black26)),
                        ),
                        Text('हिन्दी', style: TextStyle(fontSize: 12, color: Colors.black54)),
                      ],
                    ),
                  ),
                ],
              ),
            ),

            Expanded(
              child: SingleChildScrollView(
                padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 12.0),
                child: SizedBox(
                  width: double.infinity,
                  child: Column(
                    children: [
                      // Header
                      Image.network(
                        'https://lh3.googleusercontent.com/aida-public/AB6AXuDI8AI-rJt8VYRpWLESn0NVtPnA3Yu6TYZ0s09Hl06QkQCC2ALFfnBZW1fnJxZltXTg-ZuEev9sliapubmAzuAzap7YIqq8xrO1YiTDrmb_woRf_MjSII8IQVZ3GEaqNl-6bbes5ZLbSBzk5gLlvPFLS96RJFgQwKCx3X7_Kav91whkYilzKmNZVHZaQtCw8vECeRT1v6xg4DnBg57csCs64tbGFBjXmTtPcaHhiWQQC7Job9wG31MaXdgAsz4e-yvteA',
                        height: 64,
                        errorBuilder: (context, error, stackTrace) => 
                            const Text('SAHYOG', style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold, color: AppColors.primaryContainer)),
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
                          children: const [
                            Text('🏢', style: TextStyle(fontSize: 12)),
                            SizedBox(width: 6),
                            Text('COOPERATIVE REGISTRATION', style: TextStyle(fontSize: 11, fontWeight: FontWeight.bold, color: AppColors.cooperativeGreen)),
                          ],
                        ),
                      ),
                      const SizedBox(height: 16),
                      const Text(
                        'Register Your Cooperative',
                        style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold, color: AppColors.textPrimary),
                        textAlign: TextAlign.center,
                      ),
                      const SizedBox(height: 4),
                      const Text(
                        'Create an account for your cooperative and its authorized representative.',
                        style: TextStyle(fontSize: 13, color: AppColors.textSecondary),
                        textAlign: TextAlign.center,
                      ),
                      const SizedBox(height: 24),

                      // SECTION 1: COOPERATIVE DETAILS
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
                                Row(
                                  children: [
                                    Container(width: 6, height: 12, color: AppColors.primaryContainer, margin: const EdgeInsets.only(right: 6)),
                                    const Text('COOPERATIVE DETAILS', style: TextStyle(fontSize: 11, fontWeight: FontWeight.bold, color: AppColors.primaryContainer)),
                                  ],
                                ),
                                Container(
                                  padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
                                  decoration: BoxDecoration(color: Colors.green.shade50, borderRadius: BorderRadius.circular(4)),
                                  child: const Text('Organisation', style: TextStyle(fontSize: 10, fontWeight: FontWeight.bold, color: AppColors.cooperativeGreen)),
                                ),
                              ],
                            ),
                            const Divider(height: 24, color: AppColors.borderSubtle),
                            _buildTextField(
                              label: 'Cooperative Name',
                              controller: _coopNameController,
                              placeholder: 'Enter cooperative name',
                              helperText: 'e.g., Nirman Shramik Cooperative',
                            ),
                            const SizedBox(height: 16),
                            _buildTextField(
                              label: 'Registration Number',
                              controller: _regNoController,
                              placeholder: 'Enter registration number',
                              helperText: 'Your registration details will be used for cooperative verification.',
                            ),
                            const SizedBox(height: 16),
                            _buildTextField(
                              label: 'Registered Location',
                              controller: _locationController,
                              placeholder: 'Enter city or district',
                              prefixIcon: const Padding(
                                padding: EdgeInsets.symmetric(horizontal: 12.0),
                                child: Icon(Icons.location_on_outlined, size: 18, color: Colors.black38),
                              ),
                            ),
                            const SizedBox(height: 16),
                            _buildTextField(
                              label: 'Service Areas',
                              controller: _serviceAreasController,
                              placeholder: 'Select areas you serve',
                              helperText: 'Separate locations by commas',
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 16),

                      // SECTION 2: AUTHORIZED REP
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
                                Row(
                                  children: [
                                    Container(width: 6, height: 12, color: AppColors.primaryContainer, margin: const EdgeInsets.only(right: 6)),
                                    const Text('AUTHORIZED REPRESENTATIVE', style: TextStyle(fontSize: 11, fontWeight: FontWeight.bold, color: AppColors.primaryContainer)),
                                  ],
                                ),
                                Container(
                                  padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
                                  decoration: BoxDecoration(color: Colors.grey.shade100, borderRadius: BorderRadius.circular(4)),
                                  child: const Text('Admin User', style: TextStyle(fontSize: 10, fontWeight: FontWeight.bold, color: Colors.black54)),
                                ),
                              ],
                            ),
                            const Divider(height: 24, color: AppColors.borderSubtle),
                            _buildTextField(
                              label: 'Representative Name',
                              controller: _repNameController,
                              placeholder: 'Enter authorized representative name',
                              helperText: 'Secretary / Registered Administrator',
                            ),
                            const SizedBox(height: 16),
                            _buildTextField(
                              label: 'Admin Mobile Number',
                              controller: _phoneController,
                              placeholder: 'Enter mobile number',
                              keyboardType: TextInputType.phone,
                              maxLength: 10,
                              onChanged: (_) => setState(() {}),
                              helperText: 'This number will receive an OTP.',
                              prefixIcon: Padding(
                                padding: const EdgeInsets.only(right: 12.0),
                                child: Container(
                                  padding: const EdgeInsets.symmetric(horizontal: 12),
                                  decoration: const BoxDecoration(
                                    border: Border(right: BorderSide(color: AppColors.borderSubtle)),
                                  ),
                                  child: Row(
                                    mainAxisSize: MainAxisSize.min,
                                    children: const [
                                      Text('🇮🇳', style: TextStyle(fontSize: 14)),
                                      SizedBox(width: 4),
                                      Text('+91', style: TextStyle(fontWeight: FontWeight.bold, color: AppColors.textPrimary)),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                            const SizedBox(height: 16),
                            _buildTextField(
                              label: 'Email Address',
                              controller: _emailController,
                              placeholder: 'Enter email address',
                              isRequired: false,
                              isOptional: true,
                              keyboardType: TextInputType.emailAddress,
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 16),

                      // SECTION 3: SERVICES
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
                                Row(
                                  children: [
                                    Container(width: 6, height: 12, color: AppColors.primaryContainer, margin: const EdgeInsets.only(right: 6)),
                                    const Text('SERVICES PROVIDED', style: TextStyle(fontSize: 11, fontWeight: FontWeight.bold, color: AppColors.primaryContainer)),
                                  ],
                                ),
                                Container(
                                  padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
                                  decoration: BoxDecoration(color: Colors.green.shade50, borderRadius: BorderRadius.circular(4)),
                                  child: Text('${_selectedServices.length} selected', style: const TextStyle(fontSize: 10, fontWeight: FontWeight.bold, color: AppColors.cooperativeGreen)),
                                ),
                              ],
                            ),
                            const SizedBox(height: 4),
                            const Text('Services your cooperative provides (select all that apply)', style: TextStyle(fontSize: 11, color: AppColors.textSecondary)),
                            const SizedBox(height: 16),
                            Wrap(
                              spacing: 8,
                              runSpacing: 8,
                              children: _services.map((service) {
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
                                    padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
                                    decoration: BoxDecoration(
                                      color: isSelected ? AppColors.cooperativeGreen : Colors.grey.shade50,
                                      border: Border.all(color: isSelected ? AppColors.cooperativeGreen : AppColors.borderSubtle),
                                      borderRadius: BorderRadius.circular(12),
                                      boxShadow: isSelected ? [BoxShadow(color: AppColors.cooperativeGreen.withOpacity(0.2), blurRadius: 4, offset: const Offset(0, 2))] : null,
                                    ),
                                    child: Row(
                                      mainAxisSize: MainAxisSize.min,
                                      children: [
                                        if (isSelected)
                                          const Padding(
                                            padding: EdgeInsets.only(right: 6.0),
                                            child: Icon(Icons.check, size: 14, color: Colors.white),
                                          ),
                                        Text(
                                          service,
                                          style: TextStyle(
                                            fontSize: 12,
                                            fontWeight: isSelected ? FontWeight.bold : FontWeight.w500,
                                            color: isSelected ? Colors.white : AppColors.textPrimary,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                );
                              }).toList(),
                            )
                          ],
                        ),
                      ),
                      const SizedBox(height: 24),

                      // Continue Button
                      PrimaryButton(
                        text: 'Continue →',
                        onPressed: isValid ? _handleContinue : null,
                      ),
                      const SizedBox(height: 16),
                      
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Text('Already registered? ', style: TextStyle(fontSize: 13, color: AppColors.textSecondary)),
                          GestureDetector(
                            onTap: () => Navigator.pop(context),
                            child: const Text('Login', style: TextStyle(fontSize: 13, fontWeight: FontWeight.bold, color: AppColors.primaryContainer)),
                          ),
                        ],
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
}
