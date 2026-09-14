# 🤝 SAHYOG (सहयोग) | KaamSaathi

> **India's Digital Public Infrastructure (DPI) for Cooperative & Informal Workforce Enablement**  
> *Connecting Blue-Collar Workers, Labor Cooperatives (PACS/LAMPS), Institutional Employers, and Households through Verifiable Digital Rails.*

[![Flutter](https://img.shields.io/badge/Flutter-3.x-02569B?style=for-the-badge&logo=flutter&logoColor=white)](https://flutter.dev)
[![Dart](https://img.shields.io/badge/Dart-3.x-0175C2?style=for-the-badge&logo=dart&logoColor=white)](https://dart.dev)
[![Platform](https://img.shields.io/badge/Platform-Android-3DDC84?style=for-the-badge&logo=android&logoColor=white)](https://github.com/Rishusingh18/KaamSaathi/releases)
[![Languages](https://img.shields.io/badge/Languages-11%20Indian%20Languages-FF9933?style=for-the-badge)](lib/utils/localization.dart)
[![License](https://img.shields.io/badge/License-MIT-blue.svg?style=for-the-badge)](LICENSE)

---

## 📲 Download the App (Android APK)

You can download the ready-to-install Android Release APK directly from the GitHub Releases:

👉 **[Download Latest SAHYOG Release APK (v1.0.0)](https://github.com/Rishusingh18/KaamSaathi/releases/latest)**

### How to Install:
1. Download `app-release.apk` to your Android device from the link above.
2. Tap the downloaded file in your browser or file manager.
3. If prompted, toggle **"Allow installation from this source"**.
4. Tap **Install** and launch **SAHYOG / KaamSaathi**.

---

## 🌟 Executive Summary & Vision

India's informal labor ecosystem encompasses over **450+ million workers** across construction, civil maintenance, agriculture, trades, and domestic assistance. Despite being the backbone of the economy, these workers and small labor cooperatives (PACS/LAMPS) face severe structural challenges:
- **Middleman Commission Gouging**: Unregistered labor contractors capture 20%–40% of worker earnings.
- **Absence of Portable Credentials**: A skilled mason or electrician has no formal, digitally verifiable proof of past completed jobs or verified trades.
- **Payment Insecurity & Delays**: Wage theft, delayed disbursements, and lack of transparent escrow accounts.
- **Underutilized Cooperatives**: Labor cooperatives lack a modern digital interface to discover institutional demand and pool workforce across regional units.

**SAHYOG (सहयोग)** bridges these gaps by constructing a unified **Digital Public Infrastructure (DPI)** rail that democratizes workforce discovery, transparent escrow wage settlements, portable skill passports, and cross-cooperative labor exchange.

---

## 🏛️ The Four Core Personas

SAHYOG provides dedicated, tailored user experiences for all stakeholders:

```
                          ┌───────────────────────────┐
                          │       SAHYOG PLATFORM      │
                          │   Digital Public Infra    │
                          └─────────────┬─────────────┘
                                        │
        ┌───────────────────┬───────────┴───────────┬───────────────────┐
        ▼                   ▼                       ▼                   ▼
┌──────────────┐    ┌──────────────┐        ┌──────────────┐    ┌──────────────┐
│  👷 WORKER   │    │ 🤝 SOCIETY   │        │ 🏢 INSTITUTION│   │ 🏠 HOUSEHOLD │
│  - Passport  │    │  - Exchange  │        │  - Bulk Jobs │    │  - On-Demand │
│  - QR ID     │    │  - Demand    │        │  - Invoicing │    │  - Verified  │
│  - Escrow    │    │  - Roster    │        │  - GST Audit │    │  - Live Track│
└──────────────┘    └──────────────┘        └──────────────┘    └──────────────┘
```

### 1. 👷 Worker Persona (`WorkerLayout`)
- **Digital Skill Passport**: Cryptographically signed, QR-verifiable skill records, certifications, past project completion badges, and government database linkages (e-Shram, Skill India).
- **Daily Attendance & Escrow Settlements**: Transparent tracking of worked mandays, daily wages (e.g. ₹750/day), overtime, and direct escrow payouts without contractor leakage.
- **One-Tap Shift Acceptance**: Simple, card-based interface for receiving and accepting localized work requests.
- **Inclusive Accessibility**: Full speech/vernacular text support across 11 Indian languages designed for low-literacy users.

### 2. 🤝 Cooperative Society & Contractor Persona (`MainLayout`)
- **Demand Matching & Allocation**: Intelligent matching of incoming enterprise and civil project tenders with available registered cooperative workers.
- **Cooperative Exchange (Inter-Society Sharing)**: Dynamic sharing of surplus or specialist labor pools between neighboring cooperatives, preventing downtime and worker underemployment.
- **AI Workforce Insights**: Predictive labor demand curves, regional wage benchmarks, seasonal availability, and skill gap forecasting.
- **Roster & Safety Management**: Verification badges, equipment allocation kits (safety harness, mixers, gear), and welfare compliance.

### 3. 🏢 Institution & Enterprise Persona (`/institution/`)
- **Institutional Procurement**: Seamless procurement of verified workforce for colleges, municipal bodies, hospitals, and infrastructure developers.
- **Digital Tax & Compliance Invoices**: Automated generation of official digital invoices (e.g., `#SHY-INST-2026-089`) featuring cooperative registration numbers, GSTIN, itemized breakdowns (labor mandays, equipment hire, platform settlement fees), and offline PDF export.
- **Verified DPI Audit Trail**: Direct verification links anchored to the National Cooperative Database.

### 4. 🏠 Household & Domestic Client Persona (`/household/`)
- **On-Demand Domestic Services**: Instant booking for verified plumbers, electricians, painters, carpenters, cleaners, and home attendants.
- **Trust & Background Checks**: Display of police-cleared, cooperative-verified identities and transparent standardized rates.
- **End-to-End Tracking**: Live service tracking, OTP-based job completion confirmation, in-app invoice generation, and rating/feedback.

---

## 🇮🇳 Multilingual Vernacular Support

SAHYOG is built ground-up for India with dynamic, zero-restart runtime localization supporting **11 official languages**:

| Language | Script | Code | Language | Script | Code |
|:---|:---|:---|:---|:---|:---|
| **English** | Latin | `en` | **ગુજરાતી (Gujarati)** | Gujarati | `gu` |
| **हिंदी (Hindi)** | Devanagari | `hi` | **ಕನ್ನಡ (Kannada)** | Kannada | `kn` |
| **বাংলা (Bengali)** | Bengali | `bn` | **മലയാളം (Malayalam)** | Malayalam | `ml` |
| **తెలుగు (Telugu)** | Telugu | `te` | **ਪੰਜਾਬੀ (Punjabi)** | Gurmukhi | `pa` |
| **தமிழ் (Tamil)** | Tamil | `ta` | **ଓଡ଼ିଆ (Odia)** | Odia | `or` |
| **मराठी (Marathi)** | Devanagari | `mr` | | | |

*Localization state is managed via dynamic `ValueNotifier<String>` in `AppLocalization`, instantly updating all screens.*

---

## 🛠️ Technology Stack

- **Framework**: [Flutter 3.x](https://flutter.dev) (Dart 3.x)
- **Design System**: Tailored Government / DPI Design System inspired by India Digital Public Infrastructure (Clean Slate, Slate Blue `#123B5D`, Emerald `#087443`, Coral `#E05A47`, and neutral shades `#0F172A`, `#F8FAFC`).
- **Typography**: [Google Fonts (Inter)](https://fonts.google.com/specimen/Inter) with dynamic typography scale.
- **Vector Assets & Icons**: `flutter_svg`, Cupertino Icons, and Material Icons.
- **State Management**: Reactive `ValueNotifier`, `StatefulWidget` lifecycle, and granular localized rebuild builders.
- **Local Storage & File I/O**: `dart:io` cross-platform temporary directory management and binary byte stream writing (`writeAsBytes`).
- **Build Targets**: Android (APK, App Bundle), iOS, Web prototype.

---

## 📁 Project Architecture & Screen Directory

```
lib/
├── main.dart                                    # App Entrypoint & Route Config
├── theme/
│   └── app_theme.dart                           # Custom DPI Color Palette & Typographic System
├── utils/
│   └── localization.dart                        # 11-Language Localization Engine
├── widgets/
│   ├── action_card.dart                         # Interactive Dashboard Card
│   ├── custom_buttons.dart                      # Primary & Outlined DPI Buttons
│   ├── household_account_modal.dart             # Household Profile & Switcher Modal
│   └── status_badge.dart                        # Status & Verification Chip
└── screens/
    ├── role_selection_screen.dart               # Gateway: Choose Worker / Society / Institution / Household
    ├── language_selection_screen.dart           # Language Selector (11 Indian Languages)
    ├── login_options_screen.dart                # Phone / Aadhaar / OTP Auth Screen
    ├── otp_screen.dart                          # 6-Digit OTP Verification Screen
    │
    │── 👷 WORKER SCREENS
    │   ├── worker_main_layout.dart              # Worker Bottom Navigation Shell
    │   ├── worker_dashboard_screen.dart         # Worker Dashboard & Earnings Card
    │   ├── worker_skill_passport_tab.dart       # QR Skill Passport & Trade Badges
    │   ├── worker_details_screen.dart           # Worker Bio & Verified History
    │   ├── worker_registration_screen.dart      # e-KYC & Trade Registration
    │   ├── worker_verification_screen.dart      # Identity & Document Upload
    │   ├── worker_assignment_screen.dart        # Active Assignment & Shift Details
    │   ├── worker_notifications_screen.dart     # Shift Dispatch & Alert Inbox
    │   └── worker_welfare_screen.dart           # Insurance & Cooperative Benefits
    │
    │── 🤝 COOPERATIVE & CONTRACTOR SCREENS
    │   ├── main_layout.dart                     # Cooperative Bottom Navigation Shell
    │   ├── dashboard_screen.dart                # Cooperative HQ Overview & Stats
    │   ├── cooperative_exchange_screen.dart     # Inter-Society Workforce Pooling
    │   ├── ai_insights_screen.dart              # Predictive Demand & Rate Benchmark
    │   ├── workers_screen.dart                  # Member Directory & Roster
    │   ├── requests_screen.dart                 # Demand Tenders & Incoming Requests
    │   ├── request_details_screen.dart          # Project Scope & Allocation
    │   ├── projects_screen.dart                 # Active Works & Progress
    │   └── profile_screen.dart                  # Society Registration & Compliance
    │
    │── 🏢 INSTITUTION SCREENS (`lib/screens/institution/`)
    │   ├── institution_choose_workforce_screen.dart # Worker & Cluster Selection
    │   ├── institution_matching_workforce_screen.dart # Real-time Match Algorithm
    │   ├── institution_invoice_screen.dart      # Official Digital GST Invoice & PDF Export
    │   └── institution_request_flow.dart        # Tender & Work-Order Lifecycle
    │
    └── 🏠 HOUSEHOLD SCREENS
        ├── household_welcome_screen.dart        # On-Demand Service Discovery Landing
        ├── household_login_screen.dart          # Rapid Phone Login for Residents
        ├── household_registration_screen.dart   # Resident Profile Setup
        ├── household_dashboard_screen.dart      # Category Booking (Plumbing, Masonry, etc.)
        ├── household_service_request_screen.dart# Job Scope, Scheduling & Address
        ├── household_service_method_screen.dart # Instant Dispatch vs Scheduled Match
        ├── household_recommended_matches_screen.dart # Top-Rated Nearby Workers
        ├── household_track_service_screen.dart  # Live Job Tracking & Arrival Status
        ├── household_service_completion_screen.dart # OTP Verification & Feedback
        ├── household_invoice_screen.dart        # Resident Digital Bill & Payment
        └── household_history_screen.dart        # Booking History & Past Records
```

---

## 🚀 Getting Started for Developers

### Prerequisites
- [Flutter SDK](https://docs.flutter.dev/get-started/install) (`>= 3.13.3`)
- [Android Studio](https://developer.android.com/studio) / Android SDK (`API 34+`)
- [Dart SDK](https://dart.dev/get-dart) (`>= 3.1.0`)

### Installation & Run

1. **Clone the repository:**
   ```bash
   git clone https://github.com/Rishusingh18/KaamSaathi.git
   cd KaamSaathi
   ```

2. **Fetch dependencies:**
   ```bash
   flutter pub get
   ```

3. **Validate environment & analyze code:**
   ```bash
   flutter analyze lib/
   ```

4. **Launch on connected device or emulator:**
   ```bash
   flutter run
   ```

### Building the Release APK

To create an optimized, signed release APK:
```bash
flutter build apk --release
```
The resulting binary will be located at:
```
build/app/outputs/flutter-apk/app-release.apk
```

To create architecture-specific split APKs (smaller file size):
```bash
flutter build apk --split-per-abi
```

---

## 🔒 Security, Trust & Compliance

- **Aadhaar & DigiLocker Compliance**: No raw identity data is stored locally. Verification utilizes one-time cryptographic tokens and QR hashing.
- **Escrow-Protected Wage Payments**: Wages are safeguarded under UPI / NPCI escrow until work milestones are verified.
- **Fair Wage Guarantee**: Benchmarked to national minimum wage advisories per trade category.
- **Offline Reliability**: Invoices and credentials can be downloaded and stored locally for offline presentation in rural or remote project sites.

---

## 🤝 Contributing

Contributions to empower India's informal workforce are welcome!
1. Fork the repository.
2. Create your feature branch (`git checkout -b feature/AmazingFeature`).
3. Commit your changes (`git commit -m 'feat: Add AmazingFeature'`).
4. Push to the branch (`git push origin feature/AmazingFeature`).
5. Open a Pull Request.

---

## 📄 License

Distributed under the **MIT License**. See `LICENSE` for details.

---

<div align="center">
  <sub>Built with ❤️ for India's Cooperative & Informal Workforce.</sub><br/>
  <b>SAHYOG — Empowering Every Hand that Builds the Nation.</b>
</div>
