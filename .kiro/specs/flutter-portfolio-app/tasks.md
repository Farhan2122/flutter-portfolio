# Implementation Plan: Flutter Portfolio App

## Overview

This implementation plan breaks down the Flutter Portfolio App into incremental coding steps. Each task builds on previous work, starting with core data models and infrastructure, then building up the UI layer, and finally adding polish with animations and accessibility features. The plan includes property-based tests as sub-tasks to validate correctness properties throughout development.

## Tasks

- [x] 1. Set up project dependencies and core constants
  - Add required dependencies to pubspec.yaml: url_launcher for external links
  - Create core constants files: app_colors.dart, app_text_styles.dart, app_dimensions.dart, app_animations.dart
  - Define color palettes for light and dark themes
  - Define typography scale and text styles
  - Define spacing, sizing, and animation duration constants
  - _Requirements: 8.1, 8.2, 8.3, 9.4_

- [ ] 2. Implement data models with validation and serialization
  - [x] 2.1 Create Project model with JSON serialization
    - Implement Project class with all fields (id, name, description, technologies, imageUrls, playStoreUrl, appStoreUrl, displayOrder)
    - Add validation in constructor (name non-empty, description >= 10 chars, at least one store URL, technologies non-empty)
    - Implement fromJson and toJson methods
    - _Requirements: 3.1, 3.3, 3.4, 3.5, 3.6, 4.1, 4.2, 11.1_
  
  - [ ]* 2.2 Write property test for Project model serialization
    - **Property 23: Data Model Serialization Round-Trip**
    - **Validates: Requirements 11.1**
  
  - [x] 2.3 Create Skill model with JSON serialization
    - Implement Skill class with fields (id, name, category, displayOrder)
    - Add validation (name and category non-empty)
    - Implement fromJson and toJson methods
    - _Requirements: 2.1, 2.4, 11.1_
  
  - [x] 2.4 Create ContactInfo model with JSON serialization
    - Implement ContactInfo class with fields (email, linkedInUrl, githubUrl, twitterUrl, websiteUrl)
    - Add email format validation
    - Implement fromJson and toJson methods
    - _Requirements: 5.1, 5.2, 5.3, 11.1_
  
  - [x] 2.5 Create AboutInfo model with JSON serialization
    - Implement AboutInfo class with fields (name, title, bio, summary, profileImageUrl)
    - Add validation (name non-empty, bio >= 50 chars, summary non-empty)
    - Implement fromJson and toJson methods
    - _Requirements: 1.2, 1.3, 1.4, 11.1_
  
  - [ ]* 2.6 Write property test for AboutInfo bio length validation
    - **Property 1: AboutInfo Bio Length Validation**
    - **Validates: Requirements 1.3**

