import '../models/about_info.dart';
import '../models/contact_info.dart';
import '../models/project.dart';
import '../models/skill.dart';

/// Repository for portfolio data — Muhammad Farhan
class PortfolioRepository {
  static final PortfolioRepository _instance = PortfolioRepository._internal();
  factory PortfolioRepository() => _instance;
  PortfolioRepository._internal();

  AboutInfo? _aboutInfo;
  List<Skill> _skills = [];
  List<Project> _projects = [];
  ContactInfo? _contactInfo;

  void initialize() {
    _aboutInfo = AboutInfo(
      name: 'Muhammad Farhan',
      title: 'Flutter Developer',
      bio:
          'Flutter developer at CODELOUNGE, Lahore, building enterprise-grade mobile applications. '
          'Experienced in BLE, NFC, Face Recognition, REST APIs, and complex state management. '
          'I care deeply about clean architecture, smooth animations, and pixel-perfect UI.',
      summary:
          'Specializing in enterprise mobile applications with Flutter — '
          'from workforce management systems to energy-audit platforms. '
          'Based in Lahore, Pakistan.',
    );

    _skills = [
      // Framework & Language
      Skill(id: '1', name: 'Flutter', category: 'Framework', displayOrder: 1),
      Skill(id: '2', name: 'Dart', category: 'Language', displayOrder: 2),
      // State Management
      Skill(
        id: '3',
        name: 'GetX',
        category: 'State Management',
        displayOrder: 3,
      ),
      Skill(
        id: '4',
        name: 'BLoC',
        category: 'State Management',
        displayOrder: 4,
      ),
      Skill(
        id: '5',
        name: 'Provider',
        category: 'State Management',
        displayOrder: 5,
      ),
      // Backend / Services
      Skill(id: '6', name: 'Firebase', category: 'Backend', displayOrder: 6),
      Skill(id: '7', name: 'Supabase', category: 'Backend', displayOrder: 7),
      Skill(id: '8', name: 'REST API', category: 'Backend', displayOrder: 8),
      // Architecture
      Skill(
        id: '9',
        name: 'Clean Architecture',
        category: 'Architecture',
        displayOrder: 9,
      ),
      Skill(
        id: '10',
        name: 'CI/CD',
        category: 'Architecture',
        displayOrder: 10,
      ),
      // Hardware
      Skill(id: '11', name: 'BLE', category: 'Hardware', displayOrder: 11),
      Skill(id: '12', name: 'NFC', category: 'Hardware', displayOrder: 12),
      Skill(
        id: '13',
        name: 'Face Recognition',
        category: 'Hardware',
        displayOrder: 13,
      ),
      // Storage
      Skill(id: '14', name: 'SQLite', category: 'Storage', displayOrder: 14),
      Skill(id: '15', name: 'Hive', category: 'Storage', displayOrder: 15),
      // Version Control
      Skill(
        id: '16',
        name: 'Git',
        category: 'Version Control',
        displayOrder: 16,
      ),
      Skill(
        id: '17',
        name: 'GitHub',
        category: 'Version Control',
        displayOrder: 17,
      ),
      // Platforms
      Skill(id: '18', name: 'Android', category: 'Platform', displayOrder: 18),
      Skill(id: '19', name: 'iOS', category: 'Platform', displayOrder: 19),
      Skill(
        id: '20',
        name: 'Flutter Web',
        category: 'Platform',
        displayOrder: 20,
      ),
      // Soft Skills
      Skill(
        id: '21',
        name: 'Problem Solving',
        category: 'Soft Skill',
        displayOrder: 21,
      ),
      Skill(
        id: '22',
        name: 'Communication',
        category: 'Soft Skill',
        displayOrder: 22,
      ),
      Skill(
        id: '23',
        name: 'Team Work',
        category: 'Soft Skill',
        displayOrder: 23,
      ),
      Skill(
        id: '24',
        name: 'Time Management',
        category: 'Soft Skill',
        displayOrder: 24,
      ),
      Skill(
        id: '25',
        name: 'Adaptability',
        category: 'Soft Skill',
        displayOrder: 25,
      ),
      Skill(
        id: '26',
        name: 'Critical Thinking',
        category: 'Soft Skill',
        displayOrder: 26,
      ),
      // AI Tools
      Skill(id: '27', name: 'ChatGPT', category: 'AI Tools', displayOrder: 27),
      Skill(id: '28', name: 'Gemini', category: 'AI Tools', displayOrder: 28),
      Skill(id: '29', name: 'Cursor', category: 'AI Tools', displayOrder: 29),
      Skill(id: '30', name: 'Kiro', category: 'AI Tools', displayOrder: 30),
    ];

    _projects = [
      Project(
        id: '1',
        name: 'CEERTIF AI',
        description:
            'Enterprise workforce management system with AI-powered attendance, '
            'BLE proximity detection, NFC badge scanning, and Face Recognition. '
            'Built for large organizations to streamline employee management and compliance.',
        technologies: [
          'Flutter',
          'Supabase',
          'BLE',
          'NFC',
          'AI',
          'Face Recognition',
        ],
        imageUrls: [],
        playStoreUrl:
            'https://play.google.com/store/apps/details?id=com.hexasoft.bch',
        appStoreUrl: 'https://apps.apple.com/pk/app/ceertifs/id1456381091',
        displayOrder: 1,
      ),
      Project(
        id: '2',
        name: 'WattAudit',
        description:
            'Energy audit and management platform for tracking and optimizing energy consumption. '
            'Features real-time monitoring dashboards, detailed analytics, compliance reporting, '
            'and offline-capable data sync.',
        technologies: ['Flutter', 'Firebase', 'REST API', 'Charts', 'SQLite'],
        imageUrls: [],
        playStoreUrl:
            'https://play.google.com/store/apps/details?id=io.hexasoft.ceert_audit',
        appStoreUrl: 'https://apps.apple.com/pk/app/watt-audit/id6449857114',
        displayOrder: 2,
      ),
      Project(
        id: '3',
        name: 'CutForU',
        description:
            'Smart barber-shop booking and management app. Customers can browse, '
            'book appointments, and track queue status in real-time. '
            'Barbers manage their schedule, services, and customer list.',
        technologies: ['Flutter', 'Firebase', 'GetX', 'Notifications'],
        imageUrls: [],
        playStoreUrl:
            'https://play.google.com/store/apps/details?id=com.cutforu.app',
        displayOrder: 3,
      ),
    ];

    _contactInfo = ContactInfo(
      email: 'muhammadfarhan92325@gmail.com',
      linkedInUrl: 'http://www.linkedin.com/in/muhammad-farhan-rafi',
      githubUrl: 'https://github.com/Farhan2122',
    );
  }

  AboutInfo getAboutInfo() {
    if (_aboutInfo == null) throw StateError('Repository not initialized.');
    return _aboutInfo!;
  }

  List<Skill> getSkills() => List.unmodifiable(_skills);

  List<Project> getProjects() => List.unmodifiable(_projects);

  ContactInfo getContactInfo() {
    if (_contactInfo == null) throw StateError('Repository not initialized.');
    return _contactInfo!;
  }
}
