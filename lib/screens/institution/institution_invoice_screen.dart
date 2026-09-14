import 'dart:convert';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../../utils/localization.dart';

class InstitutionInvoiceModel {
  final String invoiceNumber;
  final String settlementDate;
  final String status;
  final String institutionName;
  final String institutionDetails;
  final String providerName;
  final String providerDetails;
  final String serviceTitle;
  final String serviceDescription;
  final String serviceAmount;
  final String equipmentTitle;
  final String equipmentDescription;
  final String equipmentAmount;
  final String feeTitle;
  final String feeDescription;
  final String feeAmount;
  final String totalAmount;

  const InstitutionInvoiceModel({
    this.invoiceNumber = '#SHY-INST-2026-089',
    this.settlementDate = '18 Sep 2026',
    this.status = 'PAID ✓',
    this.institutionName = 'ABC College',
    this.institutionDetails = 'Sector 14 Dwarka, New Delhi\nGSTIN: 07AAAAA0000A1Z5',
    this.providerName = 'Nirman Shramik Cooperative',
    this.providerDetails = 'Sector 12 Dwarka Unit\nReg: COOP-DEL-2023-7712',
    this.serviceTitle = 'College Campus Exterior Painting',
    this.serviceDescription = '5 Painters × 5 Days (25 Mandays @ ₹750/day)',
    this.serviceAmount = '₹18,750',
    this.equipmentTitle = 'Safety Gear & Scaffolding Kit',
    this.equipmentDescription = 'Equipment rental and fall protection',
    this.equipmentAmount = '₹2,000',
    this.feeTitle = 'Cooperative DPI Platform Fee + GST (5%)',
    this.feeDescription = 'National digital gateway settlement',
    this.feeAmount = '₹1,038',
    this.totalAmount = '₹21,788',
  });

  static final Map<String, InstitutionInvoiceModel> registry = {
    '#SHY-INST-2026-089': const InstitutionInvoiceModel(
      invoiceNumber: '#SHY-INST-2026-089',
      settlementDate: '18 Sep 2026',
      status: 'PAID ✓',
      institutionName: 'ABC College',
      institutionDetails: 'Sector 14 Dwarka, New Delhi\nGSTIN: 07AAAAA0000A1Z5',
      providerName: 'Nirman Shramik Cooperative',
      providerDetails: 'Sector 12 Dwarka Unit\nReg: COOP-DEL-2023-7712',
      serviceTitle: 'College Campus Exterior Painting',
      serviceDescription: '5 Painters × 5 Days (25 Mandays @ ₹750/day)',
      serviceAmount: '₹18,750',
      equipmentTitle: 'Safety Gear & Scaffolding Kit',
      equipmentDescription: 'Equipment rental and fall protection',
      equipmentAmount: '₹2,000',
      feeTitle: 'Cooperative DPI Platform Fee + GST (5%)',
      feeDescription: 'National digital gateway settlement',
      feeAmount: '₹1,038',
      totalAmount: '₹21,788',
    ),
    '#SHY-INST-2026-090': const InstitutionInvoiceModel(
      invoiceNumber: '#SHY-INST-2026-090',
      settlementDate: '22 Sep 2026',
      status: 'PAID ✓',
      institutionName: 'Delhi Public School',
      institutionDetails: 'Sector 6, R.K. Puram, New Delhi\nGSTIN: 07AAAPD1234F1Z1',
      providerName: 'Jan Kalyan Shramik Cooperative Society',
      providerDetails: 'Community Center, Najafgarh, New Delhi\nReg: COOP-DEL-2022-4419',
      serviceTitle: 'Electrical Campus Maintenance & Rewiring',
      serviceDescription: '4 Electricians × 6 Days (24 Mandays @ ₹800/day)',
      serviceAmount: '₹19,200',
      equipmentTitle: 'Electrical Testing & Insulated Safety Kit',
      equipmentDescription: 'Multimeters, high-voltage gloves, insulated scaffolding',
      equipmentAmount: '₹1,500',
      feeTitle: 'Cooperative DPI Platform Fee + GST (5%)',
      feeDescription: 'National digital gateway settlement',
      feeAmount: '₹1,035',
      totalAmount: '₹21,735',
    ),
  };

