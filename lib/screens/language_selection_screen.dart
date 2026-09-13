import 'package:flutter/material.dart';
import '../theme/colors.dart';
import '../utils/localization.dart';
import 'role_selection_screen.dart';

class LanguageSelectionScreen extends StatefulWidget {
  const LanguageSelectionScreen({Key? key}) : super(key: key);

  @override
  State<LanguageSelectionScreen> createState() => _LanguageSelectionScreenState();
}

class _LanguageSelectionScreenState extends State<LanguageSelectionScreen> {
  // We can initialize it to the current language from AppLocalization
  // But design defaults to Hindi for this screen.
  
  @override
  void initState() {
    super.initState();
    // Setting default to Hindi for onboarding
    AppLocalization.currentLang.value = 'HI';
  }

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<String>(
      valueListenable: AppLocalization.currentLang,
      builder: (context, lang, child) {
        return Scaffold(
          backgroundColor: Colors.white,
          body: SafeArea(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 20.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const SizedBox(height: 40),
                  
                  // SAHYOG Logo
                  Image.asset(
                'assets/images/logo.png',
                    height: 120,
                    errorBuilder: (context, error, stackTrace) => 
                        const Text('SAHYOG', style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold, color: AppColors.primaryContainer)),
                  ),
                  
                  const SizedBox(height: 24),
                  
                  // Hindi title
                  const Text(
                    'साथ मिलकर, समृद्धि की ओर',
                    style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                      color: AppColors.primaryContainer,
                    ),
                  ),
                  const SizedBox(height: 8),
                  
                  // Subtitle
                  const Text(
                    'India\'s Cooperative Workforce Network',
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w600,
                      color: AppColors.textSecondary,
                    ),
                  ),
                  const SizedBox(height: 12),
                  
                  // Tri-color accent
                  Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Container(width: 24, height: 3, color: AppColors.saffron),
                      Container(width: 24, height: 3, color: Colors.grey.shade200),
                      Container(width: 24, height: 3, color: AppColors.cooperativeGreen),
                    ],
                  ),
                  
                  const SizedBox(height: 40),
                  
                  // Choose Language Text
                  const Text(
                    'अपनी पसंदीदा भाषा चुनें',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: AppColors.textPrimary,
                    ),
                  ),
                  const SizedBox(height: 4),
                  const Text(
                    'Choose your preferred language',
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w600,
                      color: AppColors.textSecondary,
                    ),
                  ),
                  
                  const SizedBox(height: 24),
                  
                  // Hindi Option
                  _buildLanguageOption(
                    context: context,
                    isSelected: lang == 'HI',
                    onTap: () => AppLocalization.currentLang.value = 'HI',
                    iconText: 'अ',
                    title: 'हिंदी',
                    subtitle: 'Hindi',
                  ),
                  
                  const SizedBox(height: 16),
                  
                  // English Option
                  _buildLanguageOption(
                    context: context,
                    isSelected: lang == 'EN',
                    onTap: () => AppLocalization.currentLang.value = 'EN',
                    iconText: 'A',
                    title: 'English',
                    subtitle: 'English',
                  ),
                  
                  const SizedBox(height: 24),
                  
                  // Info text
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: const [
                      Icon(Icons.info_outline, size: 14, color: AppColors.textSecondary),
                      SizedBox(width: 6),
                      Text(
                        'आप भाषा बाद में कभी भी बदल सकते हैं',
                        style: TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.w500,
                          color: AppColors.textSecondary,
                        ),
                      ),
                    ],
                  ),
                  
                  const Spacer(),
                  
                  // Continue Button
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: () {
                        Navigator.push(
                          context, 
                          MaterialPageRoute(builder: (context) => const RoleSelectionScreen())
                        );
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: AppColors.primaryContainer,
                        foregroundColor: Colors.white,
                        padding: const EdgeInsets.symmetric(vertical: 16),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            lang == 'HI' ? 'जारी रखें' : 'Continue', 
                            style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold)
                          ),
                          const SizedBox(width: 8),
                          const Icon(Icons.arrow_forward, size: 18),
                        ],
                      ),
                    ),
                  ),
                  
                  const SizedBox(height: 24),
                  
                  // Footer Text
                  const Text(
                    'COOPERATE. EMPOWER. GROW.',
                    style: TextStyle(
                      fontSize: 10,
                      fontWeight: FontWeight.bold,
                      letterSpacing: 1.2,
                      color: AppColors.textSecondary,
                    ),
                  ),
                  const SizedBox(height: 8),
                ],
              ),
            ),
          ),
        );
      }
    );
  }

  Widget _buildLanguageOption({
    required BuildContext context,
    required bool isSelected,
    required VoidCallback onTap,
    required String iconText,
    required String title,
    required String subtitle,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
        decoration: BoxDecoration(
          color: isSelected ? const Color(0xFFF0FDF4) : Colors.white,
          borderRadius: BorderRadius.circular(16),
          border: Border.all(
            color: isSelected ? AppColors.cooperativeGreen : AppColors.borderSubtle,
            width: isSelected ? 2 : 1,
          ),
        ),
        child: Row(
          children: [
            Container(
              width: 48,
              height: 48,
              decoration: BoxDecoration(
                color: isSelected ? AppColors.cooperativeGreen : Colors.grey.shade100,
                borderRadius: BorderRadius.circular(12),
              ),
              child: Center(
                child: Text(
                  iconText,
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: isSelected ? Colors.white : AppColors.primaryContainer,
                  ),
                ),
              ),
            ),
            const SizedBox(width: 16),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: isSelected ? AppColors.cooperativeGreen : AppColors.primaryContainer,
                    ),
                  ),
                  Text(
                    subtitle,
                    style: const TextStyle(
                      fontSize: 14,
                      color: AppColors.textSecondary,
                    ),
                  ),
                ],
              ),
            ),
            Container(
              width: 24,
              height: 24,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: isSelected ? AppColors.cooperativeGreen : Colors.white,
                border: Border.all(
                  color: isSelected ? AppColors.cooperativeGreen : Colors.grey.shade300,
                  width: 2,
                ),
              ),
              child: isSelected 
                  ? const Icon(Icons.check, size: 16, color: Colors.white)
                  : null,
            ),
          ],
        ),
      ),
    );
  }
}
