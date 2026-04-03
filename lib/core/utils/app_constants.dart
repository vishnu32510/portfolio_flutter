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
          'Crafting mobile applications that meet any unique requirements. My skills will bring your ideas to a feature-rich, intuitive, and platform-specific Mobile App. From Android to iOS.',
    ),
    // CustomService(
    //     service: 'CYBER SECURITY',
    //     logo: AppAssets.scrappingLogo,
    //     description:
    //         'Protecting your digital assets and sensitive information from cyber threats. My Cybersecurity skills include vulnerability assessments, threat monitoring, and proactive measures to ensure the security of your online presence.'),
  ];
  static const List<Project> projects = [
    Project(
      name: "LinkedIn AI Assistant",
      tags: [ProjectTag.ai, ProjectTag.web, ProjectTag.backend],
      imageUrl:
          "https://raw.githubusercontent.com/vishnu32510/linkedin-ai-asistant/main/icon500.png",
      description:
          "AI-powered Chrome extension for generating personalized LinkedIn connection notes and messages using OpenAI GPT-4o-mini with Google Sheets logging integration",
      techStack: [
        "JavaScript",
        "Chrome Extension API",
        "OpenAI API",
        "Google Apps Script",
        "REST API",
      ],
      status: "Completed",
      githubRepoLink: "https://github.com/vishnu32510/linkedin-ai-asistant",
    ),
    Project(
      name: "My Portfolio",
      tags: [ProjectTag.web, ProjectTag.mobile],
      imageUrl:
          "https://raw.githubusercontent.com/vishnu32510/portfolio_flutter/main/assets/images/appIcon.png",
      description:
          "Responsive Portfolio designed for Android, IOS, Web, MacOS with Flutter SDK using Bloc State management",
      techStack: ["Flutter", "Dart", "Bloc", "Firebase", "Firestore", "Web"],
      status: "Completed",
      githubRepoLink: "https://github.com/vishnu32510/portfolio_flutter",
    ),
    Project(
      name: "Reports Node.js Backend",
      tags: [ProjectTag.backend, ProjectTag.web],
      imageUrl: "",
      description:
          "Backend service built with Node.js and TypeScript for generating and managing reports",
      techStack: ["TypeScript", "Node.js", "REST API"],
      githubRepoLink: "https://github.com/vishnu32510/reports_nodejs",
    ),
    // Project(
    //     name: "MVP Builder",
    //     tags: [ProjectTag.mobile],
    //     imageUrl: "",
    //     description:
    //         "Flutter-based MVP builder tool for rapid prototyping and development",
    //     techStack: ["Flutter", "Dart"],
    //     githubRepoLink: "https://github.com/vishnu32510/mvp_builder"),
    Project(
      name: "Aurora Mobile Challenge",
      tags: [ProjectTag.mobile],
      imageUrl:
          "https://raw.githubusercontent.com/vishnu32510/aurora_mobile_challenge/refs/heads/main/assets/icons/icon.png",
      description:
          "Mobile application challenge project showcasing Flutter development skills",
      techStack: ["Flutter", "Dart"],
      githubRepoLink: "https://github.com/vishnu32510/aurora_mobile_challenge",
    ),
    // Project(
    //     name: "Stock Dashboard",
    //     tags: [ProjectTag.web],
    //     imageUrl: "",
    //     description:
    //         "Real-time stock market dashboard with data visualization and analytics",
    //     techStack: ["TypeScript", "React", "REST API"],
    //     githubRepoLink: "https://github.com/vishnu32510/stock-dashboard-"),
    Project(
      name: "Nova AI Assistant",
      tags: [ProjectTag.ai, ProjectTag.backend],
      imageUrl: "",
      description:
          "AI-powered assistant built with Python for intelligent automation and task management",
      techStack: ["Python", "AI/ML"],
      githubRepoLink: "https://github.com/vishnu32510/nova",
    ),
    Project(
      name: "Fact Dynamics",
      tags: [ProjectTag.web, ProjectTag.ai],
      imageUrl: "",
      description:
          "Real-time fact-checking application powered by AI to verify information accuracy",
      techStack: ["JavaScript", "AI/ML", "REST API"],
      githubRepoLink: "https://github.com/vishnu32510/fact_pulse",
    ),
    Project(
      name: "Swift Weather App",
      tags: [ProjectTag.mobile],
      imageUrl: "",
      description:
          "iOS weather application using Open Meteo API with SwiftUI for real-time weather data",
      techStack: ["Swift", "SwiftUI", "iOS", "REST API"],
      githubRepoLink: "https://github.com/vishnu32510/swift-weather-app",
    ),
    Project(
      name: "Perplexity Flutter SDK",
      tags: [ProjectTag.mobile, ProjectTag.ai],
      imageUrl: "",
      description:
          "A lightweight Flutter SDK to interact with Perplexity.ai's chat completion API",
      techStack: ["Flutter", "Dart", "AI/ML", "REST API"],
      githubRepoLink: "https://github.com/vishnu32510/perplexity_flutter",
    ),
    Project(
      name: "Perplexity Dart SDK",
      tags: [ProjectTag.backend, ProjectTag.ai],
      imageUrl: "",
      description:
          "A lightweight Dart SDK to interact with Perplexity.ai's chat completion API",
      techStack: ["Dart", "AI/ML", "REST API"],
      githubRepoLink: "https://github.com/vishnu32510/perplexity_dart",
    ),
    Project(
      name: "WhosThatDog",
      tags: [ProjectTag.mobile, ProjectTag.ai],
      imageUrl: "",
      description:
          "Fun game app to identify dog breeds and learn about different breeds and sub-breeds using AI",
      techStack: ["Kotlin", "Android", "AI/ML", "REST API"],
      githubRepoLink: "https://github.com/vishnu32510/WhosThatDog",
    ),
    Project(
      name: "Theater App UI",
      tags: [ProjectTag.mobile],
      imageUrl: "",
      description:
          "Modern theater booking app UI built with Kotlin Jetpack Compose",
      techStack: ["Kotlin", "Jetpack Compose", "Android"],
      githubRepoLink: "https://github.com/vishnu32510/TheaterApp_Kotlin",
    ),
    Project(
      name: "Mars Visitation App",
      tags: [ProjectTag.mobile, ProjectTag.web],
      imageUrl: "",
      description:
          "Interactive Mars visitation application built with Flutter for exploring Mars missions",
      techStack: ["Flutter", "Dart", "JavaScript"],
      githubRepoLink: "https://github.com/vishnu32510/mars_visitation_flutter",
    ),
    Project(
      name: "Sign Language Detection",
      tags: [ProjectTag.ai],
      imageUrl: "",
      description:
          "Machine learning model for real-time sign language detection and translation",
      techStack: ["Python", "Jupyter Notebook", "AI/ML", "Computer Vision"],
      githubRepoLink: "https://github.com/vishnu32510/sign_language",
    ),
    Project(
      name: "Anomaly-Driven Video Summarization",
      tags: [ProjectTag.ai],
      imageUrl: "",
      description:
          "AI-powered video summarization system for real-time surveillance using anomaly detection",
      techStack: ["Python", "Jupyter Notebook", "AI/ML", "Computer Vision"],
      githubRepoLink:
          "https://github.com/vishnu32510/anomaly-driven-video-summarization",
    ),
    Project(
      name: "Unsplash public photos",
      tags: [ProjectTag.mobile],
      imageUrl:
          "https://raw.githubusercontent.com/vishnu32510/Photos_using_unsplash_api/main/images/icon.png",
      description:
          "Application to access Unsplash public photos (Unsplash Public API are used)",
      techStack: ["Flutter", "Dart", "REST API", "Unsplash API"],
      githubRepoLink:
          "https://github.com/vishnu32510/Photos_using_unsplash_api",
    ),
    Project(
      name: "Appetizer IOS Application",
      tags: [ProjectTag.mobile],
      imageUrl:
          "https://raw.githubusercontent.com/vishnu32510/Appetizer/main/appetizers/Assets.xcassets/AppIcon.appiconset/AppIcon.png",
      description: "Appetizer IOS Application with SwiftUI and Api interfaces.",
      techStack: ["Swift", "SwiftUI", "iOS", "REST API"],
      githubRepoLink: "https://github.com/vishnu32510/Appetizer",
    ),
    Project(
      name: "Apple Framework List",
      tags: [ProjectTag.mobile],
      imageUrl:
          "https://raw.githubusercontent.com/vishnu32510/Apple-Frameworks/main/Apple-Frameworks/Assets.xcassets/AppIcon.appiconset/AppIcon.png",
      description:
          "Apple Frameworks List in Gridview and Listview with SwiftUI",
      techStack: ["Swift", "SwiftUI", "iOS"],
      githubRepoLink: "https://github.com/vishnu32510/Apple-Frameworks",
    ),
    Project(
      name: "Whatsapp UI Clone",
      tags: [ProjectTag.mobile],
      imageUrl: "",
      description: "Whatsapp UI Clone with FLutter",
      techStack: ["Flutter", "Dart", "UI/UX"],
      githubRepoLink: "https://github.com/vishnu32510/flutter_whatsapp",
    ),
    Project(
      name: "Facebook Responsive UI Clone",
      tags: [ProjectTag.web],
      imageUrl: "",
      description:
          "Flutter Facebook Responsive Responsive UI for Web and Mobile",
      techStack: ["Flutter", "Dart", "Web", "Responsive UI"],
      githubRepoLink: "https://github.com/vishnu32510/flutter_facebook",
    ),
    Project(
      name: "Weather App UI",
      tags: [ProjectTag.mobile],
      imageUrl:
          "https://raw.githubusercontent.com/vishnu32510/SwiftUI-Weather/main/SwiftUI-Weather/Assets.xcassets/AppIcon.appiconset/AppIcon.png",
      description: "Swift Weather App UI in Dark and Light Mode",
      techStack: ["Swift", "SwiftUI", "iOS", "Dark Mode"],
      githubRepoLink: "https://github.com/vishnu32510/SwiftUI-Weather",
    ),
    Project(
      name: "My GitHub Profile Details",
      tags: [ProjectTag.mobile],
      imageUrl:
          "https://raw.githubusercontent.com/vishnu32510/GitHubSwift/main/GitHubSwift/Assets.xcassets/AppIcon.appiconset/AppIcon.png",
      description:
          "Simple Swift IOS App to display my GitHub Details form the Github API",
      techStack: ["Swift", "SwiftUI", "iOS", "GitHub API"],
      githubRepoLink: "https://github.com/vishnu32510/GitHubSwift",
    ),
  ];

  static const List<TechnicalSkill> technicalSkills = [
    TechnicalSkill(
      category: 'Languages',
      skills: [
        'Dart',
        'Python',
        'JavaScript',
        'TypeScript',
        'Swift',
        'Kotlin',
        'Java',
        'C/C++',
      ],
    ),
    TechnicalSkill(
      category: 'Mobile & Frontend',
      skills: ['Flutter', 'Android', 'iOS', 'React', 'HTML/CSS'],
    ),
    TechnicalSkill(
      category: 'Backend',
      skills: [
        'Node.js',
        'Express.js',
        'FastAPI',
        'REST APIs',
        'PostgreSQL',
        'MongoDB',
        'Firebase',
      ],
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
      coursework: [
        'Software Development',
        'Data Structures',
        'Algorithms',
        'Database Systems',
      ],
    ),
  ];
}
