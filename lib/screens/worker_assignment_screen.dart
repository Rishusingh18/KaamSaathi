import 'package:flutter/material.dart';
import '../theme/colors.dart';
import 'main_layout.dart';
import '../utils/localization.dart';

class WorkerAssignmentScreen extends StatefulWidget {
  const WorkerAssignmentScreen({Key? key}) : super(key: key);

  @override
  State<WorkerAssignmentScreen> createState() => _WorkerAssignmentScreenState();
}

class _WorkerAssignmentScreenState extends State<WorkerAssignmentScreen> {
  // State for which workers are selected
  final List<bool> _selectedWorkers = [true, false, false, false];
  bool _isAssigned = false;

  void _toggleWorker(int index) {
    if (_isAssigned) return;
    setState(() {
      _selectedWorkers[index] = !_selectedWorkers[index];
    });
  }

  void _handleAssignment() {
    final count = _selectedWorkers.where((s) => s).length;
    if (count == 0) return;
    setState(() {
      _isAssigned = true;
    });
  }

  @override
  Widget build(BuildContext context) {
    final selectedCount = _selectedWorkers.where((s) => s).length;
    final isButtonEnabled = selectedCount > 0;

    return Scaffold(
      backgroundColor: AppColors.surfaceCanvas,
      appBar: AppBar(
        backgroundColor: AppColors.surfaceCanvas,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: AppColors.textPrimary),
          onPressed: () => Navigator.pop(context),
        ),
        title: Text(AppLocalization.get('Assign Workers'),
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
            color: AppColors.primaryContainer,
          ),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 16.0),
            child: Center(
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                decoration: BoxDecoration(
                  color: Colors.grey.shade100,
                  border: Border.all(color: AppColors.borderSubtle),
                  borderRadius: BorderRadius.circular(16),
                ),
                child: Row(
                  children: [
                    Text(AppLocalization.get('EN'), style: TextStyle(fontSize: 11, fontWeight: FontWeight.bold, color: AppColors.primaryContainer)),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 4.0),
                      child: Text('|', style: TextStyle(fontSize: 11, color: Colors.grey)),
                    ),
                    Text(AppLocalization.get('हिन्दी'), style: TextStyle(fontSize: 11, color: Colors.grey)),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
      body: Column(
        children: [
          Expanded(
            child: SingleChildScrollView(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(AppLocalization.get('Select workers for Community Hall Repair.'), style: TextStyle(fontSize: 12, color: AppColors.textSecondary, fontWeight: FontWeight.w500)),
                  const SizedBox(height: 12),
                  
                  // Project Summary Card
                  Container(
                    padding: const EdgeInsets.all(14),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(16),
                      border: Border.all(color: AppColors.borderSubtle),
                      boxShadow: [
                        BoxShadow(color: Colors.black.withOpacity(0.02), blurRadius: 4, offset: const Offset(0, 2)),
                      ],
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Container(
                                    padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
                                    decoration: BoxDecoration(
                                      color: Colors.grey.shade100,
                                      borderRadius: BorderRadius.circular(6),
                                      border: Border.all(color: AppColors.borderSubtle),
                                    ),
                                    child: const Text('🏢 Najafgarh Community Centre', style: TextStyle(fontSize: 10, fontWeight: FontWeight.w500, color: AppColors.textPrimary)),
                                  ),
                                  const SizedBox(height: 6),
                                  Text(AppLocalization.get('Community Hall Repair'), style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold, color: AppColors.primaryContainer)),
                                  const SizedBox(height: 4),
                                  const Text('🗓️ Sep 18–22, 2026  •  ⏰ 9:00 AM–5:00 PM', style: TextStyle(fontSize: 11, color: AppColors.textSecondary)),
                                ],
                              ),
                            ),
                            Container(
                              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                              decoration: BoxDecoration(
                                color: Colors.blue.shade50,
                                borderRadius: BorderRadius.circular(8),
                                border: Border.all(color: Colors.blue.shade100),
                              ),
                              child: const Text('5 workers', style: TextStyle(fontSize: 11, fontWeight: FontWeight.bold, color: AppColors.primaryContainer)),
                            ),
                          ],
                        ),
                        const Padding(
                          padding: EdgeInsets.symmetric(vertical: 10.0),
                          child: Divider(color: AppColors.borderSubtle, height: 1),
                        ),
                        Wrap(
                          spacing: 6,
                          crossAxisAlignment: WrapCrossAlignment.center,
                          children: [
                            Text(AppLocalization.get('Required Skills:'), style: TextStyle(fontSize: 11, fontWeight: FontWeight.w600, color: AppColors.textSecondary)),
                            ...['Masonry', 'Painting', 'General Labour'].map((skill) => Container(
                              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
                              decoration: BoxDecoration(
                                color: Colors.grey.shade100,
                                borderRadius: BorderRadius.circular(6),
                              ),
                              child: Text(skill, style: const TextStyle(fontSize: 10, fontWeight: FontWeight.w500, color: AppColors.textPrimary)),
                            )).toList(),
                          ],
                        ),
                      ],
                    ),
                  ),
                  
                  const SizedBox(height: 16),
                  
                  Text(AppLocalization.get('RECOMMENDED WORKERS'), style: TextStyle(fontSize: 11, fontWeight: FontWeight.bold, color: AppColors.textSecondary)),
                  Text(AppLocalization.get('AI-assisted matching based on skills, availability and experience.'), style: TextStyle(fontSize: 11, color: AppColors.textSecondary)),
                  
                  const SizedBox(height: 12),
                  
                  // Worker List
                  _buildWorkerCard(0, 'RK', 'Ramlal Kumar', 'Painting • Masonry • 5 years', '94%', true),
                  const SizedBox(height: 8),
                  _buildWorkerCard(1, 'AS', 'Anita Sharma', 'General Labour • Cleaning • 3 years', '82%', true, avatarColor: Colors.amber, isAssignedText: false),
                  const SizedBox(height: 8),
                  _buildWorkerCard(2, 'ML', 'Mohan Lal', 'Carpentry • General Labour • 6 years', '76%', false, avatarColor: Colors.blue, isAssignedText: true),
                  const SizedBox(height: 8),
                  _buildWorkerCard(3, 'SD', 'Sunita Devi', 'Electrical • Maintenance • 4 years', '64%', false, avatarColor: Colors.green, isAssignedText: false, isWorkingText: true),
                  
                  const SizedBox(height: 16),
                  
                  if (_isAssigned)
                    Container(
                      padding: const EdgeInsets.all(16),
                      decoration: BoxDecoration(
                        color: Colors.green.shade50,
                        borderRadius: BorderRadius.circular(16),
                        border: Border.all(color: Colors.green.shade200),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              Container(
                                width: 32,
                                height: 32,
                                decoration: const BoxDecoration(color: AppColors.cooperativeGreen, shape: BoxShape.circle),
                                child: const Icon(Icons.check, color: Colors.white, size: 20),
                              ),
                              const SizedBox(width: 12),
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(AppLocalization.get('Workers Assigned ✓'), style: const TextStyle(fontSize: 14, fontWeight: FontWeight.bold, color: AppColors.cooperativeGreen)),
                                    Text(AppLocalization.get('Selected workers have been assigned to Community Hall Repair.'), style: const TextStyle(fontSize: 12, color: AppColors.textPrimary)),
                                  ],
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 16),
                          SizedBox(
                            width: double.infinity,
                            child: ElevatedButton(
                              onPressed: () {
                                // Navigate to Projects (Index 3 in MainLayout if we want to go back to root)
                                Navigator.pushAndRemoveUntil(
                                  context,
                                  MaterialPageRoute(builder: (context) => const MainLayout()),
                                  (route) => false,
                                );
                              },
                              style: ElevatedButton.styleFrom(
                                backgroundColor: AppColors.primaryContainer,
                                padding: const EdgeInsets.symmetric(vertical: 12),
                                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                              ),
                              child: Text(AppLocalization.get('View Active Project →'), style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold)),
                            ),
                          ),
                          const SizedBox(height: 8),
                          Center(
                            child: TextButton(
                              onPressed: () {
                                setState(() {
                                  _isAssigned = false;
                                });
                              },
                              child: Text(AppLocalization.get('Modify Worker Selection'), style: TextStyle(fontSize: 11, color: AppColors.textSecondary)),
                            ),
                          ),
                        ],
                      ),
                    )
                  else
                    Container(
                      padding: const EdgeInsets.all(12),
                      decoration: BoxDecoration(
                        color: Colors.grey.shade100.withOpacity(0.7),
                        borderRadius: BorderRadius.circular(12),
                        border: Border.all(color: AppColors.borderSubtle),
                      ),
                      child: const Text(
                        'Work invitations and skill match details will be dispatched immediately to the selected workers\' SAHYOG apps.',
                        textAlign: TextAlign.center,
                        style: TextStyle(fontSize: 11, color: AppColors.textSecondary),
                      ),
                    ),
                    
                  const SizedBox(height: 24),
                ],
              ),
            ),
          ),
          
          if (!_isAssigned)
            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.white,
                boxShadow: [
                  BoxShadow(color: Colors.black.withOpacity(0.05), blurRadius: 10, offset: const Offset(0, -5)),
                ],
              ),
              child: Column(
                children: [
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 10),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(12),
                      border: Border.all(color: AppColors.borderSubtle),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            Container(width: 8, height: 8, decoration: BoxDecoration(color: selectedCount > 0 ? AppColors.cooperativeGreen : Colors.grey, shape: BoxShape.circle)),
                            const SizedBox(width: 8),
                            Text('$selectedCount ${AppLocalization.get('of 5 workers selected')}', style: const TextStyle(fontSize: 12, fontWeight: FontWeight.bold, color: AppColors.textPrimary)),
                          ],
                        ),
                        Text(AppLocalization.get('Req: 5 workers'), style: const TextStyle(fontSize: 11, fontWeight: FontWeight.w500, color: AppColors.textSecondary)),
                      ],
                    ),
                  ),
                  const SizedBox(height: 12),
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton.icon(
                      onPressed: isButtonEnabled ? _handleAssignment : null,
                      icon: const Icon(Icons.arrow_forward),
                      label: Text(AppLocalization.get('Assign Selected Workers')),
                      style: ElevatedButton.styleFrom(
                        padding: const EdgeInsets.symmetric(vertical: 14),
                        backgroundColor: isButtonEnabled ? AppColors.cooperativeGreen : Colors.grey.shade300,
                        foregroundColor: isButtonEnabled ? Colors.white : Colors.grey.shade600,
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                      ),
                    ),
                  ),
                  const SizedBox(height: 8),
                  SizedBox(
                    width: double.infinity,
                    child: TextButton(
                      onPressed: () => Navigator.pop(context),
                      child: Text(AppLocalization.get('Cancel'), style: TextStyle(color: AppColors.textSecondary)),
                    ),
                  ),
                ],
              ),
            ),
        ],
      ),
    );
  }

  Widget _buildWorkerCard(int index, String initials, String name, String details, String match, bool isAvailable, {MaterialColor avatarColor = Colors.blue, bool isAssignedText = false, bool isWorkingText = false}) {
    final isSelected = _selectedWorkers[index];
    
    return GestureDetector(
      onTap: () => _toggleWorker(index),
      child: Container(
        padding: const EdgeInsets.all(14),
        decoration: BoxDecoration(
          color: isSelected ? Colors.green.shade50 : Colors.white,
          borderRadius: BorderRadius.circular(16),
          border: Border.all(color: isSelected ? AppColors.cooperativeGreen : AppColors.borderSubtle),
          boxShadow: [
            BoxShadow(color: Colors.black.withOpacity(0.02), blurRadius: 4, offset: const Offset(0, 2)),
          ],
        ),
        child: Row(
          children: [
            Container(
              width: 20,
              height: 20,
              decoration: BoxDecoration(
                color: isSelected ? AppColors.cooperativeGreen : Colors.white,
                borderRadius: BorderRadius.circular(6),
                border: Border.all(color: isSelected ? AppColors.cooperativeGreen : Colors.grey.shade300, width: 2),
              ),
              child: isSelected ? const Icon(Icons.check, size: 14, color: Colors.white) : null,
            ),
            const SizedBox(width: 12),
            Container(
              width: 40,
              height: 40,
              decoration: BoxDecoration(
                color: avatarColor.shade50,
                shape: BoxShape.circle,
                border: Border.all(color: avatarColor.shade200),
              ),
              alignment: Alignment.center,
              child: Text(initials, style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold, color: avatarColor.shade700)),
            ),
            const SizedBox(width: 12),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Text(name, style: const TextStyle(fontSize: 14, fontWeight: FontWeight.bold, color: AppColors.primaryContainer)),
                      const SizedBox(width: 6),
                      Container(
                        padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
                        decoration: BoxDecoration(
                          color: isAvailable ? Colors.green.shade50 : (isAssignedText ? Colors.amber.shade50 : Colors.blue.shade50),
                          borderRadius: BorderRadius.circular(4),
                          border: Border.all(color: isAvailable ? Colors.green.shade200 : (isAssignedText ? Colors.amber.shade200 : Colors.blue.shade200)),
                        ),
                        child: Text(
                          isAvailable ? '✓ Available' : (isAssignedText ? '→ Assigned' : '● Working'),
                          style: TextStyle(
                            fontSize: 9,
                            fontWeight: FontWeight.bold,
                            color: isAvailable ? AppColors.cooperativeGreen : (isAssignedText ? Colors.amber.shade700 : Colors.blue.shade700),
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 2),
                  Text(details, style: const TextStyle(fontSize: 12, color: AppColors.textSecondary, fontWeight: FontWeight.w500)),
                ],
              ),
            ),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
              decoration: BoxDecoration(
                color: isAvailable ? Colors.green.shade50 : Colors.grey.shade100,
                borderRadius: BorderRadius.circular(12),
                border: Border.all(color: isAvailable ? Colors.green.shade200 : AppColors.borderSubtle),
              ),
              child: Text(
                'Match: $match',
                style: TextStyle(
                  fontSize: 11,
                  fontWeight: FontWeight.bold,
                  color: isAvailable ? AppColors.cooperativeGreen : AppColors.textSecondary,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