- [x] 3. Implement PortfolioRepository with hardcoded data
  - Create PortfolioRepository singleton class
  - Implement initialize() method with hardcoded portfolio data for Watt Audit and CEERTIFS projects
  - Implement getter methods: getAboutInfo(), getSkills(), getProjects(), getContactInfo()
  - Populate with real data: Watt Audit (Play Store: https://play.google.com/store/apps/details?id=io.hexasoft.ceert_audit, App Store: https://apps.apple.com/pk/app/watt-audit/id6449857114)
  - Populate with real data: CEERTIFS (Play Store: https://play.google.com/store/apps/details?id=com.hexasoft.bch, App Store: https://apps.apple.com/pk/app/ceertifs/id1456381091)
  - _Requirements: 3.1, 3.7, 11.1, 11.2_

- [ ]* 3.1 Write property tests for content management
  - **Property 24: Dynamic Content Updates**
  - **Property 25: New Project Addition**
  - **Property 26: Project Update Reflection**
  - **Validates: Requirements 11.3, 11.4, 11.5**

- [ ] 4. Create theme configuration
  - [x] 4.1 Implement light theme in light_theme.dart
    - Define ThemeData with light color scheme using AppColors
    - Configure text theme using AppTextStyles
    - Set up component themes (card, button, navigation bar)
    - _Requirements: 8.1, 8.3_
  
  - [x] 4.2 Implement dark theme in dark_theme.dart
    - Define ThemeData with dark color scheme using AppColors
    - Configure text theme using AppTextStyles
    - Set up component themes matching light theme structure
    - _Requirements: 8.1, 8.2_
  
  - [ ]* 4.3 Write property test for contrast ratio compliance
    - **Property 16: Contrast Ratio Compliance**
    - **Validates: Requirements 8.7, 14.4**

- [ ] 5. Implement utility helpers
  - [x] 5.1 Create UrlLauncherHelper for external links
    - Implement launchExternalUrl() method with error handling
    - Implement launchEmail() method with mailto: scheme
    - Add error logging and user feedback for failed launches
    - _Requirements: 4.3, 5.4, 5.5, 13.1, 13.3, 13.4_
  
  - [ ]* 5.2 Write property test for external link error handling
    - **Property 28: External Link Error Handling**
    - **Validates: Requirements 13.1, 13.3**
  
  - [x] 5.3 Create ResponsiveHelper for screen size utilities
    - Implement isMobile(), isTablet(), isDesktop() methods
    - Implement getResponsivePadding() method
    - Define breakpoint constants (320px-600px mobile, 600px-1024px tablet)
    - _Requirements: 7.1, 7.2_

- [ ] 6. Checkpoint - Ensure all tests pass
  - Ensure all tests pass, ask the user if questions arise.

- [ ] 7. Implement reusable widget components
  - [x] 7.1 Create ResponsiveImage widget
    - Implement StatelessWidget with url and aspectRatio parameters
    - Add Image.network with loadingBuilder showing LoadingIndicator
    - Add errorBuilder showing placeholder icon
    - Calculate responsive width based on screen size
    - Use ClipRRect for rounded corners
    - _Requirements: 10.2, 10.3, 10.4, 7.5, 13.2_
  
  - [ ]* 7.2 Write property tests for image handling
    - **Property 19: Image Aspect Ratio Preservation**
    - **Property 20: Image Load Failure Handling**
    - **Validates: Requirements 10.2, 10.4, 13.2**
  
  - [x] 7.3 Create AnimatedSection widget
    - Implement StatefulWidget with SingleTickerProviderStateMixin
    - Create AnimationController with duration from AppAnimations
    - Implement fade and slide animations with curves
    - Wrap child in FadeTransition and SlideTransition
    - _Requirements: 9.1, 9.2, 9.4, 9.6_
  
  - [ ]* 7.4 Write property test for animation duration constraint
    - **Property 18: Animation Duration Constraint**
    - **Validates: Requirements 9.4**
  
  - [x] 7.5 Create LoadingIndicator widget
    - Implement simple CircularProgressIndicator wrapper with consistent styling
    - _Requirements: 10.3_

- [x] 8. Implement AboutSection
  - Create AboutSection StatelessWidget
  - Fetch AboutInfo from PortfolioRepository
  - Wrap in AnimatedSection for entrance animation
  - Use SingleChildScrollView with Column layout
  - Display profile image with ResponsiveImage (if available)
  - Display name with AppTextStyles.heading1
  - Display title with AppTextStyles.subtitle
  - Display bio and summary with AppTextStyles.body
  - Apply proper spacing using AppDimensions
  - _Requirements: 1.1, 1.2, 1.3, 1.4, 9.1_

- [ ] 9. Implement Skills section components
  - [x] 9.1 Create SkillChip widget
    - Implement StatelessWidget accepting Skill parameter
    - Use Container with rounded corners and primary container color
    - Display skill name with AppTextStyles.chip
    - Apply padding from AppDimensions
    - _Requirements: 2.2, 2.4_
  
  - [x] 9.2 Create SkillsSection widget
    - Fetch skills list from PortfolioRepository
    - Wrap in AnimatedSection
    - Use SingleChildScrollView with Column
    - Display "Skills" heading with AppTextStyles.heading1
    - Use Wrap widget for skill chips with proper spacing
    - Map skills to SkillChip widgets
    - _Requirements: 2.1, 2.2, 2.3, 2.5, 9.1_
  
  - [ ]* 9.3 Write property test for skills list capacity
    - **Property 2: Skills List Capacity**
    - **Validates: Requirements 2.3**

- [ ] 10. Implement Projects section components
  - [x] 10.1 Create StoreLinkButton widget
    - Define StorePlatform enum (playStore, appStore)
    - Implement StatelessWidget with url and platform parameters
    - Use ElevatedButton.icon with appropriate icon (Icons.shop for Play Store, Icons.apple for App Store)
    - Implement onPressed handler calling UrlLauncherHelper.launchExternalUrl
    - Add proper labels ("Play Store", "App Store")
    - _Requirements: 4.1, 4.2, 4.3, 4.5_
  
  - [ ]* 10.2 Write property test for store link URL launching
    - **Property 7: Store Link URL Launching**
    - **Validates: Requirements 4.3**
  
  - [x] 10.3 Create ProjectCard widget
    - Implement StatelessWidget accepting Project parameter
    - Use Card with proper margin and padding
    - Display first project image with ResponsiveImage (16:9 aspect ratio)
    - Display project name with AppTextStyles.heading2
    - Display description with AppTextStyles.body
    - Display technologies as Chip widgets in Wrap layout
    - Conditionally display StoreLinkButton for Play Store (if playStoreUrl != null)
    - Conditionally display StoreLinkButton for App Store (if appStoreUrl != null)
    - Apply proper spacing throughout
    - _Requirements: 3.2, 3.3, 3.4, 3.5, 3.6, 4.1, 4.2, 4.4, 4.5_
  
  - [ ]* 10.4 Write property tests for project card display
    - **Property 4: Project Card Content Completeness**
    - **Property 6: Store Link Conditional Display**
    - **Validates: Requirements 3.3, 3.4, 3.5, 3.6, 4.1, 4.2, 4.4**
  
  - [x] 10.5 Create ProjectsSection widget
    - Fetch projects list from PortfolioRepository
    - Wrap in AnimatedSection
    - Use ListView.builder for scrollable project list
    - Add "Projects" heading as first item
    - Map each project to ProjectCard widget
    - Apply proper padding and spacing
    - _Requirements: 3.1, 3.2, 3.7, 3.8, 9.1_
  
  - [ ]* 10.6 Write property tests for projects display
    - **Property 3: Projects List Display Completeness**
    - **Property 5: Minimum Projects Support**
    - **Validates: Requirements 3.1, 3.2, 3.7**

- [ ] 11. Implement Contact section components
  - [x] 11.1 Create ContactItem widget
    - Implement StatelessWidget with icon, label, value, and onTap parameters
    - Use InkWell for tap handling with visual feedback
    - Display icon with AppDimensions.iconSize
    - Display label with AppTextStyles.caption
    - Display value with AppTextStyles.body
    - Add trailing arrow icon
    - Apply proper padding and layout
    - _Requirements: 5.1, 5.4, 9.3_
  
  - [x] 11.2 Create ContactSection widget
    - Fetch ContactInfo from PortfolioRepository
    - Wrap in AnimatedSection
    - Use SingleChildScrollView with Column
    - Display "Contact" heading with AppTextStyles.heading1
    - Create ContactItem for email with Icons.email, calling UrlLauncherHelper.launchEmail
    - Conditionally create ContactItem for LinkedIn (if linkedInUrl != null)
    - Conditionally create ContactItem for GitHub (if githubUrl != null)
    - Conditionally create ContactItem for Twitter (if twitterUrl != null)
    - Apply proper spacing
    - _Requirements: 5.1, 5.2, 5.3, 5.4, 5.5, 5.6, 9.1, 9.3_
  
  - [ ]* 11.3 Write property tests for contact methods
    - **Property 8: Contact Methods Display**
    - **Property 9: Contact Method Action Triggering**
    - **Validates: Requirements 5.3, 5.4, 5.5**

- [ ] 12. Checkpoint - Ensure all tests pass
  - Ensure all tests pass, ask the user if questions arise.

- [ ] 13. Implement navigation and home screen
  - [x] 13.1 Create CustomNavigationBar widget
    - Implement StatelessWidget with currentIndex and onTap parameters
    - Use BottomNavigationBar with 4 items (About, Skills, Projects, Contact)
    - Use appropriate icons for each section
    - Set currentIndex to highlight active section
    - Call onTap callback when item is tapped
    - Ensure minimum touch target size of 48x48 pixels
    - _Requirements: 6.1, 6.3, 6.4, 14.3_
  
  - [x] 13.2 Create HomeScreen widget
    - Implement StatefulWidget with State class
    - Create PageController for managing page views
    - Initialize _currentIndex to 0 (About section)
    - Implement _onNavigationTap to update index and animate PageController
    - Implement _onPageChanged to update _currentIndex when user swipes
    - Build Scaffold with PageView containing all 4 sections
    - Add CustomNavigationBar as bottomNavigationBar
    - Dispose PageController properly
    - _Requirements: 1.1, 6.1, 6.2, 6.3, 6.4, 6.5_
  
  - [ ]* 13.3 Write property tests for navigation
    - **Property 10: Navigation Section Transitions**
    - **Property 11: Navigation Active State Indication**
    - **Validates: Requirements 6.2, 6.3**

- [x] 14. Create root app widget with theme support
  - Create PortfolioApp StatelessWidget in app.dart
  - Use MaterialApp with title "Portfolio"
  - Set theme to light theme from light_theme.dart
  - Set darkTheme to dark theme from dark_theme.dart
  - Set themeMode to ThemeMode.system for automatic theme switching
  - Set home to HomeScreen
  - Configure ErrorWidget.builder for graceful error handling
  - _Requirements: 8.1, 8.2, 8.3, 8.4, 8.5, 13.5_

- [ ]* 14.1 Write property test for system theme reactivity
  - **Property 15: System Theme Reactivity**
  - **Validates: Requirements 8.5**

- [x] 15. Update main.dart entry point
  - Initialize PortfolioRepository with hardcoded data
  - Call runApp with PortfolioApp widget
  - Add error handling and logging setup
  - _Requirements: 1.1, 13.4, 13.5_

- [ ] 16. Add accessibility features
  - [x] 16.1 Add semantic labels to all interactive widgets
    - Add Semantics widgets or semanticLabel properties to all buttons, links, and navigation items
    - Ensure labels are descriptive and meaningful for screen readers
    - _Requirements: 14.1, 14.2_
  
  - [ ]* 16.2 Write property test for semantic labels
    - **Property 31: Interactive Element Semantic Labels**
    - **Validates: Requirements 14.1**
  
  - [x] 16.3 Add section change announcements
    - Use Semantics with liveRegion property in HomeScreen
    - Announce section changes when navigation occurs
    - _Requirements: 14.5_
  
  - [ ]* 16.4 Write property test for section change announcements
    - **Property 33: Section Change Announcements**
    - **Validates: Requirements 14.5**
  
  - [x] 16.5 Verify touch target sizes
    - Review all interactive elements to ensure minimum 48x48 pixel size
    - Adjust button sizes and padding if needed
    - _Requirements: 14.3_
  
  - [ ]* 16.6 Write property test for touch target sizes
    - **Property 32: Touch Target Size Compliance**
    - **Validates: Requirements 14.3**
  
  - [x] 16.7 Add text scaling support
    - Ensure all text uses MediaQuery.textScaleFactorOf for scaling
    - Test layouts with text scale factors up to 2.0
    - Fix any overflow issues
    - _Requirements: 14.6_
  
  - [ ]* 16.8 Write property test for text scaling support
    - **Property 34: Text Scaling Support**
    - **Validates: Requirements 14.6**

- [ ] 17. Implement responsive design enhancements
  - [x] 17.1 Add responsive padding to all sections
    - Update AboutSection, SkillsSection, ProjectsSection, ContactSection to use ResponsiveHelper.getResponsivePadding
    - Test on different screen sizes (mobile, tablet, desktop)
    - _Requirements: 7.1, 7.2, 7.4_
  
  - [ ]* 17.2 Write property tests for responsive design
    - **Property 12: Screen Width Adaptation**
    - **Property 13: Responsive Image Sizing**
    - **Property 14: Orientation Change Handling**
    - **Validates: Requirements 7.1, 7.5, 7.6**

- [ ] 18. Add error handling and resilience
  - [x] 18.1 Implement error logging throughout the app
    - Add debugPrint statements for all caught errors
    - Ensure errors include sufficient context (URL, operation, etc.)
    - _Requirements: 13.4_
  
  - [ ]* 18.2 Write property tests for error handling
    - **Property 29: Error Logging**
    - **Property 30: Error Resilience**
    - **Validates: Requirements 13.4, 13.5**

- [x] 19. Add image tap functionality for enlarged view
  - Wrap ResponsiveImage in GestureDetector
  - Implement onTap handler to show full-screen image dialog
  - Create image dialog with dismissible overlay
  - _Requirements: 10.6_

- [ ]* 19.1 Write property test for image tap enlargement
  - **Property 22: Image Tap Enlargement**
  - **Validates: Requirements 10.6**

- [x] 20. Implement image caching optimization
  - Configure Image.network cacheWidth and cacheHeight parameters
  - Verify that Flutter's default image caching is working
  - Test that images load from cache on subsequent views
  - _Requirements: 12.3, 12.4_

- [ ]* 20.1 Write property test for image caching
  - **Property 27: Image Caching**
  - **Validates: Requirements 12.4**

- [ ] 21. Add property test generators utility
  - Create PropertyTestGenerators class in test/utils/
  - Implement generateRandomAboutInfo() with bio >= 50 chars
  - Implement generateRandomProject() with valid constraints
  - Implement generateRandomSkill()
  - Implement generateRandomContactInfo() with valid email format
  - Add helper methods: _randomString, _randomUrl, _randomEmail, _randomBool, _randomInt, _randomStringList
  - _Requirements: All property tests_

- [x] 22. Add assets configuration
  - Create assets/ directory for images
  - Add placeholder images for projects (Watt Audit and CEERTIFS screenshots)
  - Update pubspec.yaml to include assets directory
  - Update PortfolioRepository to use asset paths or network URLs
  - _Requirements: 3.5, 10.1_

- [ ] 23. Final checkpoint - Ensure all tests pass
  - Run all unit tests and verify they pass
  - Run all property tests with 100+ iterations and verify they pass
  - Test the app on different screen sizes (mobile, tablet)
  - Test theme switching (light/dark mode)
  - Test all navigation flows
  - Test all external links (store links, contact links)
  - Verify accessibility with screen reader
  - Ensure all tests pass, ask the user if questions arise.

- [x] 24. Polish and final touches
  - Review all spacing and alignment for visual consistency
  - Verify all animations are smooth and within 500ms duration
  - Test error scenarios (failed image loads, failed URL launches)
  - Verify app works in both portrait and landscape orientations
  - Add any missing semantic labels or accessibility features
  - _Requirements: 9.4, 9.5, 13.1, 13.2, 13.3, 14.1, 14.2, 14.5_

## Notes

- Tasks marked with `*` are optional property-based tests and can be skipped for faster MVP
- Each task references specific requirements for traceability
- Checkpoints ensure incremental validation at key milestones
- Property tests validate universal correctness properties with 100+ iterations
- Unit tests validate specific examples, edge cases, and integration points
- The implementation follows a bottom-up approach: models → repository → utilities → widgets → screens → integration
- All external dependencies (url_launcher) are added early to avoid integration issues
- Theme and responsive design are built in from the start rather than retrofitted
- Accessibility features are integrated throughout rather than added at the end
