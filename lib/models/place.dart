class Place {
  final String name;
  final String description;
  final String imageUrl;
  final double price;
  final List<String> highlights;
  final List<String> itinerary;
  final List<String> inclusions;
  final List<String> exclusions;

  Place({
    required this.name,
    required this.description,
    required this.imageUrl,
    required this.price,
    required this.highlights,
    required this.itinerary,
    required this.inclusions,
    required this.exclusions,
  });
}
