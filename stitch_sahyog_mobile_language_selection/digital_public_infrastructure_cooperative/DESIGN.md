---
name: Digital Public Infrastructure Cooperative
colors:
  surface: '#f8f9ff'
  surface-dim: '#cbdbf5'
  surface-bright: '#f8f9ff'
  surface-container-lowest: '#ffffff'
  surface-container-low: '#eff4ff'
  surface-container: '#e5eeff'
  surface-container-high: '#dce9ff'
  surface-container-highest: '#d3e4fe'
  on-surface: '#0b1c30'
  on-surface-variant: '#42474e'
  inverse-surface: '#213145'
  inverse-on-surface: '#eaf1ff'
  outline: '#73777f'
  outline-variant: '#c2c7cf'
  surface-tint: '#3d6185'
  primary: '#123B5D'
  on-primary: '#ffffff'
  primary-container: '#002541'
  on-primary-container: '#82a5cd'
  inverse-primary: '#a6caf3'
  secondary: '#087443'
  on-secondary: '#ffffff'
  secondary-container: '#97f3b6'
  on-secondary-container: '#027241'
  tertiary: '#F59B18'
  on-tertiary: '#ffffff'
  tertiary-container: '#543100'
  on-tertiary-container: '#e68f00'
  error: '#ba1a1a'
  on-error: '#ffffff'
  error-container: '#ffdad6'
  on-error-container: '#93000a'
  primary-fixed: '#d0e4ff'
  primary-fixed-dim: '#a6caf3'
  on-primary-fixed: '#001d34'
  on-primary-fixed-variant: '#24496c'
  secondary-fixed: '#99f6b9'
  secondary-fixed-dim: '#7ed99e'
  on-secondary-fixed: '#00210f'
  on-secondary-fixed-variant: '#00522d'
  tertiary-fixed: '#ffddba'
  tertiary-fixed-dim: '#ffb867'
  on-tertiary-fixed: '#2b1700'
  on-tertiary-fixed-variant: '#673d00'
  background: '#f8f9ff'
  on-background: '#0b1c30'
  surface-variant: '#d3e4fe'
  surface-canvas: '#F8FAFC'
  surface-card: '#FFFFFF'
  text-primary: '#17212B'
  text-secondary: '#64748B'
  border-subtle: '#E2E8F0'
  status-success: '#15803D'
  status-warning: '#B45309'
  status-error: '#DC2626'
  status-info: '#2563EB'
typography:
  display-lg:
    fontFamily: Inter
    fontSize: 40px
    fontWeight: '700'
    lineHeight: 48px
    letterSpacing: -0.02em
  display-lg-mobile:
    fontFamily: Inter
    fontSize: 32px
    fontWeight: '700'
    lineHeight: 40px
    letterSpacing: -0.01em
  headline-lg:
    fontFamily: Inter
    fontSize: 28px
    fontWeight: '700'
    lineHeight: 36px
    letterSpacing: -0.01em
  headline-md:
    fontFamily: Inter
    fontSize: 22px
    fontWeight: '600'
    lineHeight: 28px
  headline-sm:
    fontFamily: Inter
    fontSize: 18px
    fontWeight: '600'
    lineHeight: 24px
  kpi-stat:
    fontFamily: Inter
    fontSize: 32px
    fontWeight: '700'
    lineHeight: 36px
  body-lg:
    fontFamily: Inter
    fontSize: 16px
    fontWeight: '500'
    lineHeight: 24px
  body-md:
    fontFamily: Inter
    fontSize: 15px
    fontWeight: '400'
    lineHeight: 22px
  body-sm:
    fontFamily: Inter
    fontSize: 13px
    fontWeight: '400'
    lineHeight: 18px
  label-lg:
    fontFamily: Inter
    fontSize: 14px
    fontWeight: '600'
    lineHeight: 20px
  label-md:
    fontFamily: Inter
    fontSize: 12px
    fontWeight: '600'
    lineHeight: 16px
    letterSpacing: 0.02em
  label-sm:
    fontFamily: Inter
    fontSize: 11px
    fontWeight: '500'
    lineHeight: 14px
    letterSpacing: 0.03em
rounded:
  sm: 0.25rem
  DEFAULT: 0.5rem
  md: 0.5rem
  lg: 0.75rem
  xl: 1rem
  full: 9999px
spacing:
  gutter: 1rem
  gutter-desktop: 1.5rem
  margin: 1rem
  margin-tablet: 1.5rem
  margin-desktop: 2rem
  space-xs: 0.25rem
  space-sm: 0.5rem
  space-md: 1rem
  space-lg: 1.5rem
  space-xl: 2rem
  space-2xl: 3rem
