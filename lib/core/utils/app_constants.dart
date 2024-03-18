import '../../data/models/custom_service.dart';
import '../../data/models/project.dart';
import 'app_assets.dart';

abstract class AppConstants {
  static const double appBarHeight = 80;
  static const String appTitle = "Vishnu's Portfolio";
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
        imageUrl:
            "https://raw.githubusercontent.com/vishnu32510/portfolio_flutter/main/assets/images/appIcon.png",
        description:
            "Responsive Portfolio designed for Android, IOS, Web, MacOS with Flutter SDK using Bloc State management",
        githubRepoLink: "https://github.com/vishnu32510/portfolio_flutter"),
    Project(
        name: "Unsplash public photos",
        imageUrl:
            "https://raw.githubusercontent.com/vishnu32510/Photos_using_unsplash_api/main/images/icon.png",
        description:
            "Application to access Unsplash public photos (Unsplash Public API are used)",
        githubRepoLink:
            "https://github.com/vishnu32510/Photos_using_unsplash_api"),
    Project(
        name: "Appetizer IOS Application",
        imageUrl:
            "https://raw.githubusercontent.com/vishnu32510/Appetizer/main/appetizers/Assets.xcassets/AppIcon.appiconset/AppIcon.png",
        description:
            "Appetizer IOS Application with SwiftUI and Api interfaces.",
        githubRepoLink: "https://github.com/vishnu32510/Appetizer"),
    Project(
        name: "Apple Framework List",
        imageUrl:
            "https://raw.githubusercontent.com/vishnu32510/Apple-Frameworks/main/Apple-Frameworks/Assets.xcassets/AppIcon.appiconset/AppIcon.png",
        description:
            "Apple Frameworks List in Gridview and Listview with SwiftUI",
        githubRepoLink: "https://github.com/vishnu32510/Apple-Frameworks"),
    Project(
        name: "Whatsapp UI Clone",
        imageUrl: "",
        description: "Whatsapp UI Clone with FLutter",
        githubRepoLink: "https://github.com/vishnu32510/flutter_whatsapp"),
    Project(
        name: "Facebook Responsive UI Clone",
        imageUrl: "",
        description:
            "Flutter Facebook Responsive Responsive UI for Web and Mobile",
        githubRepoLink: "https://github.com/vishnu32510/flutter_facebook"),
    Project(
        name: "Weather App UI",
        imageUrl:
            "https://raw.githubusercontent.com/vishnu32510/SwiftUI-Weather/main/SwiftUI-Weather/Assets.xcassets/AppIcon.appiconset/AppIcon.png",
        description: "Swift Weather App UI in Dark and Light Mode",
        githubRepoLink: "https://github.com/vishnu32510/SwiftUI-Weather"),
    Project(
        name: "My GitHub Profile Details",
        imageUrl:
            "https://raw.githubusercontent.com/vishnu32510/GitHubSwift/main/GitHubSwift/Assets.xcassets/AppIcon.appiconset/AppIcon.png",
        description:
            "Simple Swift IOS App to display my GitHub Details form the Github API",
        githubRepoLink: "https://github.com/vishnu32510/GitHubSwift"),
  ];
}