  static InstitutionInvoiceModel? findById(String id) {
    if (registry.containsKey(id)) return registry[id]!;
    final withHash = id.startsWith('#') ? id : '#$id';
    if (registry.containsKey(withHash)) return registry[withHash]!;
    return null;
  }
}

class InstitutionInvoiceScreen extends StatefulWidget {
  final bool showBackButton;
  final String? invoiceId;
  final InstitutionInvoiceModel? invoice;

  const InstitutionInvoiceScreen({
    super.key,
    this.showBackButton = true,
    this.invoiceId,
    this.invoice,
  });

  @override
  State<InstitutionInvoiceScreen> createState() => _InstitutionInvoiceScreenState();
}

class _InstitutionInvoiceScreenState extends State<InstitutionInvoiceScreen> {
  InstitutionInvoiceModel? _invoiceRecord;
  String? _errorMessage;
  bool _isResourceReady = false;
  bool _isDownloading = false;

  @override
  void initState() {
    super.initState();
    _loadInvoice();
  }

  void _loadInvoice() {
    if (widget.invoice != null) {
      _invoiceRecord = widget.invoice!;
      _isResourceReady = true;
      _errorMessage = null;
    } else if (widget.invoiceId != null && widget.invoiceId!.isNotEmpty) {
      final found = InstitutionInvoiceModel.findById(widget.invoiceId!);
      if (found != null) {
        _invoiceRecord = found;
        _isResourceReady = true;
        _errorMessage = null;
      } else {
        _invoiceRecord = null;
        _isResourceReady = false;
        _errorMessage = 'Invoice ${widget.invoiceId} not found';
      }
    } else {
      _invoiceRecord = const InstitutionInvoiceModel();
      _isResourceReady = true;
      _errorMessage = null;
    }
  }

  Future<File> _generateAndSaveInvoicePdf(InstitutionInvoiceModel invoice) async {
    final sanitizedNumber = invoice.invoiceNumber.replaceAll(RegExp(r'[^a-zA-Z0-9_-]'), '_');
    final tempDir = Directory.systemTemp;
    final file = File('${tempDir.path}/invoice_$sanitizedNumber.pdf');
    final buffer = StringBuffer()
      ..writeln('%PDF-1.4')
      ..writeln('% SAHYOG DPI Digital Invoice')
      ..writeln('Invoice Number: ${invoice.invoiceNumber}')
      ..writeln('Settlement Date: ${invoice.settlementDate}')
      ..writeln('Status: ${invoice.status}')
      ..writeln('Billed To: ${invoice.institutionName}')
      ..writeln('Institution Details: ${invoice.institutionDetails.replaceAll('\n', ', ')}')
      ..writeln('Provider: ${invoice.providerName}')
      ..writeln('Provider Details: ${invoice.providerDetails.replaceAll('\n', ', ')}')
      ..writeln('Service: ${invoice.serviceTitle} (${invoice.serviceAmount})')
      ..writeln('Equipment: ${invoice.equipmentTitle} (${invoice.equipmentAmount})')
      ..writeln('Fee: ${invoice.feeAmount}')
      ..writeln('Total: ${invoice.totalAmount}')
      ..writeln('%%EOF');
    final bytes = Uint8List.fromList(utf8.encode(buffer.toString()));
    await file.writeAsBytes(bytes, flush: true);
    return file;
  }

