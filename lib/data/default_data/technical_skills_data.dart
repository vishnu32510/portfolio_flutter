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
          'Rust',
          'C',
          'C++',
          'Java',
          'HTML',
          'CSS',
        ],
      ),
      TechnicalSkill(
        category: 'Gen AI & LLM Tools 🤖',
        skills: [
          'ADK / LangChain / AutoGen',
          'OpenAI / Anthropic / Gemini / Claude',
          'Claude Code',
          'Cursor',
          'Vertex AI',
          'Batch Prediction',
          'Model Context Protocol (MCP)',
          'RAG pipelines',
          'OCR + LLM extraction with OCR / LLM extraction',
          'Vector embeddings',
        ],
      ),
      TechnicalSkill(
        category: 'Cloud & DevOps ☁️',
        skills: [
          'Google Cloud Platform (GCP)',
          'Microsoft Azure',
          'Amazon Web Services (AWS)',
          'Docker',
          'Kubernetes',
          'Terraform',
          'Cloud Run Services/Jobs',
          'AWS Lambda',
          'AWS ECS',
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
          'REST API',
          'gRPC API',
          'GraphQL',
          'WebSocket',
          'Kafka',
          'RabbitMQ',
          'ETL',
          'Data Pipelines',
          'Automations & Workflows',
        ],
      ),
      TechnicalSkill(
        category: 'Frontend Development & UI/UX',
        skills: [
          'React,js',
          'Next.js',
          'Angular',
        ],
      ),
      TechnicalSkill(
        category: 'Backend Development & API Development',
        skills: [
          'Flask',
          'FastAPI',
          'Node.js',
          'Express.js',
          'Gin',
          'Play Framework',
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
          'Room',
          'Dagger / Hilt',
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
