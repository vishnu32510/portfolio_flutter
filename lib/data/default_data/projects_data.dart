import '../models/project.dart';

class ProjectsData {
  static List<Project> getProjects() {
    return const [
      Project(
        name: "LinkedIn AI Assistant",
        tags: [
          ProjectTag.featured,
          ProjectTag.ai,
          ProjectTag.web,
          ProjectTag.backend,
        ],
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
        gifUrl:
            "https://raw.githubusercontent.com/vishnu32510/linkedin-ai-asistant/main/LinkedInNote.gif",
      ),
      Project(
        name: 'My Portfolio',
        tags: [
          ProjectTag.featured,
          ProjectTag.web,
          ProjectTag.mobile,
          ProjectTag.backend,
        ],
        imageUrl:
            'https://raw.githubusercontent.com/vishnu32510/portfolio_flutter/main/assets/images/appIcon.png',
        description:
            'Responsive Portfolio designed for Android, IOS, Web, MacOS with Flutter SDK using Bloc State management',
        techStack: ['Flutter', 'Dart', 'Bloc', 'Firebase', 'Firestore', 'Web'],
        status: 'Completed',
        githubRepoLink: 'https://github.com/vishnu32510/portfolio_flutter',
        demoLink: 'https://avatars.githubusercontent.com/u/226618007',
      ),
      Project(
        name: 'Floxi',
        tags: [
          ProjectTag.featured,
          ProjectTag.ai,
          ProjectTag.mobile,
          ProjectTag.web,
          ProjectTag.backend,
        ],
        isAsset: true,
        imageUrl: 'assets/logo/floxi_icon.png',
        description:
            'Eco-reward app to promote sustainable actions with AI-driven suggestions, receipt & barcode-based carbon tracking, and a B2B analytics dashboard.',
        techStack: [
          'AI / ML',
          'Agentic',
          'Python',
          'Flutter',
          'Flask',
          'React.js',
          'Next.js',
          'Dart',
          'Firebase',
          'GCP',
          'Node.js',
          'Android',
          'IOS',
          "Docker",
        ],
        status: 'Completed',
        githubRepoLink: 'https://github.com/floxi-co',
        demoLink: 'https://floxi.co',
      ),
      Project(
        name: 'Flashlight Control',
        tags: [ProjectTag.featured, ProjectTag.mobile],
        imageUrl:
            'https://raw.githubusercontent.com/vishnu32510/flashlight_control_flutter/main/assets/marketing/app_icon_512.png',
        description:
            'Cross-platform Flutter flashlight app with feature-first architecture (Bloc, go_router, get_it). Store pipelines: GitHub Actions for Android (Play Console internal/production via Fastlane) and iOS via Xcode Cloud with Fastlane match; optional iOS lanes on GitHub Actions for TestFlight and App Store submit.',
        techStack: [
          'Flutter',
          'Dart',
          'Bloc',
          'go_router',
          'get_it',
          'Fastlane',
          'GitHub Actions',
          'Xcode Cloud',
          'iOS',
          'Android',
          'CI/CD',
        ],
        status: 'Active (iOS & Android)',
        githubRepoLink:
            'https://github.com/vishnu32510/flashlight_control_flutter',
      ),
      Project(
        name: 'Plushify Me',
        tags: [ProjectTag.featured, ProjectTag.ai, ProjectTag.mobile],
        imageUrl:
            'https://raw.githubusercontent.com/vishnu32510/plushie_flutter/main/assets/app_icon.png',
        description:
            'iOS app that turns photos into plushie-style images using OpenAI gpt-image-1 (edits API). Shipped on the App Store; automation with Xcode Cloud and GitHub Actions alongside a clean BLoC-based Flutter codebase.',
        techStack: [
          'Flutter',
          'Dart',
          'Bloc',
          'OpenAI API',
          'gpt-image-1',
          'Xcode Cloud',
          'GitHub Actions',
          'iOS',
        ],
        status: 'Live on App Store',
        githubRepoLink: 'https://github.com/vishnu32510/plushie_flutter',
        demoLink: 'https://apps.apple.com/ca/app/plushify-me/id6760384789',
      ),
      Project(
        name: 'Fact Dynamics',
        tags: [
          ProjectTag.featured,
          ProjectTag.ai,
          ProjectTag.backend,
          ProjectTag.mobile,
          ProjectTag.web,
        ],
        imageUrl:
            'https://raw.githubusercontent.com/vishnu32510/fact_pulse/main/assets/icon/icon.png',
        description:
            'Real-time fact-checking for speech & images. Showcased in the Perplexity API Cookbook with Dart and Flutter SDKs.',
        techStack: [
          'Flutter',
          'Dart',
          'Perplexity API',
          'LangChain',
          'FastAPI',
          'Agentic',
          'Real-time',
        ],
        status: 'Completed',
        githubRepoLink: 'https://github.com/vishnu32510/fact_pulse',
        demoLink: 'https://fact-pulse.web.app/',
      ),
      Project(
        name: 'Chi Planner',
        tags: [
          ProjectTag.featured,
          ProjectTag.ai,
          ProjectTag.mobile,
          ProjectTag.backend,
        ],
        imageUrl:
            'https://raw.githubusercontent.com/vishnu32510/chi-scartlet-hacks/main/assets/images/chicago.png',
        description:
            'Live trip & event planner with LLM integration and real-time attraction data scraping. Scarlet Hacks 2024 winner.',
        techStack: ['Flutter', 'Dart', 'LLM', 'Google Cloud', 'APIs'],
        status: 'Completed',
        githubRepoLink: 'https://github.com/vishnu32510/chi-scartlet-hacks',
        demoLink: 'https://devpost.com/software/chi-town-places-event-planner',
      ),
      Project(
        name: 'perplexity_dart',
        tags: [ProjectTag.featured, ProjectTag.ai, ProjectTag.backend],
        imageUrl:
            'https://upload.wikimedia.org/wikipedia/commons/7/7e/Dart-logo.png',
        description: 'Dart SDK for the Perplexity API with streaming support.',
        techStack: ['Dart', 'Perplexity API', 'SDK'],
        status: 'Published',
        githubRepoLink: 'https://github.com/vishnu32510/perplexity_dart',
        demoLink: 'https://pub.dev/packages/perplexity_dart',
      ),
      Project(
        name: 'perplexity_flutter',
        tags: [
          ProjectTag.featured,
          ProjectTag.ai,
          ProjectTag.mobile,
          ProjectTag.web,
        ],
        imageUrl:
            'https://upload.wikimedia.org/wikipedia/commons/7/7e/Dart-logo.png',
        description:
            'Flutter UI SDK for building Perplexity-powered experiences.',
        techStack: ['Flutter', 'Dart', 'Perplexity API', 'SDK'],
        status: 'Published',
        githubRepoLink: 'https://github.com/vishnu32510/perplexity_flutter',
        demoLink: 'https://pub.dev/packages/perplexity_flutter',
      ),
      Project(
        name: "Aurora Mobile Challenge",
        tags: [ProjectTag.mobile],
        imageUrl:
            "https://raw.githubusercontent.com/vishnu32510/aurora_mobile_challenge/refs/heads/main/assets/icons/icon.png",
        description:
            "Mobile application challenge project showcasing Flutter development skills",
        techStack: ["Flutter", "Dart"],
        githubRepoLink:
            "https://github.com/vishnu32510/aurora_mobile_challenge",
      ),
      Project(
        name: 'Unsplash public photos',
        tags: [ProjectTag.mobile],
        imageUrl:
            'https://raw.githubusercontent.com/vishnu32510/Photos_using_unsplash_api/main/images/icon.png',
        description:
            'Application to access Unsplash public photos (Unsplash Public API are used)',
        techStack: ['Flutter', 'Dart', 'REST API', 'Unsplash API'],
        status: 'Completed',
        githubRepoLink:
            'https://github.com/vishnu32510/Photos_using_unsplash_api',
        demoLink: null,
      ),
      Project(
        name: 'Appetizer IOS Application',
        tags: [ProjectTag.mobile],
        imageUrl:
            'https://raw.githubusercontent.com/vishnu32510/Appetizer/main/appetizers/Assets.xcassets/AppIcon.appiconset/AppIcon.png',
        description:
            'Appetizer IOS Application with SwiftUI and Api interfaces.',
        techStack: ['Swift', 'SwiftUI', 'iOS', 'REST API'],
        status: 'Completed',
        githubRepoLink: 'https://github.com/vishnu32510/Appetizer',
        demoLink: null,
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
        name: 'Apple Framework List',
        tags: [ProjectTag.mobile],
        imageUrl:
            'https://raw.githubusercontent.com/vishnu32510/Apple-Frameworks/main/Apple-Frameworks/Assets.xcassets/AppIcon.appiconset/AppIcon.png',
        description:
            'Apple Frameworks List in Gridview and Listview with SwiftUI',
        techStack: ['Swift', 'SwiftUI', 'iOS'],
        status: 'Completed',
        githubRepoLink: 'https://github.com/vishnu32510/Apple-Frameworks',
        demoLink: null,
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
      Project(
        name: 'Whatsapp UI Clone',
        tags: [ProjectTag.mobile, ProjectTag.web],
        imageUrl: '',
        description: 'Whatsapp UI Clone with FLutter',
        techStack: ['Flutter', 'Dart', 'UI/UX'],
        status: 'Completed',
        githubRepoLink: 'https://github.com/vishnu32510/flutter_whatsapp',
        demoLink: null,
      ),
      Project(
        name: 'Facebook Responsive UI Clone',
        tags: [ProjectTag.web, ProjectTag.mobile],
        imageUrl: '',
        description:
            'Flutter Facebook Responsive Responsive UI for Web and Mobile',
        techStack: ['Flutter', 'Dart', 'Web', 'Responsive UI'],
        status: 'Completed',
        githubRepoLink: 'https://github.com/vishnu32510/flutter_facebook',
        demoLink: null,
      ),
      Project(
        name: "Swift Weather App",
        tags: [ProjectTag.mobile],
        imageUrl:
            "https://raw.githubusercontent.com/vishnu32510/swift-weather-app/refs/heads/master/OpenMeteoWeatherApp/Assets.xcassets/AppIcon.appiconset/ICOND%201.png",
        description:
            "iOS weather application using Open Meteo API with SwiftUI for real-time weather data",
        techStack: ["Swift", "SwiftUI", "iOS", "REST API"],
        githubRepoLink: "https://github.com/vishnu32510/swift-weather-app",
      ),
      Project(
        name: "Theater App UI",
        tags: [ProjectTag.mobile],
        imageUrl:
            "https://raw.githubusercontent.com/vishnu32510/TheaterApp_Kotlin/refs/heads/main/app/src/main/ic_launcher-playstore.png",
        description:
            "Modern theater booking app UI built with Kotlin Jetpack Compose",
        techStack: ["Kotlin", "Jetpack Compose", "Android"],
        githubRepoLink: "https://github.com/vishnu32510/TheaterApp_Kotlin",
      ),
      Project(
        name: 'Weather App UI',
        tags: [ProjectTag.mobile],
        imageUrl:
            'https://raw.githubusercontent.com/vishnu32510/SwiftUI-Weather/main/SwiftUI-Weather/Assets.xcassets/AppIcon.appiconset/AppIcon.png',
        description: 'Swift Weather App UI in Dark and Light Mode',
        techStack: ['Swift', 'SwiftUI', 'iOS', 'Dark Mode'],
        status: 'Completed',
        githubRepoLink: 'https://github.com/vishnu32510/SwiftUI-Weather',
        demoLink: null,
      ),
      Project(
        name: 'My GitHub Profile Details',
        tags: [ProjectTag.mobile],
        imageUrl:
            'https://raw.githubusercontent.com/vishnu32510/GitHubSwift/main/GitHubSwift/Assets.xcassets/AppIcon.appiconset/AppIcon.png',
        description:
            'Simple Swift IOS App to display my GitHub Details form the Github API',
        techStack: ['Swift', 'SwiftUI', 'iOS', 'GitHub API'],
        status: 'Completed',
        githubRepoLink: 'https://github.com/vishnu32510/GitHubSwift',
        demoLink: null,
      ),
    ];
  }
}
