import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import '../../../data/models/portfolio_data.dart';
import '../../../data/models/technical_skill.dart';
import '../../../data/models/experience.dart';
import '../../../data/models/project.dart';
import '../../../data/models/education.dart';

part 'portfolio_event.dart';
part 'portfolio_state.dart';

class PortfolioBloc extends Bloc<PortfolioEvent, PortfolioState> {
  PortfolioBloc()
      : super(PortfolioState(
          data: _getDefaultData(),
          isLoading: false,
        )) {
    on<LoadPortfolioData>(_onLoadPortfolioData);
    on<PortfolioDataUpdated>(_onPortfolioDataUpdated);

    // Load initial data immediately
    add(const LoadPortfolioData());
  }

  Future<void> _onLoadPortfolioData(
    LoadPortfolioData event,
    Emitter<PortfolioState> emit,
  ) async {
    emit(state.copyWith(isLoading: true, error: null));
    
    // Use default data directly
    emit(state.copyWith(
      data: _getDefaultData(),
      isLoading: false,
      error: null,
    ));
  }

  void _onPortfolioDataUpdated(
    PortfolioDataUpdated event,
    Emitter<PortfolioState> emit,
  ) {
    emit(state.copyWith(data: event.data, isLoading: false, error: null));
  }

  static PortfolioData _getDefaultData() {
    // Fallback data if Firebase is unavailable - using actual resume and GitHub data
    return PortfolioData(
      developerName: 'Vishnu Priyan Sellam Shanmugavel',
      developerTitle: 'Software Engineer - Full-stack',
      introMessage:
          'Software Engineer - Full-stack specializing in building high-performance, cross-platform apps with Flutter, Dart, and Firebase, plus native Android (Kotlin) & iOS (Swift) SDKs. Backend & web experience with Flask, Next.js, and cloud deployments (Google Cloud, AWS) to power mobile and web experiences. Founder of Floxi – an eco-reward platform gamifying sustainable actions. Hackathon winner, open-source contributor, and cloud-native solutions builder.',
      resumeLink:
          'https://drive.google.com/file/d/1WDLPye0JSXinnxGaFskq1mqi42cVCjKy/view?usp=sharing',
             socialLinks: const {
               'github': 'https://github.com/vishnu32510',
               'linkedin': 'https://www.linkedin.com/in/vishnu32510/',
               'email': 'mailto:vishnu32510@gmail.com',
               'devpost': 'https://devpost.com/vishnu32510',
               'twitter': 'https://twitter.com/vishnu32510',
               'stackOverflow': 'https://stackoverflow.com/users/15953982/vishnu-priyan-s-s?tab=profile',
               'instagram': 'https://www.instagram.com/vishnu32510/',
               'portfolio': 'https://floxi.co',
             },
      technicalSkills: const [
        TechnicalSkill(
          category: 'Programming Languages 💻',
          skills: [
            'Python',
            'JavaScript',
            'TypeScript',
            'Dart',
            'Kotlin',
            'Swift',
            'Go',
            'C',
            'C++',
            'Java',
            'Rust',
            'HTML',
            'CSS',
          ],
        ),
        TechnicalSkill(
          category: 'Gen AI & LLM Tools 🤖',
          skills: [
            'ADK / LangChain / AutoGen',
            'Model Context Protocol (MCP)',
            'RAG pipelines',
            'OCR + LLM extraction',
            'Vector embeddings',
          ],
        ),
        TechnicalSkill(
          category: 'Cloud & DevOps ☁️',
          skills: [
            'Google Cloud Platform (GCP)',
            'Microsoft Azure',
            'Amazon Web Services (AWS)',
            'Firebase',
            'Docker & Containers',
            'FCM (Firebase Cloud Messaging)',
            'CI / CD',
            'Pub/Sub & messaging',
            'Jenkins',
            'Git',
          ],
        ),
        TechnicalSkill(
          category: 'Data & Integrations 🔗',
          skills: [
            'REST / gRPC APIs',
            'GraphQL',
            'Kafka',
            'RabbitMQ',
            'ETL',
            'Data Pipelines',
            'Automations & workflows',
          ],
        ),
        TechnicalSkill(
          category: 'Frameworks & Libraries 🧩',
          skills: [
            'Flask',
            'Node.js',
            'React.js',
            'Next.js',
            'Angular',
            'Gin',
            'Play Framework',
            'Room',
            'Dagger / Hilt',
            'Mocha',
          ],
        ),
        TechnicalSkill(
          category: 'Mobile Development 📱',
          skills: [
            'Flutter',
            'Jetpack Compose',
            'SwiftUI',
            'Bloc',
            'Redux',
            'MVVM',
            'JUnit',
            'Mockito',
            'XCTest',
            'Accessibility (a11y)',
          ],
        ),
        TechnicalSkill(
          category: 'Methodologies 📐',
          skills: [
            'Object-Oriented Programming (OOP)',
            'Test-Driven Development (TDD)',
            'SOLID principles',
            'Agile & Scrum',
            'Integration Testing',
            'Distributed Systems',
            'Multi-tiered architectures',
          ],
        ),
      ],
      experiences: const [
        Experience(
          title: 'Software Engineer',
          company: 'HealthLab Innovations Inc, Arlington, VA',
          period: 'OCT 2025 - Present',
          achievements: [
            'Built and maintained React.js/Next.js + TypeScript portals for patients and staff by adding role based access',
            'Built FastAPI and Go agentic microservices for lab code mapping and data validation, improving data accuracy',
            'Designed and deployed Azure/GCP + Docker containerized services with automated CI/CD pipelines with 99% uptime',
            'Implemented REST/gRPC + GraphQL APIs with auditability, observability, and healthcare compliance requirements',
          ],
        ),
        Experience(
          title: 'Software Development Intern',
          company: 'Leap Of Faith Technologies, Chicago, IL',
          period: 'MAY 2025 - DEC 2025',
          achievements: [
            'Integrated MCP and LLM/agent based ETL with FlaskAPI, enabling automated insight for healthcare operations',
            'Developed secure modules combining mobile technology and AI with Flutter to deliver a HIPAA-compliant experience',
            'Implemented TalkBack/VoiceOver accessibility, increasing compliance with accessibility standards for visually impaired',
          ],
        ),
        Experience(
          title: 'Software Engineer / CO-FOUNDER',
          company: 'Floxi, Chicago, IL',
          period: 'APR 2025 - DEC 2025',
          achievements: [
            'Built and maintained web and mobile features for eco-reward platforms using React.js, Next.js, Flutter, Node.js and Flask',
            'Deployed dockerized Node.js/Flask APIs on GCP connected to MySQL and migrated to PostgreSQL for analytics',
            'Designed a RAG-based eco-product suggestion system using agentic orchestration with functional & MCP tools',
            'Built a receipt-extraction pipeline with OCR/LLM hybrid models, achieving 99% accuracy across real-world receipts',
            'Developed scalable GCP microservices for AI product suggestions system, barcode scanning, and carbon tracking',
          ],
        ),
        Experience(
          title: 'Software Engineer II',
          company: 'Grootan Technologies, Chennai',
          period: 'MAR 2022 - NOV 2023',
          achievements: [
            'Collaborated in an agile, cross-functional team in White-Label Superapps (Istanbul Senin - Banking, 1M+ downloads)',
            'Modularized the app architecture improving maintainability and scalability, reducing application load time by 40%',
            'Refactored 50k+ LOC using Bloc, TDD, and SOLID principles, boosting test (unit and integration) coverage by 60%',
            'Integrated Stripe for payments and built biometric authentication workflows to enhance app security and UI/UX',
            'Diagnosed ANRs and memory leaks via Profiler and Sentry. Automated CI/CD via TeamCity, reducing effort by 80%',
            'Mentored 3 junior engineers, conducted code reviews, owned feature modules & contributed to architecture decisions',
          ],
        ),
        Experience(
          title: 'Software Engineer',
          company: 'Farazon Software Technologies, Coimbatore',
          period: 'APR 2021 - MAR 2022',
          achievements: [
            'Collaborated with the R & D team to develop real-time IoT systems for oxygen generators using Flutter and MQTT',
            'Developed cross-platform sensor-based apps (Bluetooth, GPS, NFC) & integrated IoT telemetry using Flask & Firebase',
          ],
        ),
      ],
      projects: const [
        Project(
          name: 'My Portfolio',
          imageUrl: 'https://raw.githubusercontent.com/vishnu32510/portfolio_flutter/main/assets/images/appIcon.png',
          description: 'Responsive Portfolio designed for Android, IOS, Web, MacOS with Flutter SDK using Bloc State management',
          techStack: ['Flutter', 'Dart', 'Bloc', 'Firebase', 'Firestore', 'Web'],
          status: 'In Progress',
          githubRepoLink: 'https://github.com/vishnu32510/portfolio_flutter',
          demoLink: null,
        ),
        Project(
          name: 'Unsplash public photos',
          imageUrl: 'https://raw.githubusercontent.com/vishnu32510/Photos_using_unsplash_api/main/images/icon.png',
          description: 'Application to access Unsplash public photos (Unsplash Public API are used)',
          techStack: ['Flutter', 'Dart', 'REST API', 'Unsplash API'],
          status: 'Completed',
          githubRepoLink: 'https://github.com/vishnu32510/Photos_using_unsplash_api',
          demoLink: null,
        ),
        Project(
          name: 'Appetizer IOS Application',
          imageUrl: 'https://raw.githubusercontent.com/vishnu32510/Appetizer/main/appetizers/Assets.xcassets/AppIcon.appiconset/AppIcon.png',
          description: 'Appetizer IOS Application with SwiftUI and Api interfaces.',
          techStack: ['Swift', 'SwiftUI', 'iOS', 'REST API'],
          status: 'Completed',
          githubRepoLink: 'https://github.com/vishnu32510/Appetizer',
          demoLink: null,
        ),
        Project(
          name: 'Apple Framework List',
          imageUrl: 'https://raw.githubusercontent.com/vishnu32510/Apple-Frameworks/main/Apple-Frameworks/Assets.xcassets/AppIcon.appiconset/AppIcon.png',
          description: 'Apple Frameworks List in Gridview and Listview with SwiftUI',
          techStack: ['Swift', 'SwiftUI', 'iOS'],
          status: 'Completed',
          githubRepoLink: 'https://github.com/vishnu32510/Apple-Frameworks',
          demoLink: null,
        ),
        Project(
          name: 'Whatsapp UI Clone',
          imageUrl: '',
          description: 'Whatsapp UI Clone with FLutter',
          techStack: ['Flutter', 'Dart', 'UI/UX'],
          status: 'Completed',
          githubRepoLink: 'https://github.com/vishnu32510/flutter_whatsapp',
          demoLink: null,
        ),
        Project(
          name: 'Facebook Responsive UI Clone',
          imageUrl: '',
          description: 'Flutter Facebook Responsive Responsive UI for Web and Mobile',
          techStack: ['Flutter', 'Dart', 'Web', 'Responsive UI'],
          status: 'Completed',
          githubRepoLink: 'https://github.com/vishnu32510/flutter_facebook',
          demoLink: null,
        ),
        Project(
          name: 'Weather App UI',
          imageUrl: 'https://raw.githubusercontent.com/vishnu32510/SwiftUI-Weather/main/SwiftUI-Weather/Assets.xcassets/AppIcon.appiconset/AppIcon.png',
          description: 'Swift Weather App UI in Dark and Light Mode',
          techStack: ['Swift', 'SwiftUI', 'iOS', 'Dark Mode'],
          status: 'Completed',
          githubRepoLink: 'https://github.com/vishnu32510/SwiftUI-Weather',
          demoLink: null,
        ),
        Project(
          name: 'My GitHub Profile Details',
          imageUrl: 'https://raw.githubusercontent.com/vishnu32510/GitHubSwift/main/GitHubSwift/Assets.xcassets/AppIcon.appiconset/AppIcon.png',
          description: 'Simple Swift IOS App to display my GitHub Details form the Github API',
          techStack: ['Swift', 'SwiftUI', 'iOS', 'GitHub API'],
          status: 'Completed',
          githubRepoLink: 'https://github.com/vishnu32510/GitHubSwift',
          demoLink: null,
        ),
        // Added to match scripts/push_to_firestore.py (so default == Firestore seed)
        Project(
          name: 'Floxi',
          imageUrl: 'https://floxi.co/favicon.ico',
          description: 'Eco-reward app to promote sustainable actions with AI-driven suggestions, receipt & barcode-based carbon tracking, and a B2B analytics dashboard.',
          techStack: ['Flutter', 'Dart', 'Firebase', 'GCP', 'Node.js', 'React', 'Next.js'],
          status: 'In Progress',
          githubRepoLink: null,
          demoLink: 'https://floxi.co',
        ),
        Project(
          name: 'Fact Dynamics',
          imageUrl: 'https://docs.perplexity.ai/img/logo.svg',
          description: 'Real-time fact-checking for speech & images. Showcased in the Perplexity API Cookbook with Dart and Flutter SDKs.',
          techStack: ['Flutter', 'Dart', 'Perplexity API', 'LangChain', 'FastAPI'],
          status: 'Completed',
          githubRepoLink: null,
          demoLink: 'https://devpost.com/software/fact-dynamics',
        ),
        Project(
          name: 'Chi Planner',
          imageUrl: 'https://devpost.com/assets/devpost-logo-429a7b2f2b4c2b573b3bc073f5c4d7cd.svg',
          description: 'Live trip & event planner with LLM integration and real-time attraction data scraping. Scarlet Hacks 2024 winner.',
          techStack: ['Flutter', 'Dart', 'LLM', 'Google Cloud', 'APIs'],
          status: 'Completed',
          githubRepoLink: null,
          demoLink: 'https://devpost.com/software/chi-town-places-event-planner',
        ),
        Project(
          name: 'perplexity_dart',
          imageUrl: 'https://pub.dev/static/hash-mbqj7i/img/pub-dev-icon-cover-image.png',
          description: 'Dart SDK for the Perplexity API with streaming support.',
          techStack: ['Dart', 'Perplexity API', 'SDK'],
          status: 'Published',
          githubRepoLink: 'https://pub.dev/packages/perplexity_dart',
          demoLink: 'https://pub.dev/packages/perplexity_dart',
        ),
        Project(
          name: 'perplexity_flutter',
          imageUrl: 'https://pub.dev/static/hash-mbqj7i/img/pub-dev-icon-cover-image.png',
          description: 'Flutter UI SDK for building Perplexity-powered experiences.',
          techStack: ['Flutter', 'Dart', 'Perplexity API', 'SDK'],
          status: 'Published',
          githubRepoLink: 'https://pub.dev/packages/perplexity_flutter',
          demoLink: 'https://pub.dev/packages/perplexity_flutter',
        ),
      ],
      education: const [
        Education(
          degree: 'Master of Science in Computer Science',
          institution: 'Illinois Institute of Technology, Chicago, IL, US',
          period: 'JAN 2024 - DEC 2025',
          research: null,
          coursework: ['Machine Learning', 'Computer Vision', 'Operating Systems', 'Data Structures & Algorithms', 'Big Data Technology'],
        ),
        Education(
          degree: 'Bachelor of Technology, Electronics and Communication Engineering',
          institution: 'Amrita Vishwa Vidhyapeetham, Coimbatore, Tamil Nadu, India',
          period: 'JUL 2017 - JUN 2021',
          research: null,
          coursework: null,
        ),
      ],
    );
  }
}
