enum ProjectTag {
  all('All'),
  mobile('Mobile'),
  web('Web'),
  ai('AI'),
  backend('Backend');

  final String value;
  const ProjectTag(this.value);
}

class Project {
  final String name;
  final List<ProjectTag> tags;
  final bool isAsset;
  final String imageUrl;
  final String description;
  final List<String> techStack;
  final String? status; // e.g., "In Progress", "Completed", "On Hold"
  final String? githubRepoLink;
  final String? demoLink; // Renamed from previewLink for clarity
  final String? googlePlay;

  const Project({
    required this.name,
    required this.tags,
    this.isAsset = false,
    required this.imageUrl,
    required this.description,
    required this.techStack,
    this.status,
    this.githubRepoLink,
    this.demoLink,
    this.googlePlay,
  });

  factory Project.fromFirestore(Map<String, dynamic> data) {
    return Project(
      name: data['name'] ?? '',
      tags: (data['tags'] as List?)
              ?.map((t) => ProjectTag.values.firstWhere(
                  (e) => e.value.toLowerCase() == t.toString().toLowerCase(),
                  orElse: () => ProjectTag.mobile))
              .toList() ??
          [ProjectTag.mobile],
      isAsset: data['isAsset'] ?? false,
      imageUrl: data['imageUrl'] ?? '',
      description: data['description'] ?? '',
      techStack: List<String>.from(data['techStack'] ?? []),
      status: data['status'],
      githubRepoLink: data['githubRepoLink'] ?? data['codeLink'], // Support both for backward compatibility
      demoLink: data['demoLink'] ?? data['previewLink'], // Support both for backward compatibility
      googlePlay: data['googlePlay'],
    );
  }

  Map<String, dynamic> toFirestore() {
    return {
      'name': name,
      'tags': tags.map((t) => t.value).toList(),
      'isAsset': isAsset,
      'imageUrl': imageUrl,
      'description': description,
      'techStack': techStack,
      if (status != null) 'status': status,
      if (githubRepoLink != null) 'githubRepoLink': githubRepoLink,
      if (demoLink != null) 'demoLink': demoLink,
      if (googlePlay != null) 'googlePlay': googlePlay,
    };
  }
}
