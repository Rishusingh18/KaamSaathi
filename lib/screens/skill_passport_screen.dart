import 'package:flutter/material.dart';
import '../theme/colors.dart';
import '../widgets/custom_buttons.dart';
import '../utils/localization.dart';
import 'worker_main_layout.dart';

class SkillPassportModel {
  final String primarySkill;
  final String otherSkills;
  final String experienceYears;
  final String about;

  SkillPassportModel({
    required this.primarySkill,
    required this.otherSkills,
    required this.experienceYears,
    required this.about,
  });
}

class SkillPassportScreen extends StatefulWidget {
  const SkillPassportScreen({Key? key}) : super(key: key);

  @override
  State<SkillPassportScreen> createState() => _SkillPassportScreenState();
}

class _SkillPassportScreenState extends State<SkillPassportScreen> {
  String? _selectedSkill;
  final TextEditingController _otherSkillsController = TextEditingController();
  final TextEditingController _experienceController = TextEditingController();
  final TextEditingController _aboutController = TextEditingController();

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
    _otherSkillsController.dispose();
    _experienceController.dispose();
    _aboutController.dispose();
    super.dispose();
  }

  void _fillSample() {
    setState(() {
      _selectedSkill = 'Construction';
      _otherSkillsController.text = 'Tile fixing, Welding';
      _experienceController.text = '5';
      _aboutController.text = 'Worked on residential renovation and construction projects for 4 years.';
    });
  }

  void _handleCreate() async {
    final model = SkillPassportModel(
      primarySkill: _selectedSkill!,
      otherSkills: _otherSkillsController.text,
      experienceYears: _experienceController.text,
      about: _aboutController.text,
    );
    // Mock persisting the model
    await Future.delayed(const Duration(milliseconds: 300));
    
    if (mounted) {
      Navigator.pushAndRemoveUntil(
        context,
        MaterialPageRoute(builder: (context) => const WorkerMainLayout()),
        (route) => false,
      );
    }
  }

  Widget _buildTextField({
    required String label,
    required String rightLabel,
    required TextEditingController controller,
    String? placeholder,
    bool isRequired = false,
    Widget? suffixIcon,
    int maxLines = 1,
    TextInputType keyboardType = TextInputType.text,
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
                style: const TextStyle(fontSize: 11, fontWeight: FontWeight.bold, color: AppColors.textPrimary, letterSpacing: 0.5),
                children: [
                  if (isRequired) const TextSpan(text: ' *', style: TextStyle(color: Colors.red)),
                ],
              ),
            ),
            Text(
              rightLabel,
              style: const TextStyle(fontSize: 10, color: Colors.black45, fontWeight: FontWeight.bold),
            ),
          ],
        ),
        const SizedBox(height: 6),
        TextField(
          controller: controller,
          keyboardType: keyboardType,
          maxLines: maxLines,
          onChanged: (_) => setState(() {}),
          decoration: InputDecoration(
            filled: true,
            fillColor: Colors.white,
            hintText: placeholder,
            hintStyle: const TextStyle(color: Colors.black38, fontSize: 13),
            contentPadding: EdgeInsets.symmetric(horizontal: 12, vertical: maxLines > 1 ? 12 : 14),
            suffixIcon: suffixIcon,
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
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<String>(
      valueListenable: AppLocalization.currentLang,
      builder: (context, lang, child) {
        final bool isValid = _selectedSkill != null && _experienceController.text.isNotEmpty;

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
                          AppLocalization.get('Worker Profile • कौशल पासपोर्ट'),
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
                    AppLocalization.get('Build your Skill Passport'),
                    style: const TextStyle(fontSize: 22, fontWeight: FontWeight.bold, color: AppColors.primaryContainer),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    AppLocalization.get('Tell us about your skills and experience to find better work opportunities.'),
                    style: const TextStyle(fontSize: 13, color: AppColors.textSecondary),
                    textAlign: TextAlign.center,
                  ),
                  
                  const SizedBox(height: 24),
                  
                  // Verified Credential Card
                  Container(
                    padding: const EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(16),
                      border: Border.all(color: AppColors.borderSubtle),
                    ),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Container(
                          padding: const EdgeInsets.all(12),
                          decoration: BoxDecoration(
                            color: AppColors.primaryContainer,
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: const Icon(Icons.badge, color: Colors.white, size: 24),
                        ),
                        const SizedBox(width: 12),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                children: [
                                  Text(
                                    AppLocalization.get('Verified Digital Credential'),
                                    style: const TextStyle(fontSize: 12, fontWeight: FontWeight.bold, color: AppColors.primaryContainer),
                                  ),
                                  const SizedBox(width: 6),
                                  Container(
                                    padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
                                    decoration: BoxDecoration(
                                      color: const Color(0xFFE6F4EA),
                                      borderRadius: BorderRadius.circular(4),
                                    ),
                                    child: Text(
                                      AppLocalization.get('CIVIC'),
                                      style: const TextStyle(fontSize: 9, fontWeight: FontWeight.bold, color: AppColors.cooperativeGreen),
                                    ),
                                  ),
                                ],
                              ),
                              const SizedBox(height: 4),
                              Text(
                                AppLocalization.get('Recognized across all registered cooperatives.'),
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
                        // Primary Skill Dropdown
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text.rich(
                              TextSpan(
                                text: AppLocalization.get('YOUR SKILLS'),
                                style: const TextStyle(fontSize: 11, fontWeight: FontWeight.bold, color: AppColors.textPrimary, letterSpacing: 0.5),
                                children: [
                                  TextSpan(text: ' *', style: TextStyle(color: Colors.red)),
                                ],
                              ),
                            ),
                            Text(
                              AppLocalization.get('Primary required'),
                              style: const TextStyle(fontSize: 10, color: Colors.black45, fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                        const SizedBox(height: 6),
                        Container(
                          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(12),
                            border: Border.all(color: AppColors.borderSubtle),
                          ),
                          child: DropdownButtonHideUnderline(
                            child: DropdownButton<String>(
                              value: _selectedSkill,
                              isExpanded: true,
                              hint: Text(AppLocalization.get('Select your primary skill'), style: const TextStyle(color: Colors.black38, fontSize: 13, fontWeight: FontWeight.w600)),
                              icon: const Icon(Icons.keyboard_arrow_down, color: Colors.black38),
                              items: _skills.map((skill) => DropdownMenuItem(
                                value: skill,
                                child: Text(skill, style: const TextStyle(fontSize: 13, fontWeight: FontWeight.w600, color: AppColors.textPrimary)),
                              )).toList(),
                              onChanged: (val) {
                                setState(() {
                                  _selectedSkill = val;
                                });
                              },
                            ),
                          ),
                        ),
                        const SizedBox(height: 16),
                        
                        // Other Skills
                        _buildTextField(
                          label: AppLocalization.get('Other skills (optional)'),
                          rightLabel: '',
                          controller: _otherSkillsController,
                          placeholder: AppLocalization.get('Add other skills (e.g. Tile fixing, Welding)'),
                        ),
                        
                        const SizedBox(height: 16),
                        
                        // Experience
                        _buildTextField(
                          label: AppLocalization.get('EXPERIENCE'),
                          rightLabel: AppLocalization.get('YEARS IN TRADE'),
                          controller: _experienceController,
                          placeholder: AppLocalization.get('e.g. 5 years'),
                          isRequired: true,
                          keyboardType: TextInputType.number,
                          suffixIcon: Container(
                            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 14),
                            child: Text(AppLocalization.get('Years'), style: const TextStyle(fontSize: 12, color: Colors.black38, fontWeight: FontWeight.w600)),
                          ),
                        ),
                        
                        const SizedBox(height: 16),
                        
                        // About Work
                        _buildTextField(
                          label: AppLocalization.get('ABOUT YOUR WORK'),
                          rightLabel: '',
                          controller: _aboutController,
                          placeholder: AppLocalization.get('Briefly describe your experience (e.g., worked on residential renovation for 4 years)'),
                          maxLines: 3,
                        ),
                        
                        const SizedBox(height: 8),
                        Align(
                          alignment: Alignment.centerRight,
                          child: GestureDetector(
                            onTap: _fillSample,
                            child: Text(
                              AppLocalization.get('⚡ Fill Sample'),
                              style: const TextStyle(fontSize: 11, fontWeight: FontWeight.bold, color: AppColors.primaryContainer),
                            ),
                          ),
                        ),
                        
                        const Padding(
                          padding: EdgeInsets.symmetric(vertical: 16.0),
                          child: Divider(height: 1, color: AppColors.borderSubtle),
                        ),
                        
                        // Info Box
                        Container(
                          padding: const EdgeInsets.all(12),
                          decoration: BoxDecoration(
                            color: Colors.grey.shade50,
                            borderRadius: BorderRadius.circular(8),
                            border: Border.all(color: AppColors.borderSubtle),
                          ),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Icon(Icons.info_outline, size: 16, color: AppColors.cooperativeGreen),
                              const SizedBox(width: 8),
                              Expanded(
                                child: Text(
                                  AppLocalization.get('You can update your skills anytime from your Skill Passport.'),
                                  style: const TextStyle(fontSize: 11, color: AppColors.textSecondary),
                                ),
                              ),
                            ],
                          ),
                        ),
                        
                        const SizedBox(height: 24),
                        
                        SizedBox(
                          width: double.infinity,
                          child: ElevatedButton(
                            onPressed: isValid ? _handleCreate : null,
                            style: ElevatedButton.styleFrom(
                              backgroundColor: AppColors.primaryContainer,
                              disabledBackgroundColor: Colors.grey.shade200,
                              foregroundColor: Colors.white,
                              disabledForegroundColor: Colors.grey.shade400,
                              padding: const EdgeInsets.symmetric(vertical: 14),
                              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  AppLocalization.get('Create Skill Passport →').replaceAll(' →', ''),
                                  style: const TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
                                ),
                                const SizedBox(width: 8),
                                const Icon(Icons.arrow_forward, size: 16),
                              ],
                            ),
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
      }
    );
  }
}
