## Project Overview
- **App name:** DClone Tracker
- **Purpose:** This application tracks the progress of the Diablo 2: Resurrected Diablo Clone (DC) event and the current/upcoming Terror Zones across different game regions and ladders.
- **Core functionality:** Displays Diablo Clone progress, lists current and upcoming Terror Zones, and shows recent Terror Zone history.
- **Target platforms:** Mobile (iOS, Android), Web, Desktop (Windows, macOS, Linux).
- **Original user request:** The user wants a mobile application that tracks the progress of the Diablo Clone event and lists current/upcoming Terror Zones in Diablo 2: Resurrected.

## Dependency Management
- **UI & Theming:**
    - `flutter_svg`: For rendering Scalable Vector Graphics.
    - `google_fonts`: To use custom fonts like Cinzel and Crimson Text.
    - `flex_color_scheme`: For flexible and Material 3 compliant theming.
    - `flutter_animate`: For declarative animations.
    - `loading_animation_widget`: For various loading animations.
    - `flutter_staggered_grid_view`: For staggered grid layouts.
    - `animations`: For a collection of animation utilities.
    - `flutter_spinkit`: For loading spinners.
    - `cached_network_image`: For efficient loading and caching of network images.
    - `fl_chart`: For creating charts and graphs.
    - `shimmer_animation`: For shimmer effect placeholders.
    - `responsive_framework`: To build responsive layouts easily.
    - `table_calendar`: For displaying calendars.
    - `carousel_slider`: For image carousels.
- **State Management:**
    - `provider`: For dependency injection and state management.
    - `flutter_bloc`: For managing application state using the BLoC pattern.
    - `equatable`: To easily compare objects, especially for state equality.
    - `collection`: For efficient collection operations.
    - `async`: For asynchronous programming utilities.
- **Networking:**
    - `dio`: For making HTTP requests.
    - `http`: For basic HTTP requests.
    - `http_parser`: For parsing HTTP-related data.
- **Navigation:**
    - `go_router`: For declarative routing and navigation.
- **Data Persistence:**
    - `shared_preferences`: For storing simple key-value data.
    - `path_provider`: To find commonly used locations on the filesystem.
    - `flutter_secure_storage`: For securely storing sensitive data.
- **Utilities:**
    - `url_launcher`: To launch URLs in external applications.
    - `connectivity_plus`: To check network connectivity status.
    - `awesome_notifications`: For creating rich local notifications.
    - `wakelock_plus`: To keep the device screen on.
    - `path`: For file path manipulation.
    - `intl`: For internationalization and localization, including date formatting.
    - `uuid`: For generating universally unique identifiers.
    - `vector_math`: For vector and matrix operations.
    - `crypto`: For cryptographic operations.
    - `mime`: For MIME type detection.
    - `archive`: For archive file manipulation.
    - `package_info_plus`: To get information about the application package.
- **Dependency Injection:**
    - `get_it`: A simple service locator for Flutter.
- **Media:**
    - `image`: For image processing.
    - `video_player`: For playing video content.

## Architecture Summary
- **State management approach:** Provider for dependency injection and `ChangeNotifierProvider` for managing `TrackerProvider`. `flutter_bloc` is listed as a dependency but not actively used in the provided code.
- **Navigation strategy:** `go_router` is used for declarative routing, including `StatefulShellRoute` for managing nested navigation and bottom navigation bars.
- **Major architectural patterns:** Provider pattern for state management and dependency injection, Service Layer pattern for data fetching/logic (`TrackerService`).
- **Data persistence mechanisms:** `shared_preferences`, `path_provider`, and `flutter_secure_storage` are included, but not utilized in the provided code snippets.
- **Key architectural decisions:**
    - Use of `go_router` for robust navigation.
    - Separation of concerns with `Provider` and `Service` classes.
    - Custom theming to match a specific aesthetic.

