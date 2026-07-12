import 'package:flutter/material.dart';
import '../../core/constants/app_dimensions.dart';
import '../about/about_section.dart';
import '../contact/contact_section.dart';
import '../experience/experience_section.dart';
import '../hero/hero_section.dart';
import '../projects/projects_section.dart';
import '../skills/skills_section.dart';
import '../stats/stats_section.dart';
import '../tech_stack/tech_stack_section.dart';
import 'widgets/portfolio_nav_bar.dart';
import '../footer/footer_section.dart';

/// Single-page scrollable portfolio.
/// The [ScrollController] is shared with the nav bar so smooth-scroll
/// navigation works from any section link.
class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final ScrollController _scrollController = ScrollController();

  // Section keys used for anchor navigation
  final GlobalKey heroKey = GlobalKey();
  final GlobalKey aboutKey = GlobalKey();
  final GlobalKey experienceKey = GlobalKey();
  final GlobalKey projectsKey = GlobalKey();
  final GlobalKey skillsKey = GlobalKey();
  final GlobalKey contactKey = GlobalKey();

  void _scrollToKey(GlobalKey key) {
    final ctx = key.currentContext;
    if (ctx == null) return;
    Scrollable.ensureVisible(
      ctx,
      duration: const Duration(milliseconds: 700),
      curve: Curves.easeInOutCubic,
      alignment: 0.0,
    );
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      body: Stack(
        children: [
          // ── Scrollable content ──────────────────────────────────────────
          SingleChildScrollView(
            controller: _scrollController,
            child: Column(
              children: [
                // Nav bar spacer
                const SizedBox(height: AppDimensions.navHeight),

                // Sections
                HeroSection(
                  key: heroKey,
                  onViewProjects: () => _scrollToKey(projectsKey),
                ),
                AboutSection(key: aboutKey),
                ExperienceSection(key: experienceKey),
                ProjectsSection(key: projectsKey),
                SkillsSection(key: skillsKey),
                TechStackSection(),
                StatsSection(),
                ContactSection(key: contactKey),
                const FooterSection(),
              ],
            ),
          ),

          // ── Sticky nav bar overlaid at top ──────────────────────────────
          Positioned(
            top: 0,
            left: 0,
            right: 0,
            child: PortfolioNavBar(
              scrollController: _scrollController,
              onNavTap: (section) {
                switch (section) {
                  case NavSection.about:
                    _scrollToKey(aboutKey);
                  case NavSection.experience:
                    _scrollToKey(experienceKey);
                  case NavSection.projects:
                    _scrollToKey(projectsKey);
                  case NavSection.skills:
                    _scrollToKey(skillsKey);
                  case NavSection.contact:
                    _scrollToKey(contactKey);
                }
              },
            ),
          ),
        ],
      ),
    );
  }
}
