import '../models/experience.dart';

class ExperiencesData {
  static List<Experience> getExperiences() {
    return const [
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
    ];
  }
}
