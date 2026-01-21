# Firebase Setup Guide

## Overview
All portfolio data is now stored in Firebase Firestore and can be updated directly from the Firebase Console without code changes.

## Firestore Structure

Create a collection named `portfolio` with a document ID `data`:

```
portfolio/
  └── data/
      ├── developerName: string
      ├── developerTitle: string
      ├── introMessage: string
      ├── resumeLink: string
      ├── socialLinks: map<string, string>
      ├── technicalSkills: array
      ├── experiences: array
      ├── projects: array
      └── education: array
```

## Document Structure Example

```json
{
  "developerName": "Vishnu Priyan",
  "developerTitle": "Software Engineer (Full-Stack & Mobile)",
  "introMessage": "Software Engineer with 3+ years of experience...",
  "resumeLink": "https://drive.google.com/file/d/...",
  "socialLinks": {
    "github": "https://github.com/vishnu32510",
    "linkedin": "https://www.linkedin.com/in/vishnu32510/",
    "email": "mailto:vishnu32510@gmail.com",
    "devTo": "https://dev.to/vishnu32510",
    "twitter": "https://twitter.com/vishnu32510",
    "stackOverflow": "https://stackoverflow.com/users/...",
    "instagram": "https://www.instagram.com/vishnu32510/"
  },
  "technicalSkills": [
    {
      "category": "Languages",
      "skills": ["Dart", "Python", "JavaScript", "TypeScript", "Swift", "Kotlin", "Java", "C/C++"]
    },
    {
      "category": "Mobile & Frontend",
      "skills": ["Flutter", "Android", "iOS", "React", "HTML/CSS"]
    },
    {
      "category": "Backend",
      "skills": ["Node.js", "Express.js", "FastAPI", "REST APIs", "PostgreSQL", "MongoDB", "Firebase"]
    },
    {
      "category": "Tools & DevOps",
      "skills": ["Git", "Docker", "CI/CD", "GitHub Actions", "AWS", "GCP"]
    }
  ],
  "experiences": [
    {
      "title": "Software Engineer",
      "company": "Your Company Name",
      "period": "Month Year - Present",
      "achievements": [
        "Built scalable mobile applications using Flutter...",
        "Developed REST APIs using Node.js...",
        "Implemented clean architecture patterns..."
      ]
    }
  ],
  "projects": [
    {
      "name": "My Portfolio",
      "imageUrl": "https://raw.githubusercontent.com/...",
      "description": "Responsive Portfolio designed for Android, IOS, Web...",
      "githubRepoLink": "https://github.com/vishnu32510/portfolio_flutter",
      "previewLink": null,
      "googlePlay": null
    }
  ],
  "education": [
    {
      "degree": "Bachelor of Science, Computer Science",
      "institution": "Your University",
      "period": "Year - Year",
      "coursework": ["Software Development", "Data Structures", "Algorithms", "Database Systems"],
      "research": null
    }
  ]
}
```

## How to Update Data

1. Go to [Firebase Console](https://console.firebase.google.com/)
2. Select your project: `vishnupriyan-ss`
3. Navigate to Firestore Database
4. Find the `portfolio` collection
5. Click on the `data` document
6. Edit any field directly
7. Changes will be reflected in real-time on your portfolio website

## Social Links Mapping

The app automatically detects social media platforms based on URL patterns:
- `dev.to` → DEV icon
- `github.com` → GitHub icon
- `stackoverflow.com` → StackOverflow icon
- `instagram.com` → Instagram icon
- `linkedin.com` → LinkedIn icon
- `twitter.com` → Twitter icon
- `mailto:` → Email icon

## Notes

- All changes are reflected in real-time via Firestore streams
- If Firebase is unavailable, the app falls back to default data
- The app automatically handles loading states and errors