## File Structure
```
├── pubspec.yaml
├── android/
│   └── app/
│       ├── build.gradle.kts
│       └── src/
│           └── main/
│               └── AndroidManifest.xml
├── lib/
│   ├── models/
│   │   ├── dclone_status.dart
│   │   └── terror_zone.dart
│   ├── providers/
│   │   └── tracker_provider.dart
│   ├── router/
│   │   └── app_router.dart
│   ├── screens/
│   │   ├── dclone_screen.dart
│   │   ├── home_shell.dart
│   │   └── terror_zone_screen.dart
│   ├── services/
│   │   └── tracker_service.dart
│   ├── theme/
│   │   └── theme.dart
│   ├── widgets/
│   │   ├── common/
│   │   │   ├── d2r_app_bar.dart
│   │   │   ├── d2r_panel.dart
│   │   │   ├── d2r_section_header.dart
│   │   │   └── progress_orb.dart
│   │   ├── dclone/
│   │   │   ├── dclone_card.dart
│   │   │   └── dclone_filter_bar.dart
│   │   └── terror/
│   │       └── terror_zone_card.dart
│   └── main.dart
├── web/
│   ├── index.html
│   ├── manifest.json
│   └── flutter_bootstrap.js
```
- `pubspec.yaml` – Defines project dependencies, metadata, and assets.
- `android/app/build.gradle.kts` – Android app module build configuration (Kotlin DSL): plugins, SDK levels, Kotlin/Java/NDK options, versioning via Flutter values, signingConfigs, and Flutter Gradle plugin.
- `android/app/src/main/AndroidManifest.xml` – Android application manifest, defining essential components, permissions, and hardware features.
- `lib/main.dart` – Application entry point, sets up `MaterialApp.router`, theme, and providers. Includes a comment to trigger web rebuilds.
- `lib/router/app_router.dart` – Configures `go_router` for declarative navigation, defining routes and shell routes.
- `lib/screens/` – Contains the main UI screens of the application.
    - `home_shell.dart`: Provides the overall app structure with an `AppBar` and `NavigationBar`.
    - `dclone_screen.dart`: Displays Diablo Clone progress information.
    - `terror_zone_screen.dart`: Shows current and recent Terror Zones.
- `lib/providers/tracker_provider.dart`: Manages and provides the state for Diablo Clone and Terror Zone data using `ChangeNotifier`.
- `lib/services/tracker_service.dart`: Contains the business logic for fetching and simulating Diablo Clone and Terror Zone data.
- `lib/models/` – Defines data structures for the application.
    - `dclone_status.dart`: Represents the status of a Diablo Clone event.
    - `terror_zone.dart`: Represents a single Terror Zone in the game.
- `lib/theme/theme.dart`: Defines the application's color scheme, typography, and custom `ThemeExtension` for D2R-specific colors.
- `lib/widgets/common/` – Reusable UI components used across the application.
    - `d2r_app_bar.dart`: Custom `AppBar` with a specific design.
    - `d2r_panel.dart`: A styled container for grouping content.
    - `d2r_section_header.dart`: A themed header for sections.
    - `progress_orb.dart`: A visual indicator for Diablo Clone progress.
- `lib/widgets/dclone/` – Widgets specific to the Diablo Clone screen.
    - `dclone_card.dart`: Displays individual Diablo Clone status.
    - `dclone_filter_bar.dart`: A filter and sort panel for DClone data.
- `lib/widgets/terror/` – Widgets specific to the Terror Zone screen.
    - `terror_zone_card.dart`: Displays information about a Terror Zone.
- `web/index.html` – Main HTML file for the web application, including loading indicators and script tags.
- `web/manifest.json` – Web app manifest file, defining app name, icons, and display settings.
- `web/flutter_bootstrap.js` – Script for bootstrapping the Flutter web application.

