import 'package:flutter/material.dart';
import '../theme/colors.dart';
import '../utils/localization.dart';
import 'home_screen.dart';

class RoleSelectionScreen extends StatefulWidget {
  const RoleSelectionScreen({Key? key}) : super(key: key);

  @override
  State<RoleSelectionScreen> createState() => _RoleSelectionScreenState();
}

class _RoleSelectionScreenState extends State<RoleSelectionScreen> {
  String _selectedRole = 'Cooperative';

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<String>(
      valueListenable: AppLocalization.currentLang,
      builder: (context, lang, child) {
        return Scaffold(
          backgroundColor: AppColors.surfaceCanvas,
          body: SafeArea(
            child: SingleChildScrollView(
              padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  // Top Navigation Bar
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      GestureDetector(
                        onTap: () => Navigator.pop(context),
                        child: Container(
                          padding: const EdgeInsets.all(8),
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            border: Border.all(color: Colors.blue.withOpacity(0.3), width: 1.5),
                          ),
                          child: const Icon(Icons.arrow_back_ios_new, size: 16, color: AppColors.primaryContainer),
                        ),
                      ),
                      Container(
                        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                        decoration: BoxDecoration(
                          color: Colors.grey.shade50,
                          borderRadius: BorderRadius.circular(16),
                          border: Border.all(color: AppColors.borderSubtle),
                        ),
                        child: Text(
                          AppLocalization.get('Step 2 / 2'),
                          style: const TextStyle(fontSize: 12, fontWeight: FontWeight.bold, color: AppColors.primaryContainer),
                        ),
                      ),
                    ],
                  ),
                  
                  const SizedBox(height: 24),
                  
                  // Brand Logo Placeholder
                  Image.asset(
                'assets/images/logo.png',
                    height: 80,
                    errorBuilder: (context, error, stackTrace) => 
                        const Text('SAHYOG', style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold, color: AppColors.primaryContainer)),
                  ),
                  
                  const SizedBox(height: 12),
                  
                  Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Container(width: 20, height: 3, color: AppColors.saffron),
                      Container(width: 20, height: 3, color: Colors.grey.shade300),
                      Container(width: 20, height: 3, color: AppColors.cooperativeGreen),
                    ],
                  ),
                  
                  const SizedBox(height: 24),
                  
                  Text(
                    AppLocalization.get('How will you use SAHYOG?'),
                    style: const TextStyle(fontSize: 22, fontWeight: FontWeight.bold, color: AppColors.primaryContainer),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 8),
                  Text(
                    AppLocalization.get('Choose your role to get started'),
                    style: const TextStyle(fontSize: 14, color: AppColors.textSecondary),
                    textAlign: TextAlign.center,
                  ),
                  
                  const SizedBox(height: 32),
                  
                  // Role Options
                  _buildRoleOption(
                    id: 'Worker',
                    title: AppLocalization.get('Worker'),
                    tag: AppLocalization.get('कामगार'),
                    subtitle: AppLocalization.get('Find work, manage skills & track earnings'),
                    icon: Icons.person_outline,
                    iconColor: AppColors.cooperativeGreen,
                    iconBgColor: const Color(0xFFD1FAE5),
                    tagBgColor: const Color(0xFFFEF3C7),
                    tagTextColor: const Color(0xFFD97706),
                  ),
                  const SizedBox(height: 12),
                  _buildRoleOption(
                    id: 'Cooperative',
                    title: AppLocalization.get('Cooperative'),
                    tag: AppLocalization.get('सहकारी'),
                    subtitle: AppLocalization.get('Manage workers, jobs & opportunities'),
                    icon: Icons.people_outline,
                    iconColor: AppColors.primaryContainer,
                    iconBgColor: Colors.grey.shade100,
                    tagBgColor: const Color(0xFFD1FAE5),
                    tagTextColor: AppColors.cooperativeGreen,
                  ),
                  const SizedBox(height: 12),

                  
                  const SizedBox(height: 24),
                  
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                    decoration: BoxDecoration(
                      color: Colors.grey.shade50,
                      borderRadius: BorderRadius.circular(8),
                      border: Border.all(color: AppColors.borderSubtle),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Icon(Icons.info_outline, size: 14, color: AppColors.textSecondary),
                        const SizedBox(width: 8),
                        Expanded(
                          child: Text(
                            AppLocalization.get('You can link additional roles later in settings'),
                            style: const TextStyle(fontSize: 11, color: AppColors.textSecondary),
                          ),
                        ),
                      ],
                    ),
                  ),
                  
                  const SizedBox(height: 32),
                  
                  // Continue Button with dotted border
                  Container(
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.blue.withOpacity(0.3), style: BorderStyle.solid, width: 2),
                      borderRadius: BorderRadius.circular(16),
                    ),
                    padding: const EdgeInsets.all(3),
                    child: SizedBox(
                      width: double.infinity,
                      child: ElevatedButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => HomeScreen(role: _selectedRole)),
                          );
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: AppColors.primaryContainer,
                          padding: const EdgeInsets.symmetric(vertical: 16),
                          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              AppLocalization.get('Continue →').replaceAll(' →', ''),
                              style: const TextStyle(color: Colors.white, fontSize: 16, fontWeight: FontWeight.bold),
                            ),
                            const SizedBox(width: 8),
                            const Icon(Icons.arrow_forward, color: Colors.white, size: 18),
                          ],
                        ),
                      ),
                    ),
                  ),
                  
                  const SizedBox(height: 16),
                  
                  Text(
                    AppLocalization.get('COOPERATE. EMPOWER. GROW.'),
                    style: const TextStyle(fontSize: 10, fontWeight: FontWeight.bold, color: Colors.black38, letterSpacing: 1.5),
                  ),
                  const SizedBox(height: 8),
                  Container(width: 100, height: 4, decoration: BoxDecoration(color: Colors.grey.shade300, borderRadius: BorderRadius.circular(2))),
                  const SizedBox(height: 16),
                ],
              ),
            ),
          ),
        );
      }
    );
  }

  Widget _buildRoleOption({
    required String id,
    required String title,
    required String tag,
    required String subtitle,
    required IconData icon,
    required Color iconColor,
    required Color iconBgColor,
    required Color tagBgColor,
    required Color tagTextColor,
  }) {
    final bool isSelected = _selectedRole == id;
    
    return GestureDetector(
      onTap: () {
        setState(() {
          _selectedRole = id;
        });
      },
      child: Container(
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
          color: isSelected ? const Color(0xFFF0FDF4) : Colors.white,
          borderRadius: BorderRadius.circular(16),
          border: Border.all(
            color: isSelected ? AppColors.cooperativeGreen : AppColors.borderSubtle,
            width: isSelected ? 2 : 1,
          ),
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              width: 48,
              height: 48,
              decoration: BoxDecoration(
                color: isSelected ? AppColors.cooperativeGreen : iconBgColor,
                borderRadius: BorderRadius.circular(12),
              ),
              child: Icon(icon, color: isSelected ? Colors.white : iconColor),
            ),
            const SizedBox(width: 16),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Text(
                        title,
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: isSelected ? AppColors.cooperativeGreen : AppColors.primaryContainer,
                        ),
                      ),
                      const SizedBox(width: 8),
                      Container(
                        padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
                        decoration: BoxDecoration(
                          color: tagBgColor,
                          borderRadius: BorderRadius.circular(4),
                          border: Border.all(color: tagTextColor.withOpacity(0.3)),
                        ),
                        child: Text(
                          tag,
                          style: TextStyle(fontSize: 10, fontWeight: FontWeight.bold, color: tagTextColor),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 4),
                  Text(
                    subtitle,
                    style: const TextStyle(fontSize: 12, color: AppColors.textSecondary, height: 1.3),
                  ),
                ],
              ),
            ),
            const SizedBox(width: 12),
            Container(
              width: 24,
              height: 24,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: isSelected ? AppColors.cooperativeGreen : Colors.white,
                border: Border.all(
                  color: isSelected ? AppColors.cooperativeGreen : AppColors.borderSubtle,
                  width: isSelected ? 0 : 1.5,
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
