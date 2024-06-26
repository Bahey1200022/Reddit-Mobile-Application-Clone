class Community {
  final String id;
  final String name;
  final String description;
  final String image;
  final String type;
  final bool is18Plus;
  String? backimage;
  String? rules;
  Community(
      {required this.id,
      required this.name,
      required this.description,
      required this.image,
      required this.is18Plus,
      required this.type,
      this.backimage,
      this.rules});
}
