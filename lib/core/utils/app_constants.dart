import '../../data/models/custom_service.dart';
import '../../data/models/project.dart';
import 'app_assets.dart';

abstract class AppConstants {
  static const double appBarHeight = 80;
  static const String appTitle = "Vishnu's Portfolio";
  static const List<CustomService> services = [
    CustomService(
      service: 'UI, UX & RESPONSIVENESS',
      logo: AppAssets.uiDesignLogo,
      description:
          'Working on enhancing the user interface and experience with focus on aesthetics and functionality. My repressiveness designing and  and skills  ensure that your application looks great and offers a seamless and user-friendly experience.',
    ),
    CustomService(
        service: 'MOBILE DEVELOPMENT',
        logo: AppAssets.androidLogo,
        description:
            'Crafting mobile applications that meet any unique requirements. My skills will bring your ideas to a feature-rich, intuitive, and platform-specific mobile App. From Android to iOS, I have got you covered.'),
    // CustomService(
    //     service: 'CYBER SECURITY',
    //     logo: AppAssets.scrappingLogo,
    //     description:
    //         'Protecting your digital assets and sensitive information from cyber threats. My Cybersecurity skills include vulnerability assessments, threat monitoring, and proactive measures to ensure the security of your online presence.'),
  ];
  static const List<Project> projects = [
    Project(
        name: "Unsplash public photos",
        imageUrl:
            "https://raw.githubusercontent.com/vishnu32510/Photos_using_unsplash_api/main/images/icon.png",
        description:
            "Application to access Unsplash public photos (Unsplash Public API are used)",
        githubRepoLink:
            "https://github.com/vishnu32510/Photos_using_unsplash_api"),
    Project(
        name: "Apple Framework List",
        imageUrl: "",
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
  ];
}