  Future<void> _handleDownloadPdf() async {
    if (!_isResourceReady || _isDownloading || _invoiceRecord == null) return;
    final invoice = _invoiceRecord!;
    setState(() => _isDownloading = true);
    try {
      final file = await _generateAndSaveInvoicePdf(invoice);
      if (!await file.exists()) {
        throw Exception('Failed to generate file');
      }
      if (!mounted) return;
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Downloaded invoice ${invoice.invoiceNumber}.pdf'),
          backgroundColor: const Color(0xFF087443),
        ),
      );
    } catch (e) {
      if (!mounted) return;
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Failed to download invoice: $e'),
          backgroundColor: Colors.red,
        ),
      );
    } finally {
      if (mounted) setState(() => _isDownloading = false);
    }
  }

  Future<void> _handleShareInvoice() async {
    if (!_isResourceReady || _invoiceRecord == null) return;
    final invoice = _invoiceRecord!;
    try {
      final shareUrl = 'https://sahyog.gov.in/invoice/${Uri.encodeComponent(invoice.invoiceNumber)}';
      await Clipboard.setData(ClipboardData(text: shareUrl));
      if (!mounted) return;
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Invoice link copied to clipboard!'),
          backgroundColor: Color(0xFF087443),
        ),
      );
    } catch (e) {
      if (!mounted) return;
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Failed to copy invoice link: $e'),
          backgroundColor: Colors.red,
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<String>(
      valueListenable: AppLocalization.currentLang,
      builder: (context, lang, child) {
        return Scaffold(
          backgroundColor: const Color(0xFFF8FAFC),
          body: SafeArea(
            child: Column(
              children: [
                // Top Bar
                Container(
                  color: Colors.white,
                  padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      if (widget.showBackButton)
                        GestureDetector(
                          onTap: () => Navigator.pop(context),
                          child: Row(
                            children: [
                              const Icon(Icons.arrow_back_ios_new, size: 14, color: Color(0xFF123B5D)),
                              const SizedBox(width: 4),
                              Text(
                                AppLocalization.get('Back'),
                                style: const TextStyle(fontSize: 13, fontWeight: FontWeight.w600, color: Color(0xFF123B5D)),
                              ),
                            ],
                          ),
                        )
                      else
                        const SizedBox(width: 40),
                      Text(
                        AppLocalization.get('Digital Invoice & Service Record'),
                        style: const TextStyle(fontSize: 15, fontWeight: FontWeight.bold, color: Color(0xFF0F172A)),
                      ),
                      IconButton(
                        icon: const Icon(Icons.share_outlined, size: 20, color: Color(0xFF123B5D)),
                        onPressed: (_isResourceReady && _invoiceRecord != null) ? _handleShareInvoice : null,
                      ),
                    ],
                  ),
                ),

                // Invoice Body
                Expanded(
                  child: (_errorMessage != null || _invoiceRecord == null)
                      ? Center(
                          child: Padding(
                            padding: const EdgeInsets.all(24.0),
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                const Icon(Icons.error_outline, size: 48, color: Color(0xFFDC2626)),
                                const SizedBox(height: 16),
                                Text(
                                  _errorMessage ?? AppLocalization.get('Invoice not found'),
                                  style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Color(0xFF0F172A)),
                                  textAlign: TextAlign.center,
                                ),
                                const SizedBox(height: 8),
                                Text(
                                  AppLocalization.get('The requested invoice could not be located or has been archived.'),
                                  style: const TextStyle(fontSize: 13, color: Color(0xFF64748B)),
                                  textAlign: TextAlign.center,
                                ),
                                const SizedBox(height: 20),
                                if (widget.showBackButton)
                                  ElevatedButton.icon(
                                    onPressed: () => Navigator.pop(context),
                                    icon: const Icon(Icons.arrow_back, size: 16),
                                    label: Text(AppLocalization.get('Go Back')),
                                    style: ElevatedButton.styleFrom(
                                      backgroundColor: const Color(0xFF123B5D),
                                      foregroundColor: Colors.white,
                                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
                                    ),
                                  ),
                              ],
                            ),
                          ),
                        )
                      : Builder(
                          builder: (context) {
                            final invoice = _invoiceRecord!;
                            return SingleChildScrollView(
                              physics: const BouncingScrollPhysics(),
                              padding: const EdgeInsets.all(16.0),
                              child: Column(
                                children: [
                                  // Official Invoice Card
                                  Container(
                                    decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.circular(16),
                                      border: Border.all(color: const Color(0xFFE2E8F0)),
                                      boxShadow: [
                                        BoxShadow(
                                          color: Colors.black.withValues(alpha: 0.03),
                                          blurRadius: 10,
                                          offset: const Offset(0, 3),
                                        ),
                                      ],
                                    ),
                                    padding: const EdgeInsets.all(20),
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        // Top Brand Strip
                                        Row(
                                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                          children: [
                                            Column(
                                              crossAxisAlignment: CrossAxisAlignment.start,
                                              children: const [
                                                Text('SAHYOG DPI', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Color(0xFF123B5D))),
                                                Text('Digital Public Infrastructure', style: TextStyle(fontSize: 10, color: Color(0xFF64748B))),
                                              ],
                                            ),
                                            Container(
                                              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                                              decoration: BoxDecoration(
                                                color: const Color(0xFFDCFCE7),
                                                borderRadius: BorderRadius.circular(12),
                                                border: Border.all(color: const Color(0xFF86EFAC)),
                                              ),
                                              child: Text(
                                                invoice.status,
                                                style: const TextStyle(fontSize: 11, fontWeight: FontWeight.bold, color: Color(0xFF087443)),
                                              ),
                                            ),
                                          ],
                                        ),
                                        const Divider(height: 24),

                                        // Invoice Meta
                                        Row(
                                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                          children: [
                                            Column(
                                              crossAxisAlignment: CrossAxisAlignment.start,
                                              children: [
                                                const Text('INVOICE NO', style: TextStyle(fontSize: 10, fontWeight: FontWeight.bold, color: Color(0xFF94A3B8))),
                                                const SizedBox(height: 2),
                                                Text(invoice.invoiceNumber, style: const TextStyle(fontSize: 12, fontWeight: FontWeight.bold, color: Color(0xFF0F172A))),
                                              ],
                                            ),
                                            Column(
                                              crossAxisAlignment: CrossAxisAlignment.end,
                                              children: [
                                                const Text('SETTLEMENT DATE', style: TextStyle(fontSize: 10, fontWeight: FontWeight.bold, color: Color(0xFF94A3B8))),
                                                const SizedBox(height: 2),
                                                Text(invoice.settlementDate, style: const TextStyle(fontSize: 12, fontWeight: FontWeight.bold, color: Color(0xFF0F172A))),
                                              ],
                                            ),
                                          ],
                                        ),
                                        const SizedBox(height: 16),

                                        // Parties
                                        Container(
                                          padding: const EdgeInsets.all(12),
                                          decoration: BoxDecoration(
                                            color: const Color(0xFFF8FAFC),
                                            borderRadius: BorderRadius.circular(12),
                                          ),
                                          child: Column(
                                            children: [
                                              _buildPartyRow('Billed To (Institution):', invoice.institutionName, invoice.institutionDetails),
                                              const Divider(height: 16),
                                              _buildPartyRow('Service Provider (Cooperative):', invoice.providerName, invoice.providerDetails),
                                            ],
                                          ),
                                        ),
                                        const SizedBox(height: 16),

                                        // Project Details
                                        const Text('Service & Line Items', style: TextStyle(fontSize: 13, fontWeight: FontWeight.bold, color: Color(0xFF0F172A))),
                                        const SizedBox(height: 8),

                                        _buildLineItem(
                                          invoice.serviceTitle,
                                          invoice.serviceDescription,
                                          invoice.serviceAmount,
                                        ),
                                        const SizedBox(height: 8),
                                        _buildLineItem(
                                          invoice.equipmentTitle,
                                          invoice.equipmentDescription,
                                          invoice.equipmentAmount,
                                        ),
                                        const SizedBox(height: 8),
                                        _buildLineItem(
                                          invoice.feeTitle,
                                          invoice.feeDescription,
                                          invoice.feeAmount,
                                        ),
                                        const Divider(height: 24),

                                        // Total
                                        Row(
                                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                          children: [
                                            const Text('Total Amount Paid', style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold, color: Color(0xFF0F172A))),
                                            Text(invoice.totalAmount, style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Color(0xFF087443))),
                                          ],
                                        ),
                                        const SizedBox(height: 16),

                                        // Verified Badge
                                        Container(
                                          padding: const EdgeInsets.all(10),
                                          decoration: BoxDecoration(
                                            color: const Color(0xFFF0FDF4),
                                            borderRadius: BorderRadius.circular(10),
                                            border: Border.all(color: const Color(0xFFBBF7D0)),
                                          ),
                                          child: const Row(
                                            children: [
                                              Icon(Icons.verified, size: 16, color: Color(0xFF087443)),
                                              SizedBox(width: 8),
                                              Expanded(
                                                child: Text(
                                                  'Verified by National Cooperative Database & SAHYOG Digital Public Infrastructure.',
                                                  style: TextStyle(fontSize: 10.5, color: Color(0xFF065F46), fontWeight: FontWeight.w500),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  const SizedBox(height: 20),

                                  // Action Buttons
                                  Row(
                                    children: [
                                      Expanded(
                                        child: OutlinedButton.icon(
                                          onPressed: (_isResourceReady && !_isDownloading) ? _handleDownloadPdf : null,
                                          icon: _isDownloading
                                              ? const SizedBox(
                                                  width: 14,
                                                  height: 14,
                                                  child: CircularProgressIndicator(strokeWidth: 2, color: Color(0xFF123B5D)),
                                                )
                                              : const Icon(Icons.download, size: 16, color: Color(0xFF123B5D)),
                                          label: Text(AppLocalization.get('Download Invoice'), style: const TextStyle(fontSize: 12, fontWeight: FontWeight.bold, color: Color(0xFF123B5D))),
                                          style: OutlinedButton.styleFrom(
                                            padding: const EdgeInsets.symmetric(vertical: 12),
                                            side: const BorderSide(color: Color(0xFF123B5D)),
                                            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                                          ),
                                        ),
                                      ),
                                      const SizedBox(width: 10),
                                      Expanded(
                                        child: ElevatedButton.icon(
                                          onPressed: _isResourceReady ? _handleShareInvoice : null,
                                          icon: const Icon(Icons.share, size: 16, color: Colors.white),
                                          label: Text(AppLocalization.get('Share Invoice'), style: const TextStyle(fontSize: 12, fontWeight: FontWeight.bold, color: Colors.white)),
                                          style: ElevatedButton.styleFrom(
                                            backgroundColor: const Color(0xFF123B5D),
                                            padding: const EdgeInsets.symmetric(vertical: 12),
                                            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                  const SizedBox(height: 24),
                                ],
                              ),
                            );
                          },
                        ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  Widget _buildPartyRow(String title, String name, String sub) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(title, style: const TextStyle(fontSize: 10, fontWeight: FontWeight.bold, color: Color(0xFF64748B))),
              const SizedBox(height: 2),
              Text(name, style: const TextStyle(fontSize: 12, fontWeight: FontWeight.bold, color: Color(0xFF0F172A))),
              Text(sub, style: const TextStyle(fontSize: 10.5, color: Color(0xFF64748B))),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildLineItem(String title, String desc, String amount) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(title, style: const TextStyle(fontSize: 12, fontWeight: FontWeight.bold, color: Color(0xFF0F172A))),
              Text(desc, style: const TextStyle(fontSize: 10.5, color: Color(0xFF64748B))),
            ],
          ),
        ),
        Text(amount, style: const TextStyle(fontSize: 12.5, fontWeight: FontWeight.bold, color: Color(0xFF0F172A))),
      ],
    );
  }
}
