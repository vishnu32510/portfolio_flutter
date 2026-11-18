import '../models/experience.dart';

class ExperiencesData {
  static List<Experience> getExperiences() {
    return const [
      Experience(
        title: 'Software Engineer / Mobile Lead',
        company: 'Capgemini America, Inc, New York, NY',
        period: 'MAR 2026 - Present',
        companyUrl: 'https://www.capgemini.com',
        achievements: [
          'Lead feature delivery for an enterprise Life Insurance application with 100K+ downloads, 2K+ reviews, and a 4.8 rating, partnering with product, design, QA, backend, and distributed engineering teams.',
          'Manage 4 offshore engineers and mentor 7+ developers, leading feature planning, Clean Architecture roadmaps, technical direction, and code reviews.',
          'Develop production Flutter/Dart features integrating REST/HTTP APIs and backend data contracts, with BLoC-based state management and maintainable presentation, business, and data layers.',
          'Engineered full-stack insurance policy workflows across 10+ microservices, pairing Spring Boot (Java) and FastAPI (Python) backends with React.js (TypeScript) frontends.',
          'Develop native iOS and Android functionality using Swift and Kotlin via platform channels, including Home Screen Widgets, secure biometric authentication, and platform-specific integrations.',
          'Led Flutter SDK and native build-system upgrades, modernizing Android Gradle/Kotlin configuration and JVM compatibility, and migrating iOS dependencies to Swift Package Manager (SPM).',
          'Integrate and maintain mobile observability and analytics across ContentSquare, Adobe Analytics, Firebase Analytics, Splunk, and New Relic.',
          'Manage Darwin feature experiments and controlled rollouts to monitor user behavior, regressions, crashes, and production performance.',
          'Lead major production hotfix releases, coordinating validation and deployment via Harness CI/CD to minimize impact on high-volume users.',
        ],
      ),
      Experience(
        title: 'Software Engineer',
        company: 'HealthLab Innovations Inc, Arlington, VA',
        period: 'OCT 2025 - MAR 2026',
        companyUrl: 'https://healthlab.com',
        logoChipBlackInLight: true,
        achievements: [
          'Developed and maintained a Flutter healthcare application, building production mobile features and integrating clinical data and backend services.',
          'Built and maintained React.js/Next.js + TypeScript portals for patients and staff, implementing secure authentication, IAM management, and role-based access to sensitive healthcare data.',
          'Designed and deployed Python, Go, and Scala microservices on GCP (GKE, Cloud Run), integrating Kafka event streams.',
          'Built production FastAPI services and REST/gRPC/GraphQL APIs for clinical workflows, implementing data validation, error handling, backend integrations, auditability, observability, and healthcare compliance requirements.',
          'Built production ETL pipelines processing 5.4M+ files, with idempotency, audit logs, and 14 automated Cloud Run jobs and functions.',
          'Designed and deployed Dockerized services on GCP/Azure using CI/CD pipelines and safe rollouts, achieving 99% uptime.',
        ],
      ),
      Experience(
        title: 'Software Development Intern / Flutter Engineer',
        company: 'Leap Of Faith Technologies, Chicago, IL',
        period: 'MAY 2025 - DEC 2025',
        companyUrl: 'https://www.leapoffaith.com',
        achievements: [
          'Built and deployed a HIPAA-compliant Flutter healthcare application combining mobile and AI modules, EHR/FHIR data visualization, and backend integrations for patient and clinical workflows across iOS and Android.',
          'Developed Flutter features with Provider state management and integrated backend healthcare services for displaying and managing structured clinical data.',
          'Developed FastAPI mapping logic for the TheraCare platform, transforming structured healthcare data for consumption by patient and clinician applications.',
          'Integrated MCP and LLM/agent-based ETL with Flask APIs to automate insights for healthcare operations.',
          'Automated CI/CD test and deployment pipelines on AWS using Jenkins and Docker containers.',
          'Implemented TalkBack and VoiceOver accessibility, increasing compliance with accessibility standards for users with visual impairments.',
        ],
      ),
      Experience(
        title: 'Software Engineer / Co-Founder',
        company: 'Floxi, Chicago, IL',
        period: 'APR 2025 - DEC 2025',
        companyUrl: 'https://devpost.com/software/floxi',
        logoUrl: 'assets/logo/floxi_icon.png',
        achievements: [
          'Built and deployed a cross-platform B2B+B2C sustainability and eco-rewards Flutter app to the Apple App Store and Google Play, featuring barcode scanning, receipt-based carbon tracking, and AI-powered product recommendations.',
          'Designed scalable TypeScript/Node.js, Flask (Python), and Scala backend microservices on GCP for data processing and service orchestration with automated Docker CI/CD pipelines.',
          'Built an OCR/LLM hybrid receipt-extraction pipeline achieving 95% accuracy across real-world receipts.',
          'Designed a RAG-based eco-product recommendation system using agentic orchestration (ADK), functional tools, and MCP integrations.',
          'Collaborated through pair programming, design syncs, and code reviews to ensure rapid iteration and maintainable architecture.',
        ],
      ),
      Experience(
        title: 'Software Engineer II / Flutter Engineer II',
        company: 'Grootan Technologies, Chennai',
        period: 'MAR 2022 - NOV 2023',
        companyUrl: 'https://www.grootan.com',
        achievements: [
          'Developed and maintained white-label Flutter superapps, including Istanbul Senin banking workflows, with 1M+ downloads, collaborating with product, backend, QA, design, and mobile teams in an Agile environment.',
          'Modularized Flutter architecture and reusable components, improving maintainability and scalability while reducing application load time by 40%.',
          'Refactored 50K+ lines of code using BLoC, TDD, and SOLID principles, increasing unit and integration test coverage by 80%.',
          'Integrated REST APIs using Dio/HTTP, handling JSON serialization, authentication, API errors, and application state across production Flutter features.',
          'Integrated Stripe payment gateways, Biometric authentication, IDP authentication, OAuth 2.0, and KYC/ID verification workflows, and developed native platform plugins using Kotlin and Swift.',
          'Diagnosed and resolved ANRs, memory leaks, crashes, and performance regressions using profiling tools and Sentry.',
          'Implemented TalkBack and VoiceOver accessibility and automated CI/CD through TeamCity, reducing manual deployment effort by 80%.',
          'Mentored and onboarded 3 junior engineers, conducted code reviews, owned feature delivery, and contributed to architecture and technical decisions.',
        ],
      ),
      Experience(
        title: 'Software Engineer / Flutter Developer',
        company: 'Farazon Software Technologies, Coimbatore',
        period: 'APR 2021 - MAR 2022',
        companyUrl: 'https://www.farazon.com',
        achievements: [
          'Developed real-time Flutter applications with the R&D team for IoT-enabled oxygen generator systems, integrating MQTT-based communication and live device telemetry.',
          'Built Flutter applications integrating RFID tag readers and connected-device workflows for capturing and processing RFID tag data.',
          'Built cross-platform sensor and device integrations using Bluetooth/BLE, NFC, and GPS, handling real-time data capture and exchange between mobile applications and connected hardware.',
          'Developed Python (Flask) and Firebase integrations to collect, process, and synchronize IoT telemetry across mobile applications, backend services, and connected devices.',
        ],
      ),
    ];
  }
}
