import 'package:flutter/material.dart';
import 'package:dotted_border/dotted_border.dart';
import '../theme/colors.dart';
import '../utils/localization.dart';
import 'household_service_method_screen.dart';

class HouseholdServiceRequestScreen extends StatefulWidget {
  final String initialCategory;

  const HouseholdServiceRequestScreen({
    super.key,
    this.initialCategory = 'Plumbing',
  });

  @override
  State<HouseholdServiceRequestScreen> createState() =>
      _HouseholdServiceRequestScreenState();
}

class _HouseholdServiceRequestScreenState
    extends State<HouseholdServiceRequestScreen> {
  late String _selectedService;
  late TextEditingController _descController;
  DateTime _selectedDate = DateTime.now().add(const Duration(days: 1));
  String _selectedTime = '10:00 AM - 12:00 PM';
  String _location = 'Dwarka Sector 12, New Delhi';
  int _workerCount = 1;
  int _photoCount = 0;

  final List<Map<String, String>> _services = [
    {
      'id': 'Plumbing',
      'title': 'Plumbing',
      'sub': 'Taps, leaks, pipe',
      'emoji': '🔧',
    },
    {
      'id': 'Electrical',
      'title': 'Electrical',
      'sub': 'Wiring, switches',
      'emoji': '⚡',
    },
    {
      'id': 'Painting',
      'title': 'Painting',
      'sub': 'Walls, touch-up',
      'emoji': '🎨',
    },
    {
      'id': 'Carpentry',
      'title': 'Carpentry',
      'sub': 'Doors, furniture',
      'emoji': '🪚',
    },
    {
      'id': 'Cleaning',
      'title': 'Cleaning',
      'sub': 'Deep, kitchen, bath',
      'emoji': '🧹',
    },
    {
      'id': 'Gardening',
      'title': 'Gardening',
      'sub': 'Pruning, lawn care',
      'emoji': '🌱',
    },
    {
      'id': 'General Labour',
      'title': 'General Labour',
      'sub': 'Shifting, lifting',
      'emoji': '👷',
    },
    {
      'id': 'Other',
      'title': 'Other',
      'sub': 'Custom work',
      'emoji': '🛠️',
    },
  ];

  final List<String> _timeSlots = [
    '08:00 AM - 10:00 AM',
    '10:00 AM - 12:00 PM',
    '12:00 PM - 02:00 PM',
    '02:00 PM - 04:00 PM',
    '04:00 PM - 06:00 PM',
  ];

  @override
  void initState() {
    super.initState();
    _selectedService = widget.initialCategory;
    _descController = TextEditingController(
      text: _getDefaultDescForService(_selectedService),
    );
  }

  String _getDefaultDescForService(String service) {
    switch (service) {
      case 'Plumbing':
        return 'Bathroom faucet leakage and low kitchen sink pressure. Need a skilled technician to inspect and fix washers/valves.';
      case 'Painting':
        return 'Interior wall painting for 2 bedrooms. Requires primer and two coats of emulsion paint.';
      case 'Electrical':
        return 'Living room switchboard sparking and ceiling fan regulator replacement.';
      case 'Carpentry':
        return 'Repair wooden wardrobe hinge and align main door latch.';
      case 'Cleaning':
        return 'Deep cleaning of 2 bathrooms and kitchen tiles before festival.';
      case 'Gardening':
        return 'Lawn mowing, pruning hedge bushes, and repotting balcony plants.';
      case 'General Labour':
        return 'Assistance in moving heavy furniture and cardboard boxes between floors.';
      default:
        return 'General household maintenance and inspection.';
    }
  }

  @override
  void dispose() {
    _descController.dispose();
    super.dispose();
  }

  Future<void> _pickDate() async {
    final picked = await showDatePicker(
      context: context,
      initialDate: _selectedDate,
      firstDate: DateTime.now(),
      lastDate: DateTime.now().add(const Duration(days: 90)),
    );
    if (picked != null) {
      setState(() {
        _selectedDate = picked;
      });
    }
  }

  void _onContinue() {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => HouseholdServiceMethodScreen(
          service: _selectedService,
          description: _descController.text,
          date:
              '${_selectedDate.day}/${_selectedDate.month.toString().padLeft(2, '0')}/${_selectedDate.year}',
          time: _selectedTime,
          location: _location,
          workerCount: _workerCount,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<String>(
      valueListenable: AppLocalization.currentLang,
      builder: (context, lang, child) {
        final formattedDate =
            '${_selectedDate.day.toString().padLeft(2, '0')}/${_selectedDate.month.toString().padLeft(2, '0')}/${_selectedDate.year}';

        return Scaffold(
          backgroundColor: const Color(0xFFF8FAFC),
          body: SafeArea(
            child: Column(
              children: [
                // Scrollable content
                Expanded(
                  child: SingleChildScrollView(
                    physics: const BouncingScrollPhysics(),
                    padding: const EdgeInsets.symmetric(horizontal: 16.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const SizedBox(height: 10),
                        _buildTopHeader(context, lang),
                        const SizedBox(height: 16),
                        _buildTitleSection(lang),
                        const SizedBox(height: 18),
                        _buildServiceSelectorHeader(lang),
                        const SizedBox(height: 12),
                        _buildServiceGrid(lang),
                        const SizedBox(height: 18),
                        _buildDescribeRequirementCard(lang),
                        const SizedBox(height: 16),
                        _buildPhotosCard(lang),
                        const SizedBox(height: 16),
                        _buildDateTimeCard(lang, formattedDate),
                        const SizedBox(height: 16),
                        _buildLocationCard(lang),
                        const SizedBox(height: 16),
                        _buildWorkerCountCard(lang),
                        const SizedBox(height: 16),
                        _buildTrustBanner(lang),
                        const SizedBox(height: 20),
                      ],
                    ),
                  ),
                ),

                // Fixed bottom continue button with dotted border
                _buildBottomBar(lang),
              ],
            ),
          ),
        );
      },
    );
  }

  // ── TOP HEADER ───────────────────────────────────────────────────────────
  Widget _buildTopHeader(BuildContext context, String lang) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        GestureDetector(
          onTap: () => Navigator.pop(context),
          child: DottedBorder(
            options: RoundedRectDottedBorderOptions(
              color: const Color(0xFF93C5FD),
              dashPattern: const [4, 3],
              strokeWidth: 1.5,
              radius: const Radius.circular(8),
            ),
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
              color: Colors.white,
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const Icon(Icons.arrow_back_ios_new,
                      size: 13, color: Color(0xFF1E3A8A)),
                  const SizedBox(width: 4),
                  Text(
                    AppLocalization.get('Back'),
                    style: const TextStyle(
                      fontSize: 13,
                      fontWeight: FontWeight.w600,
                      color: Color(0xFF1E3A8A),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
          decoration: BoxDecoration(
            color: const Color(0xFFECFDF5),
            borderRadius: BorderRadius.circular(20),
            border: Border.all(color: const Color(0xFFA7F3D0)),
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                width: 7,
                height: 7,
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  color: Color(0xFF059669),
                ),
              ),
              const SizedBox(width: 5),
              Text(
                AppLocalization.get('Step 1 of 2'),
                style: const TextStyle(
                  fontSize: 11.5,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF059669),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  // ── TITLE SECTION ────────────────────────────────────────────────────────
  Widget _buildTitleSection(String lang) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          AppLocalization.get('Request a Service'),
          style: const TextStyle(
            fontSize: 22,
            fontWeight: FontWeight.bold,
            color: Color(0xFF0F172A),
            letterSpacing: -0.5,
          ),
        ),
        const SizedBox(height: 4),
        Text(
          AppLocalization.get('Tell us what help you need.'),
          style: const TextStyle(
            fontSize: 13,
            color: Color(0xFF64748B),
          ),
        ),
      ],
    );
  }

  // ── SERVICE SELECTOR HEADER ──────────────────────────────────────────────
  Widget _buildServiceSelectorHeader(String lang) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            Text(
              AppLocalization.get('WHAT SERVICE DO YOU NEED?'),
              style: const TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.w800,
                letterSpacing: 0.5,
                color: Color(0xFF0F172A),
              ),
            ),
            const Text(
              ' *',
              style: TextStyle(
                fontSize: 13,
                fontWeight: FontWeight.bold,
                color: Color(0xFFEF4444),
              ),
            ),
          ],
        ),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 3),
          decoration: BoxDecoration(
            color: const Color(0xFFECFDF5),
            borderRadius: BorderRadius.circular(12),
            border: Border.all(color: const Color(0xFFA7F3D0)),
          ),
          child: Text(
            '${AppLocalization.get(_selectedService)} ${AppLocalization.get('selected')}',
            style: const TextStyle(
              fontSize: 10.5,
              fontWeight: FontWeight.bold,
              color: Color(0xFF059669),
            ),
          ),
        ),
      ],
    );
  }

  // ── SERVICE GRID (8 SERVICES) ────────────────────────────────────────────
  Widget _buildServiceGrid(String lang) {
    return GridView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: 2.1,
        crossAxisSpacing: 10,
        mainAxisSpacing: 10,
      ),
      itemCount: _services.length,
      itemBuilder: (context, index) {
        final item = _services[index];
        final isSelected = _selectedService == item['id'];

        return GestureDetector(
          onTap: () {
            setState(() {
              _selectedService = item['id']!;
              _descController.text =
                  _getDefaultDescForService(_selectedService);
            });
          },
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 8),
            decoration: BoxDecoration(
              color: isSelected ? const Color(0xFFF0FDF4) : Colors.white,
              borderRadius: BorderRadius.circular(12),
              border: Border.all(
                color: isSelected
                    ? const Color(0xFF16A34A)
                    : const Color(0xFFE2E8F0),
                width: isSelected ? 1.5 : 1,
              ),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.02),
                  blurRadius: 4,
                  offset: const Offset(0, 1),
                ),
              ],
            ),
            child: Row(
              children: [
                Container(
                  width: 38,
                  height: 38,
                  decoration: BoxDecoration(
                    color: isSelected
                        ? const Color(0xFFDCFCE7)
                        : const Color(0xFFF8FAFC),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Center(
                    child: Text(
                      item['emoji']!,
                      style: const TextStyle(fontSize: 18),
                    ),
                  ),
                ),
                const SizedBox(width: 8),
                Expanded(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Expanded(
                            child: Text(
                              AppLocalization.get(item['title']!),
                              style: TextStyle(
                                fontSize: 13,
                                fontWeight: FontWeight.bold,
                                color: isSelected
                                    ? const Color(0xFF0F172A)
                                    : const Color(0xFF1E293B),
                              ),
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                          if (isSelected)
                            const Icon(
                              Icons.check_circle,
                              size: 14,
                              color: Color(0xFF16A34A),
                            ),
                        ],
                      ),
                      const SizedBox(height: 2),
                      Text(
                        AppLocalization.get(item['sub']!),
                        style: const TextStyle(
                          fontSize: 10.5,
                          color: Color(0xFF64748B),
                        ),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  // ── DESCRIBE YOUR REQUIREMENT CARD ───────────────────────────────────────
  Widget _buildDescribeRequirementCard(String lang) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(14),
        border: Border.all(color: const Color(0xFFE2E8F0)),
      ),
      padding: const EdgeInsets.all(14),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            AppLocalization.get('DESCRIBE YOUR REQUIREMENT'),
            style: const TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.w800,
              letterSpacing: 0.5,
              color: Color(0xFF0F172A),
            ),
          ),
          const SizedBox(height: 10),
          Container(
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: const Color(0xFFF8FAFC),
              borderRadius: BorderRadius.circular(10),
              border: Border.all(color: const Color(0xFFE2E8F0)),
            ),
            child: TextField(
              controller: _descController,
              maxLines: 3,
              style: const TextStyle(
                fontSize: 12.5,
                color: Color(0xFF1E293B),
                height: 1.4,
              ),
              decoration: InputDecoration(
                isDense: true,
                contentPadding: EdgeInsets.zero,
                border: InputBorder.none,
                hintText: AppLocalization.get('Describe what needs fixing or doing...'),
                hintStyle: const TextStyle(fontSize: 12, color: Color(0xFF94A3B8)),
              ),
            ),
          ),
          const SizedBox(height: 8),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                AppLocalization.get('Be as specific as possible'),
                style: const TextStyle(fontSize: 11, color: Color(0xFF94A3B8)),
              ),
              Text(
                AppLocalization.get('Optional details'),
                style: const TextStyle(fontSize: 11, color: Color(0xFF94A3B8)),
              ),
            ],
          ),
        ],
      ),
    );
  }

  // ── ADD PHOTOS CARD ──────────────────────────────────────────────────────
  Widget _buildPhotosCard(String lang) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(14),
        border: Border.all(color: const Color(0xFFE2E8F0)),
      ),
      padding: const EdgeInsets.all(14),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                AppLocalization.get('ADD PHOTOS (OPTIONAL)'),
                style: const TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.w800,
                  letterSpacing: 0.5,
                  color: Color(0xFF0F172A),
                ),
              ),
              Text(
                '${AppLocalization.get('Max 3')}${_photoCount > 0 ? " ($_photoCount/3)" : ""}',
                style: const TextStyle(fontSize: 11, color: Color(0xFF94A3B8)),
              ),
            ],
          ),
          const SizedBox(height: 12),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Add photos button
              GestureDetector(
                onTap: () {
                  setState(() {
                    if (_photoCount < 3) {
                      _photoCount++;
                    } else {
                      _photoCount = 0;
                    }
                  });
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text(_photoCount > 0
                          ? '$_photoCount ${AppLocalization.get('photo(s) attached')}'
                          : AppLocalization.get('Photos cleared')),
                      duration: const Duration(seconds: 1),
                      behavior: SnackBarBehavior.floating,
                    ),
                  );
                },
                child: DottedBorder(
                  options: RoundedRectDottedBorderOptions(
                    color: const Color(0xFF93C5FD),
                    dashPattern: const [4, 3],
                    strokeWidth: 1.2,
                    radius: const Radius.circular(10),
                  ),
                  child: Container(
                    width: 90,
                    height: 80,
                    decoration: BoxDecoration(
                      color: const Color(0xFFF8FAFC),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          width: 28,
                          height: 28,
                          decoration: const BoxDecoration(
                            shape: BoxShape.circle,
                            color: Color(0xFFDCFCE7),
                          ),
                          child: Icon(
                            _photoCount > 0 ? Icons.check : Icons.add,
                            size: 16,
                            color: const Color(0xFF16A34A),
                          ),
                        ),
                        const SizedBox(height: 4),
                        Text(
                          _photoCount > 0
                              ? '$_photoCount ${AppLocalization.get('Added')}'
                              : AppLocalization.get('Add Photos'),
                          style: const TextStyle(
                            fontSize: 10.5,
                            fontWeight: FontWeight.bold,
                            color: Color(0xFF0F172A),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              const SizedBox(width: 12),
              // Explanation box
              Expanded(
                child: Container(
                  height: 80,
                  padding: const EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    color: const Color(0xFFF8FAFC),
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(color: const Color(0xFFE2E8F0)),
                  ),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Icon(Icons.photo_outlined,
                          size: 16, color: Color(0xFF10B981)),
                      const SizedBox(width: 8),
                      Expanded(
                        child: Text(
                          AppLocalization.get(
                              'Photos can help workers understand the work and arrive prepared with required tools.'),
                          style: const TextStyle(
                            fontSize: 11,
                            color: Color(0xFF475569),
                            height: 1.35,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  // ── WHEN DO YOU NEED THE SERVICE? ─────────────────────────────────────────
  Widget _buildDateTimeCard(String lang, String formattedDate) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(14),
        border: Border.all(color: const Color(0xFFE2E8F0)),
      ),
      padding: const EdgeInsets.all(14),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            AppLocalization.get('WHEN DO YOU NEED THE SERVICE?'),
            style: const TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.w800,
              letterSpacing: 0.5,
              color: Color(0xFF0F172A),
            ),
          ),
          const SizedBox(height: 12),
          Row(
            children: [
              // Date picker field
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      AppLocalization.get('Service Date'),
                      style: const TextStyle(
                          fontSize: 11, color: Color(0xFF64748B)),
                    ),
                    const SizedBox(height: 4),
                    GestureDetector(
                      onTap: _pickDate,
                      child: Container(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 10, vertical: 10),
                        decoration: BoxDecoration(
                          color: const Color(0xFFF8FAFC),
                          borderRadius: BorderRadius.circular(8),
                          border: Border.all(color: const Color(0xFFE2E8F0)),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              formattedDate,
                              style: const TextStyle(
                                fontSize: 12.5,
                                fontWeight: FontWeight.bold,
                                color: Color(0xFF0F172A),
                              ),
                            ),
                            const Icon(Icons.calendar_today_outlined,
                                size: 14, color: Color(0xFF64748B)),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(width: 12),
              // Preferred Time dropdown
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      AppLocalization.get('Preferred Time'),
                      style: const TextStyle(
                          fontSize: 11, color: Color(0xFF64748B)),
                    ),
                    const SizedBox(height: 4),
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      decoration: BoxDecoration(
                        color: const Color(0xFFF8FAFC),
                        borderRadius: BorderRadius.circular(8),
                        border: Border.all(color: const Color(0xFFE2E8F0)),
                      ),
                      child: DropdownButtonHideUnderline(
                        child: DropdownButton<String>(
                          value: _selectedTime,
                          isExpanded: true,
                          icon: const Icon(Icons.keyboard_arrow_down,
                              size: 16, color: Color(0xFF64748B)),
                          style: const TextStyle(
                            fontSize: 11.5,
                            fontWeight: FontWeight.bold,
                            color: Color(0xFF0F172A),
                          ),
                          items: _timeSlots.map((slot) {
                            return DropdownMenuItem(
                              value: slot,
                              child: Text(slot, overflow: TextOverflow.ellipsis),
                            );
                          }).toList(),
                          onChanged: (val) {
                            if (val != null) {
                              setState(() {
                                _selectedTime = val;
                              });
                            }
                          },
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  // ── WHERE IS THE SERVICE NEEDED? ──────────────────────────────────────────
  Widget _buildLocationCard(String lang) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(14),
        border: Border.all(color: const Color(0xFFE2E8F0)),
      ),
      padding: const EdgeInsets.all(14),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                AppLocalization.get('WHERE IS THE SERVICE NEEDED?'),
                style: const TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.w800,
                  letterSpacing: 0.5,
                  color: Color(0xFF0F172A),
                ),
              ),
              GestureDetector(
                onTap: () {
                  _showChangeLocationDialog(lang);
                },
                child: Text(
                  AppLocalization.get('Change'),
                  style: const TextStyle(
                    fontSize: 11.5,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF16A34A),
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 10),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
            decoration: BoxDecoration(
              color: const Color(0xFFF8FAFC),
              borderRadius: BorderRadius.circular(8),
              border: Border.all(color: const Color(0xFFE2E8F0)),
            ),
            child: Row(
              children: [
                const Icon(Icons.location_on, size: 16, color: Color(0xFFDC2626)),
                const SizedBox(width: 8),
                Expanded(
                  child: Text(
                    _location,
                    style: const TextStyle(
                      fontSize: 12.5,
                      fontWeight: FontWeight.w600,
                      color: Color(0xFF0F172A),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  void _showChangeLocationDialog(String lang) {
    final controller = TextEditingController(text: _location);
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
          title: Text(AppLocalization.get('Change Service Location')),
          content: TextField(
            controller: controller,
            decoration: InputDecoration(
              hintText: AppLocalization.get('Enter address / area'),
              border: OutlineInputBorder(borderRadius: BorderRadius.circular(8)),
            ),
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: Text(AppLocalization.get('Cancel')),
            ),
            ElevatedButton(
              onPressed: () {
                setState(() {
                  _location = controller.text;
                });
                Navigator.pop(context);
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFF0F172A),
              ),
              child: Text(
                AppLocalization.get('Update'),
                style: const TextStyle(color: Colors.white),
              ),
            ),
          ],
        );
      },
    );
  }

  // ── HOW MANY WORKERS DO YOU NEED? ─────────────────────────────────────────
  Widget _buildWorkerCountCard(String lang) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(14),
        border: Border.all(color: const Color(0xFFE2E8F0)),
      ),
      padding: const EdgeInsets.all(14),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                AppLocalization.get('HOW MANY WORKERS DO YOU NEED?'),
                style: const TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.w800,
                  letterSpacing: 0.5,
                  color: Color(0xFF0F172A),
                ),
              ),
              Text(
                AppLocalization.get('Simple & flexible'),
                style: const TextStyle(fontSize: 11, color: Color(0xFF94A3B8)),
              ),
            ],
          ),
          const SizedBox(height: 12),
          Row(
            children: [
              _buildWorkerCountOption(
                  1, '1', AppLocalization.get('WORKER')),
              const SizedBox(width: 10),
              _buildWorkerCountOption(
                  2, '2', AppLocalization.get('WORKERS')),
              const SizedBox(width: 10),
              _buildWorkerCountOption(
                  3, '3+', AppLocalization.get('TEAM')),
            ],
          ),
          const SizedBox(height: 10),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Icon(Icons.info_outline, size: 14, color: Color(0xFF64748B)),
              const SizedBox(width: 6),
              Expanded(
                child: Text(
                  AppLocalization.get(
                      'Next step lets you choose between an individual worker or cooperative team.'),
                  style: const TextStyle(
                    fontSize: 11,
                    color: Color(0xFF64748B),
                    height: 1.3,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildWorkerCountOption(int count, String num, String label) {
    final isSelected = _workerCount == count;

    return Expanded(
      child: GestureDetector(
        onTap: () {
          setState(() {
            _workerCount = count;
          });
        },
        child: Container(
          padding: const EdgeInsets.symmetric(vertical: 12),
          decoration: BoxDecoration(
            color: isSelected ? const Color(0xFFECFDF5) : const Color(0xFFF8FAFC),
            borderRadius: BorderRadius.circular(10),
            border: Border.all(
              color: isSelected
                  ? const Color(0xFF16A34A)
                  : const Color(0xFFE2E8F0),
              width: isSelected ? 1.5 : 1,
            ),
          ),
          child: Column(
            children: [
              Text(
                num,
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w900,
                  color: isSelected
                      ? const Color(0xFF16A34A)
                      : const Color(0xFF1E293B),
                ),
              ),
              const SizedBox(height: 2),
              Text(
                label,
                style: TextStyle(
                  fontSize: 10,
                  fontWeight: FontWeight.w700,
                  color: isSelected
                      ? const Color(0xFF16A34A)
                      : const Color(0xFF64748B),
                  letterSpacing: 0.5,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  // ── TRUST BANNER ─────────────────────────────────────────────────────────
  Widget _buildTrustBanner(String lang) {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: const Color(0xFFF0FDF4),
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: const Color(0xFFBBF7D0)),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Icon(Icons.shield_outlined, size: 16, color: Color(0xFF16A34A)),
          const SizedBox(width: 8),
          Expanded(
            child: RichText(
              text: TextSpan(
                style: const TextStyle(
                  fontSize: 11.5,
                  color: Color(0xFF166534),
                  height: 1.35,
                ),
                children: [
                  TextSpan(
                    text: AppLocalization.get('No payment required now. '),
                    style: const TextStyle(fontWeight: FontWeight.bold),
                  ),
                  TextSpan(
                    text: AppLocalization.get(
                        'You will review quotes from individual workers or verified cooperatives on the next screen.'),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  // ── FIXED BOTTOM BAR ──────────────────────────────────────────────────────
  Widget _buildBottomBar(String lang) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.04),
            blurRadius: 10,
            offset: const Offset(0, -3),
          ),
        ],
      ),
      child: DottedBorder(
        options: RoundedRectDottedBorderOptions(
          color: const Color(0xFF93C5FD),
          dashPattern: const [5, 3],
          strokeWidth: 1.5,
          radius: const Radius.circular(10),
        ),
        child: SizedBox(
          width: double.infinity,
          child: ElevatedButton(
            onPressed: _onContinue,
            style: ElevatedButton.styleFrom(
              backgroundColor: const Color(0xFF1E3A5F),
              padding: const EdgeInsets.symmetric(vertical: 15),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8),
              ),
              elevation: 0,
            ),
            child: Text(
              AppLocalization.get('Continue →'),
              style: const TextStyle(
                fontSize: 15,
                fontWeight: FontWeight.bold,
                color: Colors.white,
                letterSpacing: 0.5,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
