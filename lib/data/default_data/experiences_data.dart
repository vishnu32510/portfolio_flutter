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
          'Manage 4 offshore engineers and mentor 7+ developers, leading Clean Architecture feature roadmaps and code reviews.',
          'Lead feature delivery for an enterprise Life Insurance app with 100k+ downloads, 2k+ reviews, and a 4.8 rating.',
          'Engineered full-stack features across 10+ microservices, pairing Spring Boot backends with React.js frontends.',
          'Developed native iOS/Android with Kotlin & Swift Home Screen Widgets & biometric auth.',
          'Manage feature experiments & rollout flags via Darwin experimentation, with telemetry across Splunk and New Relic.',
          'Led major framework version migrations and rapid hotfix releases, preventing downtime for high-volume users.',
        ],
      ),
      Experience(
        title: 'Software Engineer',
        company: 'HealthLab Innovations Inc, Arlington, VA',
        period: 'OCT 2025 - MAR 2026',
        companyUrl: 'https://healthlab.com',
        logoChipBlackInLight: true,
        achievements: [
          'Built and maintained React.js/Next.js + TypeScript portals for patients and staff by adding role based access.',
          'Designed and deployed Python and Go microservices on GCP (GKE, Cloud Run), integrating Kafka event streams.',
          'Implemented secure authentication, role-based access systems and IAM management for sensitive healthcare data.',
          'Built production ETL processing 5.4M+ files, with idempotency, audit logs, & automated 14 Cloud Run jobs & functions.',
          'Designed and deployed Dockerized services on GCP/Azure using CI/CD pipelines, safe rollout, achieving 99% uptime.',
          'Implemented REST/gRPC + GraphQL APIs with auditability, observability, and healthcare compliance requirements.',
        ],
      ),
      Experience(
        title: 'Software Development Intern',
        company: 'Leap Of Faith Technologies, Chicago, IL',
        period: 'MAY 2025 - DEC 2025',
        companyUrl: 'https://www.leapoffaith.com',
        achievements: [
          'Built & deployed a HIPAA-compliant healthcare Flutter app for EHR/FHIR data visualization on Play & App Store.',
          'Developed backend mapping logic in FastAPI for the TheraCare platform, supporting patients and clinicians.',
          'Integrated MCP and LLM/agent based ETL with FlaskAPI, enabling automated insight for healthcare operations.',
          'Automated CI/CD test and deployment pipelines on AWS using Jenkins and Docker containers.',
          'Implemented TalkBack/VoiceOver accessibility, increasing compliance with accessibility standards for visually impaired.',
        ],
      ),
      Experience(
        title: 'Software Engineer / Co-Founder',
        company: 'Floxi, Chicago, IL',
        period: 'APR 2025 - DEC 2025',
        companyUrl: 'https://floxi.co',
        achievements: [
          'B2B+B2C eco-reward app: deployed AI integrated Flutter app to the App & Play Store, automated CI/CD pipelines.',
          'Designed scalable backend microservices using Flask, Node.js and Scala for data processing and service orchestration.',
          'Built a receipt-extraction pipeline with OCR/LLM hybrid models, achieving 95% accuracy across real-world receipts.',
          'Designed a RAG-based eco-product suggestion system using agentic orchestration with functional & MCP tools.',
          'Built AI-driven product suggestions, barcode scanning, and receipt-based carbon tracking as scalable GCP microservices.',
          'Collaborated through pair programming, design syncs, and reviews to ensure rapid iteration and maintainable code.',
        ],
      ),
      Experience(
        title: 'Software Engineer II',
        company: 'Grootan Technologies, Chennai',
        period: 'MAR 2022 - NOV 2023',
        companyUrl: 'https://www.grootan.com',
        achievements: [
          'Collaborated in an agile, cross-functional team in White-Label Superapps (Istanbul Senin - Banking, 1M+ downloads).',
          'Modularized the app architecture improving maintainability and scalability, reducing application load time by 40%.',
          'Refactored 50k+ LOC using Bloc, TDD, and SOLID principles, boosting test (unit and integration) coverage by 60%.',
          'Integrated Biometric auth, IDP authentication, OAuth 2.0, Stripe payment gateways, and KYC / ID verification paths.',
          'Implemented TalkBack/VoiceOver accessibility raising compliance. Leveraged Kotlin and Swift for plugin development.',
          'Diagnosed ANRs and memory leaks via Profiler and Sentry. Automated CI/CD via TeamCity, reducing effort by 80%.',
          'Mentored 3 junior engineers, conducted code reviews, owned feature modules & contributed to architecture decisions.',
        ],
      ),
      Experience(
        title: 'Software Engineer',
        company: 'Farazon Software Technologies, Coimbatore',
        period: 'APR 2021 - MAR 2022',
        companyUrl: 'https://www.farazon.com',
        achievements: [
          'Contributed to the R & D team developing real-time IoT systems for oxygen generators using Flutter, MQTT.',
          'Developed cross-platform sensor-based apps (Bluetooth, GPS, NFC) & integrated IoT telemetry using Flask & Firebase.',
        ],
      ),
    ];
  }
}
