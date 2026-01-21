class Project {
  final String name;
  final String imageUrl;
  final String description;
  final List<String> techStack;
  final String? status; // e.g., "In Progress", "Completed", "On Hold"
  final String? githubRepoLink;
  final String? demoLink; // Renamed from previewLink for clarity
  final String? googlePlay;

  const Project({
    required this.name,
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
