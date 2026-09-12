import 'package:flutter/material.dart';
import '../theme/colors.dart';
import 'worker_details_screen.dart';

class WorkersScreen extends StatefulWidget {
  const WorkersScreen({Key? key}) : super(key: key);

  @override
  State<WorkersScreen> createState() => _WorkersScreenState();
}

class _WorkersScreenState extends State<WorkersScreen> {
  String _selectedFilter = 'All';
  
  final List<String> _filters = ['All', '✓ Available', '● Working', '→ Assigned', '— Unavailable'];

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
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: const [
                Text(
                  'Workforce',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: AppColors.primaryContainer,
                  ),
                ),
                Text(
                  'Manage workers associated with your cooperative.',
                  style: TextStyle(fontSize: 12, color: AppColors.textSecondary),
                ),
              ],
            ),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
              decoration: BoxDecoration(
                color: Colors.grey.shade100,
                border: Border.all(color: AppColors.borderSubtle),
                borderRadius: BorderRadius.circular(16),
              ),
              child: const Text(
                '42 Workers',
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
        children: [
          // Search Field
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: TextField(
              decoration: InputDecoration(
                filled: true,
                fillColor: Colors.white,
                hintText: 'Search workers by name or skill',
                hintStyle: const TextStyle(fontSize: 13, color: AppColors.textSecondary),
                prefixIcon: const Icon(Icons.search, size: 20, color: AppColors.textSecondary),
                contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide: const BorderSide(color: AppColors.borderSubtle),
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide: const BorderSide(color: AppColors.borderSubtle),
                ),
              ),
            ),
          ),
          
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
          
          // Worker List
          Expanded(
            child: ListView(
              padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
              children: [
                _buildWorkerCard(
                  initials: 'RK',
                  name: 'Ramlal Kumar',
                  role: 'Construction Worker',
                  experience: '5 years experience',
                  status: '✓ Available',
                  statusColor: AppColors.cooperativeGreen,
                  statusBg: const Color(0xFFECFDF5),
                  skills: ['Painting', 'Masonry'],
                  verification: '✓ e-Shram & Skill Passport Verified',
                  guildId: 'Guild Member #204',
                ),
                const SizedBox(height: 12),
                _buildWorkerCard(
                  initials: 'SD',
                  initialsBg: Colors.blue.shade50,
                  initialsColor: AppColors.primaryContainer,
                  name: 'Sunita Devi',
                  role: 'Electrical & Maintenance',
                  experience: '4 years experience',
                  status: '● Working',
                  statusColor: Colors.blue.shade700,
                  statusBg: Colors.grey.shade100,
                  skills: ['Electrical', 'Maintenance'],
                  verification: '✓ e-Shram Verified',
                  guildId: 'Guild Member #118',
                ),
                const SizedBox(height: 12),
                _buildWorkerCard(
                  initials: 'ML',
                  initialsBg: Colors.amber.shade50,
                  initialsColor: Colors.amber.shade800,
                  name: 'Mohan Lal',
                  role: 'Carpenter',
                  experience: '6 years experience',
                  status: '→ Assigned',
                  statusColor: Colors.amber.shade800,
                  statusBg: Colors.amber.shade50,
                  skills: ['Carpentry', 'Furniture'],
                  verification: '✓ Skill Passport',
                  guildId: 'Guild Member #309',
                ),
                const SizedBox(height: 24),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildWorkerCard({
    required String initials,
    Color? initialsBg,
    Color? initialsColor,
    required String name,
    required String role,
    required String experience,
    required String status,
    required Color statusColor,
    required Color statusBg,
    required List<String> skills,
    required String verification,
    required String guildId,
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
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CircleAvatar(
                    radius: 20,
                    backgroundColor: initialsBg ?? Colors.grey.shade100,
                    child: Text(
                      initials,
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 14,
                        color: initialsColor ?? AppColors.primaryContainer,
                      ),
                    ),
                  ),
                  const SizedBox(width: 12),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        name,
                        style: const TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                          color: AppColors.textPrimary,
                        ),
                      ),
                      const SizedBox(height: 2),
                      Text(
                        role,
                        style: const TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.w500,
                          color: AppColors.textSecondary,
                        ),
                      ),
                      Text(
                        experience,
                        style: const TextStyle(
                          fontSize: 11,
                          color: Colors.grey,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                decoration: BoxDecoration(
                  color: statusBg,
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(color: statusColor.withOpacity(0.3)),
                ),
                child: Text(
                  status,
                  style: TextStyle(
                    fontSize: 11,
                    fontWeight: FontWeight.bold,
                    color: statusColor,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 12),
          Row(
            children: skills.map((skill) {
              return Container(
                margin: const EdgeInsets.only(right: 8),
                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                decoration: BoxDecoration(
                  color: Colors.grey.shade100,
                  border: Border.all(color: AppColors.borderSubtle),
                  borderRadius: BorderRadius.circular(6),
                ),
                child: Text(
                  skill,
                  style: const TextStyle(
                    fontSize: 11,
                    fontWeight: FontWeight.w500,
                    color: AppColors.textSecondary,
                  ),
                ),
              );
            }).toList(),
          ),
          const SizedBox(height: 12),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 6),
            decoration: BoxDecoration(
              color: AppColors.cooperativeGreen.withOpacity(0.1),
              borderRadius: BorderRadius.circular(8),
              border: Border.all(color: AppColors.cooperativeGreen.withOpacity(0.2)),
            ),
            child: Text(
              verification,
              style: const TextStyle(
                fontSize: 11,
                fontWeight: FontWeight.w600,
                color: AppColors.cooperativeGreen,
              ),
            ),
          ),
          const SizedBox(height: 12),
          const Divider(color: AppColors.borderSubtle, height: 1),
          const SizedBox(height: 12),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                guildId,
                style: const TextStyle(fontSize: 11, color: AppColors.textSecondary),
              ),
              InkWell(
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) => const WorkerDetailsScreen()));
                },
                child: Row(
                  children: const [
                    Text(
                      'View Profile',
                      style: TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.bold,
                        color: AppColors.primaryContainer,
                      ),
                    ),
                    Icon(Icons.arrow_forward, size: 16, color: AppColors.primaryContainer),
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
