import 'package:flutter/material.dart';
import '../theme/colors.dart';
import '../widgets/custom_buttons.dart';
import '../utils/localization.dart';
import 'otp_screen.dart';

class WorkerRegistrationDraft {
  final String name;
  final String phone;
  final String location;
  final String primarySkill;
  final bool isCooperativeMember;

  WorkerRegistrationDraft({
    required this.name,
    required this.phone,
    required this.location,
    required this.primarySkill,
    required this.isCooperativeMember,
  });
}

class WorkerRegistrationScreen extends StatefulWidget {
  const WorkerRegistrationScreen({Key? key}) : super(key: key);

  @override
  State<WorkerRegistrationScreen> createState() => _WorkerRegistrationScreenState();
}

class _WorkerRegistrationScreenState extends State<WorkerRegistrationScreen> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();
  final TextEditingController _locationController = TextEditingController();
  
  String? _selectedSkill;
  bool _isCooperativeMember = false;

  final List<String> _skills = [
    'Plumbing',
    'Electrical',
    'Painting',
    'Carpentry',
    'Cleaning',
    'Gardening',
    'Construction',
    'General Labour'
  ];

  @override
  void dispose() {
    _nameController.dispose();
    _phoneController.dispose();
    _locationController.dispose();
    super.dispose();
  }

  void _handleContinue() {
    if (_nameController.text.isNotEmpty && _phoneController.text.length == 10 && _locationController.text.isNotEmpty && _selectedSkill != null) {
      final draft = WorkerRegistrationDraft(
        name: _nameController.text,
        phone: _phoneController.text,
        location: _locationController.text,
        primarySkill: _selectedSkill!,
        isCooperativeMember: _isCooperativeMember,
      );
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => OtpScreen(mobileNumber: _phoneController.text, role: 'Worker')),
      );
    }
  }

  Widget _buildTextField({
    required String label,
    required TextEditingController controller,
    String? placeholder,
    String? helperText,
    bool isRequired = true,
    Widget? prefixIcon,
    TextInputType keyboardType = TextInputType.text,
    int? maxLength,
    void Function(String)? onChanged,
    Widget? trailingWidget,
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
            if (trailingWidget != null) trailingWidget,
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
            padding: const EdgeInsets.only(top: 6),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Padding(
                  padding: EdgeInsets.only(top: 2.0, right: 4.0),
                  child: Icon(Icons.info_outline, size: 12, color: AppColors.textSecondary),
                ),
                Expanded(
                  child: Text(helperText, style: const TextStyle(fontSize: 11, color: AppColors.textSecondary)),
                ),
              ],
            ),
          ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    final bool isValid = _nameController.text.isNotEmpty && 
                         _phoneController.text.length == 10 && 
                         _locationController.text.isNotEmpty && 
                         _selectedSkill != null;

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
                      GestureDetector(
                        onTap: () => Navigator.pop(context),
                        child: Container(
                          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                          decoration: BoxDecoration(
                            shape: BoxShape.rectangle,
                            borderRadius: BorderRadius.circular(4),
                            border: Border.all(color: Colors.blue.withOpacity(0.3), style: BorderStyle.solid, width: 1.5),
                          ),
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              const Icon(Icons.arrow_back, size: 16, color: AppColors.primaryContainer),
                              const SizedBox(width: 4),
                              Text(AppLocalization.get('Back').replaceAll('Back', lang == 'HI' ? 'पीछे' : 'Back'), style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 12, color: AppColors.primaryContainer)),
                            ],
                          ),
                        ),
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
                          children: [
                            GestureDetector(
                              onTap: () => AppLocalization.setLanguage('EN'),
                              child: Text(
                                'EN', 
                                style: TextStyle(
                                  fontWeight: lang == 'EN' ? FontWeight.bold : FontWeight.normal, 
                                  fontSize: 12, 
                                  color: lang == 'EN' ? AppColors.primaryContainer : Colors.black54
                                )
                              ),
                            ),
                            const Padding(
                              padding: EdgeInsets.symmetric(horizontal: 4.0),
                              child: Text('|', style: TextStyle(color: Colors.black26)),
                            ),
                            GestureDetector(
                              onTap: () => AppLocalization.setLanguage('HI'),
                              child: Text(
                                'हिन्दी', 
                                style: TextStyle(
                                  fontWeight: lang == 'HI' ? FontWeight.bold : FontWeight.normal, 
                                  fontSize: 12, 
                                  color: lang == 'HI' ? AppColors.primaryContainer : Colors.black54
                                )
                              ),
                            ),
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
                          Image.asset(
                'assets/images/logo.png',
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
                              children: [
                                const Icon(Icons.circle, size: 8, color: AppColors.cooperativeGreen),
                                const SizedBox(width: 6),
                                Text(AppLocalization.get('Worker Registration • कामगार पंजीकरण'), style: const TextStyle(fontSize: 11, fontWeight: FontWeight.bold, color: AppColors.cooperativeGreen)),
                              ],
                            ),
                          ),
                          const SizedBox(height: 16),
                          Text(
                            AppLocalization.get('Create your worker profile'),
                            style: const TextStyle(fontSize: 22, fontWeight: FontWeight.bold, color: AppColors.primaryContainer),
                            textAlign: TextAlign.center,
                          ),
                          const SizedBox(height: 4),
                          Text(
                            AppLocalization.get('Tell us a little about yourself to get started.'),
                            style: const TextStyle(fontSize: 13, color: AppColors.textSecondary),
                            textAlign: TextAlign.center,
                          ),
                          const SizedBox(height: 24),

                          // Form
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
                                _buildTextField(
                                  label: AppLocalization.get('Full Name'),
                                  controller: _nameController,
                                  placeholder: AppLocalization.get('Enter your full name'),
                                  onChanged: (_) => setState((){}),
                                  prefixIcon: const Padding(
                                    padding: EdgeInsets.symmetric(horizontal: 12.0),
                                    child: Icon(Icons.person_outline, size: 18, color: Colors.black38),
                                  ),
                                ),
                                const SizedBox(height: 20),
                                _buildTextField(
                                  label: AppLocalization.get('Mobile Number'),
                                  controller: _phoneController,
                                  placeholder: AppLocalization.get('Enter 10-digit mobile'),
                                  keyboardType: TextInputType.phone,
                                  maxLength: 10,
                                  onChanged: (_) => setState(() {}),
                                  helperText: AppLocalization.get('We\'ll verify this with an SMS OTP in the next step'),
                                  trailingWidget: Container(
                                    padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
                                    decoration: BoxDecoration(color: Colors.green.shade50, borderRadius: BorderRadius.circular(4)),
                                    child: Text(AppLocalization.get('OTP Login'), style: const TextStyle(fontSize: 10, fontWeight: FontWeight.bold, color: AppColors.cooperativeGreen)),
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
                                        children: const [
                                          Text('🇮🇳', style: TextStyle(fontSize: 14)),
                                          SizedBox(width: 4),
                                          Text('+91', style: TextStyle(fontWeight: FontWeight.bold, color: AppColors.textPrimary)),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                                const SizedBox(height: 20),
                                _buildTextField(
                                  label: AppLocalization.get('Location'),
                                  controller: _locationController,
                                  placeholder: AppLocalization.get('Enter your city / area'),
                                  onChanged: (_) => setState((){}),
                                  prefixIcon: const Padding(
                                    padding: EdgeInsets.symmetric(horizontal: 12.0),
                                    child: Icon(Icons.location_on_outlined, size: 18, color: Colors.black38),
                                  ),
                                ),
                                const SizedBox(height: 20),
                                
                                // Primary Skill Dropdown
                                Text.rich(
                                  TextSpan(
                                    text: AppLocalization.get('Primary Skill'),
                                    style: const TextStyle(fontSize: 12, fontWeight: FontWeight.bold, color: AppColors.textPrimary),
                                    children: const [
                                      TextSpan(text: ' *', style: TextStyle(color: Colors.red)),
                                    ],
                                  ),
                                ),
                                const SizedBox(height: 4),
                                Container(
                                  padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
                                  decoration: BoxDecoration(
                                    color: Colors.grey.shade50,
                                    borderRadius: BorderRadius.circular(12),
                                    border: Border.all(color: AppColors.borderSubtle),
                                  ),
                                  child: DropdownButtonHideUnderline(
                                    child: DropdownButton<String>(
                                      value: _selectedSkill,
                                      isExpanded: true,
                                      hint: Text(AppLocalization.get('Select your main skill'), style: const TextStyle(color: Colors.black38, fontSize: 13, fontWeight: FontWeight.w600)),
                                      icon: const Icon(Icons.keyboard_arrow_down, color: Colors.black38),
                                      items: _skills.map((skill) => DropdownMenuItem(
                                        value: skill,
                                        child: Text(AppLocalization.get(skill), style: const TextStyle(fontSize: 13, fontWeight: FontWeight.w600, color: AppColors.textPrimary)),
                                      )).toList(),
                                      onChanged: (val) {
                                        setState(() {
                                          _selectedSkill = val;
                                        });
                                      },
                                    ),
                                  ),
                                ),
                                const SizedBox(height: 6),
                                Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    const Padding(
                                      padding: EdgeInsets.only(top: 2.0, right: 4.0),
                                      child: Icon(Icons.check_circle, size: 12, color: AppColors.cooperativeGreen),
                                    ),
                                    Expanded(
                                      child: Text(AppLocalization.get('Add more skills later from your Skill Passport.'), style: const TextStyle(fontSize: 11, color: AppColors.cooperativeGreen, fontWeight: FontWeight.w500)),
                                    ),
                                  ],
                                ),
                                
                                const Padding(
                                  padding: EdgeInsets.symmetric(vertical: 20.0),
                                  child: Divider(height: 1, color: AppColors.borderSubtle),
                                ),
                                
                                // Cooperative Toggle
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Expanded(
                                      child: Text(
                                        AppLocalization.get('Are you part of a cooperative?'),
                                        style: const TextStyle(fontSize: 13, fontWeight: FontWeight.bold, color: AppColors.textPrimary),
                                      ),
                                    ),
                                    Container(
                                      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                                      decoration: BoxDecoration(
                                        color: Colors.grey.shade100,
                                        borderRadius: BorderRadius.circular(12),
                                      ),
                                      child: Text(AppLocalization.get('Optional'), style: const TextStyle(fontSize: 10, fontWeight: FontWeight.bold, color: Colors.black54)),
                                    ),
                                  ],
                                ),
                                const SizedBox(height: 4),
                                Text(
                                  AppLocalization.get('Cooperative membership is completely optional. You can always use SAHYOG independently.'),
                                  style: const TextStyle(fontSize: 11, color: AppColors.textSecondary, height: 1.3),
                                ),
                                const SizedBox(height: 16),
                                Row(
                                  children: [
                                    Expanded(
                                      child: GestureDetector(
                                        onTap: () => setState(() => _isCooperativeMember = true),
                                        child: Container(
                                          padding: const EdgeInsets.symmetric(vertical: 12),
                                          decoration: BoxDecoration(
                                            color: _isCooperativeMember ? const Color(0xFFECFDF5) : Colors.white,
                                            border: Border.all(color: _isCooperativeMember ? AppColors.cooperativeGreen : AppColors.borderSubtle),
                                            borderRadius: BorderRadius.circular(12),
                                          ),
                                          child: Row(
                                            mainAxisAlignment: MainAxisAlignment.center,
                                            children: [
                                              Container(
                                                width: 16,
                                                height: 16,
                                                decoration: BoxDecoration(
                                                  shape: BoxShape.circle,
                                                  border: Border.all(color: _isCooperativeMember ? AppColors.cooperativeGreen : Colors.black38, width: _isCooperativeMember ? 5 : 1.5),
                                                ),
                                              ),
                                              const SizedBox(width: 8),
                                              Text(AppLocalization.get('Yes'), style: TextStyle(fontWeight: FontWeight.bold, color: _isCooperativeMember ? AppColors.cooperativeGreen : AppColors.textPrimary)),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ),
                                    const SizedBox(width: 12),
                                    Expanded(
                                      child: GestureDetector(
                                        onTap: () => setState(() => _isCooperativeMember = false),
                                        child: Container(
                                          padding: const EdgeInsets.symmetric(vertical: 12),
                                          decoration: BoxDecoration(
                                            color: !_isCooperativeMember ? const Color(0xFFECFDF5) : Colors.white,
                                            border: Border.all(color: !_isCooperativeMember ? AppColors.cooperativeGreen : AppColors.borderSubtle),
                                            borderRadius: BorderRadius.circular(12),
                                          ),
                                          child: Row(
                                            mainAxisAlignment: MainAxisAlignment.center,
                                            children: [
                                              if (!_isCooperativeMember)
                                                Container(
                                                  width: 16,
                                                  height: 16,
                                                  decoration: const BoxDecoration(
                                                    shape: BoxShape.circle,
                                                    color: AppColors.cooperativeGreen,
                                                  ),
                                                  child: const Icon(Icons.check, size: 12, color: Colors.white),
                                                )
                                              else
                                                Container(
                                                  width: 16,
                                                  height: 16,
                                                  decoration: BoxDecoration(
                                                    shape: BoxShape.circle,
                                                    border: Border.all(color: Colors.black38, width: 1.5),
                                                  ),
                                                ),
                                              const SizedBox(width: 8),
                                              Text(AppLocalization.get('No'), style: TextStyle(fontWeight: FontWeight.bold, color: !_isCooperativeMember ? AppColors.cooperativeGreen : AppColors.textPrimary)),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                
                                const SizedBox(height: 24),
                                
                                // Trust Banner
                                Container(
                                  padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
                                  decoration: BoxDecoration(
                                    color: const Color(0xFFECFDF5),
                                    borderRadius: BorderRadius.circular(8),
                                    border: Border.all(color: const Color(0xFFD1FAE5)),
                                  ),
                                  child: Row(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      const Icon(Icons.shield_outlined, size: 16, color: AppColors.cooperativeGreen),
                                      const SizedBox(width: 8),
                                      Expanded(
                                        child: Text(
                                          AppLocalization.get('Your information is protected and shared only with your consent.'),
                                          style: const TextStyle(fontSize: 11, fontWeight: FontWeight.w600, color: AppColors.cooperativeGreen),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                
                                const SizedBox(height: 24),

                                // Continue Button
                                Container(
                                  decoration: BoxDecoration(
                                    border: Border.all(color: Colors.blue.withOpacity(0.3), style: BorderStyle.solid, width: 2),
                                    borderRadius: BorderRadius.circular(16),
                                  ),
                                  padding: const EdgeInsets.all(3),
                                  child: PrimaryButton(
                                    text: AppLocalization.get('Continue →').replaceAll(' →', ''),
                                    onPressed: isValid ? _handleContinue : null,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(height: 24),
                          
                          Text(
                            AppLocalization.get('COOPERATE. EMPOWER. GROW.'),
                            style: const TextStyle(fontSize: 10, fontWeight: FontWeight.bold, color: Colors.black38, letterSpacing: 1.5),
                          ),
                          const SizedBox(height: 8),
                          Container(width: 100, height: 4, decoration: BoxDecoration(color: Colors.grey.shade300, borderRadius: BorderRadius.circular(2))),
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
}