## UI Components
- **`D2RAppBar`**: Custom `AppBar` with a gradient bottom border and distinct title style.
- **`D2RPanel`**: Container with specific background, border, and shadow for content blocks.
- **`D2RSectionHeader`**: Themed header for content sections with title and decorative lines.
- **`ProgressOrb`**: Animated circular widget displaying progress numerically and visually.
- **`DCloneCard`**: Card displaying Diablo Clone status, ladder type, progress, and update time.
- **`DCloneFilterBar`**: Panel with chip groups for region, mode (HC/SC), and ladder filtering, plus sort options.
- **`TerrorZoneCard`**: Card displaying Terror Zone details in "current" or "compact" views.
- **`NavigationBar`**: Standard Flutter `NavigationBar` for switching between DClone and Terror Zone screens.

## Data Flow
- **UI Interaction → State Update:** User actions trigger `TrackerProvider` updates (filters, sort order).
- **State Update → Data Fetching:** `TrackerProvider` requests data from `TrackerService`.
- **Data Fetching → State Update:** `TrackerService` fetches data, `TrackerProvider` updates its state.
- **State Update → UI Refresh:** Widgets rebuild to reflect new data or loading states.
- **Navigation:** `go_router` manages screen transitions based on user actions.
- **Filtering & Sorting:** `TrackerProvider` applies filters and sort order to `dcloneStatuses` before UI display.

## Key Implementation Notes
- **Live Data Integration:** `TrackerService` fetches DClone status directly from the `diablo2.io/dclone_api.php` API.
- **Direct API Calls:** All DClone API requests are made directly to `diablo2.io`, bypassing any proxy.
- **Error Handling:** `TrackerProvider` manages loading, error, and retry states for DClone data fetching, now exposing specific error messages.
- **State Management with Provider:** `ChangeNotifierProvider` and `context.watch` manage and consume state from `TrackerProvider`.
- **Declarative Navigation:** `go_router` manages application navigation flow, including `StatefulShellRoute`.
- **Dio Response Decoding:** Explicit JSON decoding is used to prevent Android release build auto-cast failures.
- **Extended Timeouts:** API connection and receive timeouts increased to 15 seconds for improved reliability on slower networks.
- **Advanced Filtering & Sorting:** `TrackerProvider` implements region, mode (HC/SC), and ladder filtering, along with sorting by progress, region, or update time.
- **Platform Binding Initialization:** `WidgetsFlutterBinding.ensureInitialized()` is called in `main.dart` to resolve Flutter web build target resolution failures.
- **Web Build Cache Invalidation:** A comment in `main.dart` was modified to force a clean rebuild of the web preview.
- **Stale Web Asset Fixes:** `web/index.html` and `web/manifest.json` have been updated to correctly reference "DClone Tracker" and resolve build resolver issues.
- **Flutter Web Bootstrap:** Added `web/flutter_bootstrap.js` to enable Flutter web application bootstrapping and resolve entry point resolution errors.
- **Debug Banner Default:** `MaterialApp.router` now uses the default behavior for `debugShowCheckedModeBanner`, showing it in debug builds and hiding it in release builds.

## Visual Design Language
- **Aesthetic:** Dark, gritty, and thematic, inspired by Diablo 2: Resurrected's visual style.
- **Color Palette:** Dominated by dark backgrounds (`panelBg`) with accents of gold, fire, purple, and other thematic colors (`gold`, `fire`, `terrorPurple`, `demonRed`).
- **Typography:** Uses `GoogleFonts.cinzelTextTheme` for headings and `GoogleFonts.crimsonTextTextTheme` for body text, providing a classic and thematic feel.
- **Layout:** Responsive design principles are applied using `responsive_framework`, ensuring adaptability across different screen sizes. Spacing and border styles are consistently defined in `AppTheme`.
- **Interactivity:** Subtle animations and visual feedback (e.g., glowing effects, animated progress orbs, highlighted filters) are used to improve user experience.

## Development Roadmap
- **Integrate Real Data:** Replace simulated data in `TrackerService` with actual API calls to fetch live Diablo Clone and Terror Zone information.
- **Add User Preferences:** Implement storage (e.g., `shared_preferences`) for user settings like preferred region or notification preferences.
- **Implement Notifications:** Utilize `awesome_notifications` to alert users about significant Diablo Clone progress or Terror Zone changes.

<END_OF_DOCUMENT>