---

## Brand & Style

This design system embodies modern civic infrastructure merged with high-reliability enterprise SaaS. It serves four distinct stakeholders: gig workers, cooperatives, institutional buyers, and households. The visual tone balances institutional trust, grassroots warmth, and uncompromised digital accessibility.

The core guiding principle is: *"Don't make the worker learn the technology. Make the technology adapt to the worker."*

### Design Philosophy
- **Digital Public Infrastructure (DPI) Credibility:** Grounded, unpretentious, dependable, and legible. The design prioritizes immediate clarity, high tactile affordance, and clear institutional authority over flashy trends.
- **Warm Civic Inclusivity:** Utilizing deep navy to communicate institutional stability, paired with cooperative emerald green and energetic saffron accents that reflect collective progress and mutual empowerment.
- **Pragmatic Utility over Sci-Fi:** Absolute elimination of neon effects, dark glassmorphism, decorative gradients, or theatrical AI flourishes. Predictive features, matching metrics, and AI recommendations are rendered plainly as functional decision-support cards with clear confidence ratings.
- **Multilingual & High-Affordance Design:** Designed from the ground up for full English and Devanagari parity, accommodating variable word lengths, comfortable tap zones (minimum 48px), and paired icon-label patterns suited to varying literacy levels.

## Colors

The color palette is deliberately calibrated to evoke national public utility standards and grounded cooperative movements:

- **Primary Navy (`#123B5D`):** Represents institutional structure, trust, and enterprise solidity. Used for primary interactive actions, high-level navigation chrome, header titles, and core operational controls.
- **Secondary Cooperative Green (`#087443`):** Represents collective prosperity, cooperative-level actions, verified status affirmations, and accepted assignments. Used heavily in cooperative workflows and positive status affirmations.
- **Tertiary Saffron (`#F59B18`):** Serves as an intentional attention-directing accent for pending tasks, alerts, highlighted milestones, and urgent callouts without conveying an error state.
- **Neutral Charcoal & Slate (`#17212B` / `#64748B`):** Provides sharp, accessible text contrast against `#F8FAFC` and white containers, exceeding WCAG AAA standards for body and label text.
- **System Borders (`#E2E8F0`):** Defines clean card boundaries, table dividers, and structural scaffolding without visual weight.

Colors must never be used as the sole indicator of system states; every color cue is accompanied by explicit text badges or semantic icons.

## Typography

The typographic hierarchy prioritizes rapid scannability and cross-language harmony between English (Inter) and Hindi (Noto Sans Devanagari).

### Hierarchy and Pairing Rules
- **Font Stack:** Standard Latin text renders in `Inter, system-ui, -apple-system, sans-serif`. Devanagari text defaults seamlessly to `Noto Sans Devanagari, Inter, sans-serif` to ensure equivalent vertical metrics and optical weight.
- **Devanagari Line Heights:** Hindi glyphs feature ascenders, descenders, and matras that demand ample vertical clearance. When Hindi text is active, body line heights should be expanded by 10–15% to avoid clipping and visual density fatigue.
- **KPI Figures:** Key operational metrics (daily wages, open cooperative orders, verification counters) use `kpi-stat` in Bold weight (`700`) paired with secondary labels beneath.
- **Clarity in Action Labels:** Actionable controls, chips, and table headers are set in medium-to-semibold weights to maintain readability under direct sunlight and outdoor field conditions.

## Layout & Spacing

The layout is built on a responsive 4px/8px modular scale, optimized for responsive switching between high-density operational desks and thumb-driven handheld worker views.

### Grid & Viewport Model
- **Worker & Household (Mobile-First):** Uses a single fluid column container bounded by a 480px maximum content width on wider screens. Lateral screen margins are set to `1rem` (`16px`) to maximize horizontal real estate on compact 360px–390px mobile screens.
- **Cooperative & Institution (Desktop Operations):** Utilizes a structured 12-column layout with a fixed 260px administrative left navigation sidebar, 24px column gutters, and 32px viewport margins.
- **Touch Affirmation:** All touch points on mobile workflows have a mandatory minimum height and width of `48px`, surrounded by `space-sm` (`8px`) tap clearance.
- **Rhythm Rules:** Inside surface cards, standard vertical cadence uses `space-md` (`16px`) between logical groups and `space-xs` (`4px`) between labels and related input values.

## Elevation & Depth

This design system deliberately rejects heavy, diffuse, or dramatic shadows in favor of a clean, structured visual hierarchy that performs well across low-end mobile LCD screens and high-resolution desktop monitors.

