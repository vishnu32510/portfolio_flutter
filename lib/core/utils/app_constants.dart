import '../../data/models/custom_service.dart';
import '../../data/models/project.dart';
import '../../data/models/technical_skill.dart';
import '../../data/models/experience.dart';
import '../../data/models/education.dart';
import 'app_assets.dart';

import 'app_sizes.dart';

abstract class AppConstants {
  static const double appBarHeight = AppSizes.navBarHeight;
  static const String appTitle = "Vishnu's Portfolio";
  static const String heroTagAppIcon = 'app_icon_hero';
  static const List<CustomService> services = [
    CustomService(
      service: 'RESPONSIVENESS UI',
      logo: AppAssets.uiDesignLogo,
      description:
          'Working on enhancing the user interface and experience with focus on aesthetics and functionality. My repressiveness designing and  and skills  ensure that your application looks great and offers a seamless and user-friendly experience.',
    ),
    CustomService(
        service: 'MOBILE DEVELOPMENT',
        logo: AppAssets.androidLogo,
        description:
            'Crafting mobile applications that meet any unique requirements. My skills will bring your ideas to a feature-rich, intuitive, and platform-specific Mobile App. From Android to iOS.'),
    // CustomService(
    //     service: 'CYBER SECURITY',
    //     logo: AppAssets.scrappingLogo,
    //     description:
    //         'Protecting your digital assets and sensitive information from cyber threats. My Cybersecurity skills include vulnerability assessments, threat monitoring, and proactive measures to ensure the security of your online presence.'),
  ];
  static const List<Project> projects = [
    Project(
        name: "My Portfolio",
        tags: [ProjectTag.web, ProjectTag.mobile],
        imageUrl:
            "https://raw.githubusercontent.com/vishnu32510/portfolio_flutter/main/assets/images/appIcon.png",
        description:
            "Responsive Portfolio designed for Android, IOS, Web, MacOS with Flutter SDK using Bloc State management",
        techStack: ["Flutter", "Dart", "Bloc", "Firebase", "Firestore", "Web"],
        status: "In Progress",
        githubRepoLink: "https://github.com/vishnu32510/portfolio_flutter"),
    Project(
        name: "Unsplash public photos",
        tags: [ProjectTag.mobile],
        imageUrl:
            "https://raw.githubusercontent.com/vishnu32510/Photos_using_unsplash_api/main/images/icon.png",
        description:
            "Application to access Unsplash public photos (Unsplash Public API are used)",
        techStack: ["Flutter", "Dart", "REST API", "Unsplash API"],
        githubRepoLink:
            "https://github.com/vishnu32510/Photos_using_unsplash_api"),
    Project(
        name: "Appetizer IOS Application",
        tags: [ProjectTag.mobile],
        imageUrl:
            "https://raw.githubusercontent.com/vishnu32510/Appetizer/main/appetizers/Assets.xcassets/AppIcon.appiconset/AppIcon.png",
        description:
            "Appetizer IOS Application with SwiftUI and Api interfaces.",
        techStack: ["Swift", "SwiftUI", "iOS", "REST API"],
        githubRepoLink: "https://github.com/vishnu32510/Appetizer"),
    Project(
        name: "Apple Framework List",
        tags: [ProjectTag.mobile],
        imageUrl:
            "https://raw.githubusercontent.com/vishnu32510/Apple-Frameworks/main/Apple-Frameworks/Assets.xcassets/AppIcon.appiconset/AppIcon.png",
        description:
            "Apple Frameworks List in Gridview and Listview with SwiftUI",
        techStack: ["Swift", "SwiftUI", "iOS"],
        githubRepoLink: "https://github.com/vishnu32510/Apple-Frameworks"),
    Project(
        name: "Whatsapp UI Clone",
        tags: [ProjectTag.mobile],
        imageUrl: "",
        description: "Whatsapp UI Clone with FLutter",
        techStack: ["Flutter", "Dart", "UI/UX"],
        githubRepoLink: "https://github.com/vishnu32510/flutter_whatsapp"),
    Project(
        name: "Facebook Responsive UI Clone",
        tags: [ProjectTag.web],
        imageUrl: "",
        description:
            "Flutter Facebook Responsive Responsive UI for Web and Mobile",
        techStack: ["Flutter", "Dart", "Web", "Responsive UI"],
        githubRepoLink: "https://github.com/vishnu32510/flutter_facebook"),
    Project(
        name: "Weather App UI",
        tags: [ProjectTag.mobile],
        imageUrl:
            "https://raw.githubusercontent.com/vishnu32510/SwiftUI-Weather/main/SwiftUI-Weather/Assets.xcassets/AppIcon.appiconset/AppIcon.png",
        description: "Swift Weather App UI in Dark and Light Mode",
        techStack: ["Swift", "SwiftUI", "iOS", "Dark Mode"],
        githubRepoLink: "https://github.com/vishnu32510/SwiftUI-Weather"),
    Project(
        name: "My GitHub Profile Details",
        tags: [ProjectTag.mobile],
        imageUrl:
            "https://raw.githubusercontent.com/vishnu32510/GitHubSwift/main/GitHubSwift/Assets.xcassets/AppIcon.appiconset/AppIcon.png",
        description:
            "Simple Swift IOS App to display my GitHub Details form the Github API",
        techStack: ["Swift", "SwiftUI", "iOS", "GitHub API"],
        githubRepoLink: "https://github.com/vishnu32510/GitHubSwift"),
  ];
  
  static const List<TechnicalSkill> technicalSkills = [
    TechnicalSkill(
      category: 'Languages',
      skills: ['Dart', 'Python', 'JavaScript', 'TypeScript', 'Swift', 'Kotlin', 'Java', 'C/C++'],
    ),
    TechnicalSkill(
      category: 'Mobile & Frontend',
      skills: ['Flutter', 'Android', 'iOS', 'React', 'HTML/CSS'],
    ),
    TechnicalSkill(
      category: 'Backend',
      skills: ['Node.js', 'Express.js', 'FastAPI', 'REST APIs', 'PostgreSQL', 'MongoDB', 'Firebase'],
    ),
    TechnicalSkill(
      category: 'Tools & DevOps',
      skills: ['Git', 'Docker', 'CI/CD', 'GitHub Actions', 'AWS', 'GCP'],
    ),
  ];
  
  static const List<Experience> experiences = [
    Experience(
      title: 'Software Engineer',
      company: 'Your Company Name',
      period: 'Month Year - Present',
      achievements: [
        'Built scalable mobile applications using Flutter, improving user engagement by X%',
        'Developed REST APIs using Node.js and Express.js, reducing response time by Y%',
        'Implemented clean architecture patterns, reducing code complexity by Z%',
      ],
    ),
    // Add more experiences as needed
  ];
  
  static const List<Education> education = [
    Education(
      degree: 'Bachelor of Science, Computer Science',
      institution: 'Your University',
      period: 'Year - Year',
      coursework: ['Software Development', 'Data Structures', 'Algorithms', 'Database Systems'],
    ),
  ];
}
