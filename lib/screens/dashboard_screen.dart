import 'package:flutter/material.dart';
import '../theme/colors.dart';
import '../widgets/action_card.dart';

class DashboardScreen extends StatelessWidget {
  const DashboardScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.surfaceCanvas,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: AppColors.surfaceCanvas,
        elevation: 0,
        title: Image.network(
          'https://lh3.googleusercontent.com/aida-public/AB6AXuD_UyVozWvrDUswepAXXC3-xKyH3z9ka8adb3AdzVz1IXgotOhg6zX9gRUXZjHu7mdtyzQrZYzsY3wvEfkgh45iWMUJ2b4_PmmN1lwX8AWIemXw7ZHHGxKlCJGJaH9rBZ32jshadl-hH7dK6XNilAUMg4USotyIqsw8_RSLQihSeF7VlfSQ3vWOKfyibvZt40AkPu3-TeCYeG0Ums-mbFPOLuHJseJPbVlomlTAqJtHLiowKxwIuUJ9PzpdjeX-i46MXA',
          height: 36,
          errorBuilder: (context, error, stackTrace) => 
              const Text('SAHYOG', style: TextStyle(fontWeight: FontWeight.bold, color: AppColors.primaryContainer)),
        ),
        actions: [
          IconButton(
            icon: Stack(
              children: [
                const Icon(Icons.notifications_none, color: AppColors.textPrimary),
                Positioned(
                  right: 0,
                  top: 0,
                  child: Container(
                    padding: const EdgeInsets.all(2),
                    decoration: const BoxDecoration(color: Colors.red, shape: BoxShape.circle),
                    constraints: const BoxConstraints(minWidth: 14, minHeight: 14),
                    child: const Text('3', style: TextStyle(color: Colors.white, fontSize: 8, fontWeight: FontWeight.bold), textAlign: TextAlign.center),
                  ),
                )
              ],
            ),
            onPressed: () {},
          ),
          Container(
            margin: const EdgeInsets.only(right: 16, top: 12, bottom: 12, left: 4),
            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
            decoration: BoxDecoration(
              color: Colors.grey[100],
              borderRadius: BorderRadius.circular(16),
              border: Border.all(color: Colors.grey[300]!),
            ),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: const [
                Text('EN', style: TextStyle(fontSize: 10, fontWeight: FontWeight.bold, color: AppColors.primaryContainer)),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 4.0),
                  child: Text('|', style: TextStyle(fontSize: 10, color: Colors.grey)),
                ),
                Text('हिन्दी', style: TextStyle(fontSize: 10, color: Colors.grey)),
              ],
            ),
          )
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Greeting & Verification Badge
            const Text('Good morning, Nirman Shramik 👋', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: AppColors.textPrimary)),
            const SizedBox(height: 4),
            const Text('Manage your workforce, requests and opportunities.', style: TextStyle(fontSize: 12, color: AppColors.textSecondary)),
            const SizedBox(height: 8),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 2),
              decoration: BoxDecoration(
                color: const Color(0xFFE6F4EA),
                borderRadius: BorderRadius.circular(12),
                border: Border.all(color: const Color(0xFFBBF7D0)),
              ),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: const [
                  Icon(Icons.check, size: 12, color: AppColors.cooperativeGreen),
                  SizedBox(width: 4),
                  Text('Cooperative Verified', style: TextStyle(fontSize: 10, fontWeight: FontWeight.bold, color: AppColors.cooperativeGreen)),
                ],
              ),
            ),
            
            const SizedBox(height: 16),
            
            // Key Metrics Grid
            GridView.count(
              crossAxisCount: 2,
              crossAxisSpacing: 10,
              mainAxisSpacing: 10,
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              childAspectRatio: 1.6,
              children: [
                _buildMetricCard('👷 Workers', '42', '28 Available', AppColors.cooperativeGreen),
                _buildMetricCard('📋 Active Jobs', '7', '5 Pending Requests', Colors.orange[700]!),
                _buildMetricCard('💰 Earnings', '₹48,600', 'This Month', AppColors.textSecondary, isDot: false),
                _buildMetricCard('📊 Workforce Utilization', '78%', 'This Month', AppColors.cooperativeGreen, isDot: false),
              ],
            ),
            
            const SizedBox(height: 24),
            
            // Incoming Requests
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text('Incoming Requests', style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold, color: AppColors.textPrimary)),
                Text('View All Requests →', style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold, color: AppColors.primaryContainer)),
              ],
            ),
            const SizedBox(height: 12),
            _buildRequestCard('Residential Painting', 'Dwarka • Household', 'New', 'Sep 12 • 2 workers', Colors.blue),
            const SizedBox(height: 10),
            _buildRequestCard('Community Hall Repair', 'Najafgarh • Institution', 'Urgent', 'Sep 18–22 • 5 workers', Colors.orange),
            
            const SizedBox(height: 24),
            
            // Workforce Overview
            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(12),
                border: Border.all(color: AppColors.borderSubtle),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text('Workforce Overview', style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold, color: AppColors.textPrimary)),
                      Text('Manage Workers →', style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold, color: AppColors.primaryContainer)),
                    ],
                  ),
                  const SizedBox(height: 16),
                  Row(
                    children: [
                      Expanded(child: _buildWorkforcePill('Available', '28', Colors.green)),
                      const SizedBox(width: 8),
                      Expanded(child: _buildWorkforcePill('Working', '7', Colors.blue)),
                    ],
                  ),
                  const SizedBox(height: 8),
                  Row(
                    children: [
                      Expanded(child: _buildWorkforcePill('Assigned', '5', Colors.orange)),
                      const SizedBox(width: 8),
                      Expanded(child: _buildWorkforcePill('Unavailable', '2', Colors.grey)),
                    ],
                  ),
                ],
              ),
            ),
            
            const SizedBox(height: 16),
            
            // AI Insight Card
            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(12),
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
                          Container(
                            padding: const EdgeInsets.all(4),
                            decoration: BoxDecoration(color: Colors.blue[50], borderRadius: BorderRadius.circular(6)),
                            child: const Icon(Icons.insights, size: 14, color: AppColors.primaryContainer),
                          ),
                          const SizedBox(width: 8),
                          const Text('WORKFORCE INSIGHT', style: TextStyle(fontSize: 11, fontWeight: FontWeight.bold, color: AppColors.textSecondary, letterSpacing: 1)),
                        ],
                      ),
                      Container(
                        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
                        decoration: BoxDecoration(color: Colors.grey[100], borderRadius: BorderRadius.circular(4)),
                        child: const Text('Confidence: 82%', style: TextStyle(fontSize: 9, fontWeight: FontWeight.bold, color: AppColors.textSecondary)),
                      )
                    ],
                  ),
                  const SizedBox(height: 12),
                  const Text('Painting demand is expected to increase by 24% next week.', style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold, color: AppColors.textPrimary)),
                  const SizedBox(height: 4),
                  const Text('Consider adding 4–6 painting workers to your available pool.', style: TextStyle(fontSize: 11, color: AppColors.textSecondary)),
                  const SizedBox(height: 12),
                  SizedBox(
                    width: double.infinity,
                    child: OutlinedButton(
                      onPressed: () {},
                      style: OutlinedButton.styleFrom(
                        foregroundColor: AppColors.primaryContainer,
                        side: BorderSide(color: Colors.grey[200]!),
                        backgroundColor: Colors.grey[50],
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
                      ),
                      child: const Text('View Insights →', style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold)),
                    ),
                  )
                ],
              ),
            ),
            
            const SizedBox(height: 16),
            
            // Cooperative Exchange Card
            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: const Color(0xFFF0FDF4),
                borderRadius: BorderRadius.circular(12),
                border: Border.all(color: const Color(0xFF86EFAC)),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: const [
                      Text('🤝', style: TextStyle(fontSize: 14)),
                      SizedBox(width: 8),
                      Text('Cooperative Exchange', style: TextStyle(fontSize: 13, fontWeight: FontWeight.bold, color: AppColors.cooperativeGreen)),
                    ],
                  ),
                  const SizedBox(height: 8),
                  const Text('Find nearby work opportunities, workforce support and shared equipment.', style: TextStyle(fontSize: 11, color: AppColors.textSecondary)),
                  const SizedBox(height: 12),
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                        backgroundColor: AppColors.cooperativeGreen,
                        foregroundColor: Colors.white,
                        elevation: 0,
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
                      ),
                      child: const Text('Explore Exchange →', style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold)),
                    ),
                  )
                ],
              ),
            ),
            
            const SizedBox(height: 24),
          ],
        ),
      ),
    );
  }

  Widget _buildMetricCard(String title, String value, String subtitle, Color subtitleColor, {bool isDot = true}) {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: AppColors.borderSubtle),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(title, style: const TextStyle(fontSize: 11, fontWeight: FontWeight.w600, color: AppColors.textSecondary)),
          const SizedBox(height: 6),
          Text(value, style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: AppColors.primaryContainer)),
          const SizedBox(height: 4),
          Row(
            children: [
              if (isDot) ...[
                Container(width: 6, height: 6, decoration: BoxDecoration(color: subtitleColor, shape: BoxShape.circle)),
                const SizedBox(width: 4),
              ],
              Expanded(child: Text(subtitle, style: TextStyle(fontSize: 10, fontWeight: FontWeight.w600, color: subtitleColor))),
            ],
          )
        ],
      ),
    );
  }

  Widget _buildRequestCard(String title, String location, String tag, String dateInfo, MaterialColor tagColor) {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: AppColors.borderSubtle),
      ),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(title, style: const TextStyle(fontSize: 13, fontWeight: FontWeight.bold, color: AppColors.textPrimary)),
                    const SizedBox(height: 4),
                    Row(
                      children: [
                        const Icon(Icons.location_on_outlined, size: 12, color: AppColors.textSecondary),
                        const SizedBox(width: 4),
                        Text(location, style: const TextStyle(fontSize: 11, color: AppColors.textSecondary)),
                      ],
                    )
                  ],
                ),
              ),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
                decoration: BoxDecoration(
                  color: tagColor[50],
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(color: tagColor[200]!),
                ),
                child: Text(tag, style: TextStyle(fontSize: 10, fontWeight: FontWeight.bold, color: tagColor[700])),
              )
            ],
          ),
          const Padding(
            padding: EdgeInsets.symmetric(vertical: 8.0),
            child: Divider(color: AppColors.borderSubtle, height: 1),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('🗓️ $dateInfo', style: const TextStyle(fontSize: 11, fontWeight: FontWeight.w600, color: AppColors.textSecondary)),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                decoration: BoxDecoration(
                  color: Colors.grey[50],
                  borderRadius: BorderRadius.circular(8),
                  border: Border.all(color: Colors.grey[200]!),
                ),
                child: const Text('View Request →', style: TextStyle(fontSize: 11, fontWeight: FontWeight.bold, color: AppColors.primaryContainer)),
              )
            ],
          )
        ],
      ),
    );
  }

  Widget _buildWorkforcePill(String label, String count, MaterialColor color) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
      decoration: BoxDecoration(
        color: color[50],
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: color[200]!),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(label, style: TextStyle(fontSize: 11, fontWeight: FontWeight.bold, color: color[700])),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(4),
              boxShadow: [BoxShadow(color: Colors.black.withOpacity(0.05), blurRadius: 2)],
            ),
            child: Text(count, style: TextStyle(fontSize: 11, fontWeight: FontWeight.bold, color: color[700])),
          )
        ],
      ),
    );
  }
}