### Hierarchy & Layers
1. **Canvas Layer (`#F8FAFC`):** The foundational backdrop for the entire viewport.
2. **Structural Surfaces (`#FFFFFF`):** Work surfaces, dashboard panels, and modular cards. Elevated purely through a crisp `1px solid #E2E8F0` border and an ultra-subtle ambient shadow:
   `box-shadow: 0 1px 3px 0 rgba(18, 59, 93, 0.04), 0 1px 2px -1px rgba(18, 59, 93, 0.02);`
3. **Interactive Hover & Dragged Cards:** Upon hover or touch focus, cards elevate slightly using:
   `box-shadow: 0 4px 6px -1px rgba(18, 59, 93, 0.07), 0 2px 4px -2px rgba(18, 59, 93, 0.05);` with the border shifting to `#CBD5E1`.
4. **Floating Sheets & Modals:** Bottom action sheets on mobile devices and dialog modals use an elevation shadow of:
   `box-shadow: 0 20px 25px -5px rgba(18, 59, 93, 0.1), 0 8px 10px -6px rgba(18, 59, 93, 0.06);` accompanied by a 40% opacity `#17212B` backdrop overlay.

## Shapes

The shape system employs balanced geometry that avoids severe industrial sharpness while steering clear of overly playful bubbly forms.

- **Standard Cards & Modal Surfaces:** Standardized at `12px` to `16px` border radius (`rounded-lg` to `rounded-xl`). This provides approachable framing for tabular data, job offers, and skill passport modules.
- **Interactive Controls (Buttons, Inputs, Dropdowns):** Calibrated to `8px` to `10px` (`rounded-md`), ensuring clean integration with system form fields and maintaining a professional SaaS appearance.
- **Badges, Status Chips, & Avatars:** Fully rounded pill-shapes (`9999px`) for badges and user role identifiers, creating an immediate distinction from rectangular card surfaces.
- **Selection Controls:** Checkboxes use a crisp `4px` corner radius; radio buttons are circular.

## Components

### Buttons
- **Primary Navy Action:** Background `#123B5D`, text `#FFFFFF`, border-radius `8px`, min-height `48px` on mobile (`40px` on desktop). Focus ring: `2px solid #087443` with 2px offset.
- **Cooperative Action (Accept, Allocate, Verify):** Background `#087443`, text `#FFFFFF`. Used strictly for positive operational state changes and cooperative-led workflows.
- **Secondary Action:** Transparent background with `1.5px solid #123B5D`, text `#123B5D`.
- **Tertiary / Ghost:** Transparent background, text `#64748B`, hover text `#123B5D` with `#F1F5F9` background fill.

### Cards & Decision-Support Panels
- **Standard Card:** Background `#FFFFFF`, border `1px solid #E2E8F0`, corner radius `12px`, padding `16px` (mobile) to `24px` (desktop).
- **AI Decision & Demand Forecasting Card:** White card with a top border accent: `3px solid #087443` (for positive matches) or `#F59B18` (for demand forecasts). Contains structured label-value metadata, a plain percentage match score badge (e.g., "94% Match"), and clear plain-language rationale without decorative iconography.

### Form Inputs & Selectors
- **Input Fields:** Minimum height `48px`, background `#FFFFFF`, border `1px solid #E2E8F0`, radius `8px`, text `#17212B`, placeholder `#64748B` (achieves ≥ 4.5:1 contrast for normal text).
- **Active Focus:** Border transitions to `1.5px solid #123B5D` with an ambient glow of `rgba(18, 59, 93, 0.1)`.
- **Language Switcher (Persistent):** Fixed pill selector (English | हिन्दी) visible on top navigation bars, utilizing an active segment fill in `#123B5D` with white text.

### Verification & Skill Passport Badges
- **e-Shram / Trust Status:** Pill badge with an icon and explicit text: "Consent-Based Verification" or "Pending Cooperative Attestation". Green tint (`#F0FDF4` background, `#15803D` text achieving ≥ 4.5:1 contrast, `#BBF7D0` border).
- **Warning / Action Required:** `#FFFBEB` background, `#B45309` text achieving ≥ 4.5:1 contrast, `#FDE68A` border.

### Navigation Architecture
- **Worker Navigation:** Fixed bottom navigation bar with 4-5 high-frequency touch destinations (Jobs, Passport, Earnings, Cooperative), featuring `24px` icons paired with 11px font labels.
- **Cooperative & Institution Hub:** Left-aligned 260px administrative navigation drawer with high-contrast active states, grouped by operations, worker rosters, and demand exchanges.