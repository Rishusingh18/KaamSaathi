import 'package:flutter/material.dart';
import '../theme/colors.dart';
import '../utils/localization.dart';
import 'package:dotted_border/dotted_border.dart';

class WorkerSkillPassportTab extends StatelessWidget {
  final VoidCallback? onBack;

  const WorkerSkillPassportTab({super.key, this.onBack});

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<String>(
      valueListenable: AppLocalization.currentLang,
      builder: (context, lang, child) {
        return Scaffold(
          backgroundColor: AppColors.surfaceCanvas,
          appBar: AppBar(
            backgroundColor: Colors.white,
            elevation: 0,
            toolbarHeight: 80,
            automaticallyImplyLeading: false,
            title: Row(
              children: [
                GestureDetector(
                  onTap: () {
                    if (onBack != null) {
                      onBack!();
                    } else {
                      Navigator.pop(context);
                    }
                  },
                  child: DottedBorder(
                    options: CircularDottedBorderOptions(
                      color: Colors.blue.shade300,
                      dashPattern: const [4, 4],
                      strokeWidth: 1.5,
                      padding: EdgeInsets.zero,
                    ),
                    child: Container(
                      width: 40,
                      height: 40,
                      decoration: const BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors.transparent,
                      ),
                      child: const Icon(Icons.arrow_back_ios_new, color: AppColors.primaryContainer, size: 18),
                    ),
                  ),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        AppLocalization.get('My Skill Passport'),
                        style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: AppColors.textPrimary),
                      ),
                      Text(
                        AppLocalization.get('SAHYOG Verified Worker Profile'),
                        style: const TextStyle(fontSize: 11, color: AppColors.textSecondary),
                      ),
                    ],
                  ),
                ),
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(16),
                    border: Border.all(color: AppColors.borderSubtle),
                  ),
                  child: Row(
                    children: [
                      const Icon(Icons.edit, size: 14, color: AppColors.primaryContainer),
                      const SizedBox(width: 4),
                      Text(
                        AppLocalization.get('Edit'),
                        style: const TextStyle(fontSize: 12, fontWeight: FontWeight.bold, color: AppColors.primaryContainer),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          body: ListView(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
            children: [
              // Profile Card
              _buildProfileCard(),
              
              const SizedBox(height: 12),
              
              // Skills Card
              _buildSkillsCard(),
              
              const SizedBox(height: 12),
              
              // Experience Card
              _buildExperienceCard(),
              
              const SizedBox(height: 12),
              
              // Preferences Card
              _buildPreferencesCard(),
              
              const SizedBox(height: 12),
              
              // Cooperative Society Card
              _buildCooperativeCard(),
              
              const SizedBox(height: 12),
              
              // Work History Card
              _buildWorkHistoryCard(),
              
              const SizedBox(height: 32),
            ],
          ),
        );
      }
    );
  }

  Widget _buildProfileCard() {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: AppColors.borderSubtle),
      ),
      child: Column(
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                width: 60,
                height: 60,
                decoration: BoxDecoration(
                  color: const Color(0xFF0B3051),
                  borderRadius: BorderRadius.circular(16),
                ),
                alignment: Alignment.center,
                child: Text('RK', style: TextStyle(color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold)),
              ),
              const SizedBox(width: 16),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Text(AppLocalization.get('Ramlal Kumar'), style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: AppColors.textPrimary)),
                        const SizedBox(width: 8),
                        Container(
                          padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
                          decoration: BoxDecoration(
                            color: const Color(0xFFE6F4EA),
                            borderRadius: BorderRadius.circular(4),
                          ),
                          child: Row(
                            children: [
                              Text(AppLocalization.get('Verified Profile'), style: const TextStyle(fontSize: 9, fontWeight: FontWeight.bold, color: AppColors.cooperativeGreen)),
                              const SizedBox(width: 2),
                              const Icon(Icons.check, size: 10, color: AppColors.cooperativeGreen),
                            ],
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 4),
                    Text(AppLocalization.get('Construction Worker'), style: const TextStyle(fontSize: 13, fontWeight: FontWeight.bold, color: AppColors.textSecondary)),
                    const SizedBox(height: 4),
                    Text('${AppLocalization.get("Passport ID:")} SHY-DL-8821', style: const TextStyle(fontSize: 11, color: AppColors.textSecondary)),
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(height: 16),
          Row(
            children: [
              // e-Shram verified
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
                decoration: BoxDecoration(
                  color: Colors.blue.shade50,
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Row(
                  children: [
                    Icon(Icons.check, size: 14, color: Colors.blue.shade700),
                    const SizedBox(width: 4),
                    Text(AppLocalization.get('e-Shram verified'), style: TextStyle(fontSize: 11, fontWeight: FontWeight.bold, color: Colors.blue.shade800)),
                  ],
                ),
              ),
              const SizedBox(width: 12),
              // Skill passport active
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
                decoration: BoxDecoration(
                  color: const Color(0xFFE6F4EA),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Row(
                  children: [
                    const Icon(Icons.circle, size: 8, color: AppColors.cooperativeGreen),
                    const SizedBox(width: 4),
                    Text(AppLocalization.get('Skill Passport active'), style: const TextStyle(fontSize: 11, fontWeight: FontWeight.bold, color: AppColors.cooperativeGreen)),
                    const SizedBox(width: 4),
                    const Icon(Icons.check, size: 14, color: AppColors.cooperativeGreen),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildSkillsCard() {
    return Container(
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
                  const Icon(Icons.person_outline, size: 18, color: AppColors.primaryContainer),
                  const SizedBox(width: 8),
                  Text(AppLocalization.get('My Skills'), style: const TextStyle(fontSize: 14, fontWeight: FontWeight.bold, color: AppColors.textPrimary)),
                ],
              ),
              Text(AppLocalization.get('3 skills registered'), style: const TextStyle(fontSize: 11, color: AppColors.textSecondary)),
            ],
          ),
          const SizedBox(height: 16),
          Wrap(
            spacing: 8,
            runSpacing: 8,
            children: [
              _buildSkillChip('Mason'),
              _buildSkillChip('Painting'),
              _buildSkillChip('General labor'),
              DottedBorder(
                options: RoundedRectDottedBorderOptions(
                  color: AppColors.cooperativeGreen,
                  dashPattern: const [4, 4],
                  strokeWidth: 1,
                  padding: EdgeInsets.zero,
                  radius: const Radius.circular(16),
                ),
                child: Container(
                  padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(16),
                  ),
                  child: Text(AppLocalization.get('+ Add Skill'), style: const TextStyle(fontSize: 12, fontWeight: FontWeight.bold, color: AppColors.cooperativeGreen)),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildSkillChip(String label) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(color: AppColors.borderSubtle),
        borderRadius: BorderRadius.circular(16),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          const Icon(Icons.circle, size: 6, color: AppColors.cooperativeGreen),
          const SizedBox(width: 6),
          Text(AppLocalization.get(label), style: const TextStyle(fontSize: 12, fontWeight: FontWeight.bold, color: AppColors.textPrimary)),
        ],
      ),
    );
  }

  Widget _buildExperienceCard() {
    return Container(
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
            children: [
              const Icon(Icons.access_time, size: 18, color: AppColors.primaryContainer),
              const SizedBox(width: 8),
              Text(AppLocalization.get('Experience'), style: const TextStyle(fontSize: 14, fontWeight: FontWeight.bold, color: AppColors.textPrimary)),
            ],
          ),
          const SizedBox(height: 16),
          Row(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text('5 ', style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: AppColors.primaryContainer)),
              Text(AppLocalization.get('years'), style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: AppColors.primaryContainer)),
              const SizedBox(width: 8),
              Padding(
                padding: const EdgeInsets.only(bottom: 4.0),
                child: Text(AppLocalization.get('Certified field experience'), style: const TextStyle(fontSize: 12, fontWeight: FontWeight.bold, color: AppColors.textSecondary)),
              ),
            ],
          ),
          const SizedBox(height: 12),
          Container(
            width: double.infinity,
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: Colors.grey.shade50,
              borderRadius: BorderRadius.circular(8),
            ),
            child: Text(AppLocalization.get('Construction and residential work (Residential & Commercial Sites)'), style: const TextStyle(fontSize: 13, color: AppColors.textSecondary)),
          ),
        ],
      ),
    );
  }

  Widget _buildPreferencesCard() {
    return Container(
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
                  const Icon(Icons.check_circle_outline, size: 18, color: AppColors.primaryContainer),
                  const SizedBox(width: 8),
                  Text(AppLocalization.get('Work Preferences'), style: const TextStyle(fontSize: 14, fontWeight: FontWeight.bold, color: AppColors.textPrimary)),
                ],
              ),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                decoration: BoxDecoration(
                  color: const Color(0xFFE6F4EA),
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(color: const Color(0xFFBBF7D0)),
                ),
                child: Row(
                  children: [
                    const Icon(Icons.circle, size: 6, color: AppColors.cooperativeGreen),
                    const SizedBox(width: 4),
                    Text(AppLocalization.get('Available for work'), style: const TextStyle(fontSize: 10, fontWeight: FontWeight.bold, color: AppColors.cooperativeGreen)),
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(height: 16),
          _buildDetailRow('Location Preference', 'Delhi NCR'),
          const SizedBox(height: 12),
          _buildDetailRow('Work Type', 'Full-time / Project work'),
          const SizedBox(height: 16),
          SizedBox(
            width: double.infinity,
            child: ElevatedButton.icon(
              onPressed: () {},
              icon: const Icon(Icons.autorenew, color: Colors.white, size: 18),
              label: Text(AppLocalization.get('Update availability'), style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
              style: ElevatedButton.styleFrom(
                backgroundColor: AppColors.cooperativeGreen,
                padding: const EdgeInsets.symmetric(vertical: 12),
                elevation: 0,
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildDetailRow(String label, String value) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(AppLocalization.get(label), style: const TextStyle(fontSize: 12, color: AppColors.textSecondary)),
        Text(AppLocalization.get(value), style: const TextStyle(fontSize: 12, fontWeight: FontWeight.bold, color: AppColors.textPrimary)),
      ],
    );
  }

  Widget _buildCooperativeCard() {
    return Container(
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
                  const Icon(Icons.domain, size: 18, color: AppColors.primaryContainer),
                  const SizedBox(width: 8),
                  Text(AppLocalization.get('Cooperative Society'), style: const TextStyle(fontSize: 14, fontWeight: FontWeight.bold, color: AppColors.textPrimary)),
                ],
              ),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                decoration: BoxDecoration(
                  color: Colors.blue.shade50,
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Text(AppLocalization.get('Guild affiliated'), style: TextStyle(fontSize: 11, fontWeight: FontWeight.bold, color: Colors.blue.shade800)),
              ),
            ],
          ),
          const SizedBox(height: 16),
          Container(
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: Colors.grey.shade50,
              borderRadius: BorderRadius.circular(12),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(AppLocalization.get('Nirman Shramik Cooperative'), style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold, color: AppColors.textPrimary)),
                    const SizedBox(height: 4),
                    Text('${AppLocalization.get("Registration ID:")} NSC-DL-2023', style: const TextStyle(fontSize: 11, color: AppColors.textSecondary)),
                  ],
                ),
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                  decoration: BoxDecoration(
                    color: const Color(0xFFE6F4EA),
                    borderRadius: BorderRadius.circular(4),
                  ),
                  child: Text(AppLocalization.get('Member'), style: const TextStyle(fontSize: 11, fontWeight: FontWeight.bold, color: AppColors.cooperativeGreen)),
                ),
              ],
            ),
          ),
          const SizedBox(height: 12),
          Container(
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: Colors.yellow.shade50.withValues(alpha: 0.5),
              borderRadius: BorderRadius.circular(8),
              border: Border.all(color: Colors.yellow.shade200),
            ),
            child: Text.rich(
              TextSpan(
                children: [
                  const WidgetSpan(
                    child: Padding(
                      padding: EdgeInsets.only(right: 6.0),
                      child: Icon(Icons.info, size: 14, color: Colors.grey),
                    ),
                  ),
                  TextSpan(
                    text: AppLocalization.get('Cooperative society membership is optional. Your skill passport can be used even without cooperative membership.'),
                  ),
                ],
              ),
              style: const TextStyle(fontSize: 12, color: AppColors.textSecondary, height: 1.4),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildWorkHistoryCard() {
    return Container(
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
                  const Icon(Icons.assignment_turned_in_outlined, size: 18, color: AppColors.primaryContainer),
                  const SizedBox(width: 8),
                  Text(AppLocalization.get('Work History'), style: const TextStyle(fontSize: 14, fontWeight: FontWeight.bold, color: AppColors.textPrimary)),
                ],
              ),
              Text(AppLocalization.get('Verified Records'), style: const TextStyle(fontSize: 11, color: AppColors.textSecondary)),
            ],
          ),
          const SizedBox(height: 16),
          _buildWorkHistoryItem(
            title: 'Residential Painting',
            subtitle: 'Dwarka • Nirman Shramik Cooperative',
            date: '10 Sep',
          ),
          const SizedBox(height: 12),
          _buildWorkHistoryItem(
            title: 'Community Hall Repair',
            subtitle: 'Rohini, Sector 7 • Nirman Shramik Cooperative',
            date: '5 Sep',
          ),
        ],
      ),
    );
  }

  Widget _buildWorkHistoryItem({
    required String title,
    required String subtitle,
    required String date,
  }) {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: AppColors.borderSubtle),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(AppLocalization.get(title), style: const TextStyle(fontSize: 14, fontWeight: FontWeight.bold, color: AppColors.textPrimary)),
              const SizedBox(height: 4),
              Text(AppLocalization.get(subtitle), style: const TextStyle(fontSize: 11, color: AppColors.textSecondary)),
            ],
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                decoration: BoxDecoration(
                  color: const Color(0xFFE6F4EA),
                  borderRadius: BorderRadius.circular(4),
                  border: Border.all(color: const Color(0xFFBBF7D0)),
                ),
                child: Row(
                  children: [
                    Text(AppLocalization.get('Completed'), style: const TextStyle(fontSize: 10, fontWeight: FontWeight.bold, color: AppColors.cooperativeGreen)),
                    const SizedBox(width: 4),
                    const Icon(Icons.check, size: 10, color: AppColors.cooperativeGreen),
                  ],
                ),
              ),
              const SizedBox(height: 6),
              Text(AppLocalization.get(date), style: const TextStyle(fontSize: 11, color: AppColors.textSecondary)),
            ],
          ),
        ],
      ),
    );
  }
}
