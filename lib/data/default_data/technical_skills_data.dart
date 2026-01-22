import '../models/technical_skill.dart';

class TechnicalSkillsData {
  static List<TechnicalSkill> getSkills() {
    return const [
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
    ];
  }
}
