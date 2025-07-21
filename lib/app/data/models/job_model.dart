class Job {
  final String title;
  final String location;
  final String type; // e.g. Full-Time or Part-Time
  final String jobType; // e.g. Remote, On-site, Hybrid
  final String posted; // e.g. '2d ago'
  final int applications; // e.g. number of applications
  final String img; // Image asset path

  Job({
    required this.title,
    required this.location,
    required this.type,
    required this.jobType,
    required this.posted,
    required this.applications,
    required this.img,
  });
}
