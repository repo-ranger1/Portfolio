# Portfolio — Gautam Manwani

A sophisticated Flutter web portfolio showcasing high-performance mobile applications and digital craftsmanship. Built with an elegant royal theme featuring deep backgrounds, gold accents, and custom animations.

**Live Portfolio**: [https://gautammanwani.vercel.app/]

## Overview

This portfolio represents a curated collection of production-ready mobile applications spanning healthcare, creative tools, and enterprise solutions. Each project demonstrates expertise in Flutter development, clean architecture, and user-centric design.

### Key Features

- **Royal Luxury Theme**: Editorial-inspired design with deep obsidian backgrounds and brass/gold accents
- **Responsive Design**: Seamless experience across mobile, tablet, and desktop
- **Custom Animations**: Smooth transitions, floating elements, and gesture-driven interactions
- **Performance Optimized**: Built with Flutter web for fast loading and smooth scrolling
- **Clean Architecture**: Modular codebase with clear separation of concerns

## Technology Stack

### Core Framework
- **Flutter 3.6+**: Cross-platform UI framework
- **Dart**: Primary programming language

### State Management & Architecture
- **flutter_bloc (^9.1.1)**: BLoC pattern for state management
- **Clean Architecture**: Domain-driven design with clear layer separation
- **Dependency Injection**: Custom injector pattern

### UI & Design
- **Google Fonts (^6.2.1)**: Typography system
- **Custom Fonts**: PlayFair Display, Boska, Rowan, Melodrama, Britney, Quilon
- **Lottie (^3.3.1)**: Complex animations
- **animated_text_kit (^4.2.2)**: Text animations
- **flutter_svg (^2.2.3)**: SVG rendering
- **responsive_builder (^0.7.1)**: Responsive layouts

### Utilities
- **url_launcher (^6.3.1)**: External links and deep linking
- **shared_preferences (^2.5.3)**: Local storage
- **intl (^0.20.2)**: Internationalization support

## Design System

### Royal Theme Color Palette

```dart
Primary Colors (Gold/Brass):
- Gold: #C9A86C
- Gold Light: #E8D5B7
- Gold Dark: #8B7355
- Accent: #D4AF37

Backgrounds:
- Obsidian: #0A0A0A (primary dark)
- Charcoal: #1A1A1A
- Smoke: #2A2A2A
- Cream: #FAF7F2

Text:
- Primary: Cream (#FAF7F2)
- Secondary/Mist: #888888
```

### Typography
- **Headings**: Playfair Display (serif, elegant)
- **Body**: Google Fonts (Outfit, Cormorant Garamond)
- **Accent**: Custom fonts for distinctive styling

## Project Structure

```
lib/
├── app.dart                    # Main app configuration
├── main.dart                   # Entry point
├── dependency_injector.dart    # DI setup
│
├── common/                     # Shared widgets
│   └── widgets/
│       ├── circular_text_animator.dart
│       ├── cursor_follower.dart
│       ├── cyclic_text.dart
│       ├── hover_underline_text.dart
│       ├── hover_zoom_image.dart
│       ├── marquee_text.dart
│       └── skills_marquee.dart
│
├── core/                       # Core utilities
│   ├── constants/              # App-wide constants
│   │   ├── asset_constants.dart
│   │   ├── key_constants.dart
│   │   ├── padding_constants.dart
│   │   ├── parameter_constants.dart
│   │   ├── size_constants.dart
│   │   └── string_constants.dart
│   ├── extensions/             # Dart extensions
│   │   ├── context_extensions.dart
│   │   ├── date_extensions.dart
│   │   ├── string_exntesion.dart
│   │   └── widget_extensions.dart
│   └── utils/                  # Utility classes
│       ├── app/
│       │   ├── app_color.dart
│       │   ├── app_color_royal.dart
│       │   ├── app_fonts.dart
│       │   ├── app_injector.dart
│       │   ├── app_lifecycle.dart
│       │   ├── app_routes.dart
│       │   ├── app_state.dart
│       │   └── app_theme.dart
│       ├── device/
│       │   └── device_config.dart
│       ├── responsive/
│       │   └── responsive_utils.dart
│       └── storage/
│           ├── local_storage/
│           └── session_storage.dart
│
├── domain/                     # Domain layer
│   └── entities/
│       └── module_entity.dart
│
└── presentation/               # UI layer
    ├── config/                 # App configuration
    │   ├── config.dart
    │   └── config_cubit.dart
    ├── home/                   # Landing & home
    │   ├── home.dart
    │   ├── landing.dart
    │   ├── landing_royal.dart
    │   └── widgets/
    │       ├── footer.dart
    │       └── header.dart
    ├── work/                   # Projects showcase
    │   ├── work.dart
    │   ├── work_royal.dart
    │   ├── work_royal_v2.dart
    │   └── widgets/
    │       └── project_page.dart
    ├── profile/                # About & philosophy
    │   ├── experience.dart
    │   ├── experience_royal.dart
    │   ├── profile.dart
    │   └── profile_royal.dart
    └── contact/                # Contact section
        ├── contact.dart
        ├── contact_royal.dart
        └── widgets/
            └── media_links.dart
```

## Featured Projects

### Healthcare Solutions
1. **IMSGo** - Mobile EHR with AI-powered ambient scribing
2. **IMS Care** - Patient portal with telemedicine and QR check-ins
3. **Doses Delivery** - Last-mile healthcare logistics platform
4. **MyDoses** - Medication management ecosystem

[//]: # (5. **Cataract AI** - AI-powered cataract detection system)

### Creative & Enterprise
1. **MasterPiece Studio** - Visual art browsing with immersive viewing modes

[//]: # (7. **ShowItMax** - Enterprise media presentation platform)

## Getting Started

### Prerequisites
- Flutter SDK 3.6.0 or higher
- Dart SDK >=3.6.0 <4.0.0

### Installation

1. Clone the repository
```bash
git clone https://github.com/yourusername/portfolio.git
cd portfolio
```

2. Install dependencies
```bash
flutter pub get
```

3. Run the development server
```bash
flutter run -d chrome
```

### Build for Production

```bash
# Web
flutter build web --release

# The output will be in build/web/
```

## Configuration

### Theme Customization
The portfolio uses the Royal theme by default. Theme colors are defined in:
- `lib/core/utils/app/app_color_royal.dart`
- `lib/core/utils/app/app_theme.dart`

### Content Updates
All content strings are centralized in:
- `lib/core/constants/string_constants.dart`

Update this file to modify:
- Personal information
- Project descriptions
- Work experience
- Contact details

## Assets

### Fonts
- PlayFair Display (serif headings)
- Boska, Rowan, Melodrama (display fonts)
- Inter (clean sans-serif)
- OldEnglish, Britney, Quilon (specialty fonts)

### Images & Icons
- Project screenshots: `assets/ss/`
- Project images: `assets/images/`
- SVG icons: `assets/svg/`
- Lottie animations: `assets/lottie/`

## Architecture

The project follows Clean Architecture principles:

- **Presentation Layer**: UI components, widgets, and state management
- **Domain Layer**: Business entities and use cases
- **Core Layer**: Utilities, constants, and extensions

### State Management
- BLoC pattern for complex state
- Local storage for theme persistence
- Dependency injection for loose coupling

## Performance Optimizations

- Lazy loading of images
- Optimized animations with `AnimatedBuilder`
- Responsive utilities for device-specific rendering
- Minimal dependencies for faster load times

## Browser Support

- Chrome (recommended)
- Firefox
- Safari
- Edge

## Contact & Links

- **Email**: gautammanwani04@gmail.com
- **LinkedIn**: [gautam-manwani](https://www.linkedin.com/in/gautam-manwani-462495230/)
- **Medium**: [@gautam007](http://gautam007.medium.com)
- **Stack Overflow**: [Pixel](https://stackoverflow.com/users/21977414/pixel)
- **Resume**: [View Resume](https://docs.google.com/document/d/1krm-_wcuDGapzvUqhy8eWsbKzKGj_og7gwKaEpkxKxU/edit?usp=drive_link)

## Skills Showcased

Flutter • Dart • Clean Architecture • React Native • Custom Animations • REST APIs • Firebase • Problem Solving • State Management • Performance Optimization

## License

This project is proprietary and confidential. All rights reserved.

---

**Crafted with intention. Built with passion. In Flutter.**

© 2026 Gautam Manwani