import 'package:flutter/material.dart';
import '../theme/colors.dart';
import '../utils/localization.dart';

class ProjectsScreen extends StatefulWidget {
  const ProjectsScreen({Key? key}) : super(key: key);

  @override
  State<ProjectsScreen> createState() => _ProjectsScreenState();
}

class _ProjectsScreenState extends State<ProjectsScreen> {
  String _selectedFilter = 'All';
  
  final List<String> _filters = ['All', 'In Progress', 'Upcoming', 'Completed'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.surfaceCanvas,
      appBar: AppBar(
        backgroundColor: AppColors.surfaceCanvas,
        elevation: 0,
        automaticallyImplyLeading: false,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(AppLocalization.get('Active Projects'),
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: AppColors.primaryContainer,
              ),
            ),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
              decoration: BoxDecoration(
                color: AppColors.primaryContainer.withOpacity(0.1),
                border: Border.all(color: AppColors.primaryContainer.withOpacity(0.2)),
                borderRadius: BorderRadius.circular(16),
              ),
              child: const Text(
                '7 Active Projects',
                style: TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.bold,
                  color: AppColors.primaryContainer,
                ),
              ),
            ),
          ],
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 4.0),
            child: Text(AppLocalization.get('Track ongoing work and assigned teams.'),
              style: const TextStyle(fontSize: 13, color: AppColors.textSecondary),
            ),
          ),
          
          const SizedBox(height: 12),
          
          // Filter Chips
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Row(
              children: _filters.map((filter) {
                final isSelected = _selectedFilter == filter;
                return Padding(
                  padding: const EdgeInsets.only(right: 8.0),
                  child: FilterChip(
                    label: Text(
                      filter,
                      style: TextStyle(
                        fontSize: 12,
                        fontWeight: isSelected ? FontWeight.bold : FontWeight.w500,
                        color: isSelected ? Colors.white : AppColors.textSecondary,
                      ),
                    ),
                    selected: isSelected,
                    onSelected: (selected) {
                      setState(() {
                        _selectedFilter = filter;
                      });
                    },
                    backgroundColor: Colors.white,
                    selectedColor: AppColors.primaryContainer,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                      side: BorderSide(
                        color: isSelected ? AppColors.primaryContainer : AppColors.borderSubtle,
                      ),
                    ),
                    padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                  ),
                );
              }).toList(),
            ),
          ),
          
          const SizedBox(height: 12),
          
          // Project List
          Expanded(
            child: ListView(
              padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
              children: [
                _buildProjectCard(
                  type: '🏢 Najafgarh Community Centre',
                  title: 'Community Hall Repair',
                  dateInfo: '🗓️ Sep 18–22, 2026',
                  workerInfo: '5 workers assigned',
                  status: 'Upcoming',
                  statusColor: Colors.amber.shade700,
                  statusBg: Colors.amber.shade50,
                  progressText: null, // Hidden for upcoming
                  progress: 0.0,
                  workerAvatars: ['RK', 'SD', 'ML', 'AD'],
                  workerAvatarsText: 'Ramlal Kumar + 4 others',
                ),
                const SizedBox(height: 12),
                _buildProjectCard(
                  type: '🏠 Household • Dwarka',
                  title: 'Residential Painting',
                  dateInfo: '🗓️ Sep 12, 2026',
                  workerInfo: '2 workers',
                  status: 'In Progress',
                  statusColor: Colors.blue.shade700,
                  statusBg: Colors.blue.shade50,
                  progressText: '60% Complete',
                  progress: 0.6,
                  workerAvatars: ['RK', 'AS'],
                  workerAvatarsText: 'Ramlal, Anita',
                ),
                const SizedBox(height: 12),
                _buildProjectCard(
                  type: '🏢 Institution • Janakpuri',
                  title: 'Electrical Maintenance',
                  dateInfo: '🗓️ Sep 10–14, 2026',
                  workerInfo: '3 workers',
                  status: 'In Progress',
                  statusColor: Colors.blue.shade700,
                  statusBg: Colors.blue.shade50,
                  progressText: '35% Complete',
                  progress: 0.35,
                  workerAvatars: ['SD'],
                  workerAvatarsText: 'Sunita Devi + 2 others',
                ),
                const SizedBox(height: 24),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildProjectCard({
    required String type,
    required String title,
    required String dateInfo,
    required String workerInfo,
    required String status,
    required Color statusColor,
    required Color statusBg,
    required String? progressText,
    required double progress,
    required List<String> workerAvatars,
    required String workerAvatarsText,
  }) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: AppColors.borderSubtle),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.02),
            blurRadius: 8,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
                      decoration: BoxDecoration(
                        color: Colors.grey.shade100,
                        border: Border.all(color: AppColors.borderSubtle),
                        borderRadius: BorderRadius.circular(6),
                      ),
                      child: Text(
                        type,
                        style: const TextStyle(
                          fontSize: 10,
                          fontWeight: FontWeight.w500,
                          color: AppColors.textSecondary,
                        ),
                      ),
                    ),
                    const SizedBox(height: 6),
                    Text(
                      title,
                      style: const TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.bold,
                        color: AppColors.textPrimary,
                      ),
                    ),
                    const SizedBox(height: 4),
                    Wrap(
                      crossAxisAlignment: WrapCrossAlignment.center,
                      children: [
                        Text(
                          dateInfo,
                          style: const TextStyle(fontSize: 12, color: AppColors.textSecondary),
                        ),
                        const Padding(
                          padding: EdgeInsets.symmetric(horizontal: 4.0),
                          child: Text('•', style: TextStyle(color: Colors.grey)),
                        ),
                        Text(
                          workerInfo,
                          style: const TextStyle(fontSize: 12, color: AppColors.textSecondary),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              Container(
                margin: const EdgeInsets.only(left: 8),
                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                decoration: BoxDecoration(
                  color: statusBg,
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(color: statusColor.withOpacity(0.3)),
                ),
                child: Text(
                  status,
                  style: TextStyle(
                    fontSize: 10,
                    fontWeight: FontWeight.bold,
                    color: statusColor,
                  ),
                ),
              ),
            ],
          ),
          
          if (progressText != null) ...[
            const SizedBox(height: 12),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(AppLocalization.get('Execution Status'), style: TextStyle(fontSize: 11, color: AppColors.textSecondary, fontWeight: FontWeight.w500)),
                Text(progressText, style: const TextStyle(fontSize: 11, fontWeight: FontWeight.bold, color: AppColors.primaryContainer)),
              ],
            ),
            const SizedBox(height: 4),
            ClipRRect(
              borderRadius: BorderRadius.circular(4),
              child: LinearProgressIndicator(
                value: progress,
                minHeight: 8,
                backgroundColor: Colors.grey.shade100,
                color: AppColors.cooperativeGreen,
              ),
            ),
          ],
          
          const SizedBox(height: 12),
          const Divider(color: AppColors.borderSubtle, height: 1),
          const SizedBox(height: 12),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  SizedBox(
                    width: workerAvatars.length * 16.0 + 10,
                    height: 24,
                    child: Stack(
                      children: List.generate(workerAvatars.length, (index) {
                        return Positioned(
                          left: index * 16.0,
                          child: Container(
                            width: 24,
                            height: 24,
                            decoration: BoxDecoration(
                              color: AppColors.primaryContainer,
                              shape: BoxShape.circle,
                              border: Border.all(color: Colors.white, width: 2),
                            ),
                            alignment: Alignment.center,
                            child: Text(
                              workerAvatars[index],
                              style: const TextStyle(fontSize: 9, color: Colors.white, fontWeight: FontWeight.bold),
                            ),
                          ),
                        );
                      }),
                    ),
                  ),
                  const SizedBox(width: 4),
                  Text(
                    workerAvatarsText,
                    style: const TextStyle(fontSize: 11, fontWeight: FontWeight.w500, color: AppColors.textSecondary),
                  ),
                ],
              ),
              InkWell(
                onTap: () {},
                child: Row(
                  children: [
                    Text(AppLocalization.get('View Project'),
                      style: TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.bold,
                        color: AppColors.primaryContainer,
                      ),
                    ),
                    Icon(Icons.arrow_forward, size: 14, color: AppColors.primaryContainer),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
